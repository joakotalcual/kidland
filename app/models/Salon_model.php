<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Salon_model extends CI_Model
{  
    public function __construct() {
        parent::__construct();
    }

    public function getAllSalones() {
        $q = $this->db->get('salones');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function getAllInventario() {
        $q = $this->db->get('inventario_salones');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function obtener_detalle_alquiler($id = NULL) {
        // Verificar si se proporcionó un ID válido
        if ($id) {
            // Obtener los datos del alquiler desde la tabla alquiler_salones
            $this->db->select('*');
            $this->db->from('alquiler_salones');
            $this->db->where('id', $id);
            $query = $this->db->get();
            $alquiler = $query->row();

            // Verificar si se encontró el alquiler
            if ($alquiler) {
                // Convertir el campo items a un array asociativo
                $items = json_decode($alquiler->items, true);

                $nuevosItems = [];

                foreach ($items as $item) {
                    $idItem = $item['id'];
                    
                    // Obtener el nombre del ítem desde la tabla inventario_salones
                    $this->db->select('nombre');
                    $this->db->from('inventario_salones');
                    $this->db->where('id', $idItem);
                    $query = $this->db->get();
                    $nombreItem = $query->row()->nombre;
                    
                    // Agregar el nombre del ítem al array de ítems
                    $item['nombre'] = $nombreItem;
                    
                    // Agregar el ítem modificado al nuevo array
                    $nuevosItems[] = $item;
                }

                // Asignar el nuevo array de ítems al objeto alquiler
                $alquiler->items = $nuevosItems;

                return $alquiler; // Devolver los detalles del alquiler con los nombres de los ítems
            } else {
                return null; // El alquiler no fue encontrado
            }
        } else {
            return null; // No se proporcionó un ID válido
        }
    }


    public function getAllHorarios() {
        $q = $this->db->get('horarios');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }
    
    public function add_salones($data) {
        if ($this->db->insert('salones', $data)) {
            return true;
        }
        return false;
    }

    public function updateSalon($id, $data = array()) {
        if ($this->db->update('salones', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }

    public function getSalonById($id) {
        // Consulta para obtener los datos del pedido por su ID
        $this->db->select('*');
        $this->db->from('salones');
        $this->db->where('id', $id);
        $query = $this->db->get();

        // Verificar si se encontró el pedido
        if ($query->num_rows() > 0) {
            return $query->row(); // Devolver los datos del pedido
        } else {
            return false; // Si no se encuentra, devolver falso
        }
    }

    public function deleteSalon($id) {
        if ($this->db->delete('salones', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }

    // INVENTARIO
    // 
    public function add_inventario($data) {
        if ($this->db->insert('inventario_salones', $data)) {
            return true;
        }
        return false;
    }

    public function updateInventario($id, $data = array()) {
        if ($this->db->update('inventario_salones', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }

    public function getInventarioById($id) {
        // Consulta para obtener los datos del pedido por su ID
        $this->db->select('*');
        $this->db->from('inventario_salones');
        $this->db->where('id', $id);
        $query = $this->db->get();

        // Verificar si se encontró el pedido
        if ($query->num_rows() > 0) {
            return $query->row(); // Devolver los datos del pedido
        } else {
            return false; // Si no se encuentra, devolver falso
        }
    }

    public function deleteInventario($id) {
        if ($this->db->delete('inventario_salones', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }

    // HORARIO
    // 
    public function add_horario($data) {
        // Contar la cantidad de registros actuales en la tabla 'horarios'
        $num_rows = $this->db->count_all_results('horarios');

        // Verificar si ya existen dos registros en la tabla
        if ($num_rows < 2) {
            // Si hay menos de dos registros, intentar insertar el nuevo registro
            if ($this->db->insert('horarios', $data)) {
                return true; // La inserción fue exitosa
            } else {
                return false; // Hubo un error en la inserción
            }
        } else {
            return false; // Ya existen dos registros, no se puede insertar más
        }
    }


    public function updateHorario($id, $data = array()) {
        if ($this->db->update('horarios', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }

    public function getHorarioById($id) {
        // Consulta para obtener los datos del pedido por su ID
        $this->db->select('*');
        $this->db->from('horarios');
        $this->db->where('id', $id);
        $query = $this->db->get();

        // Verificar si se encontró el pedido
        if ($query->num_rows() > 0) {
            return $query->row(); // Devolver los datos del pedido
        } else {
            return false; // Si no se encuentra, devolver falso
        }
    }

    public function deleteHorario($id) {
        if ($this->db->delete('horarios', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }

    public function obtenerCantidadDisponible($idInventario, $cantidad) {
        // Consultar la cantidad disponible del inventario en la base de datos
        $this->db->select('cantidad');
        $this->db->where('id', $idInventario);
        $query = $this->db->get('inventario_salones');

        if ($query->num_rows() > 0) {
            // Obtener la cantidad disponible del resultado de la consulta
            $row = $query->row();
            $cantidadDisponible = $row->cantidad;
            
            // Verificar si la cantidad disponible es suficiente
            if ($cantidadDisponible >= $cantidad) {
                // Restar la cantidad seleccionada del inventario
                $cantidadDisponible -= $cantidad;
                // Actualizar la cantidad disponible en la base de datos
                $this->db->set('cantidad', $cantidadDisponible);
                $this->db->where('id', $idInventario);
                $this->db->update('inventario_salones');
            }
            
            return $row->cantidad;
        } else {
            return 0;
        }
    }

    public function restablecerCantidad($idInventario, $cantidadEliminada) {
        $this->db->set('cantidad', 'cantidad + ' . $cantidadEliminada, FALSE);
        $this->db->where('id', $idInventario);
        return $this->db->update('inventario_salones');
    }

    public function verificarDisponibilidad($horaEntrada, $horaSalida, $fecha, $idSalon) {
        // Consultar la base de datos para verificar si hay algún alquiler en el rango de tiempo especificado y para el salón específico
        $this->db->where('id_salon', $idSalon); // Agregar la condición para el ID del salón
        $this->db->where('hora_entrada', $horaEntrada);
        $this->db->where('hora_salida', $horaSalida);
        $this->db->where("DATE(created_at)", $fecha);

        $query = $this->db->get('alquiler_salones');

        return $query->num_rows() == 0; // Devuelve true si no hay alquileres en ese rango de tiempo y para el salón especificado, false si hay alquileres
    }





    public function obtenerHoraEntrada($idHorario) {
        $this->db->select('hora_entrada');
        $this->db->where('id', $idHorario);
        $query = $this->db->get('horarios');

        if ($query->num_rows() > 0) {
            $row = $query->row();
            return $row->hora_entrada;
        } else {
            return null;
        }
    }

    public function obtenerHoraSalida($idHorario) {
        $this->db->select('hora_salida');
        $this->db->where('id', $idHorario);
        $query = $this->db->get('horarios');

        if ($query->num_rows() > 0) {
            $row = $query->row();
            return $row->hora_salida;
        } else {
            return null;
        }
    }
}
