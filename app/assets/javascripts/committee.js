$(document).ready(function() {

  var appendContentsInterval =  setInterval(function() {

    //Get current value
    var currentText = $("#committePositionHiddenContent").val();
    if ($(".cke_wysiwyg_frame").contents().find("body").get(0)) {
      if ($(".cke_wysiwyg_frame").contents().find("body").get(0).innerHTML == "") {

        //Append wysiwig with current text
        $(".cke_wysiwyg_frame").contents().find("body").get(0).innerHTML = currentText;
      } else {

        //Appended, stop and clear interval
        return clearInterval(appendContentsInterval);
      }
    }
    
  }, 500);





});

function populateHidden() {

  //Get contents of wysiwg
  var textAsHTML = $(".cke_wysiwyg_frame").contents().find("body").get(0).innerHTML;

  //Place in hidden field
  $("#committePositionHiddenContent").val(textAsHTML);
}