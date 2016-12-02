<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="main-box">
	<p>Please Enter A Recipe</p>
	<c:url value="/addRecipe" var="formAction"/>
	<form method="POST" action="${formAction}">

			<div>
				<label for="recipeName">Recipe Name:</label><br>
				<input type="text" id="recipeName" name="recipeName"/>
			</div>
			
			<div>
				<label for="description">Description</label><br>
				<input type="text" id="description" name="description" placeholder="Describe your recipe in 140 characters or less."/>
			</div>
			
			<div>
				<label for="ingredients">Ingredients</label><br>
				<textarea id="ingredients" name="ingredients" 
				placeholder="Put each ingredient on its own line.">
				</textarea>
			</div>
			
			<div>
				<label for="stepArray">Directions</label><br>
				<c:forEach var="i" begin="1" end="10">
					<h5>Step #<c:out value="${i}"/></h5>
					<textarea id="stepArray" name="stepArray"
					placeholder="Put each step on its own line.">
					</textarea>
				</c:forEach>
			</div>
			<br>
			<p>
			<button type="submit" id="createRecipeButton" class="btn btn-primary">Submit</button>
			</p>
			
		</form>
</div> 
	
<c:import url="/WEB-INF/jsp/common/footer.jsp" />