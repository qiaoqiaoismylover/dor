<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div class="panel panel-default">
					<div class="panel-heading">搜索</div>
					<div class="panel-body">
						<form role="form" class="form-inline"
							action="../servlet/SearchServlet">
							<div class="form-group">
								<label for="name">字段</label> <input name="table"
									value="stu_info" type="hidden"> <select name="name"
									class="form-control">
									<option value="stu_id">学号</option>
									<option value="password">密码</option>
									<option value="dor_id">宿舍号</option>
									<option value="name">姓名</option>
									<option value="sex">性别</option>
									<option value="department">所在系</option>
									<option value="stu_class">所在班级</option>
									<option value="stu_phone">手机号码</option>
								</select>
							</div>
							<div class="form-group" style="margin-left: 20px">
								<label for="value">值</label> <input type="text"
									class="form-control" id="value" name="value" placeholder="字段值"
									maxlength="12" style="width: 130px">
							</div>
							<div class="form-group" style="margin-left: 20px">
								<label for="selected">搜索类型</label> <select name="selected"
									class="form-control">
									<option>完整查询</option>
									<option>模糊查询</option>
								</select>
							</div>
							<div class="form-group " style="margin-left: 20px">
								<button type="submit" class="btn btn-info ">
									<span style="margin-right: 5px"
										class="glyphicon glyphicon-search" aria-hidden="true">
									</span>开始搜索
								</button>
							</div>
							<div class="form-group " style="margin-left: 20px">
								<button type="button" class="btn btn-default"
									onclick="window.location = '../adminLeft/adminLeftStu.jsp'">
									<span style="margin-right: 5px"
										class="glyphicon glyphicon-list" aria-hidden="true"> </span>显示全部
								</button>
							</div>
						</form>
					</div>
				</div>
</body>
</html>