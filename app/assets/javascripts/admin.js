// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require wice_grid

//= require admin/plugins/mobile_events/jquery.mobile-events.min
//= require admin/jquery/jquery-migrate.min
//= require admin/jquery_ui/jquery-ui.min
//= require admin/bootstrap/bootstrap.min
//= require admin/plugins/flot/excanvas.js
//= require admin/plugins/sparklines/jquery.sparkline.min
//= require admin/plugins/flot/flot.min
//= require admin/plugins/flot/flot.resize
//= require admin/plugins/flot/flot.pie
//= require admin/plugins/bootstrap_switch/bootstrapSwitch.min
//= require admin/plugins/fullcalendar/fullcalendar.min
//= require admin/plugins/datatables/jquery.dataTables.min
//= require admin/plugins/datatables/jquery.dataTables.columnFilter
//= require admin/plugins/common/wysihtml5.min
//= require admin/plugins/common/bootstrap-wysihtml5
//= require admin/plugins/select2/select2
//= require admin/plugins/bootstrap_colorpicker/bootstrap-colorpicker.min
//= require admin/plugins/mention/mention.min
//= require admin/plugins/input_mask/bootstrap-inputmask.min
//= require admin/plugins/fileinput/bootstrap-fileinput
//= require admin/plugins/modernizr/modernizr.min
//= require admin/plugins/retina/retina
//= require admin/plugins/timeago/jquery.timeago
//= require admin/plugins/slimscroll/jquery.slimscroll.min
//= require admin/plugins/autosize/jquery.autosize-min
//= require admin/plugins/charCount/charCount
//= require admin/plugins/validate/jquery.validate.min
//= require admin/plugins/validate/additional-methods
//= require admin/plugins/naked_password/naked_password-0.2.4.min
//= require admin/plugins/nestable/jquery.nestable
//= require admin/plugins/tabdrop/bootstrap-tabdrop
//= require admin/plugins/jgrowl/jquery.jgrowl.min
//= require admin/plugins/bootbox/bootbox.min
//= require admin/plugins/xeditable/bootstrap-editable.min
//= require admin/plugins/xeditable/wysihtml5.js
//= require admin/plugins/ckeditor/ckeditor.js
//= require admin/plugins/dynatree/jquery.dynatree.min.js
//= require admin/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js
//= require admin/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js
//= require admin/plugins/bootstrap_daterangepicker/moment.min.js
//= require admin/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.js
//= require admin/plugins/bootstrap_maxlength/bootstrap-maxlength.min
//= require admin/plugins/bootstrap_hover_dropdown/twitter-bootstrap-hover-dropdown.min
//= require admin/plugins/slider_nav/slidernav-min
//= require admin/plugins/fuelux/wizard.js
//= require admin/nav.js
//= require admin/tables.js
//= require admin/theme.js
//= require docsupport/prism.js
//= require chosen.jquery



$(function () {
$.fn.snow({
minSize: 5, //雪花的最小尺寸
maxSize: 50, //雪花的最大尺寸
newOn: 300     //雪花出现的频率 这个数值越小雪花越多
});
});
