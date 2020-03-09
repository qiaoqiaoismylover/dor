<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*"  %>
<%@page import="util.*"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>已导入</title>
<link rel="stylesheet" type="text/css" href="naive.css" />
</head>
<body>
<h3 class="p2">已导入</h3>
 <% ExcelToDb.excelToDb();%>
</body>
</html>