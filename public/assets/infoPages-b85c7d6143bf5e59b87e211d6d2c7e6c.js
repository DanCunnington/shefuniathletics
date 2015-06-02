
function populateInfoHidden() {

  //Get contents of wysiwg
  var textAsHTML = $(".cke_wysiwyg_frame").contents().find("body").get(0).innerHTML;

  //Place in hidden field
  $("#hiddenContent").val(textAsHTML);
}
;
