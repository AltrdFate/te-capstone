<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
	<div class="main-box">
		<h2>My Grocery List</h2>
		<p class="lead">Hey <c:out value="${currentUser}"/>! Based on your meal plan for this week, here's your grocery list.</p>
		
		<div>
		<ul>
			<c:forEach items="${groceries}" var="grocery">
				<li><c:out value="${grocery}"/></li>
			</c:forEach>
		</ul>
		</div>
	</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />