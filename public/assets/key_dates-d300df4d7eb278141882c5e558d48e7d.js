

var ready = function() {

  CKEDITOR.on('instanceReady', function(){ 

    CKEDITOR.instances.editor1.setData($("#hiddenKeyDateContent").val());
  });

  //Committee positions are sortable
  var set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('tr.key_date').each(function(i){
        $(this).attr("data-pos",i+1);
    });
  }
  // call sortable on our div with the sortable class
  $('.key_dates-sortable').sortable();

  // after the order changes
  $('.key_dates-sortable').sortable().bind('sortupdate', function(e, ui) {
      // array to store new order
      updated_order = []
      // set the updated positions
      set_positions();

      // populate the updated_order array with the new task positions
      $('tr.key_date').each(function(i){
          updated_order.push({ id: $(this).data("id"), position: i+1 });
      });

      // send the updated order via ajax
      $.ajax({
          type: "PUT",
          url: '/key_dates/sort',
          data: { order: updated_order }
      });
  });

};

function populateKeyDateHidden() {

  //Get contents of wysiwg
  var textAsHTML = $(".cke_wysiwyg_frame").contents().find("body").get(0).innerHTML;

  //Place in hidden field
  $("#hiddenKeyDateContent").val(textAsHTML);
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);
