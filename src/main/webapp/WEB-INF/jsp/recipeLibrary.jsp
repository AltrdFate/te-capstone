
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="main-box">
	<h2>Recipe Library</h2>
	<table class="table table-striped">
		<tr>
			<th>Name</th>
			<th>Description</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach var="recipe" items="${recipeLibrary}">
			<c:url value="/recipeDetails?recipeId=${recipe.recipeId}" var="id" />
			<c:url value="/modifyRecipeDetails?recipeId=${recipe.recipeId}"
				var="modifyId" />
			<tr>
				<td><c:out value="${recipe.recipeName}" /></td>
				<td><c:out value="${recipe.description}" /></td>
				<td><a href="${id}">View Details</a></td>
				<td><a href="${modifyId}">Modify Details</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />