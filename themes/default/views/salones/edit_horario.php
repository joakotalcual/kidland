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
                        <?= form_open_multipart("salones/edit_horario/".$horario->id, 'class="validation"');?>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <?= lang('name', 'name'); ?>
                                    <?= form_input('nombre', $horario->nombre, 'class="form-control tip" id="nombre"  required="required"'); ?>
                                </div>
                                <div class="form-group">
                                    <?= lang('Hora Entrada', 'Hora Entrada'); ?>
                                    <input name="hora_entrada" id="hora_entrada" class="form-control tip" type="time" required value="<?= $horario->hora_entrada ?>">
                                </div>

                                <div class="form-group">
                                    <?= lang('Hora Salida', 'Hora Salida'); ?>
                                    <input name="hora_salida" id="hora_salida" class="form-control tip" type="time" required value="<?= $horario->hora_salida ?>">
                                </div>
                               
                        <div class="form-group">
                            <?= form_submit('edit_horario', lang('edit_horario'), 'class="btn btn-primary"'); ?>
                        </div>
                        <?= form_close();?>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</section>

