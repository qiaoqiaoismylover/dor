<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.WaterAndElectricityFareDao"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 引入chart -->
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<!-- 引入 Bootstrap -->
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 引入 font-awesome -->
<link
	href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>宿舍管理系统</title>
</head>
<body>
	<%
		if (session.getAttribute("loginName") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<!-- 头部导航栏 -->
	<jsp:include page="public/top.jsp" flush="true" />

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2">
		
				<a href="#" class="list-group-item "><span class=""><i
						class="fa fa-signal fa-fw"></i> </span>统计 </a> <a
					href="/dor/adminLeft/adminLeftDorAdmin.jsp" class="list-group-item">
					<!-- 小图标样式设置 --> <span class="" aria-hidden="true"><i
						class="fa fa-user-circle-o fa-fw"></i> </span>宿管信息
				</a> <c:if test="${sessionScope.status=='admin'}">
				<a href="/dor/adminLeft/adminLeftStu.jsp" class="list-group-item">
					<span class="" aria-hidden="true"><i
						class="fa fa-user-circle fa-fw"></i> </span>学生信息
				</a> </c:if>
				<a href="/dor/adminLeft/adminLeftDorInfo.jsp"
					class="list-group-item"> <span class="" aria-hidden="true"><i
						class="fa fa-home fa-fw"></i> </span>宿舍信息
				</a> <a href="/dor/adminLeft/adminLeftFare.jsp" class="list-group-item">
					<span class="" aria-hidden="true"><i
						class="fa fa-minus-square-o fa-fw"></i> </span>水电费缴纳信息
				</a>
			</div>
			<!--右边内容-->
			<div class="col-sm-10">
				<div id="container"
					style="width: 550px; height: 50px; margin: 0 auto"></div>

				<div style="height: 300px; width: 50%;">
					<canvas id="chartjs-pie-chart"></canvas>
				</div>

				<script src="js/Chart.min.js"></script>

				<script>
					window.chartColors = {
						red : 'rgb(255, 99, 132)',
						orange : 'rgb(255, 159, 64)',
						yellow : 'rgb(255, 205, 86)',
						green : 'rgb(75, 192, 192)',
						blue : 'rgb(54, 162, 235)',
						purple : 'rgb(153, 102, 255)',
						grey : 'rgb(201, 203, 207)'
					};

					window.randomScalingFactor = function() {
						return (Math.random() > 0.5 ? 1.0 : -1.0)
								* Math.round(Math.random() * 100);
					};

					var pieConfig = {
						type : 'pie',
						data : {
							datasets : [ {
								data : [ <%=WaterAndElectricityFareDao.readCount(0)%>, <%=WaterAndElectricityFareDao.readCount(1)%>],
								backgroundColor : [ window.chartColors.red,
										window.chartColors.blue, ],
								label : 'Dataset 1'
							} ],
							labels : [ "未缴纳宿舍数",
									"已缴纳宿舍数" ]
						},
						options : {
							responsive : true,
							maintainAspectRatio : false,
							title : {
								display : true,
								text : '宿舍水电费缴纳情况'
							}
						}
					};

					var pieCtx = document.getElementById("chartjs-pie-chart")
							.getContext("2d");
					window.myPie = new Chart(pieCtx, pieConfig);
				</script>


			</div>
		</div>
	</div>
	<!-- 底部页脚部分 -->
	<jsp:include page="/public/foot.jsp" flush="true" />


</body>

</html>