<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Juegos_model extends CI_Model
{

    public function __construct() {
        parent::__construct();
    }

    public function addJuego($data) {
        if ($this->db->insert('juegos', $data)) {
            return true;
        }
        return false;
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

    public function updateTipo($id, $data = array()) {
        if ($this->db->update('tipos', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }

    public function deleteTipo($id) {
        if ($this->db->delete('tipos', array('id' => $id))) {
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
}
