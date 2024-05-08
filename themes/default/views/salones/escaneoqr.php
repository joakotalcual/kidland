<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<h1 style="text-align: center;">Escáner de Código QR</h1>
<div style="text-align: center;">
    <video id="qrScanner" style="width: 300px; height: 300px; border: 1px solid black;"></video>
</div>

<input type="hidden" name="spos_token" value="<?= $this->security->get_csrf_hash(); ?>">

<div id="result"></div>

<!-- Importar la librería necesaria -->
<script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>

<script>
    // Instanciar el escáner
    let scanner = new Instascan.Scanner({ video: document.getElementById('qrScanner') });

    // Función que se ejecuta cuando se detecta un código QR
    scanner.addListener('scan', function (content) {
        // Mostrar el resultado
        // Extraer el ID del contenido escaneado
        var id = extraerID(content);
        
        // Enviar el ID al backend
        enviarIDAlBackend(id);
    });

    function extraerID(content) {
        // Aquí debes implementar la lógica para extraer el ID del contenido escaneado
        // Por ejemplo, si el ID está al final de la URL, puedes usar expresiones regulares
        var regex = /\/(\d+)$/; // Expresión regular para encontrar números al final de la URL
        var matches = content.match(regex);
        if (matches && matches.length > 1) {
            return matches[1]; // Devolver el primer grupo de captura (el ID)
        } else {
            return null; // Retornar null si no se encuentra ningún ID
        }
    }

    function enviarIDAlBackend(id) {
        // Enviar el ID al backend utilizando AJAX
        var csrfToken = document.querySelector('[name="spos_token"]').value;
        $.ajax({
            url: 'invitado/' + id,
            type: 'POST',
            data: { id: id, spos_token: csrfToken},
            success: function(response) {
                // Manejar la respuesta del backend si es necesario
                console.log(response.message);
                if(response.message == 1){
                    Swal.fire({
                        title: "Exito Puede Ingresar",
                        text: "",
                        icon: "success",
                        confirmButtonColor: "#3085d6",
                        confirmButtonText: "Ok",
                    }).then((result) => {
                    });
                }else{
                    Swal.fire({
                        title: "Salon Lleno",
                        text: "",
                        icon: "warning",
                        confirmButtonColor: "#3085d6",
                        confirmButtonText: "Ok",
                    }).then((result) => {
                    });
                }
                

            },
            error: function(xhr, status, error) {
                console.error('Error al enviar el ID al backend:', error);
                // Manejar el error si ocurre
            }
        });
    }


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