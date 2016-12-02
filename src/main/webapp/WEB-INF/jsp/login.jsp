<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/nonuserHeader.jsp" />

<div class="centerpiece">
	<h3>Login</h3>
	<div class="userForm">
		<c:url var="formAction" value="/login" />
		<form method="POST" action="${formAction}">
			<input type="hidden" name="destination" value="${param.destination}" />
			<p>
				<label for="username">Username : </label><input type="text"
					id="username" name="username" placeholder="Username" class="form-control">
			</p>
			<p>
				<label for="password">Password : </label><input type="password"
					id="password" name="password" placeholder="Password" class="form-control">
			</p>
			<button type="submit" id="loginUser" class="btn btn-primary">Login</button>
		</form>
	</div>
	<div class="noteToUser">
		<c:url var="signUpURL" value="/users/new" />
		Don't have an account yet? <a href="${signUpURL}">Sign Up</a>
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
