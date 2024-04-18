<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title"><?= lang('edit_info'); ?></h3>
                </div>
                <div class="box-body">
                    <div class="col-lg-12">
                        <?= form_open("restaurante/edit_pedidos/{$pedido->id}", 'class="validation"');?>
                            <div class="" style="padding: 0;margin-bottom: 10px;display: grid;">
                                <div class="col-md-6" style="padding:0">
                                   <div class="form-group">
                                        <?= lang('Mesa', 'Mesa'); ?>
                                        <?php 
                                            $mesas_options = array();
                                            foreach ($mesas as $mesa) {
                                                $selected = ($mesa->id == $pedido->id_cliente) ? 'selected' : '';
                                                $mesas_options[] = '<option value="' . $mesa->id . '" ' . $selected . '>' . $mesa->nombre . '</option>';
                                            }
                                        ?>
                                        <?= form_dropdown('mesa', implode('', $mesas_options), '', 'id="mesa" class="form-control" required'); ?>
                                    </div>
                                </div>
                                <div class="col-md-6" style="padding:0">
                                    <div class="form-group">
                                        <?= lang('Receta', 'receta'); ?>
                                        <?php 
                                            $recetas_options = array();
                                            foreach ($recetas as $receta) {
                                                $recetas_options[$receta['id']] = $receta['nombre'];
                                            }
                                        ?>
                                        <?= form_dropdown('receta', $recetas_options, '', 'class="form-control"'); ?>
                                    </div>
                                    <div class="form-group">
                                        <?= lang('Cantidad', 'cantidad'); ?>
                                        <?= form_input('cantidad', '', 'class="form-control" type="number" min="1"'); ?>
                                    </div>
                                    <button type="button" class="btn btn-success" id="agregar-receta">Agregar Receta</button>
                                </div>
                            </div>
                            <div id="recetas-container" class="mt-4 col-md-6" style="display: grid;padding: 0;">
                                <!-- Aquí se mostrarán las recetas agregadas -->
                                <table class="table table-bordered col-md-12" style="width: auto;" id="recetas-table">
                                    <thead>
                                        <tr>
                                            <th>Receta</th>
                                            <th>Cantidad</th>
                                            <th>Precio</th>
                                            <th>Subtotal</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody id="recetas-body">
                                        <!-- Aquí se agregarán dinámicamente las filas de recetas existentes -->
                                        <?php foreach($recetas_pedido as $receta): ?>
                                            <tr data-receta-id="<?= $receta->receta_id ?>">
                                                <td><?= $receta->nombre_receta ?></td>
                                                <td class="cantidad"><?= $receta->cantidad ?></td>
                                                <td><?= $receta->precio ?></td>
                                                <td><?= floatval($receta->cantidad * $receta->precio) ?></td>
                                                <td><button type="button" class="btn btn-danger eliminar-receta">Eliminar</button></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                                <div id="total-container" class="text-right">
                                    <strong>Total:</strong> <span id="total"><?= $pedido->total ?></span>
                                </div>
                            </div>
                            <div class="form-group col-md-7" style="margin-top: 10px;padding: 0;">
                                <button type="button" class="btn btn-primary" id="añadir-pedido">Actualizar Pedido</button>
                            </div>
                        <?= form_close();?>


                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const recetasContainer = document.getElementById("recetas-body");
        const totalElement = document.getElementById("total");
        let total = <?= $pedido->total ? $pedido->total : 0 ?>;

        document.getElementById("agregar-receta").addEventListener("click", function() {
            const recetaSelect = document.querySelector('select[name="receta"]');
            const cantidadInput = document.querySelector('input[name="cantidad"]');
            const recetaId = recetaSelect.value;
            const recetaNombre = recetaSelect.options[recetaSelect.selectedIndex].text;
            const cantidad = parseInt(cantidadInput.value);

            if (recetaId && cantidad > 0) {
                const precio = <?= json_encode($recetas[0]['precio']) ?>;
                const subtotal = precio * cantidad;

                total += subtotal;
                totalElement.textContent = total.toFixed(2);

                const newRow = document.createElement("tr");
                newRow.setAttribute("data-receta-id", recetaId); // Agregar atributo data-receta-id
                newRow.innerHTML = `
                    <td>${recetaNombre}</td>
                    <td>${cantidad}</td>
                    <td>${precio}</td>
                    <td>${subtotal.toFixed(2)}</td>
                    <td><button type="button" class="btn btn-danger eliminar-receta">Eliminar</button></td>
                `;

                // Agregar clase 'cantidad' al td que muestra la cantidad
                newRow.children[1].classList.add('cantidad');

                recetasContainer.appendChild(newRow);

                recetaSelect.value = ''; // Limpiar el select después de agregar la receta
                cantidadInput.value = ''; // Limpiar la cantidad después de agregar la receta
            }
        });

        // Eliminar receta
        recetasContainer.addEventListener("click", function(event) {
            if (event.target.classList.contains("eliminar-receta")) {
                const row = event.target.closest("tr");
                const subtotal = parseFloat(row.children[3].textContent);
                total -= subtotal;
                totalElement.textContent = total.toFixed(2);
                row.remove();
            }
        });

        // Evento click del botón "Actualizar Pedido"
        document.getElementById('añadir-pedido').addEventListener('click', function() {
            // Obtener el token CSRF
            var csrfToken = document.querySelector('[name="spos_token"]').value;
            // Obtener datos de las recetas desde la tabla
            var recetas = [];
            var recetaRows = document.querySelectorAll('#recetas-table tbody tr');
            recetaRows.forEach(function(row) {
                var recetaId = row.getAttribute('data-receta-id');
                var cantidad = row.querySelector('.cantidad').textContent;
                recetas.push({ id: recetaId, cantidad: cantidad });
            });

            var cliente = document.getElementById('mesa').value;
            var currentUrl = window.location.href;

            // Crear objeto FormData y agregar datos
            var formData = new FormData();
            formData.append('recetas', JSON.stringify(recetas));
            formData.append('mesa', cliente);
            formData.append('spos_token', csrfToken);
            formData.append('id', <?= $pedido->id ?>);

            // Crear objeto XMLHttpRequest
            var xhr = new XMLHttpRequest();

            // Configurar la solicitud
            xhr.open('POST', currentUrl);

            // Manejar la respuesta
            xhr.onload = function() {
                if (xhr.status === 200) {
                    window.location.href = '<?= site_url('restaurante/list_pedidos'); ?>';
                } else {
                    console.error('Error en la solicitud. Estado:', xhr.status);
                }
            };

            // Manejar errores de red
            xhr.onerror = function() {
                console.error('Error de red al realizar la solicitud.');
            };

            // Enviar los datos al servidor
            xhr.send(formData);
        });
    });
</script>
