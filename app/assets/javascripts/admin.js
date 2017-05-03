//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require peity/jquery.peity.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require inspinia.js
//= require cocoon


//= require iCheck/icheck.min.js
//= require jeditable/jquery.jeditable.js
//= require dataTables/datatables.min.js
//= require jqGrid/i18n/grid.locale-el.js
//= require jqGrid/jquery.jqGrid.min.js
//= require jquery-ui/jquery-ui.min.js
//= require footable/footable.all.min.js

//= require steps/jquery.steps.min.js
//= require validate/jquery.validate.min.js
//= require dropzone/dropzone.js
//= require summernote/summernote.min.js
//= require colorpicker/bootstrap-colorpicker.min.js
//= require cropper/cropper.min.js
//= require datapicker/bootstrap-datepicker.js
//= require ionRangeSlider/ion.rangeSlider.min.js
//= require jasny/jasny-bootstrap.min.js
//= require jsKnob/jquery.knob.js
//= require nouslider/jquery.nouislider.min.js
//= require switchery/switchery.js
//= require chosen/chosen.jquery.js
//= require fullcalendar/moment.min.js
//= require clockpicker/clockpicker.js
//= require daterangepicker/daterangepicker.js
//= require select2/select2.full.min.js
//= require touchspin/jquery.bootstrap-touchspin.min.js
//= require bootstrap-markdown/bootstrap-markdown.js
//= require bootstrap-markdown/markdown.js
//= require bootstrap-tagsinput/bootstrap-tagsinput.js
//= require dualListbox/jquery.bootstrap-duallistbox.js
//= require typehead/bootstrap3-typeahead.min.js
//= require codemirror/codemirror.js
//= require codemirror/mode/javascript/javascript.js
$(function() {

    $('.dataTables-example').DataTable({
        pageLength: 25,
        responsive: true,
        dom: '<"html5buttons"B>lTfgitp',
        buttons: [
            { extend: 'copy'},
            {extend: 'csv'},
            {extend: 'excel', title: 'ExampleFile'},
            {extend: 'pdf', title: 'ExampleFile'},

            {extend: 'print',
                customize: function (win){
                    $(win.document.body).addClass('white-bg');
                    $(win.document.body).css('font-size', '10px');

                    $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                }
            }
        ]

    });


});


$(function() {

    Dropzone.options.dropzoneForm = {
        paramName: "file", // The name that will be used to transfer the file
        maxFilesize: 2, // MB
        dictDefaultMessage: "<strong>Drop files here or click to upload. </strong></br> (This is just a demo dropzone. Selected files are not actually uploaded.)"
    };

    $(document).ready(function(){

        var editor_one = CodeMirror.fromTextArea(document.getElementById("code1"), {
            lineNumbers: true,
            matchBrackets: true
        });

        var editor_two = CodeMirror.fromTextArea(document.getElementById("code2"), {
            lineNumbers: true,
            matchBrackets: true
        });

        var editor_two = CodeMirror.fromTextArea(document.getElementById("code3"), {
            lineNumbers: true,
            matchBrackets: true
        });

    });

});
$(function() {

    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
});
 $(document).ready(function() {
    $('#summernote').summernote();
  });