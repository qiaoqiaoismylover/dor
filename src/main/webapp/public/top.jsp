<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">

			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav">
					<c:choose>
						<c:when test="${!(sessionScope.status=='stu')}">
							<li class="active"><a class="icon-bar" href="/admin.jsp">宿舍管理系统界面</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="active"><a class="icon-bar" href="/adminLeft/adminLeftStu.jsp">宿舍管理系统界面</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>

				<jsp:include page="exit.jsp" flush="true" />
			</div>
		</div>
	</nav>
</body>
</html>