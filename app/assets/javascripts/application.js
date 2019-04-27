// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require materialize-sprockets
//= require_tree .

$(document).ready(function(){
    
    $("dropdown-button").dropdown();
    
    $(".button-collapse").sideNav();
    

    $('.datepicker').pickadate({
        format: 'mmmm dd, yyyy',
        formatSubmit: 'mmmm dd, yyyy',
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 100, // Creates a dropdown of 15 years to control year,
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        closeOnSelect: false // Close upon selecting a date,
    });
    
    $('.timepicker').pickatime({
        default: 'now',
        twelvehour: false, // change to 12 hour AM/PM clock from 24 hour
        donetext: 'OK',
        format:"HH:MM:SS",
        autoclose: false,
        vibrate: true 
    });
    
    setTimeout(function(){
        $('body').addClass('loaded');
    }, 3000);
    
    $('select').material_select();
})
