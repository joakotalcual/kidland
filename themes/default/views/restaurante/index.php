<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<input type="hidden" name="spos_token" value="<?= $this->security->get_csrf_hash(); ?>">

<section class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Seleccionar Mesa</h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label for="mesa">Mesa:</label>
                        <select id="mesa" class="form-control">
                            <option value="">Seleccione una Mesa</option>
                            <?php foreach ($mesas as $mesa): ?>
                                <option value="<?= $mesa->id ?>"><?= $mesa->nombre ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Seleccionar Pedido</h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label for="pedido">Pedido:</label>
                        <select id="pedido" class="form-control">
                            <option value="">Seleccione un pedido</option>
                            <!-- Aquí se llenarán dinámicamente los pedidos -->
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Detalles del Pedido</h3>
                </div>
                <div class="box-body">
                    <table id="detalles-pedido" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Receta</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Aquí se llenarán dinámicamente los detalles del pedido -->
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="3" class="text-right">Total</td>
                                <td id="total">0</td>
                            </tr>
                        </tfoot>
                    </table>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#payModal" style="margin-top: 10px;">Pagar</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal Pagar -->
<div class="modal" id="payModal" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
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
    $(document).ready(function() {
        // Limpiar detalles del pedido
        function limpiarDetallesPedido() {
            $('#detalles-pedido tbody').empty();
            $('#total').text('0');
        }

        // Actualizar detalles del pedido
        function actualizarDetallesPedido(detalles) {
            limpiarDetallesPedido();
            var total = 0;
            detalles.forEach(function(detalle) {
                var subtotal = detalle.cantidad * detalle.precio;
                total += subtotal;
                $('#detalles-pedido tbody').append(
                    '<tr>' +
                    '<td>' + detalle.nombre + '</td>' +
                    '<td>' + detalle.cantidad + '</td>' +
                    '<td>' + detalle.precio + '</td>' +
                    '<td>' + subtotal + '</td>' +
                    '</tr>'
                );
            });
            $('#total').text(total);
            $('#amount').val(total)
        }

        // Cargar pedidos según el cliente seleccionado
        $('#mesa').change(function() {
            var clienteId = $(this).val();
            if (clienteId) {
            	var csrfToken = document.querySelector('[name="spos_token"]').value;
                $.ajax({
                    url: '<?= base_url("restaurante/get_pedidos_por_cliente") ?>',
                    method: 'POST',
                    data: { cliente_id: clienteId, spos_token: csrfToken},
                    dataType: 'json',
                    success: function(response) {
                        $('#pedido').empty().append('<option value="">Seleccione un pedido</option>');
                        response.forEach(function(pedido) {
                            $('#pedido').append('<option value="' + pedido.id + '">' + pedido.id + '</option>');
                        });
                        limpiarDetallesPedido();
                    },
                    error: function(xhr, status, error) {
                        console.error('Error al obtener los pedidos:', error);
                    }
                });
            } else {
                $('#pedido').empty().append('<option value="">Seleccione un pedido</option>');
                limpiarDetallesPedido();
            }
        });

        // Cargar detalles del pedido al seleccionar uno
        $('#pedido').change(function() {
            var pedidoId = $(this).val();
            if (pedidoId) {
            	var csrfToken = document.querySelector('[name="spos_token"]').value;
                $.ajax({
                    url: '<?= base_url("restaurante/get_detalles_pedido") ?>',
                    method: 'POST',
                    data: { pedido_id: pedidoId, spos_token: csrfToken },
                    dataType: 'json',
                    success: function(response) {
                        actualizarDetallesPedido(response);
                    },
                    error: function(xhr, status, error) {
                        console.error('Error al obtener los detalles del pedido:', error);
                    }
                });
            } else {
                limpiarDetallesPedido();
            }
        });

        var payButton = document.querySelector('#payModal button.btn-primary');

        payButton.addEventListener('click', function () {
		    // Obtener los valores seleccionados
		    var clienteId = document.querySelector('#mesa').value;
		    var pedidoId = document.querySelector('#pedido').value;
		    var totalPedido = document.querySelector('#total').textContent;
		    var tipoPago = document.querySelector('#paid_by').value;
		    var csrfToken = document.querySelector('[name="spos_token"]').value;
		    
		    // Crear objeto con los datos a enviar
		    var data = {
		        cliente_id: clienteId,
		        pedido_id: pedidoId,
		        total: totalPedido,
		        tipo_pago: tipoPago,
		        spos_token: csrfToken,
		    };

		    // Realizar la solicitud AJAX para guardar los datos
		    $.ajax({
		        url: 'restaurante/agregar_venta',
		        type: 'POST',
		        headers: {
		            'X-CSRF-TOKEN': csrfToken // Agregar el token CSRF al encabezado
		        },
		        dataType: 'json',
		        data: data,
		       success: function(response) {
				    console.log('Datos guardados correctamente');
				    window.location.href = '<?= site_url('restaurante/view/') ?>' + response['venta_id'] + '/' +  response['store_id'];
				},
		        error: function(xhr, status, error) {
		            console.error('Error al guardar los datos:', error);
		            // Manejar el error si ocurre
		        }
		    });
		});



    });
</script>
