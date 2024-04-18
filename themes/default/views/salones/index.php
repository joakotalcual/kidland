<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<input type="hidden" name="spos_token" value="<?= $this->security->get_csrf_hash(); ?>">

<div class="container"  style="margin:0">
	<div class="col-md-12">
	    <div class="col-md-4">
    		<h1>Venta de Salones</h1>
		</div>
	</div>

    <!-- Select para elegir el cliente -->
    <div class="form-group col-md-12" style="margin:0;">
    	<div class="col-md-4" style="background-color: #f5f5f5;padding-bottom: 15px;">
	        <label for="cliente">Cliente:</label>
	        <select id="cliente" class="form-control">
	        	<option value=""></option>
	            <?php foreach ($clientes as $cliente): ?>
	                <option value="<?php echo $cliente->id; ?>"><?php echo $cliente->name; ?></option>
	            <?php endforeach; ?>
	        </select>
        </div>
    </div>

    <!-- Select para elegir el salón -->
    <div class="form-group col-md-12" style="margin:0;">
    	<div class="col-md-4" style="background-color: #f5f5f5;padding-bottom: 15px;">
	        <label for="salon">Salón:</label>
	        <select id="salon" class="form-control">
	        	<option value=""></option>
	            <?php foreach ($salones as $salon): ?>
	                <option value="<?php echo $salon->id; ?>" data-precio="<?php echo $salon->precio; ?>"><?php echo $salon->nombre; ?></option>
	            <?php endforeach; ?>
	        </select>
        </div>
    </div>

    <!-- Select para elegir el horario -->
    <div class="form-group col-md-12" style="margin:0;">
    	<div class="col-md-4" style="background-color: #f5f5f5;padding-bottom: 15px;">
	        <label for="salon">Horario:</label>
	        <select id="horario" class="form-control">
	        	<option value=""></option>
	            <?php foreach ($horarios as $horario): ?>
	                <option value="<?php echo $horario->id; ?>"><?php echo $horario->nombre; ?></option>
	            <?php endforeach; ?>
	        </select>
        </div>
    </div>

    <!-- Select para elegir el inventario y cantidad -->
    <div class="form-group col-md-12" style="margin:0;">
    	<div class="col-md-4" style="background-color: #f5f5f5;padding-bottom: 15px;">
	        <label for="inventario">Inventario:</label>
	        <select id="inventario" class="form-control">
	        	<option value=""></option>
	            <?php foreach ($inventario as $item): ?>
	                <option value="<?php echo $item->id; ?>"><?php echo $item->nombre; ?></option>
	            <?php endforeach; ?>
	        </select>
	        <div style="margin-top: 10px;margin-bottom: 10px;">
	        	<label>Cantidad</label>
	        	<input type="number" id="cantidad" class="form-control" placeholder="Cantidad">
	        </div>
	        <button id="agregarInventario" class="btn btn-primary" style="float: right;">Agregar Inventario</button>
    	</div>
    </div>

    <!-- Tabla para mostrar el inventario seleccionado -->
    <div class="col-md-12" style="margin:0;">
	    <div class="col-md-4" style="background-color: #f5f5f5;padding-bottom: 15px;">
		    <table class="table">
		        <thead>
		            <tr style="background: #dff0d8;">
		                <th>Nombre</th>
		                <th>Cantidad</th>
		                <th>Eliminar</th>
		            </tr>
		        </thead>
		        <tbody id="tablaInventario">
		            <!-- Aquí se agregarán los elementos de inventario -->
		        </tbody>
		    </table>
	    </div>
	</div>

    <!-- Total -->
    <div class="col-md-12" style="margin:0;">
    	<div class="col-md-4" style="font-size: 20px;font-weight: bold;padding-bottom: 15px;background-color: #f5f5f5;">
    		<div style="background: #dff0d8;padding: 5px;">Total: <span id="total"></span></div>
    	</div>
    </div>
    

    <!-- Botón para pagar -->
    <div class="col-md-12">
    	<div class="col-md-4" style="background-color: #f5f5f5;padding-bottom: 15px;padding-top:10px;text-align: end;">
    		<button id="pagar" class="btn btn-success" data-toggle="modal" data-target="#modalPagar">Pagar</button>
    	</div>
    </div>
</div>

<!-- Modal para pagar -->
<div class="modal" id="modalPagar" tabindex="-1" role="dialog" aria-labelledby="modalPagarLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="payModalLabel"><?= lang('payment') ?></h4>
            </div>
            <div class="modal-body">
                <!-- Aquí va el contenido del modal -->
                <div class="form-group">
                    <label for="amount"><?= lang('amount') ?></label>
                    <input type="text" class="form-control" id="amount" name="amount" readonly>
                </div>
                <!-- Fin de la tabla -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="paid_by"><?= lang('paying_by') ?></label>
                            <select class="form-control" id="paid_by" name="paid_by">
                                <option value="cash"><?= lang('cash') ?></option>
                                <option value="CC"><?= lang('cc') ?></option>
                                <option value="cheque"><?= lang('cheque') ?></option>
                                <option value="gift_card"><?= lang('gift_card') ?></option>
                                <?= isset($Settings->stripe) ? '<option value="stripe">' . lang('stripe') . '</option>' : '' ?>
                                <option value="other"><?= lang('other') ?></option>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- Agrega aquí los campos adicionales según el método de pago seleccionado -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><?= lang('close') ?></button>
                <button type="button" class="btn btn-primary"><?= lang('pay') ?></button>
            </div>
        </div>
    </div>
</div>

<script>
    // Script para manejar la lógica de la página
    $(document).ready(function() {

    	var payButton = document.querySelector('#modalPagar button.btn-primary');

		payButton.addEventListener('click', function () {
		    var clienteId = document.querySelector('#cliente').value;
		    var salonId = document.querySelector('#salon').value;
		    var total = document.querySelector('#amount').value;
		    var paid_by = document.querySelector('#paid_by').value;
		    var horario = document.querySelector('#horario').value;
		    var csrfToken = document.querySelector('[name="spos_token"]').value;

			var items = [];
			var rows = $('#tablaInventario tr');

			for (var i = 0; i < rows.length; i++) {
			    var idItem = rows[i].querySelector('td:nth-child(1)').dataset.id;
			    var cantidad = rows[i].querySelector('td:nth-child(2)').textContent;
			    items.push({ id: idItem, cantidad: cantidad });
			}

		    var data = {
		        id_cliente: clienteId,
		        id_salon: salonId,
		        total: total,
		        metodo_pago: paid_by,
		        horario: horario,
		        spos_token: csrfToken,
		        items: items // Agregar los items al objeto de datos
		    };

		    $.ajax({
		        url: 'salones/agregar_alquiler',
		        type: 'POST',
		        headers: {
		            'X-CSRF-TOKEN': csrfToken 
		        },
		        dataType: 'json',
		        data: data,
		        success: function(response) {
		            console.log('Datos guardados correctamente');
		            window.location.href = '<?= site_url('salones/view/') ?>' + response['id_alquiler'] + '/' +  response['store_id'];
		        },
		        error: function(xhr, status, error) {
		            console.error('Error al guardar los datos:', error);
		        }
		    });
		});

        // Variables para almacenar los elementos seleccionados
        var clienteSeleccionado, salonSeleccionado, inventarioSeleccionado, cantidadSeleccionada;

        // Evento al cambiar el cliente seleccionado
        $('#cliente').change(function() {
            clienteSeleccionado = $(this).val();
        });

        // Evento al cambiar el salón seleccionado
        $('#salon').change(function() {
            salonSeleccionado = $(this).val();
            // Actualizar el total con el precio del salón seleccionado
            var precioSalon = obtenerPrecioSalon();
            console.log(precioSalon)
            $('#total').text(precioSalon);
            $('#amount').val(precioSalon)
        });

        // Evento al hacer clic en "Agregar Inventario"
        $('#agregarInventario').click(function() {
            inventarioSeleccionado = $('#inventario').val();
            cantidadSeleccionada = $('#cantidad').val();
            // Agregar el elemento de inventario a la tabla
            agregarInventarioTabla(inventarioSeleccionado, cantidadSeleccionada);
        });

        // Función para obtener el nombre del inventario seleccionado
		function obtenerNombreInventario() {
		    var idInventario = $('#inventario').val(); // Obtener el valor seleccionado del select
		    var nombreInventario = $('#inventario option:selected').text(); // Obtener el texto de la opción seleccionada
		    return nombreInventario;
		}

		// Función para obtener el precio del salón seleccionado
		function obtenerPrecioSalon() {
		    var idSalon = $('#salon').val(); // Obtener el valor seleccionado del select
		    var precioSalon = $('#salon option:selected').data('precio'); // Obtener el valor del atributo data-precio de la opción seleccionada
		    // Verificar si el precio del salón es undefined y devolver 0 en ese caso
		    if (typeof precioSalon === 'undefined') {
		        return 0;
		    }
		    return precioSalon;
		}


        // Función para agregar un elemento de inventario a la tabla
        function agregarInventarioTabla(idInventario, cantidad) {
            // Lógica para agregar el inventario a la tabla
            // Ejemplo: Crear una nueva fila en la tabla con el nombre del inventario y la cantidad
            var nombreInventario = obtenerNombreInventario(idInventario);
            var idInventario = $('#inventario').val();
            var fila = '<tr>' +
                           '<td data-id="'+idInventario+'">' + nombreInventario + '</td>' +
                           '<td style="text-align:center">' + cantidad + '</td>' +
                           '<td style="float: right;"><button class="eliminar-inventario btn btn-danger">Eliminar</button></td>' +
                       '</tr>';
            $('#tablaInventario').append(fila);
        }
        // Evento al hacer clic en "Eliminar" en la tabla de inventario
        $('#tablaInventario').on('click', '.eliminar-inventario', function() {
            // Eliminar la fila de la tabla
            $(this).closest('tr').remove();
        });

        // Evento al hacer clic en "Pagar"
        $('#pagar').click(function() {
            // Lógica para realizar el pago (abrir el modal, enviar datos al backend, etc.)
        });

        

    });
</script>
