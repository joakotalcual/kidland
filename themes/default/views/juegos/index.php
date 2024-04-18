<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?>

<style type="text/css">
    .d-flex {
        display: flex;
    }
</style>

<div class="d-flex">
    <div class="col-sm-4 well well-sm ml-2" style="height: calc(100vh - 50vh);margin-left: 15px;padding: 0 !important;">
        <div style="text-align: center; font-weight: 800; text-transform: uppercase;margin-top: 10px;">Venta de Pases</div>
        <div class="d-flex" style="align-items: center;margin-top: 10px;">
            <div style="width: 60px;text-align: center;">Tipo</div>
            <select id="selectTipo" class="form-control" style="margin-right: 10px;">
                <option value="">Seleccionar tipo</option>
                <?php foreach ($tipos as $tipo): ?>
                    <option value="<?= $tipo->id ?>" data-precio="<?= $tipo->precio ?>" data-precio-adicional="<?= $tipo->precio_adicional ?>"><?= $tipo->nombre ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="d-flex" style="align-items: center;margin-top: 10px;">
            <div style="width: 60px;text-align: center;">Juego</div>
            <select id="selectJuego" class="form-control" style="margin-right: 10px;">
                <option value="">Seleccionar juego</option>
                <?php foreach ($juegos as $juego): ?>
                    <option value="<?= $juego->id ?>" data-tipo="<?= $juego->tipo ?>"><?= $juego->nombre ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="d-flex" style="align-items: center;margin-top: 10px;">
            <div style="width: 60px;text-align: center;">Tiempo</div>
            <input type="number" id="tiempo" value="0" class="form-control" style="margin-right: 10px;">
        </div>
        <div style="margin-top:10px;width:100%">
            <div id="btnAgregar" class="btn btn-primary" style="width:-webkit-fill-available;margin:0px 10px">Agregar</div>
        </div>
        <div style="margin-top: 10px;">
            <table id="tablaPases" class="table">
                <thead>
                    <tr style="background: #dff0d8;">
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Subtotal</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
        <div class="d-flex" style="position: absolute; bottom: 0;width: 100%;padding: 10px;background: #dff0d8;margin-bottom: 48px;">
            <div style="width: 50%;text-transform: uppercase;font-weight: bold;font-size: 20px;">Total</div>
            <div style="width: 50%;display: flex;justify-content: end;align-items: center;font-size: 20px;font-weight: bold;" id="total"></div>
        </div>
        <div class="d-flex" style="position: absolute; bottom: 0;width: 100%;padding: 10px;">
            <div style="width: 100%;text-transform: uppercase;font-weight: bold;font-size: 20px;text-align: center;">
                <div id="btnPagar" class="btn btn-success" style="width: 100%;" data-toggle="modal" data-target="#modalPagar">Pagar</div>
            </div>
        </div>
    </div>
    <div style="margin-left: 10px;">
        <div id="datos_result"></div>
        <div id="botones" style="display: none;"> 
            <div class="btn btn-primary" id="imprimir">imprimir</div>
            <div class="btn btn-secundary" id="limpiar" style="background: lightgray;">Limpiar</div>
        </div>
    </div>

</div>

<!-- Modal Pagar -->
<div class="modal fade" id="modalPagar" tabindex="-1" role="dialog" aria-labelledby="modalPagarLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalPagarLabel">Pagar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div style="font-size: large;margin: 10px;font-weight: bold;">Datos Padre</div>
                <div class="form-group col-sm-6" style="padding: 0px 10px;">
                    <label for="nombrePadre">Nombre</label>
                    <input type="text" class="form-control" id="nombrePadre" placeholder="Nombre del Padre">
                </div>
                <div class="form-group col-sm-6" style="padding: 0px 10px;">
                    <label for="telefonoPadre">Teléfono</label>
                    <input type="text" class="form-control" id="telefonoPadre" placeholder="Teléfono del Padre">
                </div>
                <div class="form-group col-sm-6" style="padding: 0px 10px;">
                    <label for="instagramPadre">Instagram</label>
                    <input type="text" class="form-control" id="instagramPadre" placeholder="Instagram del Padre">
                </div>
                <div class="form-group col-sm-6" style="padding: 0px 10px;">
                    <label for="direccionPadre">Dirección</label>
                    <input type="text" class="form-control" id="direccionPadre" placeholder="Dirección del Padre">
                </div>
                <div style="font-size: large;margin: 10px;font-weight: bold;">Datos Niño</div>
                <div class="form-group col-sm-6" style="padding: 0px 10px;">
                    <label for="nombreHijo">Nombre</label>
                    <input type="text" class="form-control" id="nombreHijo" placeholder="Nombre del Hijo">
                </div>
                <div class="form-group col-sm-6" style="padding: 0px 10px;">
                    <label for="telefonoHijo">Teléfono</label>
                    <input type="text" class="form-control" id="telefonoHijo" placeholder="Teléfono del Hijo">
                </div>
                <div class="form-group col-sm-6" style="padding: 0px 10px;">
                    <label for="instagramHijo">Instagram</label>
                    <input type="text" class="form-control" id="instagramHijo" placeholder="Instagram del Hijo">
                </div>
                <div class="form-group col-sm-6" style="padding: 0px 10px;">
                    <label for="direccionHijo">Dirección</label>
                    <input type="text" class="form-control" id="direccionHijo" placeholder="Dirección del Hijo">
                </div>
                <div class="adicionales" style="margin-bottom: 10px;">
                    <div style="font-size: large;margin: 10px;font-weight: bold;">Datos Adicionales</div>
                </div>
                <div class="form-group" style="margin:10px">
                    <button id="btnAgregarPadreAdicional" class="btn btn-primary">Agregar Padre Adicional</button>
                </div>
                <div class="form-group" style="margin:10px">
                    <label for="totalPago">Total a Pagar</label>
                    <input type="text" class="form-control" id="totalPago" readonly>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button id="btnPagarModal" type="button" class="btn btn-primary">Pagar</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function(){
        $('#mm_juegos_principal').addClass('active');
        $('.treeview').removeClass('active');
        $('.content-header').html('');

        $('#btnAgregar').click(function() {
            var selectedTipo = $('#selectTipo').val();
            var selectedJuego = $('#selectJuego').val();
            var selectedTipoNombre = $('#selectTipo option:selected').text();
            var selectedJuegoNombre = $('#selectJuego option:selected').text();
            var selectedTipoPrecio = $('#selectTipo option:selected').data('precio');
            
            if (!selectedTipo || !selectedJuego) {
                alert('Por favor seleccione un tipo y un juego.');
                return;
            }
            
            if (!($('#tiempo').val() > 0)) {
                alert('El tiempo debe ser mayor a 0.');
                return;
            }

            var existeFila = false;
            $('#tablaPases tbody tr').each(function() {
                var tipo = $(this).find('td:eq(1)').text();
                var juego = $(this).find('td:eq(0)').text();
                if (tipo == selectedTipoNombre && juego == selectedJuegoNombre) {
                    existeFila = true;
                    return false; // salir del bucle each
                }
            });

            if (existeFila) {
                alert('Ya existe una fila para el tipo y juego seleccionados.');
                return;
            }
            
            var subtotal = parseFloat(selectedTipoPrecio).toFixed(2) * $('#tiempo').val();
            var fila = '<tr><td>' + selectedJuegoNombre + '</td><td>' + selectedTipoNombre + '</td><td style="text-align: right;">' + subtotal + '</td><td style="text-align: right;"><button class="btnEliminar btn btn-danger"><i class="fa fa-trash-o"></i></button></td></tr>';
            $('#tablaPases tbody').append(fila);
            
            calcularTotal();
        });

        $('#tablaPases').on('click', '.btnEliminar', function() {
            $(this).closest('tr').remove();
            calcularTotal();
        });

        function calcularTotal() {
            var total = 0;
            $('#tablaPases tbody tr').each(function() {
                var subtotal = parseFloat($(this).find('td:eq(2)').text());
                total += subtotal;
            });
            $('#total').text(total.toFixed(2));
        }

        $('#btnPagarModal').click(function() {

            var tipo = $('#selectTipo').val();
            var juego = $('#selectJuego').val();
            var tiempo = $('#tiempo').val();
            // Recopilar los datos del modal para el padre
            var nombrePadre = $('#nombrePadre').val();
            var telefonoPadre = $('#telefonoPadre').val();
            var instagramPadre = $('#instagramPadre').val();
            var direccionPadre = $('#direccionPadre').val();

            // Recopilar los datos del modal para el hijo
            var nombreHijo = $('#nombreHijo').val();
            var telefonoHijo = $('#telefonoHijo').val();
            var instagramHijo = $('#instagramHijo').val();
            var direccionHijo = $('#direccionHijo').val();

            // Recopilar los datos de los padres adicionales
            var padresAdicionales = [];
            $('.additional-parent').each(function() {
                var nombre = $(this).find('.nombre-adicional').val();
                var telefono = $(this).find('.telefono-adicional').val();
                var instagram = $(this).find('.instagram-adicional').val();
                var direccion = $(this).find('.direccion-adicional').val();
                padresAdicionales.push({
                    nombre: nombre,
                    telefono: telefono,
                    instagram: instagram,
                    direccion: direccion
                });
            });

            // Recopilar el total
            var total = $('#totalPago').val();

            // Obtener el token CSRF
            var csrfTokenName = '<?= $this->security->get_csrf_token_name(); ?>';
            var csrfToken = '<?= $this->security->get_csrf_hash(); ?>';
            // Objeto con los datos a enviar
            var data = {
                tipo: tipo,
                juego: juego,
                nombrePadre: nombrePadre,
                telefonoPadre: telefonoPadre,
                instagramPadre: instagramPadre,
                direccionPadre: direccionPadre,
                nombreHijo: nombreHijo,
                telefonoHijo: telefonoHijo,
                instagramHijo: instagramHijo,
                direccionHijo: direccionHijo,
                padresAdicionales: padresAdicionales,
                total: total,
                tiempo:tiempo,
                [csrfTokenName]: csrfToken // Añadir el token CSRF al objeto de datos
            };

            // Realizar la solicitud AJAX
            $.ajax({
                url: 'juegos/addVentaJuego',
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function(response) {
                    // Manejar la respuesta del servidor
                    console.log('Respuesta del servidor:', response);
                    $('#modalPagar').modal('hide');
                    $('#datos_result').html('')
                    // Verificar si 'data' es un objeto
                    if (typeof response.data == 'object') {
                        var dataContent = '';
                        dataContent += `<div style="text-align:center;">`;
                        if (response.data.store) {
                            dataContent += `<img src="${'uploads/' + response.data.store.logo}" alt="${response.data.store.name}">
                                            <p style="text-align:center;">
                                            <strong>${response.data.store.name}</strong><br>
                                            ${response.data.store.address1}<br>${response.data.store.address2}
                                            ${response.data.store.city}<br>${response.data.store.phone}
                                            </p>`;
                        }
                        dataContent += `</div>`;

                        dataContent += `<div>
                        <div><b>Fecha:</b> ${response.data.fecha_actual}</div>
                        <div><b>Juego:</b> ${response.data.juego}</div>
                        <div><b>Tipo Pase:</b> ${response.data.tipo_pase}</div>
                        <div><b>Tiempo:</b> ${response.data.tiempo}</div>
                        <div><b>Total:</b> ${response.data.total}</div>
                        </div>`
                        // Recorrer los elementos de 'data'
                        for (var key in response.data) {
                            // Verificar si el valor es un array
                            if (Array.isArray(response.data[key])) {
                                if (key == 'padresAdicionales') {
                                    dataContent += '</div></div><h5>Datos Padres Adicionales:</h5>';
                                } else {
                                    dataContent += '<h5>' + key.charAt(0).toUpperCase() + key.slice(1) + ':</h5>';
                                }

                                // Recorrer los elementos del array
                                response.data[key].forEach(function(item) {
                                    dataContent += '<ul style="list-style: none;padding: 0;margin-bottom:10px;">';
                                    for (var prop in item) {
                                        var propName = prop == 'telefono' ? 'Teléfono' : prop.charAt(0).toUpperCase() + prop.slice(1);
                                        dataContent += '<li><strong>' + propName + ':</strong> ' + item[prop] + '</li>';
                                    }
                                    dataContent += '</ul>';
                                });
                            } else {
                                // Si no es un array, mostrar el valor directamente
                                if (key !== 'tipo' && key !== 'store' && key !== 'juego' && key !== 'tipo_pase' && key !== 'tiempo' && key !== 'total' && key !== 'fecha_actual') {
                                    var propName = key == 'nombrePadre' || key == 'nombreHijo' ? 'Nombre' :
                                        key == 'telefonoPadre' || key == 'telefonoHijo' ? 'Teléfono' : 
                                        key == 'instagramPadre' || key == 'instagramHijo' ? 'Instagram' : 
                                        key == 'direccionPadre' || key == 'direccionHijo' ? 'Direccion' : 
                                        key == 'juego' || key == 'juego' ? 'Juego' :
                                        key == 'tipo_pase' || key == 'tipo_pase' ? 'Tipo Pase' : key.charAt(0).toUpperCase() + key.slice(1);
                                    var value = key == 'total' ? parseFloat(response.data[key]).toFixed(2) : response.data[key];
                                    
                                    
                                    if(key == 'nombrePadre'){
                                        dataContent += '<div style="display:flex;"><div style="text-align: justify;max-width: 180px;">'
                                        dataContent += '<p style="margin-top:10px; margin-bottom:0">Datos Padre</p>';
                                    }
                                    if(key == 'nombreHijo'){
                                        dataContent += '</div><div style="margin-left:10px;text-align: justify;max-width: 180px;"><p style="margin-top:10px; margin-bottom:0">Datos Hijo</p>';
                                    }
                                    console.log(key)
                                    if(key == 'padresAdicionales' || key == 'total' || key == 'qr'){
                                        dataContent += '</div></div>'
                                    }

                                    if(key == 'qr'){
                                        dataContent += '<p style="margin-top:10px;margin-bottom:0;text-align: center;">' + value + '</p>';
                                    }else if(key == 'tiempo' ){
                                        dataContent += '<p style="margin-bottom:0"><strong>' + propName + ':</strong> ' + value + ' hora</p>';
                                    }else{
                                        dataContent += '<p style="margin-bottom:0"><strong>' + propName + ':</strong> ' + value + '</p>';
                                    }
                                    
                                    
                                    
                                }
                            }
                        }

                        // Agregar el contenido de 'data' al div 'datos_result'
                        $('#botones').show();
                        $('#datos_result').append(dataContent);
                    }
                },
                error: function(xhr, status, error) {
                    // Manejar errores de la solicitud AJAX
                    console.error('Error en la solicitud AJAX:', error);
                }
            });



        });


        $('#selectTipo').change(function() {
            var selectedTipo = $(this).val();
            $('#selectJuego option').each(function() {
                var juegoTipo = $(this).data('tipo');
                if (selectedTipo == '' || selectedTipo == juegoTipo) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
            $('#selectJuego').val('');
        });

        $('#btnAgregarPadreAdicional').click(function() {
            var additionalParentHtml = `
                <div class="additional-parent">
                    <div class="form-group col-sm-6" style="padding: 0px 10px;">
                        <label for="nombrePadreAdicional">Nombre</label>
                        <input type="text" class="form-control nombre-adicional" placeholder="Nombre del Padre Adicional">
                    </div>
                    <div class="form-group col-sm-6" style="padding: 0px 10px;">
                        <label for="telefonoPadreAdicional">Teléfono</label>
                        <input type="text" class="form-control telefono-adicional" placeholder="Teléfono del Padre Adicional">
                    </div>
                    <div class="form-group col-sm-6" style="padding: 0px 10px;">
                        <label for="instagramPadreAdicional">Instagram</label>
                        <input type="text" class="form-control instagram-adicional" placeholder="Instagram del Padre Adicional">
                    </div>
                    <div class="form-group col-sm-6" style="padding: 0px 10px;">
                        <label for="direccionPadreAdicional">Dirección</label>
                        <input type="text" class="form-control direccion-adicional" placeholder="Dirección del Padre Adicional">
                    </div>
                    <button class="btn btn-danger btnEliminarPadreAdicional" style="margin:0px 10px">Eliminar Padre Adicional</button>
                </div>
            `;
            
            $('.adicionales').append(additionalParentHtml);
            
            recalcularTotal(); // Llama a la función para recalcular el total
        });

        function recalcularTotal() {
            var total = 0;
            var precioTipo = parseFloat($('#selectTipo option:selected').data('precio')) * $('#tiempo').val();
            var precioAdicional = parseFloat($('#selectTipo option:selected').data('precio-adicional')) * $('#tiempo').val();
            total += precioTipo; // Sumar el precio del tipo seleccionado
            
            // Sumar el precio de los padres adicionales
            $('.additional-parent').each(function() {
                total += parseFloat(precioAdicional); // Sumar el precio adicional por cada padre adicional
            });

            $('#totalPago').val(total.toFixed(2)); // Mostrar el total en el elemento con id "total"
        }

        $(document).on('click', '.btnEliminarPadreAdicional', function() {
            $(this).closest('.additional-parent').remove(); // Elimina el bloque del padre adicional
            recalcularTotal(); // Llama a la función para recalcular el total
        });

        $('#btnPagar').click(function(){
            recalcularTotal();
        });

        // Función para imprimir el contenido del div
        function imprimirContenido() {
            var contenido = document.getElementById('datos_result').innerHTML;
            var ventanaImpresion = window.open('', '_blank');
            ventanaImpresion.document.write('<html><head><title>Contenido a imprimir</title></head><body>');
            ventanaImpresion.document.write(contenido);
            ventanaImpresion.document.write('</body></html>');
            ventanaImpresion.document.close();
            ventanaImpresion.print();
        }

        // Agregar evento click al botón de imprimir
        document.getElementById('imprimir').addEventListener('click', imprimirContenido);

        $('#limpiar').click(function(){
            $('#datos_result').html('');
            $('#botones').hide();
        });
    }); 
</script>
