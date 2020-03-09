<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.*"%>
<%@page import="util.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="naive.css" />
</head>
<body onload="ready();">
	<!-- <center>
		<h3 class="p2">请将要导入数据库的xls格式文件放入C盘，并命名为1！</h3>
		<h3 class="p2">导入后刷新学生信息管理页面即可。</h3>
		<a href="import1.jsp">导入</a>
	</center> -->
	<script type="text/javascript">
	function ready() {
			if (confirm("是否执行该操作？(请在C盘放入xls格式文件，并命名为stuInfo)")) {
			ExcelToDb.excelToDb();
			window.location = '../adminLeft/adminLeftStu.jsp';
		} else {
				window.location = '../adminLeft/adminLeftStu.jsp';
				return false;
			}
		}
	</script>
</body>
</html>