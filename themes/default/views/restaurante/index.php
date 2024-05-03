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

<!-- Modal Pagar 
<div class="modal" id="payModal" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
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

<div class="modal" data-easein="flipYIn" id="payModal" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-success">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="payModalLabel">
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
                                        <input required type="text" id="swipe" class="form-control swipe swipe_input"
                                        placeholder="<?= lang('focus_swipe_here') ?>"/>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <div class="form-group">
                                                <input required type="text" id="pcc_no"
                                                class="form-control kb-pad"
                                                placeholder="<?= lang('cc_no') ?>"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-6">
                                            <div class="form-group">

                                                <input required type="text" id="pcc_holder"
                                                class="form-control kb-text"
                                                placeholder="<?= lang('cc_holder') ?>"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <select required id="pcc_type"
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
                                            <input required type="text" id="pcc_month"
                                            class="form-control kb-pad"
                                            placeholder="<?= lang('month') ?>"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">

                                            <input required type="text" id="pcc_year"
                                            class="form-control kb-pad"
                                            placeholder="<?= lang('year') ?>"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group">

                                            <input required type="text" id="pcc_cvv2"
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
    var totalGlobal = 0;
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
            totalGlobal = total;
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

            // Variables para validar campos requeridos
            var isValid = true;
            var errorMessage = '';

            // Validar según el tipo de pago seleccionado
            switch (tipoPago) {
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

            // Si los campos son válidos, realizar la solicitud AJAX
            if (isValid) {
                var data = {
                    cliente_id: clienteId,
                    pedido_id: pedidoId,
                    total: totalPedido,
                    tipo_pago: tipoPago,
                    spos_token: csrfToken,
                };

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
            } else {
                // Mostrar alerta si faltan campos requeridos
                alert(errorMessage);
            }
        });

        // Función para validar campos requeridos dentro de un contenedor
        function validateInputs(selector) {
            var inputs = document.querySelectorAll(selector);
            for (var i = 0; i < inputs.length; i++) {
                if (!inputs[i].value) {
                    return false;
                }
            }
            return true;
        }

        $("#payModal").on("change", "#paid_by", function() {
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

    });
</script>
