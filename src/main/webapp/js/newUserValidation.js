$(document).ready(function() {
	$("#newUserForm").validate({
	
		debug: true,
		rules: {
			username: {
				required: true,
				minlength: 4
			},
			password: {
				required: true,
				minlength: 4
			},
			confirmPassword: {
				equalTo: "#password"
			}
		}
	});
});