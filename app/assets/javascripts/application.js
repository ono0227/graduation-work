// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require plugins/jquery-ui/jquery-ui
//= require plugins/bootstrap/js/bootstrap.min
//= require plugins/rs-plugin/js/jquery.themepunch.tools.min
//= require plugins/rs-plugin/js/jquery.themepunch.revolution.min
//= require plugins/owl-carousel/owl.carousel
//= require plugins/selectbox/jquery.selectbox-0.1.3.min
//= require plugins/countdown/jquery.syotimer
//= require js/custom
//= require_self

$(function () {
  $('.form-controll').on('keyup', function () {
  var searchword = $.trim($(this).val());

  $.ajax({
    type: 'GET',
    url: '/potepan/api/suggests', 
    data:  { searchWord: searchword }, 
    dataType: 'json' 
  })
  });
});
