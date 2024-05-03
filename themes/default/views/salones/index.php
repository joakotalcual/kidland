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

    <!-- Select para elegir el fecha -->
    <div class="form-group col-md-12" style="margin:0;">
    	<div class="col-md-4" style="background-color: #f5f5f5;padding-bottom: 15px;">
	        <label for="fecha">Fecha:</label>
	        <input type="date" name="fecha" id="fecha" class="form-control">
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

<!-- Modal para pagar 
<div class="modal" id="modalPagar" tabindex="-1" role="dialog" aria-labelledby="modalPagarLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="payModalLabel"><?= lang('payment') ?></h4>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label for="amount"><?= lang('amount') ?></label>
                    <input type="text" class="form-control" id="amount" name="amount" readonly>
                </div>

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

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><?= lang('close') ?></button>
                <button type="button" class="btn btn-primary"><?= lang('pay') ?></button>
            </div>
        </div>
    </div>
</div>
-->

<div class="modal" data-easein="flipYIn" id="modalPagar" tabindex="-1" role="dialog" aria-labelledby="modalPagarLabel" aria-hidden="true">
    <div class="modal-dialog modal-success">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="modalPagarLabel">
                    <?=lang('payment')?>
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <?= lang("amount", "amount"); ?>
                                    <input name="amount" type="text" id="amount"
                                    class="pa form-control kb-pad amount"/>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <?= lang("paying_by", "paid_by"); ?>
                                    <select id="paid_by" class="form-control paid_by select2" style="width:100%;">
                                        <option value="cash"><?= lang("cash"); ?></option>
                                        <option value="CC"><?= lang("cc"); ?></option>
                                        <option value="cheque"><?= lang("cheque"); ?></option>
                                        <option value="gift_card"><?= lang("gift_card"); ?></option>
                                        <?= isset($Settings->stripe) ? '<option value="stripe">' . lang("stripe") . '</option>' : ''; ?>
                                        <option value="other"><?= lang("other"); ?></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group gc" style="display: none;">
                                    <?= lang("gift_card_no", "gift_card_no"); ?>
                                    <input type="text" id="gift_card_no"
                                    class="pa form-control kb-pad gift_card_no gift_card_input"/>

                                    <div id="gc_details"></div>
                                </div>
                                <div class="pcc" style="display:none;">
                                    <div class="form-group">
                                        <input type="text" id="swipe" class="form-control swipe swipe_input"
                                        placeholder="<?= lang('focus_swipe_here') ?>"/>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <div class="form-group">
                                                <input type="text" id="pcc_no"
                                                class="form-control kb-pad"
                                                placeholder="<?= lang('cc_no') ?>"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-6">
                                            <div class="form-group">

                                                <input type="text" id="pcc_holder"
                                                class="form-control kb-text"
                                                placeholder="<?= lang('cc_holder') ?>"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <select id="pcc_type"
                                                class="form-control pcc_type select2"
                                                placeholder="<?= lang('card_type') ?>">
                                                <option value="Visa"><?= lang("Visa"); ?></option>
                                                <option
                                                value="MasterCard"><?= lang("MasterCard"); ?></option>
                                                <option value="Amex"><?= lang("Amex"); ?></option>
                                                <option
                                                value="Discover"><?= lang("Discover"); ?></option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <input type="text" id="pcc_month"
                                            class="form-control kb-pad"
                                            placeholder="<?= lang('month') ?>"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">

                                            <input type="text" id="pcc_year"
                                            class="form-control kb-pad"
                                            placeholder="<?= lang('year') ?>"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">

                                            <input type="text" id="pcc_cvv2"
                                            class="form-control kb-pad"
                                            placeholder="<?= lang('cvv2') ?>"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pcheque" style="display:none;">
                                <div class="form-group"><?= lang("cheque_no", "cheque_no"); ?>
                                    <input type="text" id="cheque_no"
                                    class="form-control cheque_no kb-text"/>
                                </div>
                            </div>
                            <div class="pcash">
                                <div class="form-group"><?= lang("payment_note", "payment_note"); ?>
                                    <input type="text" id="payment_note"
                                    class="form-control payment_note kb-text"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default pull-left" data-dismiss="modal"> <?=lang('close')?> </button>
            <button class="btn btn-primary" id="<?= $eid ? '' : 'submit-sale'; ?>"><?=lang('submit')?></button>
        </div>
    </div>
</div>
</div>

<script>
	var totalGlobal  = 0;
    // Script para manejar la lógica de la página
    $(document).ready(function() {
    	$("#modalPagar").on("change", "#paid_by", function() {
            $("#clear-cash-notes").click(), $("#amount").val(totalGlobal);
            var t = $(this).val();
            
            $("#paid_by_val").val(t);
            var e = formatDecimal(totalGlobal);
            if (0 != Settings.rounding) a = formatDecimal(roundNumber(e, parseInt(Settings.rounding)));
            else
            var a = formatDecimal(e);
            $("#rpaidby").val(t), "gift_card" == t ? ($(".gc").slideDown(), $(".ngc").slideUp("fast"), setTimeout(function() {
                $("#gift_card_no").focus()
            }, 10), $("#amount").attr("readonly", !0)) : ($(".ngc").slideDown(), $(".gc").slideUp("fast"), $("#gc_details").html(""), $("#amount").attr("readonly", !1)), "cash" == t || "other" == t ? ($(".pcash").slideDown(), $(".pcheque").slideUp("fast"), $(".pcc").slideUp("fast"), setTimeout(function() {
                $("#amount").focus()
            }, 10)) : "CC" == t || "stripe" == t ? ($(".pcc").slideDown(), $(".pcheque").slideUp("fast"), $(".pcash").slideUp("fast"), $("#amount").val(a), setTimeout(function() {
                $("#swipe").val("").focus()
            }, 10)) : "cheque" == t ? ($(".pcheque").slideDown(), $(".pcc").slideUp("fast"), $(".pcash").slideUp("fast"), $("#amount").val(a), setTimeout(function() {
                $("#cheque_no").focus()
            }, 10)) : ($(".pcheque").hide(), $(".pcc").hide(), $(".pcash").hide())
        });

    	var payButton = document.querySelector('#modalPagar button.btn-primary');

		payButton.addEventListener('click', function () {

            var isValid = true;
            var errorMessage = '';
            var paid_by = document.querySelector('#paid_by').value;
            switch (paid_by) {
                case 'cash':
                    break;
                case 'CC':
                    if (!validateInputs('.pcc input')) {
                        isValid = false;
                        errorMessage = 'Por favor, complete todos los campos para el pago con tarjeta de crédito.';
                    }
                    break;
                case 'cheque':
                    if (!validateInputs('.pcheque .form-group input')) {
                        isValid = false;
                        errorMessage = 'Por favor, complete todos los campos para el pago con cheque.';
                    }
                    break;
                case 'gift_card':
                    if (!document.querySelector('#gift_card_no').value) {
                        isValid = false;
                        errorMessage = 'Por favor, ingrese el número de la tarjeta de regalo.';
                    }
                    break;
                case 'stripe':
                    if (!validateInputs('.pcc input')) {
                        isValid = false;
                        errorMessage = 'Por favor, complete todos los campos para el pago con Stripe.';
                    }
                    break;
                default:
                    isValid = false;
                    errorMessage = 'Por favor, seleccione un tipo de pago válido.';
            }

            if (isValid) {

    		    var clienteId = document.querySelector('#cliente').value;
    		    var salonId = document.querySelector('#salon').value;
                var fecha = document.querySelector('#fecha').value;
    		    var total = document.querySelector('#amount').value;
    		    var paid_by = document.querySelector('#paid_by').value;
    		    var horario = document.querySelector('#horario').value;
    		    var csrfToken = document.querySelector('[name="spos_token"]').value;
    		    totalGlobal = total;
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
                    fecha: fecha,
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
            }   else {
                // Mostrar alerta si faltan campos requeridos
                alert(errorMessage);
            }
		});

        function validateInputs(selector) {
            var inputs = document.querySelectorAll(selector);
            for (var i = 0; i < inputs.length; i++) {
                if (!inputs[i].value) {
                    return false;
                }
            }
            return true;
        }

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

        $('#agregarInventario').click(function() {
            if ($('#fecha').val() !== '' && 
                $('#horario').val() !== '' && 
                $('#salon').val() !== '' && 
                parseInt($('#cantidad').val()) > 0 && 
                
                $('#inventario').val() !== '') {

        		    var inventarioSeleccionado = $('#inventario').val();
        		    var cantidadSeleccionada = $('#cantidad').val();
        		    var csrfToken = document.querySelector('[name="spos_token"]').value;
        		    // Realizar una solicitud AJAX para verificar la disponibilidad del inventario
        		    $.ajax({
        		        url: 'salones/verificar_disponibilidad_inventario',
        		        type: 'POST',
        		        data: {
        		            idInventario: inventarioSeleccionado,
        		            cantidad: cantidadSeleccionada,
        		            spos_token: csrfToken
        		        },
        		        success: function(response) {
        		            if (response == 'disponible') {
        		                // Agregar el elemento de inventario a la tabla si hay suficiente cantidad disponible
        		                agregarInventarioTabla(inventarioSeleccionado, cantidadSeleccionada);
        		            } else {
        		                alert('No hay suficiente cantidad disponible del inventario seleccionado.');
        		            }
        		        },
        		        error: function() {
        		            alert('Error al verificar la disponibilidad del inventario.');
        		        }
    		       });
                }
		});


		$('#fecha, #horario, #salon').on('change', function() {
		    // Verificar si los valores de los tres campos están llenos
		    var salon = $('#salon').val();
		    var fecha = $('#fecha').val();
		    var idHorario = $('#horario').val();

		    if (salon && fecha && idHorario) {
		        var csrfToken = $('[name="spos_token"]').val(); // Corregido: Selecciona el token CSRF correctamente

		        // Realizar una solicitud AJAX para verificar la disponibilidad del salón
		        $.ajax({
		            url: 'salones/verificar_disponibilidad',
		            type: 'POST',
		            data: {
		                salon: salon,
		                fecha: fecha,
		                idHorario: idHorario,
		                spos_token: csrfToken
		            },
		            success: function(response) {
					    // Parsear la respuesta JSON
					    var jsonResponse = JSON.parse(response);

					    // Verificar si el salón está disponible
					    if (jsonResponse.disponible === true) {
					        // Si el salón está disponible, no hacer nada
					    } else {
					        // Si el salón no está disponible, mostrar un alert y reiniciar los valores de fecha y horario
					        alert('El salón seleccionado no está disponible en la fecha y horario especificados.');
					        $('#fecha').val(''); // Reiniciar el valor de la fecha
					        $('#horario').val(''); // Reiniciar el valor del horario
					    }
					},
		            error: function() {
		                alert('Error al verificar la disponibilidad del salón.');
		            }
		        });
		    }
		});



		function agregarInventarioTabla(idInventario, cantidad) {
		    // Lógica para agregar el inventario a la tabla
		    // Ejemplo: Crear una nueva fila en la tabla con el nombre del inventario y la cantidad
		    var nombreInventario = obtenerNombreInventario(idInventario);
		    var fila = '<tr>' +
		                   '<td data-id="'+idInventario+'">' + nombreInventario + '</td>' +
		                   '<td style="text-align:center">' + cantidad + '</td>' +
		                   '<td style="float: right;"><button class="eliminar-inventario btn btn-danger">Eliminar</button></td>' +
		               '</tr>';
		    $('#tablaInventario').append(fila);
		}


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

        // Evento al hacer clic en "Eliminar" en la tabla de inventario
        $('#tablaInventario').on('click', '.eliminar-inventario', function() {
        	$(this).closest('tr').remove();
		    // Obtener la cantidad seleccionada de la fila a eliminar
		    var cantidadEliminada = parseInt($(this).closest('tr').find('td:eq(1)').text());
		    var csrfToken = document.querySelector('[name="spos_token"]').value;
		    // Hacer una solicitud AJAX para actualizar la cantidad del inventario en la base de datos
		    $.ajax({
		        url: 'salones/restablecer_cantidad_inventario',
		        type: 'POST',
		        data: {
		            idInventario: $(this).closest('tr').find('td:eq(0)').data('id'), // Obtener el ID del inventario
		            cantidad: cantidadEliminada,
		            spos_token: csrfToken // Incluir el token CSRF en los datos de la solicitud
		        },
		        success: function(response) {

		            if (response == 'actualizado') {
		                // Eliminar la fila de la tabla si la cantidad del inventario se actualizó correctamente en la base de datos
		                
		            } else {
		                alert('Error al restablecer la cantidad del inventario.');
		            }
		        },
		        error: function() {
		            alert('Error al restablecer la cantidad del inventario.');
		        }
		    });
		});


        // Evento al hacer clic en "Pagar"
        $('#pagar').click(function() {
            // Lógica para realizar el pago (abrir el modal, enviar datos al backend, etc.)
        });

        

    });
</script>
