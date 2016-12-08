<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
	<h1>Modify Your Meal Plan Details</h1>
	<p class="lead">
		Hey ${currentUser}!, Switch meals in and out of your plan.
	<c:url value="/modifyMealPlan?mealPlanId=${param.mealPlanId}" var="formAction"/>
	<form id="modifyMealPlanForm" method="POST" action="${formAction}">
		<h2>Your Current Meals In This Plan</h2>
		<input type="text" id="mealPlanDescription" name="mealPlanDescription" value="${mealPlan.mealPlanDescription}" placeholder="Meal Plan Description"/>
		<br>
		<c:forEach var="mealName" items="${mealNames}">
			<c:out value="${mealName}"/><br>
		</c:forEach>
		
		<c:forEach var="i" begin="1" end="5">
			<select name="recipeIds" id="recipeChoice">
				<c:forEach var="meal" items="${allMeals}">
					<option value="${meal.mealId}" >${meal.mealDescription}</option>
				</c:forEach>
					<option value="" selected>None</option>
			</select>
			<br>
		</c:forEach>
	</form>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />