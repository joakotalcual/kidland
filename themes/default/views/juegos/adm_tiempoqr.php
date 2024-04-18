<div style="height: 100%; font-family: system-ui; display: flex; flex-direction: column; justify-content: center; align-items: center;">
    <?php 
        if($admin){
    ?>
    <h1><?= $juego->nombre_juego ?></h1>
    
    <div>
        <div style="margin-bottom:10px">
            <div><b>Fecha:</b> <?= $juego->created_at ?></div>
            <div><b>Tiempo:</b> <?= $juego->tiempo ?> Horas</div>
            <div><b>Total:</b> <?= $juego->precio ?></div>
        </div>
        <div style="display: flex; flex-wrap: wrap;">
        <?php foreach ($datos as $dato): ?>
            <?php if ($dato->tipo_persona == 'Padre' || $dato->tipo_persona == 'Hijo'): ?>
                <div style="max-width: 200px; text-align: justify; margin-right: 20px;">
                    <div style="margin-bottom: 5px; text-transform: uppercase;"><b>
                        <?= $dato->tipo_persona == 'Padre' ? 'Datos Padre' : 'Datos Niño' ?>
                    </b></div>
                    <div><b>Nombre:</b> <?= $dato->nombre ?></div>
                    <div><b>Teléfono:</b> <?= $dato->telefono ?></div>
                    <div><b>Instagram:</b> <?= $dato->instagram ?></div>
                    <div><b>Dirección:</b> <?= $dato->direccion ?></div>
                </div>
            <?php endif; ?>
        <?php endforeach; ?>
    </div>

    <div style="">
        <?php foreach ($datos as $dato): ?>
            <?php if ($dato->tipo_persona == 'Padre Adicional'): ?>
                <div style="max-width: 200px; text-align: justify;margin-top: 10px;">
                    <div style="margin-bottom: 5px; text-transform: uppercase;"><b>Datos Padre Adicional</b></div>
                    <div><b>Nombre:</b> <?= $dato->nombre ?></div>
                    <div><b>Teléfono:</b> <?= $dato->telefono ?></div>
                    <div><b>Instagram:</b> <?= $dato->instagram ?></div>
                    <div><b>Dirección:</b> <?= $dato->direccion ?></div>
                </div>
            <?php endif; ?>
        <?php endforeach; ?>
    </div>
    </div>
    <?php 
        }
    ?>
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

        // Actualizar el contenido del elemento h3 con el nuevo tiempo restante
        if (nuevoTiempoRestante != '00:00:00') {
        tiempoRestanteElement.innerHTML = nuevoTiempoRestante;

        // Si el tiempo restante llega a 00:00:00, detener la actualización

            //clearInterval(intervalo);
        }
    }

    // Actualizar el tiempo restante cada segundo
    var intervalo = setInterval(actualizarTiempoRestante, 1000);
</script>
