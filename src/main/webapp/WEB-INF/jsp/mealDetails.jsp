<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="main-box">
	<div>
		<h3>
			<c:out value="${meal}" />
		</h3>
		<p class="lead">What's in this meal? The recipes are...</p>
		<ul>
			<c:forEach items="${recipes}" var="recipe">
				<c:url value="/recipeDetails?recipeId=${recipe.recipeId}"
					var="recipeDetailsURL" />
				<li><a href="${recipeDetailsURL}"><c:out
							value="${recipe.recipeName}" /></a></li>
			</c:forEach>
		</ul>
	</div>
	<div>
		<ul class="detailsNav">
			<c:url value="/mealLibrary" var="mealLibraryURL" />
			<li><a href="${mealLibraryURL}">Return to Meal Library</a></li>
		</ul>
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />