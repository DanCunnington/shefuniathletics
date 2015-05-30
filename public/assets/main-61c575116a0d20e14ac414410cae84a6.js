$(function() {
	var errors = $(".alert.alert-danger");
	
	$.each(errors, function(index) {
		var error = $(errors[index]);
		var html = "<div class='alert alert-dismissable alert-danger'>"
  					+ "<button type='button' class='close' data-dismiss='alert'>×</button>"
  					+ error.text()
  					+ "</div>";
		error.removeClass("alert").removeClass("alert-danger");
		error.html(html);
	});
	
	var successes = $(".alert.alert-success");
	
	$.each(successes, function(index) {
		var success = $(successes[index]);
		var html = "<div class='alert alert-dismissable alert-success'>"
  					+ "<button type='button' class='close' data-dismiss='alert'>×</button>"
  					+ success.text()
  					+ "</div>";
		success.removeClass("alert").removeClass("alert-success");
		success.html(html);
	});
	
	var notices = $(".alert.alert-info");
	
	$.each(notices, function(index) {
		var notice = $(notices[index]);
		var html = "<div class='alert alert-dismissable alert-info'>"
  					+ "<button type='button' class='close' data-dismiss='alert'>×</button>"
  					+ notice.text()
  					+ "</div>";
		notice.removeClass("alert").removeClass("alert-info");
		notice.html(html);
	});
	
	
	
});

function dateFieldDefaultFixture() {
	var x = document.getElementById("fixture_date");
	if (x.innerHTML == "") {
		x.value = "Please Choose a Date";
	}
}

function dateFieldDefaultSocial() {
	var x = document.getElementById("social_date");
	if (x.innerHTML == "") {
		x.value = "Please Choose a Date";
	}
}

var ready = function() {


	//On click of choose image button, allow user to choose image
	$("a.chooseImage").click(function(event) {
	    event.preventDefault();
	    
	    var hiddenField = $(this).attr("rel");

	    //Clear div
	    $("#cloudinaryImages").html("");


	
	    //Populate modal with images from server
	    $.get("/cloudinaryImages",function(result) {
	    	var images = result.resources;
	    	var cloudinaryBaseURL = 'http://res.cloudinary.com/shefuniathletics/image/upload/w_90,h_90,c_fit/'
	    	//For each image
	    	for (var i=0; i<images.length; i++) {

	    		images[i].public_id = images[i].public_id.replace(" ","%20");
	    		var image = images[i].public_id+"."+images[i].format;
	   
	    		//append a new child to .cloudinaryImages
		    	//Build up html string
		    	var imageHtml = "<div class='col-sm-3 cloudinaryImageContainer'>"+
		    		"<img class='cloudinaryImage' rel='"+image+"' src="+cloudinaryBaseURL+image+">"+
		    		"<a href='#' rel='"+image+"' class='cloudinaryImageClose'>Delete</a>"+
		    		"</div>";
		    	

		    	$("#cloudinaryImages").append(imageHtml);

		    	//Show modal on last one
		    	if (i == images.length-1) {
		    		//Show modal
	    			$("#chooseImageModal").modal('show');

	    			$("img.cloudinaryImage").on("click", function() {
						//Hide the modal
						$("#chooseImageModal").modal('hide');

						var image_id = $(this).attr('rel');
						$("#"+hiddenField).val(image_id);

						console.log("herhyereyryer");

						//Append to preview
						var imageString = 'http://res.cloudinary.com/shefuniathletics/image/upload/w_50,h_50,c_fit/'+image_id;
						var previewHTML = '<img src="'+imageString+'"><a href="#" class="clear-chosen-preview">×</a>';
						$(".custom-chosen-preview").append(previewHTML);
						$("a.clear-chosen-preview").on("click",function(event) {
							event.preventDefault();
							$(".custom-chosen-preview").html("");
						});
					});

					

					$("a.cloudinaryImageClose").click(function(event) {
						event.preventDefault();

						var confirm = window.confirm("Are you sure?");
						if (confirm) {
							var image_id = $(this).attr("rel");
							$.get('/deleteCloudinaryImage/'+image_id,function(result) {
								if (result.ok) {
									//hide modal
									$("#chooseImageModal").modal('hide');
								}
							});
						}
						
					});
		    	}

		    }
	    });
	});




		
}


$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);
