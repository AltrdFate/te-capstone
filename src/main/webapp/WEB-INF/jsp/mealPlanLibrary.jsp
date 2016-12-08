<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
<h1>My Meal Plans</h1>
<p class="lead">Access all your meal plans in your library below.</p>
<table class="table table-striped">
	<tr>
			<th>Name</th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
	
	<c:forEach items="${mealPlanList}" var="mealPlan">
		<tr>
		<td><c:out value="${mealPlan.mealPlanDescription}" /></td>
		<td><c:url value="mealPlanDetails?mealPlanId=${mealPlan.mealPlanId}" var="viewMealDetailsURL"/>
		<a href="${viewMealDetailsURL}">View Details</a></td>
		<td><c:url value="/groceryList?mealPlanId=${mealPlan.mealPlanId}" var="groceryListURL"/>
		<a href="${groceryListURL}">View Grocery List</a>
		</td>
		<td><c:url value="modifyMealPlan?mealPlanId=${mealPlan.mealPlanId}" var="modifyMealPlanURL"/>
		<a href="${modifyMealPlanURL}"><span class="delete">Delete</span></a></td>
		</tr>
</c:forEach>
	
</table>

</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />