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
