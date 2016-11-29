
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


	<div class="row">
		<div class="userForm">
			<c:url var="formAction" value="/users/new" />
			<form method="POST" action="${formAction}" id="newUserForm">
				<label for="username">User Name : </label><input type="text"
					id="username" name="username" placeholder="Username"> 
					<p>
					<label for="password">Password
					: </label>
					<input type="password" id="password" name="password" placeholder="Password"> 
					<p>
					<label
					for="confirmPassword">Confirm Password : </label><input
					type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password">
					<p>
				<button type="submit" class="btn btn-primary">Create New
					Account</button>
			</form>
		</div>
		<div class="noteToUser">
			<c:url var="loginURL" value="/login" />
			Already have an account? <a href="${loginURL}">Login</a>.
		</div>
	</div>
</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />