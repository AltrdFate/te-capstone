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
	<a name="getStarted"></a>
<div class="main-box-dashboard">
	<div class="welcomeHeader">
	
		<h2>
			Welcome, <c:out value="${currentUser}" />!
		</h2>
		<p class="lead">Getting and staying healthy starts with a good
			plan.</p>
		<div class="dashboardDescription">Lorem ipsum dolor sit amet,
			consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
			labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
			exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
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
			Where it all starts: create and manage your recipes using your own personalized library.
			
			</div>
			<br>
			<p>
				<c:url var="addRecipe" value="/addRecipe" />
				<a href="${addRecipe}"><button type="button" id="loginUser" class="btn btn-primary">Get Started</button></a>
					</p>
		</div>
		<div class="option">
			<div class="optionImg">
				<img src="/capstone/img/mealPlanIcon.png" alt="Meal Plan Icon" />
			</div>
			<div class="optionHeader">
				<p class="lead">My Meal Plan</p>
			</div>
			<div class="optionDetails">
			Set yourself up for success. Create multiple meal plans, adding a variety of meals to plan out your week. 
			</div>
			<br>
			<p>
			<c:url var="createMealPlanURL" value="/createMealPlan" />
				<a href="${createMealPlanURL}"><button type="button" id="getStartedMealPlan" class="btn btn-primary">Get Started</button></a>
		</div>
		<div class="option">
			<div class="optionImg">
				<img src="/capstone/img/groceryListIcon.png" alt="Grocery List Icon" />
			</div>
			<div class="optionHeader">
				<p class="lead">My Grocery List</p>
			</div>
			<div class="optionDetails">
				Make your plan a reality. Easily generate a grocery list based on your meal plan for the week.
			</div>
			<br>
			<p>
				<c:url var="mealPlanLibraryURL" value="/mealPlanLibrary" />
				<a href="${mealPlanLibraryURL}"><button type="button" id="getStartedGrocery" class="btn btn-primary">Get Started</button></a>
					</p>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />