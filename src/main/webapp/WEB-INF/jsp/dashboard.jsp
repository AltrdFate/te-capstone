<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="jumbotron">
	<div class="jumboHeading">
		<h2>Start Planning a Healthier You Today.</h2>
		<p class="lead">mealPlan helps families get and stay healthy with
			its easy-to-use functionality.</p>
			<p>
		<a href="#getStarted"><button type="button" id="loginUser" class="btn btn-primary">Get
			Started</button></a>
	</p>
	</div>
	
</div>

<div class="welcomeHeader">
<a name="getStarted"></a>
	<h4>
		Welcome,
		<c:out value="${currentUser}" />
		!
	</h4>
</div>

<div class="dashboardOptions">
	<div class="option">
		<div class="optionImg"></div>
		<div class="optionDetails">
			<h3>My Recipes</h3>
			<ul>
				<c:url var="addRecipe" value="/addRecipe" />
				<c:url var="viewLibraryURL" value="/recipeLibrary" />
				<li><a href="${addRecipe}">Add a Recipe</a></li>
				<li><a href="${viewLibraryURL}">View My Recipe Library</a></li>
			</ul>
		</div>
	</div>
	<div class="option">
		<div class="optionImg"></div>
		<div class="optionDetails">
			<h3>My Meal Plan</h3>
			<ul>
				<c:url var="createMealplan" value="/createMealplan" />
				<c:url var="createMeal" value="/createMeal"/>
				<li><a href=${createMealURL}">Create a Meal</a></li>
				<li><a href="${createMealplan}">Create a Meal Plan</a></li>
				<li>View My Meal Plan</li>
				<li>Modify My Meal Plan</li>
			</ul>
		</div>
	</div>
	<div class="option">
		<div class="optionImg"></div>
		<div class="optionDetails">
			<h3>My Grocery List</h3>
			<ul>
				<li>View My Grocery List</li>
				<li>Modify My Grocery</li>
			</ul>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />