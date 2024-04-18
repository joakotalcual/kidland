<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

use SimpleSoftwareIO\QrCode\Generator;
use BaconQrCode\Renderer\RendererStyle\EyeFill;
use BaconQrCode\Renderer\RendererStyle\Fill;

class Restaurante extends MY_Controller {

    function __construct() {
        parent::__construct();

        $current_method = $this->router->fetch_method();

        $this->load->helper('pos');
        $this->load->model('restaurante_model');
        $this->load->library('form_validation');

    }

    public function index() {
        // Obtener los pedidos con estado pendiente
        $pendientes = $this->restaurante_model->getPedidosPorEstado('pendiente');

        // Pasar los pedidos a la vista
        $this->data['pedidos_pendientes'] = $pendientes;
        $this->data['mesas'] = $this->restaurante_model->getAllMesas();
        // Establecer el título de la página y otros metadatos si es necesario
        $this->data['page_title'] = 'Restaurante';
        $meta = array('page_title' => 'Restaurante');

        // Cargar la vista
        $this->page_construct('restaurante/index', $this->data, $meta);
    }

    public function agregar_venta() {
        // Obtener los datos enviados desde el frontend
        $cliente_id = $this->input->post('cliente_id');
        $pedido_id = $this->input->post('pedido_id');
        $total = $this->input->post('total');
        $tipo_pago = $this->input->post('tipo_pago');

        // Crear el array de datos a insertar en la tabla
        $data = array(
            'id_cliente' => $cliente_id,
            'id_pedido' => $pedido_id,
            'total' => $total,
            'tipo_pago' => $tipo_pago,
            'created_at' => date('Y-m-d H:i:s')
        );

        // Insertar los datos en la tabla de ventas
        $this->db->insert('ventas_restaurante', $data);
        $venta_id = $this->db->insert_id(); 
        // Verificar si la inserción fue exitosa
        if ($this->db->affected_rows() > 0) {
            // Actualizar el estado del pedido a "completado"
            $this->db->where('id', $pedido_id);
            $this->db->update('pedidos', array('estado' => 'completado'));

            // Obtener el ID de la venta insertada
            
            // Preparar la respuesta JSON
            $response = array('success' => true, 'message' => 'Venta agregada exitosamente', 'venta_id' => $venta_id, 'store_id' => $this->session->userdata('store_id'));
            $this->output->set_content_type('application/json')->set_output(json_encode($response));
        } else {
            // La inserción falló
            $response = array('success' => false, 'message' => 'Error al agregar la venta');
            $this->output->set_status_header(400)->set_content_type('application/json')->set_output(json_encode($response));
        }
    }



    public function view($id = NULL, $store_id = NULL) {
        // Verificar si se proporcionó un ID de venta
  
        if ($id === NULL) {
            // Si no se proporcionó un ID, redireccionar o mostrar un mensaje de error
        } else {
            // Obtener los detalles de la venta con el ID proporcionado
            $venta = $this->obtener_detalle_venta($id);

            // Verificar si se encontró la venta
            if ($venta === NULL) {
                // Si no se encontró la venta, redireccionar o mostrar un mensaje de error
            } else {
                // Cargar los datos necesarios para la vista
                $this->data['venta'] = $venta;
                $this->data['store'] = $this->site->getStoreByID($store_id);
                // Otros datos necesarios para la vista, como el título de la página
                $this->data['page_title'] = 'Factura Restaurante';
                $meta = array('page_title' => 'Factura Restaurante');

                // Cargar la vista
                $this->page_construct('restaurante/view', $this->data, $meta);
                //$this->load->view($this->theme.'restaurante/view', $this->data);
            }
        }
    }

    public function obtener_detalle_venta($id) {
        // Consulta SQL para obtener los detalles de la venta y los nombres de las recetas
        $this->db->select('v.*, p.*, r.nombre AS nombre_receta, c.nombre AS nombre_cliente');
        $this->db->from('ventas_restaurante v');
        $this->db->join('pedido_tiene_recetas p', 'v.id_pedido = p.id_pedido');
        $this->db->join('recetas r', 'p.id_receta = r.id');
        $this->db->join('mesas c', 'v.id_cliente = c.id'); // Join con la tabla de clientes
        $this->db->where('v.id', $id);

        // Ejecutar la consulta
        $query = $this->db->get();

        // Verificar si se obtuvieron resultados
        if ($query->num_rows() > 0) {
            // Recuperar los datos de la venta y los detalles de las recetas
            $venta = $query->row(); // Suponiendo que solo esperamos una fila para la venta
            $venta->detalles = $query->result(); // Suponiendo que hay múltiples detalles

            return $venta;
        } else {
            // No se encontraron detalles de venta con el ID proporcionado
            return NULL;
        }
    }


    public function get_pedidos_por_cliente() {
        $cliente_id = $this->input->post('cliente_id');

        // Verificar si se proporcionó un ID de cliente válido
        if ($cliente_id) {
            // Consulta para obtener los pedidos asociados al cliente
            $this->db->select('id');
            $this->db->from('pedidos');
            $this->db->where('id_cliente', $cliente_id);
            $this->db->where('estado', 'pendiente');
            $query = $this->db->get();

            // Verificar si se encontraron pedidos asociados al cliente
            if ($query->num_rows() > 0) {
                $pedidos = $query->result(); // Devolver los pedidos asociados al cliente
                echo json_encode($pedidos);
            } else {
                echo json_encode([]); // Si no se encuentran, devolver un array vacío
            }
        } else {
            echo json_encode([]); // Si no se proporcionó un ID de cliente válido, devolver un array vacío
        }
    }

    public function get_detalles_pedido() {
        $pedido_id = $this->input->post('pedido_id');

        // Verificar si se proporcionó un ID de pedido válido
        if ($pedido_id) {
            // Consulta para obtener los detalles del pedido
            $this->db->select('recetas.nombre, pedido_tiene_recetas.cantidad, pedido_tiene_recetas.precio');
            $this->db->from('pedido_tiene_recetas');
            $this->db->join('recetas', 'pedido_tiene_recetas.id_receta = recetas.id', 'left');
            $this->db->where('pedido_tiene_recetas.id_pedido', $pedido_id);
            $query = $this->db->get();

            // Verificar si se encontraron detalles del pedido
            if ($query->num_rows() > 0) {
                $detalles_pedido = $query->result(); // Devolver los detalles del pedido
                echo json_encode($detalles_pedido);
            } else {
                echo json_encode([]); // Si no se encuentran detalles, devolver un array vacío
            }
        } else {
            echo json_encode([]); // Si no se proporcionó un ID de pedido válido, devolver un array vacío
        }
    }

    function list_ventas() {
        $this->data['page_title'] = lang('list_ventas');
        $bc = array(array('link' => '#', 'page' => lang('list_ventas')));
        $meta = array('page_title' => lang('list_ventas'), 'bc' => $bc);
        $this->page_construct('restaurante/list_ventas', $this->data, $meta);
    }

    function get_ventas() {
        $this->load->library('datatables');

        // Seleccionar las columnas necesarias, incluyendo el nombre del cliente
        $this->datatables->select('ventas_restaurante.id as pid, ventas_restaurante.created_at, ventas_restaurante.total, ventas_restaurante.tipo_pago, mesas.nombre as cliente', FALSE);

        // Definir las tablas a utilizar en la consulta
        $this->datatables->from('ventas_restaurante');
        $this->datatables->join('mesas', 'ventas_restaurante.id_cliente = mesas.id', 'left');

        // Ocultar la columna pid (si se desea)
        $this->datatables->unset_column('pid');

        // Generar y devolver la salida de datatables
        echo $this->datatables->generate();
    }


    function list_insumos() {
        $this->data['page_title'] = lang('list_insumos');
        $bc = array(array('link' => '#', 'page' => lang('list_insumos')));
        $meta = array('page_title' => lang('list_insumos'), 'bc' => $bc);
        $this->page_construct('restaurante/list_insumos', $this->data, $meta);
    }


    function add_insumos() {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        $this->form_validation->set_rules('nombre', lang("name"), 'required');;

        if ($this->form_validation->run() == true) {

            $data = array(
                'nombre' => $this->input->post('nombre'),
                'cantidad' => $this->input->post('cantidad'),
                'tipo_medida' => $this->input->post('tipo_medida'),
                'store_id' => $this->session->userdata('store_id'),
                );
        }

        if ($this->form_validation->run() == true && $this->restaurante_model->add_insumos($data)) {

            $this->session->set_flashdata('message', lang("insumo_added"));
            redirect('restaurante/list_insumos');

        } else {

            $this->data['tipos'] = array('kg', 'litro', 'unidad');
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['page_title'] = lang('add_insumos');
            $bc = array(array('link' => site_url('restaurante/add_insumos'), 'page' => lang('add_insumos')), array('link' => '#', 'page' => lang('add_insumos')));
            $meta = array('page_title' => lang('add_insumos'), 'bc' => $bc);
            $this->page_construct('restaurante/add_insumos', $this->data, $meta);
        }
    }

    function get_insumos($store_id) {

        $this->load->library('datatables');

        $this->datatables->select('insumos.id as pid, insumos.nombre, insumos.cantidad, insumos.tipo_medida', FALSE);

        $this->datatables->from('insumos');

        $this->datatables->add_column("Actions", "<div><a href='" . site_url('restaurante/edit_insumo/$1') . "' title='" . lang("edit_tipo") . "' class='tip btn btn-warning btn-xs'><i class='fa fa-edit'></i></a> <a href='" . site_url('restaurante/delete_insumo/$1') . "' onClick=\"return confirm('" . lang('alert_x_tipo') . "')\" title='" . lang("delete_tipo") . "' class='tip btn btn-danger btn-xs'><i class='fa fa-trash-o'></i></a></div>", "pid, nombre, precio, tiempo");

        $this->datatables->unset_column('pid');

        echo $this->datatables->generate();
    }


    function edit_insumo($id = NULL) {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }
        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        $pr_details = $this->site->getInsumoByID($id);


        $this->form_validation->set_rules('nombre', lang("name"), 'required');;

        if ($this->form_validation->run() == true) {

            $data = array(
                'nombre' => $this->input->post('nombre'),
                'cantidad' => $this->input->post('cantidad'),
                'tipo_medida' => $this->input->post('tipo_medida'),
                'store_id' => $this->session->userdata('store_id'),
                );
        }

        if ($this->form_validation->run() == true && $this->restaurante_model->updateInsumo($id, $data)) {

            $this->session->set_flashdata('message', lang("insumo_updated"));
            redirect("restaurante/list_insumos");

        } else {

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['insumo'] = $this->site->getInsumoByID($id);
            $this->data['tipos'] = array('kg', 'litro', 'unidad');
            $this->data['stores'] = $this->site->getAllStores();
            $this->data['page_title'] = lang('edit_insumo');
            $bc = array(array('link' => site_url('restaurantes/edit_insumo'), 'page' => lang('edit_insumo')), array('link' => '#', 'page' => lang('edit_insumo')));
            $meta = array('page_title' => lang('edit_insumo'), 'bc' => $bc);
            $this->page_construct('restaurante/edit_insumo', $this->data, $meta);

        }
    }

    function delete_insumo($id = NULL) {
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

        if ($this->restaurante_model->deleteInsumo($id)) {
            $this->session->set_flashdata('message', lang("insumo_deleted"));
            redirect('restaurante/list_insumos');
        }

    }



    function list_recetas() {
        $this->data['page_title'] = lang('list_recetas');
        $bc = array(array('link' => '#', 'page' => lang('list_recetas')));
        $meta = array('page_title' => lang('list_recetas'), 'bc' => $bc);
        $this->page_construct('restaurante/list_recetas', $this->data, $meta);
    }


    function add_recetas() {
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

        $id_receta = $this->restaurante_model->add_recetas($data);

        if ($id_receta) {
            // Recorrer los insumos y cantidades
            $insumos = $this->input->post('insumo[]');
            $cantidades = $this->input->post('cantidad_insumo[]');
            foreach ($insumos as $key => $insumo_id) {
                $data_insumo = array(
                    'id_receta' => $id_receta,
                    'id_insumo' => $insumo_id,
                    'cantidad' => $cantidades[$key],
                );
                // Agregar los insumos de la receta a la tabla receta_tiene_insumos
                $this->restaurante_model->add_receta_insumo($data_insumo);
            }
        }

        if ($this->form_validation->run() == true && $id_receta) {

            $this->session->set_flashdata('message', lang("receta_added"));
            redirect('restaurante/list_recetas');

        } else {

            $this->data['insumos'] = $this->restaurante_model->getAllInsumos($this->session->userdata('store_id'));
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['page_title'] = lang('add_recetas');
            $bc = array(array('link' => site_url('restaurante/add_recetas'), 'page' => lang('add_recetas')), array('link' => '#', 'page' => lang('add_recetas')));
            $meta = array('page_title' => lang('add_recetas'), 'bc' => $bc);
            $this->page_construct('restaurante/add_recetas', $this->data, $meta);
        }
    }

    function get_recetas($store_id) {

        $this->load->library('datatables');

        $this->datatables->select('recetas.id as pid, recetas.nombre, recetas.precio', FALSE);

        $this->datatables->from('recetas');

        $this->datatables->add_column("Actions", "<div><a href='" . site_url('restaurante/edit_recetas/$1') . "' title='" . lang("edit_tipo") . "' class='tip btn btn-warning btn-xs'><i class='fa fa-edit'></i></a> <a href='" . site_url('restaurante/delete_recetas/$1') . "' onClick=\"return confirm('" . lang('alert_x_tipo') . "')\" title='" . lang("delete_tipo") . "' class='tip btn btn-danger btn-xs'><i class='fa fa-trash-o'></i></a></div>", "pid, nombre, precio, tiempo");

        $this->datatables->unset_column('pid');

        echo $this->datatables->generate();
    }


    function edit_recetas($id = NULL) {
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

        $id_receta = $this->restaurante_model->updateReceta($id, $data);

        $this->restaurante_model->delete_receta_insumo($id_receta);
        if ($id_receta) {
            // Recorrer los insumos y cantidades
            $insumos = $this->input->post('insumo[]');
            $cantidades = $this->input->post('cantidad_insumo[]');
            foreach ($insumos as $key => $insumo_id) {
                $data_insumo = array(
                    'id_receta' => $id_receta,
                    'id_insumo' => $insumo_id,
                    'cantidad' => $cantidades[$key],
                );
                // Agregar los insumos de la receta a la tabla receta_tiene_insumos
                $this->restaurante_model->add_receta_insumo($data_insumo, $id_receta);
            }
        }

        if ($this->form_validation->run() == true && $id_receta) {

            $this->session->set_flashdata('message', lang("receta_updated"));
            redirect("restaurante/list_recetas");

        } else {
            $this->data['recetas'] = $this->restaurante_model->getRecetaById($id);
            $this->data['insumos'] = $this->restaurante_model->getAllInsumos($this->session->userdata('store_id'));
            $this->data['stores'] = $this->site->getAllStores();
            $this->data['page_title'] = lang('edit_recetas');
            $bc = array(array('link' => site_url('restaurantes/edit_recetas'), 'page' => lang('edit_recetas')), array('link' => '#', 'page' => lang('edit_recetas')));
            $meta = array('page_title' => lang('edit_recetas'), 'bc' => $bc);
            $this->page_construct('restaurante/edit_recetas', $this->data, $meta);

        }
    }

    function delete_recetas($id = NULL) {
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

        $this->restaurante_model->delete_receta_insumo($id);

        if ($this->restaurante_model->deleteRecetas($id)) {
            $this->session->set_flashdata('message', lang("receta_deleted"));
            redirect('restaurante/list_recetas');
        }

    }



    function list_pedidos() {
        $this->data['page_title'] = lang('list_pedidos');
        $bc = array(array('link' => '#', 'page' => lang('list_pedidos')));
        $meta = array('page_title' => lang('list_pedidos'), 'bc' => $bc);
        $this->page_construct('restaurante/list_pedidos', $this->data, $meta);
    }


    function add_pedidos() {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        $this->form_validation->set_rules('mesa', lang("mesa"), 'required');;

        // Verificar si el formulario se envió correctamente
        if ($this->form_validation->run() == true) {
            // Obtener los datos del formulario
            $cliente_id = $this->input->post('mesa');
            $recetas_json = $this->input->post('recetas');
            $recetas = json_decode($recetas_json, true);

            // Calcular el total del pedido
            $total = 0;
            
            // Iterar sobre cada receta
            foreach ($recetas as $receta) {
                $receta_id = $receta["id"]; // Acceder usando comillas dobles
                $cantidad = $receta["cantidad"];

                // Obtener el precio de la receta desde la base de datos
                $precio_receta = $this->restaurante_model->getPrecioReceta($receta_id);
                
                // Calcular subtotal de esta receta y sumarlo al total
                $subtotal = $precio_receta * $cantidad;
                $total += $subtotal;

                // Crear el registro del detalle del pedido
                $detalle_pedido_data = array(
                    'id_pedido' => null, // Aún no se conoce el ID del pedido
                    'id_receta' => $receta_id,
                    'cantidad' => $cantidad,
                    'precio' => $precio_receta
                );

                // Guardar el detalle del pedido
                $this->restaurante_model->add_detalle_pedido($detalle_pedido_data);

            }

            // Crear el registro del pedido
            $pedido_data = array(
                'id_cliente' => $cliente_id,
                'total' => $total,
                'created_at' => date('Y-m-d H:i:s')
            );

            // Guardar el pedido y obtener su ID
            $pedido_id = $this->restaurante_model->add_pedido($pedido_data);

            // Actualizar el ID del pedido en los detalles del pedido
            $this->restaurante_model->update_detalle_pedido_pedido_id($pedido_id);

            // Crear el registro de la relación entre el cliente y el pedido
            $cliente_pedido_data = array(
                'id_pedido' => $pedido_id,
                'id_cliente' => $cliente_id
            );

            // Guardar la relación entre el cliente y el pedido
            $this->restaurante_model->add_cliente_pedido($cliente_pedido_data);

            // Redireccionar a alguna página de éxito o mostrar un mensaje de éxito
        } else {
            // Mostrar errores de validación o manejar de otra forma si el formulario no es válido
        }



        if ($this->form_validation->run() == true && $pedido_id) {

            $this->session->set_flashdata('message', lang("receta_added"));
            redirect('restaurante/list_pedidos');

        } else {
            $this->data['mesas'] = $this->restaurante_model->getAllMesas();
            $this->data['recetas'] = $this->restaurante_model->getAllRecetasDisponibles($this->session->userdata('store_id'));
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['page_title'] = lang('add_pedidos');
            $bc = array(array('link' => site_url('restaurante/add_pedidos'), 'page' => lang('add_pedidos')), array('link' => '#', 'page' => lang('add_pedidos')));
            $meta = array('page_title' => lang('add_pedidos'), 'bc' => $bc);
            $this->page_construct('restaurante/add_pedidos', $this->data, $meta);
        }
    }

    public function verificar_insumos() {
        // Verificar si se enviaron los parámetros necesarios en la solicitud AJAX
        $receta_id = $this->input->get('receta_id');
        $cantidad = $this->input->get('cantidad');

        if (!isset($receta_id) || !isset($cantidad)) {
            // Si no se proporcionaron los parámetros necesarios, enviar una respuesta de error
            $response = array('success' => false, 'message' => 'Parámetros incorrectos en la solicitud AJAX');
            $this->output->set_status_header(400)->set_content_type('application/json')->set_output(json_encode($response));
            return;
        }

        // Consultar la cantidad de insumos necesarios para la receta
        $this->db->select('id_insumo, cantidad');
        $this->db->where('id_receta', $receta_id);
        $query = $this->db->get('receta_tiene_insumos');

        if ($query->num_rows() > 0) {
            $insumos_necesarios = $query->result_array();
        } else {
            // Si no se encontraron insumos necesarios para la receta, enviar una respuesta de error
            $response = array('success' => false, 'message' => 'No se encontraron insumos necesarios para la receta');
            $this->output->set_status_header(400)->set_content_type('application/json')->set_output(json_encode($response));
            return;
        }

        // Verificar si hay suficientes insumos disponibles
        foreach ($insumos_necesarios as $insumo) {
            $id_insumo = $insumo['id_insumo'];
            $cantidad_necesaria = $insumo['cantidad'] * $cantidad;

            // Consultar la cantidad disponible del insumo en la base de datos
            $this->db->select('cantidad');
            $this->db->where('id', $id_insumo);
            $query = $this->db->get('insumos');

            if ($query->num_rows() > 0) {
                $insumo_disponible = $query->row_array()['cantidad'];

                if ($insumo_disponible < $cantidad_necesaria) {
                    // Si no hay suficientes insumos disponibles, enviar una respuesta de error
                     $response = array('success' => false, 'message' => 'Insumos insuficientes para la receta');
                     $this->output->set_status_header(200)->set_content_type('application/json')->set_output(json_encode($response));
                    return;
                } else {
                    // Restar la cantidad de insumos utilizados
                    $this->db->set('cantidad', 'cantidad - ' . $cantidad_necesaria, FALSE);
                    $this->db->where('id', $id_insumo);
                    $this->db->update('insumos');
                }
            } else {
                // Si no se encontró el insumo en la base de datos, enviar una respuesta de error
                $response = array('success' => false, 'message' => 'Insumo no encontrado en la base de datos');
                $this->output->set_status_header(400)->set_content_type('application/json')->set_output(json_encode($response));
                return;
            }
        }

        // Si se llega hasta aquí, significa que hay suficientes insumos disponibles
        $response = array('success' => true, 'message' => 'Insumos disponibles para la receta');
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    public function obtener_insumos_receta($recetaId) {
        // Seleccionar los campos necesarios
        $this->db->select('rti.id_insumo, rti.cantidad, i.cantidad AS cantidad_actual');

        // De qué tabla obtener los datos
        $this->db->from('receta_tiene_insumos rti');

        // Hacer un JOIN con la tabla de insumos
        $this->db->join('insumos i', 'rti.id_insumo = i.id');

        // Condiciones de la consulta
        $this->db->where('rti.id_receta', $recetaId);

        // Ejecutar la consulta
        $query = $this->db->get();

        // Verificar si se obtuvieron resultados
        if ($query->num_rows() > 0) {
            // Recuperar los datos de los insumos de la receta
            $insumos = $query->result();

            // Calcular la cantidad a devolver para cada insumo
            $insumosDevueltos = array();
            foreach ($insumos as $insumo) {
                $cantidadDevuelta = $insumo->cantidad;
                $cantidadActual = $insumo->cantidad_actual;
                $cantidadDisponible = $cantidadActual + $cantidadDevuelta;
                $insumosDevueltos[] = array(
                    'id_insumo' => $insumo->id_insumo,
                    'cantidad' => $cantidadDisponible
                );
            }

            // Devolver los datos de los insumos devueltos
            $response = array('success' => true, 'insumos' => $insumosDevueltos);
            $this->output->set_content_type('application/json')->set_output(json_encode($response));
        } else {
            // No se encontraron insumos para la receta
            $response = array('success' => false, 'message' => 'No se encontraron insumos para la receta');
            $this->output->set_status_header(404)->set_content_type('application/json')->set_output(json_encode($response));
        }
    }


    function agregar_cantidad_insumo($idInsumo) {
        // Obtener la cantidad a agregar del cuerpo de la solicitud
        $cantidad = $this->input->get('cantidad');

        // Actualizar la cantidad del insumo en la base de datos
        $this->db->set('cantidad', $cantidad, FALSE);
        $this->db->where('id', $idInsumo);
        $this->db->update('insumos');

        // Verificar si la actualización fue exitosa
        if ($this->db->affected_rows() > 0) {
            // La actualización fue exitosa
            $response = array('success' => true, 'message' => 'Cantidad de insumo actualizada correctamente');
            $this->output->set_content_type('application/json')->set_output(json_encode($response));
        } else {
            // La actualización falló
            $response = array('success' => false, 'message' => 'Error al actualizar la cantidad de insumo');
            $this->output->set_status_header(400)->set_content_type('application/json')->set_output(json_encode($response));
        }
    }


    function get_pedidos($store_id) {
        $this->load->library('datatables');

        // Selección de columnas con alias para el nombre de la tabla
        $this->datatables->select('pedidos.id as pid, pedidos.total, pedidos.estado, mesas.nombre as nombre_mesa', FALSE);

        // Definir la tabla principal
        $this->datatables->from('pedidos');

        // Agregar LEFT JOIN con la tabla 'customers'
        $this->datatables->join('mesas', 'pedidos.id_cliente = mesas.id', 'left');

        // Definir las columnas personalizadas, incluyendo el enlace para editar y eliminar
        $this->datatables->add_column("Actions", "<div><a href='" . site_url('restaurante/edit_pedidos/$1') . "' title='" . lang("edit_tipo") . "' class='tip btn btn-warning btn-xs'><i class='fa fa-edit'></i></a> <a href='" . site_url('restaurante/delete_pedidos/$1') . "' onClick=\"return confirm('" . lang('alert_x_tipo') . "')\" title='" . lang("delete_tipo") . "' class='tip btn btn-danger btn-xs'><i class='fa fa-trash-o'></i></a></div>", "pid, nombre, precio, tiempo");

        // Eliminar la columna 'pid' que se usó para el enlace de acciones
        $this->datatables->unset_column('pid');

        // Generar y mostrar la tabla con datatables
        echo $this->datatables->generate();
    }



    function edit_pedidos($id = NULL) {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        // Obtener el ID del pedido
        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        // Verificar si se proporcionó un ID válido
        if (!$id) {
            // Redireccionar o mostrar un mensaje de error
            
        }
        
        $this->form_validation->set_rules('mesa', lang("mesa"), 'required');;
            // Verificar si el formulario se envió correctamente
            $pedido = $this->restaurante_model->getPedidoById($id);
            $recetas_pedido = $this->restaurante_model->getRecetasPedido($id);
            if ($this->form_validation->run() == true) {

                $this->restaurante_model->delete_pedido_tiene_recetas($id);
                $this->restaurante_model->delete_cliente_tiene_pedidos($id);
                // Obtener los datos del pedido
                

                $cliente_id = $this->input->post('mesa');
                $recetas_json = $this->input->post('recetas');
                $recetas = json_decode($recetas_json, true);

                // Calcular el total del pedido
                $total = 0;
                
                // Iterar sobre cada receta
                foreach ($recetas as $receta) {
                    $receta_id = $receta["id"]; // Acceder usando comillas dobles
                    $cantidad = $receta["cantidad"];

                    // Obtener el precio de la receta desde la base de datos
                    $precio_receta = $this->restaurante_model->getPrecioReceta($receta_id);
                    
                    // Calcular subtotal de esta receta y sumarlo al total
                    $subtotal = $precio_receta * $cantidad;
                    $total += $subtotal;

                    // Crear el registro del detalle del pedido
                    $detalle_pedido_data = array(
                        'id_pedido' => $id, // Aún no se conoce el ID del pedido
                        'id_receta' => $receta_id,
                        'cantidad' => $cantidad,
                        'precio' => $precio_receta
                    );

                    // Guardar el detalle del pedido
                    $this->restaurante_model->add_detalle_pedido($detalle_pedido_data);

                }

                // Crear el registro del pedido
                $pedido_data = array(
                    'id_cliente' => $cliente_id,
                    'total' => $total,
                    'created_at' => date('Y-m-d H:i:s')
                );

                // Guardar el pedido y obtener su ID
                $pedido_id = $this->restaurante_model->update_pedido($id, $pedido_data);

                // Actualizar el ID del pedido en los detalles del pedido
                $this->restaurante_model->update_detalle_pedido_pedido_id($pedido_id);

                // Crear el registro de la relación entre el cliente y el pedido
                $cliente_pedido_data = array(
                    'id_pedido' => $id,
                    'id_cliente' => $cliente_id
                );

                // Guardar la relación entre el cliente y el pedido
                $this->restaurante_model->add_cliente_pedido($cliente_pedido_data);
                // Verificar si se encontró el pedido

                if ($pedido_id) {
                    $this->session->set_flashdata('message', lang("receta_added"));
                    redirect('restaurante/list_pedidos');
                }

        } else {

            // Cargar los datos del pedido y las recetas en la vista
            $this->data['mesas'] = $this->restaurante_model->getAllMesas();
            $this->data['pedido'] = $pedido;

            $this->data['recetas_pedido'] = $recetas_pedido;
            $this->data['recetas'] = $this->restaurante_model->getAllRecetas($this->session->userdata('store_id'));
            $this->data['stores'] = $this->site->getAllStores();
            $this->data['page_title'] = lang('edit_pedidos');
            $bc = array(array('link' => site_url('restaurantes/edit_pedidos'), 'page' => lang('edit_pedidos')), array('link' => '#', 'page' => lang('edit_pedidos')));
            $meta = array('page_title' => lang('edit_pedidos'), 'bc' => $bc);
            $this->page_construct('restaurante/edit_pedidos', $this->data, $meta);
        }
    }


    function delete_pedidos($id = NULL) {
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

        $this->restaurante_model->delete_pedido_tiene_recetas($id);
        $this->restaurante_model->delete_cliente_tiene_pedidos($id);

        if ($this->restaurante_model->deletePedidos($id)) {
            $this->session->set_flashdata('message', lang("pedido_deleted"));
            redirect('restaurante/list_pedidos');
        }

    }



    function list_mesas() {
        $this->data['page_title'] = lang('list_mesas');
        $bc = array(array('link' => '#', 'page' => lang('list_mesas')));
        $meta = array('page_title' => lang('list_mesas'), 'bc' => $bc);
        $this->page_construct('restaurante/list_mesas', $this->data, $meta);
    }


    function add_mesas() {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        $this->form_validation->set_rules('nombre', lang("name"), 'required');;

        if ($this->form_validation->run() == true) {

            $data = array(
                'nombre' => $this->input->post('nombre'),
                'store_id' => $this->session->userdata('store_id'),
                );
        }

        if ($this->form_validation->run() == true && $this->restaurante_model->add_mesas($data)) {

            $this->session->set_flashdata('message', lang("mesa_added"));
            redirect('restaurante/list_mesas');

        } else {

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['page_title'] = lang('add_mesas');
            $bc = array(array('link' => site_url('restaurante/add_mesas'), 'page' => lang('add_mesas')), array('link' => '#', 'page' => lang('add_mesas')));
            $meta = array('page_title' => lang('add_mesas'), 'bc' => $bc);
            $this->page_construct('restaurante/add_mesas', $this->data, $meta);
        }
    }

    function get_mesas($store_id) {

        $this->load->library('datatables');

        $this->datatables->select('mesas.id as pid, mesas.nombre', FALSE);

        $this->datatables->from('mesas');

        $this->datatables->add_column("Actions", "<div><a href='" . site_url('restaurante/edit_mesas/$1') . "' title='" . lang("edit_tipo") . "' class='tip btn btn-warning btn-xs'><i class='fa fa-edit'></i></a> <a href='" . site_url('restaurante/delete_mesas/$1') . "' onClick=\"return confirm('" . lang('alert_x_tipo') . "')\" title='" . lang("delete_tipo") . "' class='tip btn btn-danger btn-xs'><i class='fa fa-trash-o'></i></a></div>", "pid, nombre, precio, tiempo");

        $this->datatables->unset_column('pid');

        echo $this->datatables->generate();
    }


    function edit_mesas($id = NULL) {
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
                'store_id' => $this->session->userdata('store_id'),
                );
        }

        if ($this->form_validation->run() == true && $this->restaurante_model->updateMesa($id, $data)) {

            $this->session->set_flashdata('message', lang("mesa_updated"));
            redirect("restaurante/list_mesas");

        } else {
            $this->data['mesa'] = $this->restaurante_model->getMesaById($id);
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['stores'] = $this->site->getAllStores();
            $this->data['page_title'] = lang('edit_mesas');
            $bc = array(array('link' => site_url('restaurantes/edit_mesas'), 'page' => lang('edit_mesas')), array('link' => '#', 'page' => lang('edit_mesas')));
            $meta = array('page_title' => lang('edit_mesas'), 'bc' => $bc);
            $this->page_construct('restaurante/edit_mesas', $this->data, $meta);

        }
    }

    function delete_mesas($id = NULL) {
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

        if ($this->restaurante_model->deleteMesa($id)) {
            $this->session->set_flashdata('message', lang("mesa_deleted"));
            redirect('restaurante/list_mesas');
        }

    }
}
