
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/nonuserHeader.jsp" />

	<div class="centerpiece">
	<h3>Create a New User Account</h3>
	<p class="lead">Start Planning a Healthier You Today.</p>
		<div class="userForm">
			<c:url var="formAction" value="/users/new" />
			<form method="POST" action="${formAction}" id="newUserForm">
				<label for="username">Username : </label>
					<input type="text" id="username" name="username" placeholder="Username" class="form-control"> 
					<p>
				<label for="password">Password : </label>
					<input type="password" id="password" name="password" placeholder="Password" class="form-control"> 
					<p>
				<label for="confirmPassword">Confirm Password : </label>
					<input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" class="form-control">
					</p>
					<p>
				<button type="submit" id="submitNewUser" class="btn btn-primary">Create New Account</button></p>
			</form>
		</div>
		<div class="noteToUser">
			<c:url var="loginURL" value="/login" />
			Already have an account? <a href="${loginURL}">Login</a>.
		</div>
	</div>
</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />