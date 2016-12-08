<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
	<h1>Delete Meal Plan</h1>
	<p class="lead">
		Hey <c:out value="${currentUser}"/>! Are you sure you want to <span class="delete">DELETE</span> this plan:
		<p class="lead">
			<c:out value="${mealPlan.mealPlanDescription}"/>
			</p>
	
	<c:url value="/modifyMealPlan?mealPlanId=${param.mealPlanId}" var="formAction"/>
	<form id="modifyMealPlanForm" method="POST" action="${formAction}">
		<button type="submit" id="deletePlanButton" class="btn btn-primary">DELETE</button>
	</form>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />