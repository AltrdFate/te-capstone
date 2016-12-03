<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="main-box">
<h1>Modify Recipe Details</h1>
<c:url value="/modifyRecipeDetails?recipeId=${param.recipeId}" var="formAction"/>
	<form method="POST" action="${formAction}">
		<label for="recipeName">Recipe Name:</label> <input type="text"
			id="recipeName" name="recipeName" value="${recipe.recipeName}" />
		<p>
			<label for="description">Description:</label> <input type="text"
				id="description" name="description" value="${recipe.description}" />
		<p>
		<h4>Ingredients</h4>
		<c:forEach items="${ingredients}" var="ingredient">
			<p><input type="text" id="ingredients" name="ingredients" value="${ingredient}"/><p>
		</c:forEach>
		
		<h4>Directions</h4>
		<ol>
		<c:forEach items="${directions}" var="direction">
			<li><p><input type="text" id="directions" name="directions" value="${direction}"/></li>
		</c:forEach>
		</ol>
		<button type="submit" id="editRecipeButton" class="btn btn-primary">Submit Changes</button>
	</form>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />