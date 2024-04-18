<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?>

<h1 style="text-align: center;">Escáner de Código QR</h1>
<div style="text-align: center;">
    <video id="qrScanner" style="width: 300px; height: 300px; border: 1px solid black;"></video>
</div>
<input type="hidden" name="csrf_token" value="<?php echo $csrf_token; ?>">


<div id="result"></div>

<!-- Importar la librería necesaria -->
<script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>

<script>
    // Instanciar el escáner
    let scanner = new Instascan.Scanner({ video: document.getElementById('qrScanner') });

    // Función que se ejecuta cuando se detecta un código QR
    scanner.addListener('scan', function (content) {
        // Mostrar el resultado
        window.open(content, '_blank');
    });




    // Iniciar el escáner
    Instascan.Camera.getCameras().then(function (cameras) {
        if (cameras.length > 0) {
            scanner.start(cameras[0]);
        } else {
            console.error('No se encontraron cámaras disponibles.');
        }
    }).catch(function (e) {
        console.error(e);
    });
</script>