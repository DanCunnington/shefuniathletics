

var ready = function() {
  CKEDITOR.on('instanceReady', function(){ 

    CKEDITOR.instances.editor1.setData($("#hiddenContent").val());
  }); 
};

function populateInfoHidden() {

  //Get contents of wysiwg
  var textAsHTML = $(".cke_wysiwyg_frame").contents().find("body").get(0).innerHTML;

  //Place in hidden field
  $("#hiddenContent").val(textAsHTML);
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);
