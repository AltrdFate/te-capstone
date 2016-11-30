$(document).ready(function() {
	$("#newUserForm").validate({

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