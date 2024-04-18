<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

use SimpleSoftwareIO\QrCode\Generator;
use BaconQrCode\Renderer\RendererStyle\EyeFill;
use BaconQrCode\Renderer\RendererStyle\Fill;

class Salones extends MY_Controller {

    function __construct() {
        parent::__construct();

        $current_method = $this->router->fetch_method();

        $this->load->helper('pos');
        $this->load->model('salon_model');
        $this->load->library('form_validation');

    }

    public function agregar_alquiler()
    {
        // Obtener los datos enviados por POST
        $idCliente = $this->input->post('id_cliente');
        $idSalon = $this->input->post('id_salon');
        $total = $this->input->post('total');
        $metodoPago = $this->input->post('metodo_pago');
        $horarioId = $this->input->post('horario');
        $items = $this->input->post('items');

        // Consultar el horario para obtener la hora de entrada y salida
        $horario = $this->db->get_where('horarios', array('id' => $horarioId))->row();
        $horaEntrada = $horario->hora_entrada;
        $horaSalida = $horario->hora_salida;

        // Consultar el cliente para obtener su nombre
        $cliente = $this->db->get_where('customers', array('id' => $idCliente))->row();
        $nombreCliente = $cliente->name;

        // Consultar el salón para obtener su nombre
        $salon = $this->db->get_where('salones', array('id' => $idSalon))->row();
        $nombreSalon = $salon->nombre;

        // Crear un array con los datos del alquiler
        $datosAlquiler = array(
            'id_cliente' => $idCliente,
            'nombre_cliente' => $nombreCliente,
            'id_salon' => $idSalon,
            'nombre_salon' => $nombreSalon,
            'hora_entrada' => $horaEntrada,
            'hora_salida' => $horaSalida,
            'total' => $total,
            'metodo_pago' => $metodoPago,
            'items' => json_encode($items) // Convertir el array de items a JSON antes de guardar en la base de datos
        );

        // Insertar los datos del alquiler en la base de datos
        if ($this->db->insert('tec_alquiler_salones', $datosAlquiler)) {
            $idAlquiler = $this->db->insert_id();
            echo json_encode(array('success' => true, 'message' => 'Datos guardados correctamente', 'id_alquiler' => $idAlquiler, 'store_id' => $this->session->userdata('store_id')));
        } else {
            echo json_encode(array('success' => false, 'message' => 'Error al guardar los datos'));
        }
    }

    public function view($id = NULL, $store_id = NULL) {
        if ($id === NULL) {
        } else {
            $alquiler = $this->salon_model->obtener_detalle_alquiler($id);
            if ($alquiler) {
                $this->data['alquiler'] = $alquiler;
                $this->data['store'] = $this->site->getStoreByID($store_id);
                $this->data['page_title'] = 'Factura Salon';
                $meta = array('page_title' => 'Factura Salon');
                $this->page_construct('salones/view', $this->data, $meta);
            }
        }
    }

     public function index() {
 
        $this->data['clientes'] = $this->site->getAllCustomers();
        $this->data['salones'] = $this->salon_model->getAllSalones();
        $this->data['inventario'] = $this->salon_model->getAllInventario();
        $this->data['horarios'] = $this->salon_model->getAllHorarios();
        $this->data['page_title'] = 'Salones';
        $meta = array('page_title' => 'Salones');

        $this->page_construct('salones/index', $this->data, $meta);
    }


    function list_salones() {
        $this->data['page_title'] = lang('list_salones');
        $bc = array(array('link' => '#', 'page' => lang('list_salones')));
        $meta = array('page_title' => lang('list_salones'), 'bc' => $bc);
        $this->page_construct('salones/list_salones', $this->data, $meta);
    }


    function add_salones() {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        $this->form_validation->set_rules('nombre', lang("name"), 'required');;

        if ($this->form_validation->run() == true) {

            $data = array(
                'nombre' => $this->input->post('nombre'),
                'precio' => $this->input->post('precio'),
                'store_id' => $this->session->userdata('store_id'),
                );
        }

        if ($this->form_validation->run() == true && $this->salon_model->add_salones($data)) {

            $this->session->set_flashdata('message', lang("mesa_added"));
            redirect('salones/list_salones');

        } else {

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['page_title'] = lang('add_salones');
            $bc = array(array('link' => site_url('salones/add_salones'), 'page' => lang('add_salones')), array('link' => '#', 'page' => lang('add_salones')));
            $meta = array('page_title' => lang('add_salones'), 'bc' => $bc);
            $this->page_construct('salones/add_salones', $this->data, $meta);
        }
    }

    function get_salones($store_id) {

        $this->load->library('datatables');

        $this->datatables->select('salones.id as pid, salones.nombre, salones.precio', FALSE);

        $this->datatables->from('salones');

        $this->datatables->add_column("Actions", "<div><a href='" . site_url('salones/edit_salones/$1') . "' title='" . lang("edit_tipo") . "' class='tip btn btn-warning btn-xs'><i class='fa fa-edit'></i></a> <a href='" . site_url('salones/delete_salones/$1') . "' onClick=\"return confirm('" . lang('alert_x_tipo') . "')\" title='" . lang("delete_tipo") . "' class='tip btn btn-danger btn-xs'><i class='fa fa-trash-o'></i></a></div>", "pid, nombre, precio, tiempo");

        $this->datatables->unset_column('pid');

        echo $this->datatables->generate();
    }


    function edit_salones($id = NULL) {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }
        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        $this->form_validation->set_rules('nombre', lang("name"), 'required');;

        if ($this->form_validation->run() == true) {

            $data = array(
                'nombre' => $this->input->post('nombre'),
                'precio' => $this->input->post('precio'),
                'store_id' => $this->session->userdata('store_id'),
                );
        }

        if ($this->form_validation->run() == true && $this->salon_model->updateSalon($id, $data)) {

            $this->session->set_flashdata('message', lang("salones_updated"));
            redirect("salones/list_salones");

        } else {
            $this->data['salon'] = $this->salon_model->getSalonById($id);
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['stores'] = $this->site->getAllStores();
            $this->data['page_title'] = lang('edit_salones');
            $bc = array(array('link' => site_url('salones/edit_salones'), 'page' => lang('edit_salones')), array('link' => '#', 'page' => lang('edit_salones')));
            $meta = array('page_title' => lang('edit_salones'), 'bc' => $bc);
            $this->page_construct('salones/edit_salones', $this->data, $meta);

        }
    }

    function delete_salones($id = NULL) {
        if(DEMO) {
            $this->session->set_flashdata('error', lang('disabled_in_demo'));
            redirect(isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : 'welcome');
        }

        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        if ($this->salon_model->deleteSalon($id)) {
            $this->session->set_flashdata('message', lang("salones_deleted"));
            redirect('salones/list_salones');
        }

    }



    // INVENTARIO

    function list_inventario() {
        $this->data['page_title'] = lang('list_inventario');
        $bc = array(array('link' => '#', 'page' => lang('list_inventario')));
        $meta = array('page_title' => lang('list_inventario'), 'bc' => $bc);
        $this->page_construct('salones/list_inventario', $this->data, $meta);
    }


    function add_inventario() {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        $this->form_validation->set_rules('nombre', lang("name"), 'required');;

        if ($this->form_validation->run() == true) {

            $data = array(
                'nombre' => $this->input->post('nombre'),
                'cantidad' => $this->input->post('cantidad'),
                'precio' => $this->input->post('precio'),
                'store_id' => $this->session->userdata('store_id'),
                );
        }

        if ($this->form_validation->run() == true && $this->salon_model->add_inventario($data)) {

            $this->session->set_flashdata('message', lang("mesa_added"));
            redirect('salones/list_inventario');

        } else {

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['page_title'] = lang('add_inventario');
            $bc = array(array('link' => site_url('salones/add_inventario'), 'page' => lang('add_inventario')), array('link' => '#', 'page' => lang('add_inventario')));
            $meta = array('page_title' => lang('add_inventario'), 'bc' => $bc);
            $this->page_construct('salones/add_inventario', $this->data, $meta);
        }
    }

    function get_inventario($store_id) {

        $this->load->library('datatables');

        $this->datatables->select('inventario_salones.id as pid, inventario_salones.nombre, inventario_salones.cantidad, inventario_salones.precio', FALSE);

        $this->datatables->from('inventario_salones');

        $this->datatables->add_column("Actions", "<div><a href='" . site_url('salones/edit_inventario/$1') . "' title='" . lang("edit_tipo") . "' class='tip btn btn-warning btn-xs'><i class='fa fa-edit'></i></a> <a href='" . site_url('salones/delete_inventario/$1') . "' onClick=\"return confirm('" . lang('alert_x_tipo') . "')\" title='" . lang("delete_tipo") . "' class='tip btn btn-danger btn-xs'><i class='fa fa-trash-o'></i></a></div>", "pid, nombre, precio, tiempo");

        $this->datatables->unset_column('pid');

        echo $this->datatables->generate();
    }


    function edit_inventario($id = NULL) {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }
        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        $this->form_validation->set_rules('nombre', lang("name"), 'required');;

        if ($this->form_validation->run() == true) {

            $data = array(
                'nombre' => $this->input->post('nombre'),
                'cantidad' => $this->input->post('cantidad'),
                'precio' => $this->input->post('precio'),
                'store_id' => $this->session->userdata('store_id'),
                );
        }

        if ($this->form_validation->run() == true && $this->salon_model->updateInventario($id, $data)) {

            $this->session->set_flashdata('message', lang("salones_updated"));
            redirect("salones/list_inventario");

        } else {
            $this->data['inventario'] = $this->salon_model->getInventarioById($id);
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['stores'] = $this->site->getAllStores();
            $this->data['page_title'] = lang('edit_inventario');
            $bc = array(array('link' => site_url('salones/edit_inventario'), 'page' => lang('edit_inventario')), array('link' => '#', 'page' => lang('edit_inventario')));
            $meta = array('page_title' => lang('edit_inventario'), 'bc' => $bc);
            $this->page_construct('salones/edit_inventario', $this->data, $meta);

        }
    }

    function delete_inventario($id = NULL) {
        if(DEMO) {
            $this->session->set_flashdata('error', lang('disabled_in_demo'));
            redirect(isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : 'welcome');
        }

        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        if ($this->salon_model->deleteInventario($id)) {
            $this->session->set_flashdata('message', lang("inventario_deleted"));
            redirect('salones/list_inventario');
        }

    }


    // HORARIO

    function list_horario() {
        $this->data['page_title'] = lang('list_horario');
        $bc = array(array('link' => '#', 'page' => lang('list_horario')));
        $meta = array('page_title' => lang('list_horario'), 'bc' => $bc);
        $this->page_construct('salones/list_horario', $this->data, $meta);
    }


    function add_horario() {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        $this->form_validation->set_rules('nombre', lang("name"), 'required');;

        if ($this->form_validation->run() == true) {

            $data = array(
                'nombre' => $this->input->post('nombre'),
                'hora_entrada' => $this->input->post('hora_entrada'),
                'hora_salida' => $this->input->post('hora_salida'),
                );
        }

        if ($this->form_validation->run() == true && $this->salon_model->add_horario($data)) {

            $this->session->set_flashdata('message', lang("mesa_added"));
            redirect('salones/list_horario');

        } else {

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['page_title'] = lang('add_horario');
            $bc = array(array('link' => site_url('salones/add_horario'), 'page' => lang('add_horario')), array('link' => '#', 'page' => lang('add_horario')));
            $meta = array('page_title' => lang('add_horario'), 'bc' => $bc);
            $this->page_construct('salones/add_horario', $this->data, $meta);
        }
    }

    function get_horario($store_id) {

        $this->load->library('datatables');

        $this->datatables->select('horarios.id as pid, horarios.nombre, horarios.hora_entrada, horarios.hora_salida', FALSE);

        $this->datatables->from('horarios');

        $this->datatables->add_column("Actions", "<div><a href='" . site_url('salones/edit_horario/$1') . "' title='" . lang("edit_tipo") . "' class='tip btn btn-warning btn-xs'><i class='fa fa-edit'></i></a> <a href='" . site_url('salones/delete_horario/$1') . "' onClick=\"return confirm('" . lang('alert_x_tipo') . "')\" title='" . lang("delete_tipo") . "' class='tip btn btn-danger btn-xs'><i class='fa fa-trash-o'></i></a></div>", "pid, nombre, precio, tiempo");

        $this->datatables->unset_column('pid');

        echo $this->datatables->generate();
    }


    function edit_horario($id = NULL) {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }
        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        $this->form_validation->set_rules('nombre', lang("name"), 'required');;

        if ($this->form_validation->run() == true) {

            $data = array(
                'nombre' => $this->input->post('nombre'),
                'hora_entrada' => $this->input->post('hora_entrada'),
                'hora_salida' => $this->input->post('hora_salida'),
                );
        }

        if ($this->form_validation->run() == true && $this->salon_model->updateHorario($id, $data)) {

            $this->session->set_flashdata('message', lang("salones_updated"));
            redirect("salones/list_horario");

        } else {
            $this->data['horario'] = $this->salon_model->getHorarioById($id);
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['stores'] = $this->site->getAllStores();
            $this->data['page_title'] = lang('edit_horario');
            $bc = array(array('link' => site_url('salones/edit_horario'), 'page' => lang('edit_horario')), array('link' => '#', 'page' => lang('edit_horario')));
            $meta = array('page_title' => lang('edit_horario'), 'bc' => $bc);
            $this->page_construct('salones/edit_horario', $this->data, $meta);

        }
    }

    function delete_horario($id = NULL) {
        if(DEMO) {
            $this->session->set_flashdata('error', lang('disabled_in_demo'));
            redirect(isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : 'welcome');
        }

        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        if ($this->salon_model->deleteHorario($id)) {
            $this->session->set_flashdata('message', lang("horario_deleted"));
            redirect('salones/list_horario');
        }

    }
}
