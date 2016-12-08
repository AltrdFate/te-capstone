<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
	<h2>Create a Meal Plan</h2>
	<p class="lead">Please use the form below to create a new meal
		plan. Don't worry if you don't have all the information handy - you
		can always modify the details later.</p>

	<c:url value="/createMealPlan" var="formAction" />
	<form id="mealPlanForm" method="POST" action="${formAction}">

		<div>
			<label for="mealPlanDescription">Meal Plan Name:</label><br>
			<input type="text" id="mealPlanDescription"
				name="mealPlanDescription" placeholder="Meal Plan Name" />
		</div>

		<div>
			<h3>Monday</h3>
			<div class="meals">
				<select name="mealId" id="mealId">
					<c:forEach var="meal" items="${meals}">
						<option value="${meal.mealId}">${meal.mealDescription}</option>
					</c:forEach>
						<option value="" selected>None</option>
				</select><br> 
			</div>
		<div>
			<h3>Tuesday</h3>
			<div class="meals">
				<select name="mealId" id="mealId">
					<c:forEach var="meal" items="${meals}">
						<option value="${meal.mealId}">${meal.mealDescription}</option>
					</c:forEach>
					<option value="" selected>None</option>
				</select><br> 
			</div>
			
			<h3>Wednesday</h3>
			<div class="meals">
				<select name="mealId" id="mealId">
					<c:forEach var="meal" items="${meals}">
						<option value="${meal.mealId}">${meal.mealDescription}</option>
					</c:forEach>
					<option value="" selected>None</option>
				</select><br> 
			</div>
			
			<h3>Thursday</h3>
			<div class="meals">
				<select name="mealId" id="mealId">
					<c:forEach var="meal" items="${meals}">
						<option value="${meal.mealId}">${meal.mealDescription}</option>
					</c:forEach>
					<option value="" selected>None</option>
				</select><br> 
			</div>
			
			<h3>Friday</h3>
			<div class="meals">
				<select name="mealId" id="mealId">
					<c:forEach var="meal" items="${meals}">
						<option value="${meal.mealId}">${meal.mealDescription}</option>
					</c:forEach>
					<option value="" selected>None</option>
				</select><br> 
			</div>
			
			<h3>Saturday</h3>
			<div class="meals">
				<select name="mealId" id="mealId">
					<c:forEach var="meal" items="${meals}">
						<option value="${meal.mealId}">${meal.mealDescription}</option>
					</c:forEach>
					<option value="" selected>None</option>
				</select><br> 
			</div>
			
			<h3>Sunday</h3>
			<div class="meals">
				<select name="mealId" id="mealId">
					<c:forEach var="meal" items="${meals}">
						<option value="${meal.mealId}">${meal.mealDescription}</option>
					</c:forEach>
					<option value="" selected>None</option>
				</select><br> 
			</div>
			
		</div>
		<button style="" id="submitMealPlan" class="btn btn-primary">Submit</button>
		</form>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
