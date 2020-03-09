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
	<div class="col-sm-2 ">
		<c:if test="${!(sessionScope.status=='stu')}">
		<a href="../admin.jsp" class="list-group-item "><span
			class=""><i class="fa fa-signal fa-fw"></i> </span>统计 </a> 
			</c:if>
			<a href="/dor/adminLeft/adminLeftDorAdmin.jsp" class="list-group-item ">
			<!-- 小图标样式设置 --> <span class="" aria-hidden="true"><i
				class="fa fa-user-circle-o fa-fw"></i> </span>宿管信息
		</a>
		<c:if test="${sessionScope.status=='admin'}">
			<a href="/dor/adminLeft/adminLeftStu.jsp" class="list-group-item">
				<span class="" aria-hidden="true"><i
					class="fa fa-user-circle fa-fw"></i> </span>学生信息</a>
		</c:if>
		<a href="/dor/adminLeft/adminLeftDorInfo.jsp" class="list-group-item">
			<span class="" aria-hidden="true"><i class="fa fa-home fa-fw"></i>
		</span>宿舍信息
		</a> <a href="/dor/adminLeft/adminLeftFare.jsp" class="list-group-item">
			<span class="" aria-hidden="true"><i
				class="fa fa-minus-square-o fa-fw"></i> </span>水电费缴纳信息
		</a>
	</div>
</body>
</html>