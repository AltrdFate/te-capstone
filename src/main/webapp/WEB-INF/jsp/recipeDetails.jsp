<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="main-box">
	<div>
		<ul class="detailsNav">
			<c:url value="/modifyRecipeDetails?recipeId=${recipe.recipeId}"
				var="modifyURL" />
			<li><a href="${modifyURL}">Modify Recipe</a></li>
			<li>|</li>
			<li>Add to Meal Plan</li>
		</ul>
	</div>
	<h1>
		<c:out value="${recipe.recipeName}" />
	</h1>
	<p class="lead">
		<c:out value="${recipe.description}" />
	</p>
	<p>
	<h4>Ingredients</h4>
	<ul>
		<c:forEach items="${ingredients}" var="ingredient">
			<li><c:out value="${ingredient}" /></li>
		</c:forEach>
	</ul>
	<p>
	<h4>Directions</h4>
	<ol>
		<c:forEach items="${directions}" var="direction">
			<li><c:out value="${direction}" /></li>
		</c:forEach>
	</ol>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />