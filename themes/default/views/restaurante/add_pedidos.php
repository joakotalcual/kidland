<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title"><?= lang('enter_info'); ?></h3>
                </div>
                <div class="box-body">
                    <div class="col-lg-12">
                        <?= form_open("restaurante/add_pedidos", 'class="validation"');?>
                            <div class="" style="padding: 0;margin-bottom: 10px;display: grid;">
                                <div class="col-md-6" style="padding:0">
                                    <div class="form-group">
                                        <?= lang('Mesa', 'Mesa'); ?>
                                        <?php 
                                            $mesas_options = array();
                                            foreach ($mesas as $mesa) {
                                                $mesas_options[$mesa->id] = $mesa->nombre;
                                            }
                                        ?>
                                        <?= form_dropdown('mesa', $mesas_options, '', 'id="mesa" class="form-control" required'); ?>
                                    </div>
                                </div>
                                <div class="col-md-6" style="padding:0">
                                    <div class="form-group">
                                        <?= lang('Receta', 'receta'); ?>
                                        <select name="receta" class="form-control">
                                            <?php foreach ($recetas as $receta) : ?>
                                                <option value="<?= $receta['id'] ?>" data-precio="<?= $receta['precio'] ?>">
                                                    <?= $receta['nombre'] ?>
                                                </option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <?= lang('Cantidad', 'cantidad'); ?>
                                        <?= form_input('cantidad', '', 'class="form-control" type="number"'); ?>
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
                                        <!-- Aquí se agregarán dinámicamente las filas de recetas -->
                                    </tbody>
                                </table>
                                <div id="total-container" class="text-right">
                                    <strong>Total:</strong> <span id="total">0</span>
                                </div>
                            </div>
                            <div class="form-group col-md-7" style="margin-top: 10px;padding: 0;">
                                <button type="button" class="btn btn-primary" id="añadir-pedido">Añadir Pedido</button>
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
        let total = 0;

        document.getElementById("agregar-receta").addEventListener("click", function() {
            const recetaSelect = document.querySelector('select[name="receta"]');
            const cantidadInput = document.querySelector('input[name="cantidad"]');
            const recetaOption = recetaSelect.options[recetaSelect.selectedIndex];
            const recetaId = recetaSelect.value;
            const recetaNombre = recetaSelect.options[recetaSelect.selectedIndex].text;
            const cantidad = parseFloat(cantidadInput.value);

            if (recetaId && cantidad) {
                // Realizar una solicitud AJAX para verificar la disponibilidad de insumos
                const xhr = new XMLHttpRequest();
                xhr.open('GET', `verificar_insumos?receta_id=${recetaId}&cantidad=${cantidad}`, true);
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            const response = JSON.parse(xhr.responseText);
                            if (response.success) {
                                // Si hay suficientes insumos disponibles, agregar la receta a la tabla
                                const precio = parseFloat(recetaOption.dataset.precio);
                                const subtotal = precio * cantidad;
                                total += subtotal;
                                totalElement.textContent = total.toFixed(2);
                                const newRow = document.createElement("tr");
                                newRow.setAttribute("data-receta-id", recetaId);
                                newRow.innerHTML = `
                                    <td>${recetaNombre}</td>
                                    <td>${cantidad}</td>
                                    <td>${precio}</td>
                                    <td>${subtotal.toFixed(2)}</td>
                                    <td><button type="button" class="btn btn-danger eliminar-receta">Eliminar</button></td>
                                `;
                                newRow.children[1].classList.add('cantidad');
                                recetasContainer.appendChild(newRow);
                                recetaSelect.value = '';
                                cantidadInput.value = '';
                            } else {
                                // Si no hay suficientes insumos disponibles, mostrar un alert
                                alert(response.message);
                            }
                        } else {
                            // Manejar errores de la solicitud AJAX si es necesario
                            //alert('hola');
                            
                        }

                    }
                };
                xhr.send();
            }
        });




        // Eliminar receta
        recetasContainer.addEventListener("click", function(event) {
            if (event.target.classList.contains("eliminar-receta")) {
                const row = event.target.closest("tr");
                const recetaId = row.getAttribute("data-receta-id");
                const subtotal = parseFloat(row.children[3].textContent);
                var csrfToken = document.querySelector('[name="spos_token"]').value;
                // Realizar una solicitud al backend para obtener las cantidades de insumos de la receta
                fetch('<?= site_url('restaurante/obtener_insumos_receta/') ?>' + recetaId,  {
                    headers: {
                        'spos_token': csrfToken
                    },
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Actualizar las cantidades de insumos en la base de datos
                        // Iterar sobre cada insumo en el array
                        data.insumos.forEach(insumo => {
                            const idInsumo = insumo.id_insumo;
                            const cantidadDevuelta = insumo.cantidad;

                            // Crear la URL con los parámetros de la solicitud GET
                            const url = '<?= site_url('restaurante/agregar_cantidad_insumo/') ?>' + idInsumo + '?cantidad=' + cantidadDevuelta + '&spos_token=' + csrfToken;

                            // Crear un nuevo objeto XMLHttpRequest
                            const xhr = new XMLHttpRequest();

                            // Configurar la solicitud
                            xhr.open('GET', url, true);

                            // Definir la función de respuesta
                            xhr.onload = function() {
                                if (xhr.status >= 200 && xhr.status < 300) {
                                    const response = JSON.parse(xhr.responseText);
                                    if (!response.success) {
                                        console.error('Error al agregar cantidad al insumo');
                                    }
                                } else {
                                    console.error('Error al procesar la solicitud:', xhr.statusText);
                                }
                            };

                            // Definir la función de error
                            xhr.onerror = function() {
                                console.error('Error al procesar la solicitud:', xhr.statusText);
                            };

                            // Enviar la solicitud GET
                            xhr.send();
                        });



                    } else {
                        console.error('Error al obtener los datos de la receta');
                    }
                })
                .catch(error => {
                    console.error('Error al procesar la solicitud:', error);
                });

                // Actualizar el total en el frontend
                total -= subtotal;
                totalElement.textContent = total.toFixed(2);

                // Eliminar la fila de la tabla en el frontend
                row.remove();
            }
        });


        // Evento click del botón "Añadir Pedido"
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

            // Crear objeto XMLHttpRequest
            var xhr = new XMLHttpRequest();

            // Configurar la solicitud
            xhr.open('POST', currentUrl);

            // Manejar la respuesta
            xhr.onload = function() {
                if (xhr.status === 200) {
                    window.location.href = 'list_pedidos';
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



