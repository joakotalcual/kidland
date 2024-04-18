<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?>

<script type="text/javascript">
    $(document).ready(function() {

        var table = $('#prTables').DataTable({

            // 'ajax': '<?=site_url('products/get_products/'.$store->id);?>',
            'ajax' : { url: '<?=site_url('restaurante/get_mesas/'.$store->id);?>', type: 'POST', "data": function ( d ) {
                d.<?=$this->security->get_csrf_token_name();?> = "<?=$this->security->get_csrf_hash()?>";
                console.log(d);
            }},
            "buttons": [
            { extend: 'copyHtml5', 'footer': false, exportOptions: { columns: [ 0, 1, 2, 3 ] } },
            { extend: 'excelHtml5', 'footer': false, exportOptions: { columns: [ 0, 1, 2, 3 ] } },
            { extend: 'csvHtml5', 'footer': false, exportOptions: { columns: [ 0, 1, 2, 3 ] } },
            { extend: 'pdfHtml5', orientation: 'landscape', pageSize: 'A4', 'footer': false,
            exportOptions: { columns: [ 0, 1, 2, 3 ] } },
            { extend: 'colvis', text: 'Columns'},
            ],
            "columns": [
            { "data": "pid", "visible": false },
            { "data": "nombre" },
            { "data": "Actions", "searchable": false, "orderable": false }
            ]

        });

        $('#search_table').on( 'keyup change', function (e) {
            var code = (e.keyCode ? e.keyCode : e.which);
            if (((code == 13 && table.search() !== this.value) || (table.search() !== '' && this.value === ''))) {
                table.search( this.value ).draw();
            }
        });

        table.columns().every(function () {
            var self = this;
            $( 'input', this.footer() ).on( 'keyup change', function (e) {
                var code = (e.keyCode ? e.keyCode : e.which);
                if (((code == 13 && self.search() !== this.value) || (self.search() !== '' && this.value === ''))) {
                    self.search( this.value ).draw();
                }
            });
            $( 'select', this.footer() ).on( 'change', function (e) {
                self.search( this.value ).draw();
            });
        });

    });
</script>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header">
                    <?php if (!$this->session->userdata('has_store_id')) { ?>
                    <div class="dropdown pull-right">
                      <button class="btn btn-primary" id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?= $store->name.' ('.$store->code.')'; ?>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dLabel">
                        <?php
                        foreach ($stores as $st) {
                            if ($store->id != $st->id) {
                                echo "<li><a href='".site_url('products/?store_id='.$st->id)."'>{$st->name} ({$st->code})</a></li>";
                            }
                        }
                        ?>
                    </ul>
                </div>
                <?php } ?>
                <h3 class="box-title"><?= lang('list_results'); ?></h3>
            </div>
            <div class="box-body">
                <div class="table-responsive">
                    <table id="prTables" class="table table-striped table-bordered table-hover" style="margin-bottom:5px;">
                        <thead>
                            <tr class="active">
                                <th style="max-width:30px;"><?= lang("id"); ?></th>
                                <th><?= lang("nombre"); ?></th>
                                <th style="width:30px;"><?= lang("actions"); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="3" class="dataTables_empty"><?= lang('loading_data_from_server'); ?></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th style="max-width:30px;"><input type="text" class="text_filter" placeholder="[<?= lang('id'); ?>]"></th>
                                <th><input type="text" class="text_filter" placeholder="[<?= lang('nombre'); ?>]"></th>
                                <th style="width:30px;"><?= lang("actions"); ?></th>
                            </tr>
                            <tr>
                                <td colspan="3" class="p0"><input type="text" class="form-control b0" name="search_table" id="search_table" placeholder="<?= lang('type_hit_enter'); ?>" style="width:100%;"></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <div class="modal fade" id="picModal" tabindex="-1" role="dialog" aria-labelledby="picModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                                <button type="button" class="close mr10" onclick="window.print();"><i class="fa fa-print"></i></button>
                                <h4 class="modal-title" id="myModalLabel">title</h4>
                            </div>
                            <div class="modal-body text-center">
                                <img id="product_image" src="" alt="" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
</section>
