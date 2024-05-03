<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Restaurante_model extends CI_Model
{

    public function __construct() {
        parent::__construct();
    }

    public function add_insumos($data) {
        if ($this->db->insert('insumos', $data)) {
            return true;
        }
        return false;
    }

    public function add_recetas($data) {
        if ($this->db->insert('recetas', $data)) {
            return $this->db->insert_id();
        }
        return false;
    }

    public function add_receta_insumo($data) {
        return $this->db->insert('receta_tiene_insumos', $data);
    }

    public function addTipo($data) {
        if ($this->db->insert('tipos', $data)) {
            return true;
        }
        return false;
    }
    
    public function getAllTipos($store_id) {
        $this->db->select('id, nombre, precio, precio_adicional, tiempo, created_at, updated_at');

        $this->db->where('store_id', $store_id);

        $query = $this->db->get('tipos');

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return array();
        }
    }

    public function getAllJuegos($store_id) {
        $this->db->select('id, nombre, tipo, created_at, updated_at');

        $this->db->where('store_id', $store_id);

        $query = $this->db->get('juegos');

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return array();
        }
    }

    public function getAllInsumos($store_id) {
        $this->db->where('store_id', $store_id);
        $query = $this->db->get('insumos');

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    public function getAllRecetas($store_id) {
        $this->db->where('store_id', $store_id);
        $query = $this->db->get('recetas');

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    public function getAllRecetasDisponibles($store_id) {
        // Obtener todas las recetas de la tienda
        $this->db->where('store_id', $store_id);
        $query = $this->db->get('recetas');
        
        // Verificar si se encontraron recetas
        if ($query->num_rows() > 0) {
            $recetas = $query->result_array();
            
            // Filtrar las recetas disponibles
            $recetas_disponibles = array();
            foreach ($recetas as $receta) {
                if ($this->recetaDisponible($receta['id'])) {
                    $recetas_disponibles[] = $receta;
                }
            }
            
            return $recetas_disponibles;
        } else {
            return array();
        }
    }

    private function recetaDisponible($receta_id) {
        // Obtener los insumos requeridos para la receta
        $this->db->select('id_insumo, cantidad');
        $this->db->where('id_receta', $receta_id);
        $query = $this->db->get('receta_tiene_insumos');
        
        // Verificar si se encontraron insumos para la receta
        if ($query->num_rows() > 0) {
            $insumos_requeridos = $query->result_array();
            
            // Verificar la disponibilidad de cada insumo
            foreach ($insumos_requeridos as $insumo) {
                if (!$this->insumoDisponible($insumo['id_insumo'], $insumo['cantidad'])) {
                    // Si algún insumo no está disponible en la cantidad requerida, la receta no está disponible
                    return false;
                }
            }
            
            // Si todos los insumos están disponibles en las cantidades requeridas, la receta está disponible
            return true;
        } else {
            // Si no se encontraron insumos requeridos para la receta, considerarla no disponible
            return false;
        }
    }

    private function insumoDisponible($insumo_id, $cantidad_requerida) {
        // Obtener la cantidad disponible del insumo
        $this->db->select('cantidad');
        $this->db->where('id', $insumo_id);
        $query = $this->db->get('insumos');
        
        // Verificar si se encontró el insumo
        if ($query->num_rows() > 0) {
            $insumo = $query->row_array();
            
            // Verificar la disponibilidad comparando la cantidad requerida con la cantidad disponible
            return ($insumo['cantidad'] >= $cantidad_requerida);
        } else {
            // Si no se encontró el insumo, considerarlo no disponible
            return false;
        }
    }


    public function getAllCustomers() {
        $q = $this->db->get('customers');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function getAllMesas() {
        $q = $this->db->get('mesas');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }
    

    public function getPrecioReceta($receta_id) {
        $this->db->select('precio');
        $this->db->where('id', $receta_id);
        $query = $this->db->get('recetas');

        if ($query->num_rows() > 0) {
            $row = $query->row();
            return $row->precio;
        } else {
            return 0; // O retorna un valor predeterminado si no se encuentra la receta
        }
    }

    public function add_pedido($pedido_data) {
        $this->db->insert('pedidos', $pedido_data);
        return $this->db->insert_id();
    }

    public function add_detalle_pedido($detalle_pedido_data) {
        $this->db->insert('pedido_tiene_recetas', $detalle_pedido_data);
    }

    public function add_cliente_pedido($cliente_pedido_data) {
        $this->db->insert('cliente_tiene_pedidos', $cliente_pedido_data);
    }

    public function update_detalle_pedido_pedido_id($pedido_id)
    {
        // Actualizar el ID del pedido en los detalles del pedido
        $this->db->set('id_pedido', $pedido_id);
        $this->db->where('id_pedido', null); // Actualizar los detalles con ID de pedido nulo
        $this->db->update('pedido_tiene_recetas');
    }

    
    public function update_pedido($id, $data = array()) {
        if ($this->db->update('pedidos', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }

    public function add_mesas($data) {
        $this->db->insert('mesas', $data);
        return $this->db->insert_id();
    }




    public function getTiempoTipo($tipo_id) {
        // Selecciona solo la columna 'tiempo'
        $this->db->select('tiempo');
        
        // Realiza la consulta para obtener el tiempo del tipo dado
        $query = $this->db->get_where('tipos', array('id' => $tipo_id));

        // Verifica si se encontró algún resultado
        if ($query->num_rows() > 0) {
            // Obtiene el resultado como un objeto
            $result = $query->row();
            
            // Devuelve el valor del tiempo
            return $result->tiempo;
        } else {
            // Si no se encuentra ningún resultado, puedes devolver un valor predeterminado o manejarlo de otra manera
            return false;
        }
    }

    public function insertSalesJuegos($data) {
        // Inserta los datos en la tabla 'sales_juegos'
        $this->db->insert('sales_juegos', $data);
        
        // Verifica si la inserción fue exitosa
        if ($this->db->affected_rows() > 0) {
            // Devuelve el ID de la inserción si fue exitosa
            return $this->db->insert_id();
        } else {
            // Devuelve falso si la inserción falló
            return false;
        }
    }


    public function insertSalesJuegosPersonas($data) {
        // Inserta los datos en la tabla 'sales_juegos_personas'
        $this->db->insert('sales_juegos_personas', $data);
        
        // Verifica si la inserción fue exitosa
        if ($this->db->affected_rows() > 0) {
            // Devuelve verdadero si la inserción fue exitosa
            return true;
        } else {
            // Devuelve falso si la inserción falló
            return false;
        }
    }

    public function updateInsumo($id, $data = array()) {
        if ($this->db->update('insumos', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }

    public function updateMesa($id, $data = array()) {
        if ($this->db->update('mesas', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }
    

    public function updateReceta($id, $data = array()) {
        $this->db->where('id', $id);
        if ($this->db->update('recetas', $data)) {
            return $id; // Retorna el ID de la receta actualizada
        }
        return false;
    }

    public function delete_receta_insumo($id_receta) {
        $this->db->where('id_receta', $id_receta);
        return $this->db->delete('receta_tiene_insumos');
    }

    public function deleteInsumo($id) {
        if ($this->db->delete('insumos', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }

    public function deleteMesa($id) {
        if ($this->db->delete('mesas', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }
    

    public function deleteRecetas($id) {
        if ($this->db->delete('recetas', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }
    
    public function deleteVenta($id) {
        if ($this->db->delete('sales_juegos', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }

    public function updateJuego($id, $data = array()) {
        if ($this->db->update('juegos', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }

    public function updateSaleJuegos($id, $data = array()) {
        if ($this->db->update('sales_juegos', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }

    

    public function deleteJuego($id) {
        if ($this->db->delete('juegos', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }

    public function delete_pedido_tiene_recetas($id) {
        if ($this->db->delete('pedido_tiene_recetas', array('id_pedido' => $id))) {
            return true;
        }
        return FALSE;
    }

    public function delete_cliente_tiene_pedidos($id) {
        if ($this->db->delete('cliente_tiene_pedidos', array('id_pedido' => $id))) {
            return true;
        }
        return FALSE;
    }

    public function deletePedidos($id) {
        // Obtener el pedido
        $pedido = $this->db->get_where('pedidos', array('id' => $id))->row();

        // Verificar si se encontró el pedido
        if ($pedido) {
            // Eliminar el pedido
            
                // Obtener las recetas asociadas a este pedido
                $recetas = $this->db->get_where('pedido_tiene_recetas', array('id_pedido' => $id))->result();
                // Recorrer cada receta asociada al pedido
                foreach ($recetas as $receta) {
                    // Obtener la cantidad de recetas
                    $cantidadRecetas = $receta->cantidad;
                    
                    // Obtener la lista de insumos asociados a esta receta
                    $insumosReceta = $this->db->get_where('receta_tiene_insumos', array('id_receta' => $receta->id_receta))->result();

                    // Actualizar la cantidad de insumos en la tabla de insumos
                    foreach ($insumosReceta as $insumoReceta) {
                        // Obtener la cantidad de insumos necesarios
                        $cantidadInsumos = $insumoReceta->cantidad * $cantidadRecetas;

                        // Obtener el ID del insumo
                        $idInsumo = $insumoReceta->id_insumo;

                        // Obtener la información del insumo
                        $insumo = $this->db->get_where('insumos', array('id' => $idInsumo))->row();

                        // Actualizar la cantidad de insumos
                        if ($insumo) {
                            $nuevaCantidad = $insumo->cantidad + $cantidadInsumos;
                            $this->db->where('id', $idInsumo);
                            $this->db->update('insumos', array('cantidad' => $nuevaCantidad));
                        }
                    }
                }
            if ($this->db->delete('pedidos', array('id' => $id))) {
               return true; // Operación exitosa
            }
        }
    return false; // No se pudo eliminar el pedido
}


    


    public function tiempoRestante($id) {
        try {
            // Seleccionar la fecha de creación y el tiempo asignado
            $this->db->select('created_at, tiempo');
            $this->db->where('id', $id);
            $query = $this->db->get('sales_juegos');

            // Verificar si se obtuvieron resultados
            if ($query->num_rows() > 0) {
                // Obtener la fila de resultados
                $row = $query->row();

                // Convertir la fecha de creación a un objeto DateTime
                $created_at = new DateTime($row->created_at);

                // Obtener el tiempo asignado en horas
                $tiempo_horas = (int) $row->tiempo;

                // Calcular la fecha de vencimiento sumando el tiempo asignado a la fecha de creación
                $expiration_time = clone $created_at;
                $expiration_time->modify("+$tiempo_horas hour");

                // Calcular el tiempo restante
                $now = new DateTime();
                $tiempo_restante = $expiration_time->diff($now);

                // Verificar si el tiempo restante es negativo (es decir, ya ha pasado el tiempo asignado)
                if ($expiration_time < $now) {
                    return '00:00:00'; // Si ya ha pasado el tiempo, devolver 00:00:00
                } else {
                    // Formatear el tiempo restante
                    return $tiempo_restante->format('%H:%I:%S');
                }
            } else {
                // Si no se encuentra la venta de juego, devolver FALSE
                return FALSE;
            }
        } catch (Exception $e) {
            // Manejar la excepción
            log_message('error', 'Error en tiempoRestante(): ' . $e->getMessage());
            return FALSE;
        }
    }

    public function getRecetaById($id) {
        // Obtener la receta por su ID
        $q = $this->db->get_where('recetas', array('id' => $id));
        if ($q->num_rows() > 0) {
            $receta = $q->row_array();

            // Obtener los insumos relacionados con esta receta desde la tabla receta_tiene_insumos
            $this->db->select('*');
            $this->db->from('receta_tiene_insumos');
            $this->db->where('id_receta', $id);
            $query = $this->db->get();

            // Verificar si hay resultados y asignarlos a la receta
            if ($query->num_rows() > 0) {
                $receta['insumos'] = $query->result_array();
            } else {
                $receta['insumos'] = array(); // Si no hay insumos, asignar un array vacío
            }

            return $receta;
        }
        return FALSE;
    }

    public function getPedidoById($id) {
        // Consulta para obtener los datos del pedido por su ID
        $this->db->select('*');
        $this->db->from('pedidos');
        $this->db->where('id', $id);
        $query = $this->db->get();

        // Verificar si se encontró el pedido
        if ($query->num_rows() > 0) {
            return $query->row(); // Devolver los datos del pedido
        } else {
            return false; // Si no se encuentra, devolver falso
        }
    }

    public function getMesaById($id) {
        // Consulta para obtener los datos del pedido por su ID
        $this->db->select('*');
        $this->db->from('mesas');
        $this->db->where('id', $id);
        $query = $this->db->get();

        // Verificar si se encontró el pedido
        if ($query->num_rows() > 0) {
            return $query->row(); // Devolver los datos del pedido
        } else {
            return false; // Si no se encuentra, devolver falso
        }
    }

    
    public function getRecetasPedido($id_pedido) {
        // Consulta para obtener las recetas asociadas a un pedido por su ID
        $this->db->select('pedido_tiene_recetas.*, recetas.nombre as nombre_receta, recetas.id as receta_id');
        $this->db->from('pedido_tiene_recetas');
        $this->db->join('recetas', 'recetas.id = pedido_tiene_recetas.id_receta', 'left');
        $this->db->where('pedido_tiene_recetas.id_pedido', $id_pedido);
        $query = $this->db->get();

        // Verificar si se encontraron recetas asociadas al pedido
        if ($query->num_rows() > 0) {
            return $query->result(); // Devolver las recetas asociadas al pedido
        } else {
            return false; // Si no se encuentran, devolver falso
        }
    }

    public function getPedidosPorEstado($estado) {
        // Consultar los pedidos con el estado especificado
        $this->db->select('*');
        $this->db->from('pedidos');
        $this->db->where('estado', $estado);
        $query = $this->db->get();

        // Verificar si se encontraron pedidos
        if ($query->num_rows() > 0) {
            return $query->result(); // Devolver los pedidos encontrados
        } else {
            return array(); // Devolver un array vacío si no se encontraron pedidos
        }
    }
}
