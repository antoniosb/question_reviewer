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
//= require turbolinks
//= require_directory .


function forceOneCheckBox() {
    $('input:checkbox').on('change', function() {
        $('input:checkbox').not(this).prop('checked', false);
    });
}

function scrollToReview() {
    var question_status = $('#question_status');
    var reviews = $('#reviews');
    question_status.on('change', function() {
        var text = question_status.find(":selected").text();
        if(text === 'Rejected') {
            reviews.show();
            alert('Por favor, forneça um comentário.');
            $(window).scrollTop($('#reviews').offset().top);
        } else {
            reviews.hide();
        }
    });
}