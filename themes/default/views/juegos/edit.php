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
                        <?= form_open_multipart("juegos/edit/".$juego->id, 'class="validation"');?>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <?= lang('name', 'name'); ?>
                                    <?= form_input('nombre', $juego->nombre, 'class="form-control tip" id="nombre"  required="required"'); ?>
                                </div>
                                <div class="form-group">
                                    <?= lang('tipos', 'tipos'); ?>
                                    <?php
                                    $tip[''] = lang("select")." ".lang("tipos");
                                    foreach($tipos as $tipo) {
                                        $tip[$tipo->id] = $tipo->nombre;
                                    }
                                    ?>
                                    <?= form_dropdown('tipo', $tip, $juego->tipo, 'class="form-control select2 tip" id="tipo"  required="required" style="width:100%;"'); ?>
                                </div>
                               
                        <div class="form-group">
                            <?= form_submit('edit_juego', lang('edit_juego'), 'class="btn btn-primary"'); ?>
                        </div>
                        <?= form_close();?>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</section>

