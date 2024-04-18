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
                        <th style="text-align: left;">Fecha de la venta:</th>
                        <td><?= $venta->created_at ?></td> <!-- Cambiar por la fecha de la venta -->
                    </tr>
                    <tr>
                        <th style="text-align: left;">Número de venta:</th>
                        <td><?= $venta->id ?></td> <!-- ID de la venta -->
                    </tr>
                    <tr>
                        <th style="text-align: left;">Mesa:</th>
                        <td><?= $venta->nombre_cliente ?></td> <!-- Nombre del cliente -->
                    </tr>
                </tbody>
            </table>

            <h3>Detalles de la venta</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>Descripción</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($venta->detalles as $detalle) { ?>
                        <tr>
                            <td><?= $detalle->nombre_receta ?></td> <!-- Nombre de la receta -->
                            <td style="text-align:right;"><?= $detalle->cantidad ?></td> <!-- Cantidad -->
                            <td style="text-align:right;"><?= $detalle->precio ?></td> <!-- Precio -->
                            <td style="text-align:right;"><?= $detalle->cantidad * $detalle->precio ?></td> <!-- Subtotal -->
                        </tr>
                    <?php } ?>
                    <tr>
                        <th colspan="3" style="text-align: right;font-size: 20px;">Total:</th>
                        <td style="text-align: right;"><?= $venta->total ?></td> <!-- Total de la venta -->
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
    // Ocultar el botón de imprimir antes de abrir la ventana de impresión
function ocultarBotonImprimir() {
    var botonImprimir = document.getElementById('botonImprimir');
    botonImprimir.style.display = 'none';
}

// Mostrar el botón de imprimir después de cerrar la ventana de impresión
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