<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
<h2>Create a Meal</h2>
	<p class="lead">Please use the form below to add recipes to a new meal. Don't worry if you don't have all the information handy - you can always modify the details later.</p>
	<c:url value="/createMeal" var="formAction"/>
	<form id ="mealForm" method="POST" action="${formAction}">

			<div class="formField">
				<label for="mealName">Meal Name:</label><br>
				<input type="text" id="mealName" name="mealDescription" placeholder="Meal Name"/>
				<p>
				<br>
				Select recipes to add to this meal:
			<c:forEach var="i" begin="1" end="5">
				<p>
				<select name="recipeIds" id="recipeChoice">
					<c:forEach var="recipe" items="${recipes}">
						<option value="${recipe.recipeId}">${recipe.recipeName}</option>
					</c:forEach>
					<option value="" selected>None</option>
				</select>
				<p>
			</c:forEach>
			<br>
			<p>
			<button type="submit" id="createMealButton" class="btn btn-primary">Submit</button>
			</p>
			</div>
	</form>
	
	</div>
</div>



<c:import url="/WEB-INF/jsp/common/footer.jsp" />