function populateHidden() {

  //Get contents of wysiwg
  var textAsHTML = $(".cke_wysiwyg_frame").contents().find("body").get(0).innerHTML;

  //Place in hidden field
  $("#hiddenContent").val(textAsHTML);
}

var ready = function() {

  var appendContentsInterval =  setInterval(function() {

    //Get current value
    var currentText = $("#hiddenContent").val();

    if ($(".cke_wysiwyg_frame").contents().find("body").get(0)) {
      var contentsOfFrame = $(".cke_wysiwyg_frame").contents().find("body").get(0).innerHTML;
      if ((contentsOfFrame == "undefined") || (contentsOfFrame == "")) {
        //Append wysiwig with current text
        $(".cke_wysiwyg_frame").contents().find("body").get(0).innerHTML = currentText;
      } else {

        //Appended, stop and clear interval
        return clearInterval(appendContentsInterval);
      }
    }    
  }, 500);
};

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);