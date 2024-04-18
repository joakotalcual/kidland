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
                        <?= form_open_multipart("juegos/addTipo", 'class="validation"');?>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <?= lang('name', 'name'); ?>
                                    <?= form_input('nombre', set_value('nombre'), 'class="form-control tip" id="nombre"  required="required"'); ?>
                                </div>
                                <div class="form-group">
                                    <?= lang('price', 'price'); ?>
                                    <?= form_input('precio', set_value('precio'), 'class="form-control tip" id="precio"  required="required"'); ?>
                                </div>
                                <div class="form-group">
                                    <?= lang('precio_adicional', 'precio_adicional'); ?>
                                    <?= form_input('precio_adicional', set_value('precio_adicional'), 'class="form-control tip" id="precio_adicional"'); ?>
                                </div>
                               
                        <div class="form-group">
                            <?= form_submit('add_tipos', lang('add_tipos'), 'class="btn btn-primary"'); ?>
                        </div>
                        <?= form_close();?>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</section>

