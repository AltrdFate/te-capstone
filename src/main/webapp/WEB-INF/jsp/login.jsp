<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<c:url var ="formAction" value="NEEDURL"/>

<form method = "POST" action="${formAction}">
	<input type="hidden" name="destination" value="${param.destination}" />
	<label for="username">User Name : </label><input type="text" id="username" name="username">
	<label for="password">Password : </label><input type="text" id="password" name="password">
	<button type="submit">Login</button>
</form>

<c:url var ="signUpURL" value="/users/new"/>
Don't have an account yet? <a href="${signUpURL}">Sign Up</a>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />