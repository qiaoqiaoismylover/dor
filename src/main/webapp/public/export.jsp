<%@page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@page contentType="application/vnd.ms-excel"%>
<%@page import="dao.*"%>
<%@page import="pojo.*"%>
<%@page import="java.util.List"%>

<%
	response.setHeader("Content-disposition", "attachment; filename=stuInfo.xls");

	//以上这行设定传送到前端浏览器时的档名为test.xls
	//就是靠这一行，让前端浏览器以为接收到一个excel档
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>

<body>
	<br>
	<table border="1" width="100%">
		<tr>
			<td>学号</td>
			<td>密码</td>
			<td>宿舍号</td>
			<td>姓名</td>
			<td>性别</td>
			<td>所在系</td>
			<td>所在班级</td>
			<td>手机号码</td>
		</tr>
		<%
			List<StuInfo> users2 = StudentInfoDao.readList();
			for (StuInfo l : users2) {
		%>
		<tr>
			<td><%=l.getStu_id()%></td>
			<td><%=l.getPassword()%></td>
			<td><%=l.getDor_id()%></td>
			<td><%=l.getName()%></td>
			<td><%=l.getSex()%></td>
			<td><%=l.getDepartment()%></td>
			<td><%=l.getStu_class()%></td>
			<td><%=l.getStu_phone()%></td>
		</tr>
		<%
			}
		%>



	</table>
</body>
</html>
