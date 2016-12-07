<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="main-box">

<c:out value="${meal}"/>
<p>
<ul>
<c:forEach items="${recipes}" var="recipe">
	<li><c:out value="${recipe.recipeName}"/></li>
</c:forEach>
</ul>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />