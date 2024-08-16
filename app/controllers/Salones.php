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
        $fecha = $this->input->post('fecha');

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
            'fecha' => $fecha,
            'metodo_pago' => $metodoPago,
            'capacidad' => 110,
            'items' => json_encode($items) // Convertir el array de items a JSON antes de guardar en la base de datos
        );

        $alquiler = $this->db->insert('tec_alquiler_salones', $datosAlquiler);

        

        
        // Insertar los datos del alquiler en la base de datos
        if ($alquiler) {
            $idAlquiler = $this->db->insert_id();
            $qrcode = new Generator;
            $serverUrl = base_url();
            $qrCodeUrl = $serverUrl . 'salones/invitado/' . $idAlquiler;
            $qrCodes = $qrcode->size(120)->generate($qrCodeUrl);

            $data_update_alquiler = [
                'qr' => $qrCodes,
            ];
            $this->salon_model->updateAlquiler($idAlquiler, $data_update_alquiler);
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

    function list_alquiler() {
        $this->data['page_title'] = lang('list_alquiler');
        $bc = array(array('link' => '#', 'page' => lang('list_alquiler')));
        $meta = array('page_title' => lang('list_alquiler'), 'bc' => $bc);
        $this->page_construct('salones/list_alquiler', $this->data, $meta);
    }

    function get_alquiler() {
        $this->load->library('datatables');

        $this->datatables->select('alquiler_salones.id as pid, alquiler_salones.nombre_cliente, alquiler_salones.nombre_salon, alquiler_salones.created_at, alquiler_salones.total, alquiler_salones.hora_entrada, alquiler_salones.hora_salida', FALSE);

        $this->datatables->from('alquiler_salones');

        $this->datatables->unset_column('pid');

        echo $this->datatables->generate();
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

        $this->datatables->select('salones.id as pid, salones.nombre, salones.precio, salones.capacidad', FALSE);

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

    public function verificar_disponibilidad_inventario() {
        $idInventario = $this->input->post('idInventario');
        $cantidad = $this->input->post('cantidad');

        // Lógica para verificar la disponibilidad del inventario
        // Consultar la cantidad disponible del inventario en la base de datos
        $cantidadDisponible = $this->salon_model->obtenerCantidadDisponible($idInventario, $cantidad);

        // Verificar si la cantidad disponible es suficiente
        if ($cantidadDisponible >= $cantidad) {
            echo 'disponible';
        } else {
            echo 'no_disponible';
        }
    }

    public function restablecer_cantidad_inventario() {
        // Obtener los datos de la solicitud AJAX
        $idInventario = $this->input->post('idInventario');
        $cantidad = $this->input->post('cantidad');

        // Lógica para restablecer la cantidad del inventario en la base de datos
        $actualizado = $this->salon_model->restablecerCantidad($idInventario, $cantidad);

        if ($actualizado) {
            echo 'actualizado'; // Se actualizó correctamente la cantidad del inventario
        } else {
            echo 'error_actualizacion'; // Hubo un error al actualizar la cantidad del inventario
        }
    }

    public function verificar_disponibilidad() {
        // Obtener los datos de la solicitud AJAX
        $fecha = $this->input->post('fecha');
        $idHorario = $this->input->post('idHorario');
        $idSalon = $this->input->post('salon');

        // Convertir la fecha en un rango de tiempo para comparar con los alquileres existentes
        $horaEntrada = $this->salon_model->obtenerHoraEntrada($idHorario);
        $horaSalida = $this->salon_model->obtenerHoraSalida($idHorario); 

        // Formar el rango de tiempo en formato datetime
        $rangoTiempoInicio = $fecha . ' ' . $horaEntrada;
        $rangoTiempoFin = $fecha . ' ' . $horaSalida;

        // Consultar la base de datos para verificar la disponibilidad
        $disponible = $this->salon_model->verificarDisponibilidad($horaEntrada,$horaSalida,$fecha, $idSalon);

        // Devolver la respuesta a la solicitud AJAX
        echo json_encode(['disponible' => $disponible]);
    }

    public function escaneoqr() {
        $this->data['page_title'] = lang('Escaneo QR');
        $bc = array(array('link' => '#', 'page' => lang('Escaneo QR')));
        $meta = array('page_title' => lang('Escaneo QR'), 'bc' => $bc);
        $this->page_construct('salones/escaneoqr', $this->data, $meta);
    }

    public function invitado($id)
    {
        // Buscar el registro en la tabla alquiler_salones por su ID
        $alquilerSalon = $this->salon_model->getAlquilerById($id);

        // Verificar si se encontró el registro
        if ($alquilerSalon) {

            // Verificar si la capacidad es mayor que 0
            if ($alquilerSalon->capacidad > 0) {
                // Restar 1 a la capacidad
                
                $alquilerSalon->capacidad -= 1;

                // Guardar los cambios en la base de datos
                $this->salon_model->updateAlquiler($id, $alquilerSalon);

                // Devolver un mensaje de éxito
                $response = array('success' => false, 'message' => '1');
                $this->output->set_status_header(200)->set_content_type('application/json')->set_output(json_encode($response));
                return;
            } else {
                // Devolver un mensaje de error si la capacidad es 0
                $response = array('success' => false, 'message' => '0');
                $this->output->set_status_header(200)->set_content_type('application/json')->set_output(json_encode($response));
                return;
            }
        } else {
            // Devolver un mensaje de error si no se encuentra el registro
            return $this->response->setStatusCode(404)->setJSON(['error' => 'El salón no existe']);
        }
    }

    public function calendario($year = NULL, $month = NULL) {
 
        /*$this->data['clientes'] = $this->site->getAllCustomers();
        $this->data['salones'] = $this->salon_model->getAllSalones();
        $this->data['inventario'] = $this->salon_model->getAllInventario();
        $this->data['horarios'] = $this->salon_model->getAllHorarios();
        $this->data['page_title'] = 'Salones';
        $meta = array('page_title' => 'Salones');

        $this->page_construct('salones/calendario', $this->data, $meta);*/

        try {
            if (!$year) { $year = date('Y'); }
            if (!$month) { $month = date('m'); }
            $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
            $this->lang->load('calendar');
            $config = array(
                'show_next_prev' => TRUE,
                'next_prev_url' => site_url('salones/calendario'),
                'month_type' => 'long',
                'day_type' => 'long'
                );
            $config['template'] = '

            {table_open}<table border="0" cellpadding="0" cellspacing="0" class="table table-bordered table-calendar" style="min-width:522px;">{/table_open}

            {heading_row_start}<tr class="active">{/heading_row_start}

            {heading_previous_cell}<th><div class="text-center"><a href="{previous_url}">&lt;&lt;</div></a></th>{/heading_previous_cell}
            {heading_title_cell}<th colspan="{colspan}"><div class="text-center">{heading}</div></th>{/heading_title_cell}
            {heading_next_cell}<th><div class="text-center"><a href="{next_url}">&gt;&gt;</a></div></th>{/heading_next_cell}

            {heading_row_end}</tr>{/heading_row_end}

            {week_row_start}<tr>{/week_row_start}
            {week_day_cell}<td class="cl_equal"><div class="cl_wday">{week_day}</div></td>{/week_day_cell}
            {week_row_end}</tr>{/week_row_end}

            {cal_row_start}<tr>{/cal_row_start}
            {cal_cell_start}<td>{/cal_cell_start}

            {cal_cell_content}{day}<br>{content}{/cal_cell_content}
            {cal_cell_content_today}<div class="highlight">{day}</div>{content}{/cal_cell_content_today}

            {cal_cell_no_content}{day}{/cal_cell_no_content}
            {cal_cell_no_content_today}<div class="highlight">{day}</div>{/cal_cell_no_content_today}

            {cal_cell_blank}&nbsp;{/cal_cell_blank}

            {cal_cell_end}</td>{/cal_cell_end}
            {cal_row_end}</tr>{/cal_row_end}

            {table_close}</table>{/table_close}
            ';

            $this->load->library('calendar', $config);

            $alquileres = $this->salon_model->getAlquileres($year, $month);
            $html = '';
            if (!empty($alquileres)) {
                foreach ($alquileres as $alquiler) {
                    $alquiler->date = intval($alquiler->date);
                    $html .= "<table class='table table-condensed table-striped' style='margin-bottom:10px;'>
                    <tr>
                        <td>Cliente</td>
                        <td style='text-align:right;font-weight: 500;'>{$alquiler->nombre_cliente}</td>
                    </tr>
                    <tr>
                        <td>Salon</td>
                        <td style='text-align:right;font-weight: 500;'>{$alquiler->nombre_salon}</td>
                    </tr>
                    <tr>
                        <td>Hora Entrada</td>
                        <td style='text-align:right;font-weight: 500;'>{$alquiler->hora_entrada}</td>
                    </tr>
                    <tr>
                        <td>Hora Salida</td>
                        <td style='text-align:right;font-weight: 500;'>{$alquiler->hora_salida}</td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td style='text-align:right;font-weight: 500;'>{$this->tec->formatMoney($alquiler->total)}</td>
                    </tr>
                    </table>";
                }
                $daily_sale[$alquiler->date] = $html;
            } else {
                $daily_sale = array();
            }

            $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
            $this->data['calender'] = $this->calendar->generate($year, $month, $daily_sale);

            $start = $year.'-'.$month.'-01 00:00:00';
            $end = $year.'-'.$month.'-'.days_in_month($month, $year).' 23:59:59';

            $this->data['page_title'] = $this->lang->line("Calendario Salones");
            $bc = array(array('link' => '#', 'page' => lang('reports')), array('link' => '#', 'page' => lang('Calendario Salones')));
            $meta = array('page_title' => lang('Calendario Salones'), 'bc' => $bc);
            $this->page_construct('salones/calendario', $this->data, $meta);
        } catch (\Throwable $th) {
            //throw $th;
            echo $th->getMessage();
        }
    }
}
