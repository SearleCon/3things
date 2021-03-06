// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.ui.touch-punch
//= require jquery.turbolinks
//= require jquery.purr
//= require jquery.autosize
//= require best_in_place
//= require best_in_place.purr
//= require bootstrap
//= require bootstrap-tab
//= require jquery.spin
//= require_tree .

$(document).ready(function(){
    $('textarea').autosize();
    var checkboxes = $("input[type='checkbox']"),
        submitButt = $("input[type='submit']");

    checkboxes.click(function() {
        submitButt.prop("disabled", !checkboxes.is(":checked"));
    });
});
