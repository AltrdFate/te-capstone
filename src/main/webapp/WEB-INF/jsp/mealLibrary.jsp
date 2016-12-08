<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="main-box">
<h1>My Meals</h1>
<p class="lead">Access all your meals in your library below.</p>
<table class="table table-striped">
	<tr>
			<th>Name</th>
			<th></th>
			<th></th>
		</tr>
	
	<c:forEach items="${meals}" var="meal">
		<tr>
		<td><c:out value="${meal.mealDescription}" /></td>
		<td><c:url value="mealDetails?mealId=${meal.mealId}" var="viewMealDetailsURL"/>
		<a href="${viewMealDetailsURL}">View Details</a></td>
		<td><c:url value="modifyMeal?mealId=${meal.mealId}" var="modifyMealURL"/>
		<a href="${modifyMealURL}">Modify Details</a></td>
		</tr>
</c:forEach>
	
</table>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />