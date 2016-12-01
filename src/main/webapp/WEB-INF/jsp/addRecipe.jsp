<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

Welcome, <c:out value="${currentUser}"/>!
<div>
	<p>Please Enter A Recipe</p>
	<c:url value="/addRecipe" var="formAction"/>
	<form method="POST" action="${formAction}">

			<div>
				<label for="recipeName">Recipe Name:</label>
				<input type="text" id="recipeName" name="recipeName"/>
			</div>
			
			<div>
				<label for="description">Description</label>
				<input type="text" id="description" name="description"/>
			</div>
			
			<div>
				<label for="ingredients">Ingredients</label>
				<input type="text" id="ingredients" name="ingredients" 
				placeholder="Put each ingredient on its own line."/>
			</div>
			
			<div>
				<label for="directions">Directions</label>
				<input type="text" id="directions" name="directions"
				placeholder="Put each step on its own line."/>
			</div>
			<button type="submit" id="createRecipeButton" class="btn btn-primary">Submit</button>
			
		</form>
</div> 
	
<c:import url="/WEB-INF/jsp/common/footer.jsp" />