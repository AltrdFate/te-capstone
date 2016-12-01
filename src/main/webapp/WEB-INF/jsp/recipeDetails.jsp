<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="main-box">
	<h1>
		<c:out value="${recipe.recipeName}" />
	</h1>
	<p class="lead">
		<c:out value="${recipe.description}" />
	</p>
	<p>
	<h4>Ingredients</h4>
	<c:set var="ingredients" value="${recipe.ingredients}" />
	<c:set var="ingredient1" value="${fn:split(ingredients, '\\\n')}" />
	<c:set var="ingredient2" value="${fn:split(ingredients, '\\\n')}" />
	<ul>
		<li><c:out value="${ingredient1}" /></li>
		<li><c:out value="${ingredient2}" /></li>
	</ul>
	<p>
	<h4>Directions</h4>
	<ol>
		<li><c:out value="${recipe.directions}" /></li>
	</ol>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />