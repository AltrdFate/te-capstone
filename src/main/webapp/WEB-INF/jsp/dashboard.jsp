<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="jumbotron">
	<div class="jumboHeading">
		<h2>Start Planning a Healthier You Today.</h2>
		<p class="lead">mealPlan helps families get and stay healthy with
			its easy-to-use functionality.</p>
		<p>
			<a href="#getStarted"><button type="button" id="loginUser"
					class="btn btn-primary">Get Started</button></a>
		</p>
	</div>

</div>
<div class="main-box-dashboard">
<div class="welcomeHeader">
	<a name="getStarted"></a>
	<h2>
		Welcome, <c:out value="${currentUser}" />!
	</h2>
	<p class="lead">Getting and staying healthy starts with a good
		plan.</p>
		<div class="dashboardDescription">
		Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
	</div>
</div>

<div class="dashboardOptions">
	<div class="option">
		<div class="optionImg">
			<img src="/capstone/img/recipeIcon.png" alt="Recipe Icon" />
		</div>
		<div class="optionHeader">
			<p class="lead">My Recipes</p>
		</div>

		<div class="optionDetails">
			<c:url var="addRecipe" value="/addRecipe" />
			<c:url var="viewLibraryURL" value="/recipeLibrary" />
			<h5>
				<a href="${addRecipe}">&gt;Add a Recipe</a>
			</h5>
			<!-- 				Add a recipe to your library. -->
			<p>
			<h5>
				<a href="${viewLibraryURL}">&gt;View My Recipe Library</a>
			</h5>
			<!-- 				Access your recipes in your library.<br> -->
			<!-- 				Make any edits to a recipe.<br> -->
			<!-- 				View the details of your recipe. -->
		</div>
	</div>
	<div class="option">
		<div class="optionImg">
			<img src="/capstone/img/mealPlanIcon.png" alt="Meal Plan Icon" />
		</div>
		<div class="optionHeader">
			<p class="lead">My Meal Plan</p>
		</div>
		<div class="optionDetails">
			<c:url var="createMealplan" value="/createMealplan" />
			<c:url var="createMeal" value="/createMeal" />
			<a href="${createMeal}">Create a Meal</a>
			<p>
				<a href="${createMealplan}">Create a Meal Plan</a>
			<p>View My Meal Plan
		</div>
	</div>
	<div class="option">
		<div class="optionImg">
			<img src="/capstone/img/groceryListIcon.png" alt="Grocery List Icon" />
		</div>
		<div class="optionHeader">
			<p class="lead">My Grocery List</p>
		</div>
		<div class="optionDetails">

			View My Grocery List
			<p>Modify My Grocery
		</div>
	</div>
</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />