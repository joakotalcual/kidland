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
                        <?= form_open_multipart("restaurante/add_recetas", 'class="validation"');?>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <?= lang('name', 'name'); ?>
                                    <?= form_input('nombre', set_value('nombre'), 'class="form-control tip" id="nombre" required="required"'); ?>
                                </div>
                                <div class="form-group">
                                    <?= lang('price', 'price'); ?>
                                    <?= form_input('precio', set_value('precio'), 'class="form-control tip" id="precio" required="required"'); ?>
                                </div>
                                <div id="insumos-container">
                                    <!-- Aquí se agregarán dinámicamente los campos de insumos -->
                                    <?php 
                                        $options = array();
                                        foreach ($insumos as $insumo) {
                                            $options[$insumo['id']] = $insumo['nombre'];
                                        }
                                    ?>
                                    <div class="form-group">
                                        <?= lang('insumo', 'insumo'); ?>
                                        <?= form_dropdown('insumo[]', $options, '', 'class="form-control"'); ?>
                                        <input type="text" name="cantidad_insumo[]" class="form-control tip" placeholder="Cantidad" style="margin-top: 10px;">
                                    </div>
                                </div>
                                <button type="button" class="btn btn-success" id="agregar-insumo" style="margin-top: 10px;">Agregar Insumo</button>
                            </div>
                        </div>
                        <div class="form-group" style="margin-top: 10px;">
                            <?= form_submit('add_tipos', lang('Añadir Receta'), 'class="btn btn-primary"'); ?>
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
        const agregarInsumoBtn = document.getElementById("agregar-insumo");
        const insumosContainer = document.getElementById("insumos-container");

        agregarInsumoBtn.addEventListener("click", function() {
            const nuevoInsumoHtml = `
                <div class="form-group">
                    <label for="insumo">Insumo</label>
                    <select name="insumo[]" class="form-control">
                        <?php foreach ($insumos as $insumo): ?>
                            <option value="<?= $insumo['id'] ?>"><?= $insumo['nombre'] ?></option>
                        <?php endforeach; ?>
                    </select>
                    <input type="text" name="cantidad_insumo[]" class="form-control tip" placeholder="Cantidad" style="margin-top: 10px;">
                    <button type="button" class="btn btn-danger eliminar-insumo" style="margin-top: 10px;">Eliminar</button>
                </div>`;
            insumosContainer.insertAdjacentHTML("beforeend", nuevoInsumoHtml);
        });

        insumosContainer.addEventListener("click", function(event) {
            if (event.target.classList.contains("eliminar-insumo")) {
                event.target.closest(".form-group").remove();
            }
        });
    });
</script>



