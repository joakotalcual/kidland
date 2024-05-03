<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<div class="container" style="width: 500px;">
    <div style="text-align:center;">
        <?php
        if ($store) {
            echo '<img src="'.base_url('uploads/'.$store->logo).'" alt="'.$store->name.'">';
            echo '<p style="text-align:center;">';
            echo '<strong>'.$store->name.'</strong><br>';
            echo $store->address1.'<br>'.$store->address2;
            echo $store->city.'<br>'.$store->phone;
            echo '</p>';
            echo '<p>'.nl2br($store->receipt_header).'</p>';
        }
        ?>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h2>Factura</h2>
            <table class="table">
                <tbody>
                    <tr>
                        <th style="text-align: left;">Fecha de la alquiler:</th>
                        <td><?= $alquiler->fecha ?></td> <!-- Cambiar por la fecha de la alquiler -->
                    </tr>
                    <tr>
                        <th style="text-align: left;">Cliente:</th>
                        <td><?= $alquiler->nombre_cliente ?></td> <!-- ID de la alquiler -->
                    </tr>
                    <tr>
                        <th style="text-align: left;">Salon:</th>
                        <td><?= $alquiler->nombre_salon ?></td> <!-- ID de la alquiler -->
                    </tr>
                    <tr>
                        <th style="text-align: left;">Hora entrada:</th>
                        <td><?= $alquiler->hora_entrada ?></td> <!-- Nombre del cliente -->
                    </tr>
                    <tr>
                        <th style="text-align: left;">Hora Salida:</th>
                        <td><?= $alquiler->hora_salida ?></td> <!-- Nombre del cliente -->
                    </tr>
                </tbody>
            </table>

            <h3>Detalles del alquiler</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>Descripción</th>
                        <th>Cantidad</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($alquiler->items as $detalle) { ?>
                        <tr>
                            <td><?= $detalle['nombre'] ?></td> <!-- Nombre de la receta -->
                            <td style="text-align:right;"><?= $detalle['cantidad'] ?></td> <!-- Cantidad --> 
                        </tr>
                    <?php } ?>
                    <tr>
                        <th colspan="3" style="text-align: right;font-size: 20px;">Total:</th>
                        <td style="text-align: right;"><?= $alquiler->total ?></td> <!-- Total de la alquiler -->
                    </tr>
                </tbody>
            </table>
            <div style="display: flex;justify-content: center;">
                <button class="btn btn-primary" id="botonImprimir">Imprimir factura</button>
            </div>
            
        </div>
    </div>
</div>

<script>
    // Ocultar el botón de imprimir antes de abrir la alquilerna de impresión
function ocultarBotonImprimir() {
    var botonImprimir = document.getElementById('botonImprimir');
    botonImprimir.style.display = 'none';
}

// Mostrar el botón de imprimir después de cerrar la alquilerna de impresión
function mostrarBotonImprimir() {
    var botonImprimir = document.getElementById('botonImprimir');
    botonImprimir.style.display = 'block';
}

// Evento para imprimir la factura
document.getElementById('botonImprimir').addEventListener('click', function() {
    ocultarBotonImprimir();
    window.print();
    mostrarBotonImprimir();
});

</script>