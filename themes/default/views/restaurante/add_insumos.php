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
                        <?= form_open_multipart("restaurante/add_insumos", 'class="validation"');?>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <?= lang('name', 'name'); ?>
                                    <?= form_input('nombre', set_value('nombre'), 'class="form-control tip" id="nombre"  required="required"'); ?>
                                </div>
                                <div class="form-group">
                                    <?= lang('quantity', 'quantity'); ?>
                                    <?= form_input('cantidad', set_value('cantidad'), 'class="form-control tip" id="cantidad"  required="required"'); ?>
                                </div>
                                <div class="form-group">
                                    <?= lang('Tipo de Medida', 'Tipo de Medida'); ?>
                                    <?php
                                    $tip[''] = lang("select")." ".lang("Tipo de Medida");
                                    foreach($tipos as $tipo) {
                                        $tip[$tipo] = $tipo;
                                    }
                                    ?>
                                    <?= form_dropdown('tipo_medida', $tip, set_value('tipo_medida'), 'class="form-control select2 tip" id="tipo_medida"  required="required" style="width:100%;"'); ?>
                                </div>
                               
                        <div class="form-group">
                            <?= form_submit('add_tipos', lang('add_insumos'), 'class="btn btn-primary"'); ?>
                        </div>
                        <?= form_close();?>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</section>

