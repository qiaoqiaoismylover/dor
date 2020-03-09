<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.DorAdminInfoDao"%>
<%@page import="pojo.DorAdminInfo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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

<title>宿舍管理系统</title>
</head>
<body>
	<!-- 头部导航栏 -->
	<jsp:include page="/public/top.jsp" flush="true" />

	<div class="container-fluid">
		<div class="row">

			<!--左边菜单栏-->
			<jsp:include page="/public/left.jsp" flush="true">
				<jsp:param name="ifDorAdActive" value="active" />
			</jsp:include>

			<div class="col-sm-10">
				<!-- 顶部搜索部分 -->
				<c:if test="${!(sessionScope.status=='stu')}">
					<div class="panel panel-default">
						<div class="panel-heading">搜索</div>
						<div class="panel-body">
							<form role="form" class="form-inline"
								action="../servlet/SearchServlet">
								<div class="form-group">
									<label for="name">字段</label> <input name="table"
										value="dor_admin" type="hidden"> <select name="name"
										class="form-control">
										<option value="dor_ad_id">宿管姓名</option>
										<c:if test="${(sessionScope.status=='admin')}">
											<option value="password">宿管密码</option>
										</c:if>
										<option value="dor_id">所管理宿舍栋号</option>
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
										onclick="window.location = '../adminLeft/adminLeftDorAdmin.jsp'">
										<span style="margin-right: 5px"
											class="glyphicon glyphicon-list" aria-hidden="true"> </span>显示全部
									</button>
								</div>
								<c:if test="${sessionScope.status=='admin'}">
									<div class="form-group " style="margin-left: 48px">
										<button type="button" class="btn btn-default"
											data-toggle="modal" onclick="read()"
											data-target="#addUserModal">
											<span style="margin-right: 5px" class="" aria-hidden="true"><i
												class="fa fa-user-plus">&nbsp;新增数据</i> </span>
										</button>
									</div>
								
								</c:if>
							</form>
						</div>
					</div>
				</c:if>
				<!-- 列表展示-->
				<div class="table-responsive">
					<table class="table table-hover ">
						<thead>
							<tr>
								<th>宿管姓名</th>
								<c:if test="${(sessionScope.status=='admin')}">
									<th>密码</th>
								</c:if>
								<th>所管理宿舍栋号</th>
								<th>联系电话</th>
								<c:if test="${sessionScope.status=='admin'}">
									<th>操作</th>
								</c:if>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${dorAdminInfo}" var="d">
								<tr>
									<td>${d.dor_ad_id}</td>
									<c:if test="${(sessionScope.status=='admin')}">
										<td>${d.password}</td>
									</c:if>
									<td>${d.dor_id}</td>
									<td>${d.dor_ad_phone}</td>
									<c:if test="${sessionScope.status=='admin'}">
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-default "
													data-dor_ad_id="${d.dor_ad_id}" data-dor_id="${d.dor_id}"
													data-password="${d.password}"
													data-dor_ad_phone="${d.dor_ad_phone}" data-toggle="modal"
													onclick="readOnly()" data-target="#addUserModal">
													<i class="fa fa-user-o">&nbsp;修改</i>
												</button>

												<button type="button" class="btn btn-danger "
													data-dor_ad_id="${d.dor_ad_id}" data-toggle="modal"
													onclick="" data-target="#delUserModal">
													<i class="fa fa-user-times">&nbsp;删除</i>
												</button>
											</div>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- add框示例（Modal） -->
					<form method="post" action="../servlet/UpdateServlet"
						class="form-horizontal" style="margin-top: 0px" role="form"
						id="form_data" onsubmit="return confirm()" style="margin: 20px;">
						<div class="modal fade" id="addUserModal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">x</button>
										<h4 class="modal-title" id="myModalLabel">用户信息</h4>
									</div>
									<div class="modal-body">
										<form class="form-horizontal" role="form">
											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">宿管账号</label>
												<div class="col-sm-9">
													<input type="hidden" class="form-control" id="tab"
														name="tab" placeholder="" value="dor_admin"> <input
														type="text" class="form-control" id="dor_ad_id"
														name="dor_ad_id" value="" placeholder="">
												</div>
											</div>

											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">密码</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="password"
														name="password" value="" placeholder="">
												</div>
											</div>

											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">所管理宿舍号</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="dor_id"
														name="dor_id" value="" placeholder="">
												</div>
											</div>

											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">联系电话</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="dor_ad_phone"
														name="dor_ad_phone" value="" placeholder="">
												</div>
											</div>
										</form>
									</div>
									<!-- model底部按钮部分 -->
									<jsp:include page="/public/modelfooterUpdate.jsp" flush="true" />
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal -->
						</div>
					</form>
					<!-- 删除模态框示例（Modal） -->
					<form method="post" action="../servlet/DeleteServlet"
						class="form-horizontal" style="margin-top: 0px" role="form"
						id="form_data" onsubmit="return confirm()" style="margin: 20px;">
						<div class="modal fade" id="delUserModal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">用户信息</h4>
									</div>
									<div class="modal-body">
										<form class="form-horizontal" role="form">
											<div class="form-group">

												<div class="col-sm-9">
													<h3 class="col-sm-18 control-label" id="deleteLabel">删除信息</h3>
													<input type="hidden" class="form-control" id="tab"
														name="tab" placeholder="" value="dor_admin"> <input
														type="hidden" class="form-control" id="dor_ad_id"
														name="dor_ad_id" placeholder="">
												</div>
											</div>
										</form>
									</div>
									<!-- model底部按钮部分 -->
									<jsp:include page="/public/modelfooterDelete.jsp" flush="true" />
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal -->
						</div>
					</form>
				</div>
				<!-- 底部页码部分 -->
				<jsp:include page="/public/pagination.jsp" flush="true" />
			</div>
		</div>
	</div>
	<!-- 底部页脚部分 -->
	<jsp:include page="/public/foot.jsp" flush="true" />

	<script>
		$('#addUserModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var dor_ad_id = button.data('dor_ad_id') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var password = button.data('password')
			var dor_id = button.data('dor_id')
			var dor_ad_phone = button.data('dor_ad_phone')
			var modal = $(this)

			modal.find('.modal-title').text('宿管信息')
			modal.find('#dor_ad_id').val(dor_ad_id)
			modal.find('#password').val(password)
			modal.find('#dor_id').val(dor_id)
			modal.find('#dor_ad_phone').val(dor_ad_phone)

		})

		$('#delUserModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var dor_ad_id = button.data('dor_ad_id') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-title').text('删除学生信息')
			modal.find('#deleteLabel').text('是否删除宿管姓名为  ' + dor_ad_id + ' 的信息')
			modal.find('#dor_ad_id').val(dor_ad_id)
		})

		function confirm() {
			if (confirm("是否执行该操作？")) {
				return true;
			}
			return false;
		}
		function showAll() {
	<%if (!(session.getAttribute("status").equals("stu"))) {
				List list = DorAdminInfoDao.readList();
				session.setAttribute("dorAdminInfo", list);
			}%>
		}
		function readOnly() {
			$('input[name=dor_ad_id]').attr("readonly", "readonly")//将input元素设置为readonly
		}
		function read() {
			$('input[name=dor_ad_id]').removeAttr("readonly");//去除input元素的readonly属性
		}
	</script>

</body>

</html>