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
	<c:set var="ingredients" value="${recipe.ingredients} |" />
	<c:set var="ingredient1" value="${fn:split(ingredients, '|')}" />
	
	<c:set var="test" value = "This is | just a | test"/>
	<c:set var="test1" value ="${fn:split(test, '|')}"/>
	${test1[0]}<br>
	${test1[1]}<br>
	${test1[2]}<br>
	<ul>
		<li><c:out value="${ingredient1[0]}" /></li>
		<li><c:out value="${ingredient1[1]}" /></li>
		<li><c:out value="${ingredient1[2]}" /></li>
	</ul>
	<p>
	<h4>Directions</h4>
	<ol>
		
		<li><c:out value="${recipe.directions}" /></li>
	</ol>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />