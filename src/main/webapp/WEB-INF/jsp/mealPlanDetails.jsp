<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
	<h1>Meal Plan</h1>
	<p class="lead"><c:out value="${mealPlan.mealPlanDescription}"/></p>
	Meals:<br>
	<ul>
	<c:forEach var = "mealName" items="${mealNames}">
		<li><c:out value="${mealName}"/></li>
	</c:forEach>
	</ul>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />