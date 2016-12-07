<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<h1>My Meals</h1>
<p class="lead">Access all your meals in your library below.</p>
<table class="table table-striped">
	<tr>
			<th>Name</th>
			<th></th>
			<th></th>
		</tr>
	
	<c:forEach items="${mealPlan}" var="mealPlan">
		<tr>
		<td><c:out value="${mealPlan.mealPlanDescription}" /></td>
		<td><c:url value="mealPlanDetails?mealPlanId=${mealPlan.mealPlanId}" var="viewMealPlanDetailsURL"/>
		<a href="${viewMealPlanDetailsURL}">View Details</a></td>
		<td><c:url value="modifyMealPlan?mealPlanId=${mealPlan.mealPlanId}" var="modifyMealPlanURL"/>
		<a href="${modifyMealPlanURL}">Modify Details</a></td>
		</tr>
</c:forEach>
	
</table>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />