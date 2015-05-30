var ready = function() {

  // Cloudinary jQuery integration library uses jQuery File Upload widget
  // (see http://blueimp.github.io/jQuery-File-Upload/).
  // Any file input field with cloudinary-fileupload class is automatically
  // wrapped using the File Upload widget and configured for Cloudinary uploads.
  // You can further customize the configuration using .fileupload method
  // as we do below.
  $(".cloudinary-fileupload")
    .fileupload({ 
      // Uncomment the following lines to enable client side image resizing and valiation.
      // Make sure cloudinary/processing is included the js file
      //disableImageResize: false,
      //imageMaxWidth: 800,
      //imageMaxHeight: 600,
      //acceptFileTypes: /(\.|\/)(gif|jpe?g|png|bmp|ico)$/i,
      //maxFileSize: 20000000, // 20MB
      dropZone: "#direct_upload",
      start: function (e) {
        $(".status").text("Starting upload...");
      },
      progress: function (e, data) {
        $(".status").text("Uploading... " + Math.round((data.loaded * 100.0) / data.total) + "%");
      },
      fail: function (e, data) {
        $(".status").text("Upload failed");
      }
    })
    .off("cloudinarydone").on("cloudinarydone", function (e, data) {
      $("#photo_bytes").val(data.result.bytes);
      $(".status").text("");
      var preview = $(".preview").html('');
      $.cloudinary.image(data.result.public_id, {
        format: data.result.format, width: 50, height: 50, crop: "fit"
      }).appendTo(preview);


      $('<a/>').
        addClass('delete_by_token').
        attr({href: '#'}).
        data({delete_token: data.result.delete_token}).
        html('&times;').
        appendTo(preview).
        click(function(e) {
          e.preventDefault();
          $.cloudinary.delete_by_token($(this).data('delete_token')).done(function(){
            $('.preview').html('');
            $('#info').html('');
            $("#photo_bytes").val('');
            $('input[name="photo[image]"]').remove();
          }).fail(function() {
            $('.status').text("Cannot delete image");
        });
      });
      view_upload_details(data.result);
    });
    
  function view_upload_details(upload) {
    // Build an html table out of the upload object
    var rows = [];
    $.each(upload, function(k,v){
      rows.push(
        $("<tr>")
          .append($("<td>").text(k))
          .append($("<td>").text(JSON.stringify(v))));
    });
    $("#info").html(
      $("<div class=\"upload_details\">")
        .append("<h2>Upload metadata:</h2>")
        .append($("<table>").append(rows))
    );
  }


  //Committee positions are sortable
  var set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('tr.historic_image').each(function(i){
        $(this).attr("data-pos",i+1);
    });
  }
  // call sortable on our div with the sortable class
  $('.historic_images-sortable').sortable();

  // after the order changes
  $('.historic_images-sortable').sortable().bind('sortupdate', function(e, ui) {
      // array to store new order
      updated_order = []
      // set the updated positions
      set_positions();

      // populate the updated_order array with the new task positions
      $('tr.historic_image').each(function(i){
          updated_order.push({ id: $(this).data("id"), position: i+1 });
      });

      // send the updated order via ajax
      $.ajax({
          type: "PUT",
          url: '/historic_images/sort',
          data: { order: updated_order }
      });
  });



}


$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);