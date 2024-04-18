<div style="height: 100%; font-family: system-ui; display: flex; flex-direction: column; justify-content: center; align-items: center;">
    <h1>Tiempo Restante</h1>
    <h3 id="tiempo-restante"><?php echo $tiempo_restante ?></h3>
</div>

<script>
    // Función para actualizar el tiempo restante cada segundo
    function actualizarTiempoRestante() {
        // Obtener el elemento h3 que muestra el tiempo restante
        var tiempoRestanteElement = document.getElementById('tiempo-restante');

        // Obtener el tiempo restante actual del elemento
        var tiempoRestante = tiempoRestanteElement.innerHTML;

        // Parsear el tiempo restante en horas, minutos y segundos
        var tiempoRestanteArray = tiempoRestante.split(':');
        var horas = parseInt(tiempoRestanteArray[0], 10);
        var minutos = parseInt(tiempoRestanteArray[1], 10);
        var segundos = parseInt(tiempoRestanteArray[2], 10);

        // Restar un segundo al tiempo restante
        segundos--;

        // Si los segundos llegan a 0, reducir un minuto y restablecer los segundos a 59
        if (segundos < 0) {
            segundos = 59;
            minutos--;
        }

        // Si los minutos llegan a 0, reducir una hora y restablecer los minutos a 59
        if (minutos < 0) {
            minutos = 59;
            horas--;
        }

        // Formatear el nuevo tiempo restante
        var nuevoTiempoRestante = ('0' + horas).slice(-2) + ':' + ('0' + minutos).slice(-2) + ':' + ('0' + segundos).slice(-2);
        if (nuevoTiempoRestante != '00:00:00') {
        // Actualizar el contenido del elemento h3 con el nuevo tiempo restante
        tiempoRestanteElement.innerHTML = nuevoTiempoRestante;

        // Si el tiempo restante llega a 00:00:00, detener la actualización
        
            //clearInterval(intervalo);
        }
    }

    // Actualizar el tiempo restante cada segundo
    var intervalo = setInterval(actualizarTiempoRestante, 1000);
</script>
