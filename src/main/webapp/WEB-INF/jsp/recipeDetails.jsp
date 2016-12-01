<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
	<div class="main-box">
		<c:out value="${recipe.recipeName}"/>
	</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />