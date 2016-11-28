 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

//Need to add URL 
<c:url var ="formAction" value="/users/new"/>

<form method = "POST" action="${formAction}">
	<label for="username">User Name : </label><input type="text" id="username" name="username">
	<label for="password">Password : </label><input type="password" id="password" name="password">
<!-- 	<label for="confirmPassword">Confirm Password : </label><input type="password" id="confirmPassword" name="confirmPassword"> -->
	<button type="submit">Create New Account</button>
</form>

//Add URL for login
<c:url var ="loginURL" value="/login"/>
Already have an account? <a href="${loginURL}">Login</a>.
 