// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require jquery.autogrow-textarea

//= require turbolinks
//= require bootstrap/dropdown
//= require bootstrap/alert
//= require bootstrap/alert
//= require bootstrap/modal
//= require bootstrap/tooltip
//= require wice_grid
//= require bootstrap-markdown-bundle
//= require dropzone

// Prevent auto-mounting Dropzone instance
Dropzone.autoDiscover = false;

$(function() {
  $("textarea[data-provide='markdown']").each(function(index, element){
    var $textarea = $(element);

    $textarea.autogrow();
    $textarea.dropzone({
      clickable: false,
      url: "/media_contents",
      init: function() {
        this.on("success", function(file, responseText){
           match = responseText.file_name.url.match(/\.(jpg|png|gif)\b/);
           if (match != null) {

               var imageString = "\n![](" + responseText.file_name.url + ")";
           } else {
               var imageString = "\n<" + responseText.file_name.url + ">";
           }

          $textarea.val($textarea.val() + imageString);
          $textarea.trigger("change"); // to also trigger auto-grow plugin
        });
      }
    });
  });
});
