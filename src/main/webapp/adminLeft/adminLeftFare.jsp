<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.WaterAndElectricityFareDao"%>
<%@page import="pojo.WaterAndElectricityFare"%>
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
<script
	src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

<title>宿舍管理系统</title>
</head>
<body>
	<!-- 头部导航栏 -->
	<jsp:include page="/public/top.jsp" flush="true" />


	<div class="container-fluid">
		<div class="row">
			<!--左边菜单栏-->
			<jsp:include page="/public/left.jsp" flush="true">
				<jsp:param name="ifFareActive" value="active" />
			</jsp:include>
			<!--左边菜单栏-->
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
										value="water_and_electricity" type="hidden"> <select
										name="name" class="form-control">
										<option value="bill_id">单号</option>
										<option value="dor_id">宿舍号</option>
										<option value="time">日期</option>
										<option value="water_consum">用水量</option>
										<option value="water_charge">水费</option>
										<option value="electricity_consum">用电量</option>
										<option value="electricity_charge">电费</option>
										<option value="is_pay">是否已付清</option>
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
										onclick="window.location = '../adminLeft/adminLeftFare.jsp'">
										<span style="margin-right: 5px"
											class="glyphicon glyphicon-list" aria-hidden="true"> </span>显示全部
									</button>
								</div>
								<div class="form-group " style="margin-left: 48px">
									<button type="button" class="btn btn-default"
										data-toggle="modal" onclick="read()"
										data-target="#addUserModal">
										<span style="margin-right: 5px" class="" aria-hidden="true"><i
											class="fa fa-user-plus">&nbsp;新增数据</i> </span>
									</button>
								</div>
							</form>
						</div>
					</div>
				</c:if>
				<!--列表展示 -->
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>单号</th>
								<th>宿舍号</th>
								<th>日期</th>
								<th>用水量</th>
								<th>水费</th>
								<th>用电量</th>
								<th>电费</th>
								<th>缴纳情况</th>
								<c:if test="${sessionScope.status=='admin'}">
									<th>操作</th>
								</c:if>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${fare}" var="d">

								<tr>
									<td>${d.bill_id}</td>
									<td>${d.dor_id}</td>
									<td>${d.time}</td>
									<td>${d.water_consum}</td>
									<td>${d.water_charge}</td>
									<td>${d.electricity_consum}</td>
									<td>${d.electricity_charge}</td>

									<c:choose>
										<c:when test="${(d.is_pay==1)}">
											<td>已缴纳</td>
										</c:when>
										<c:when test="${(sessionScope.status=='stu')}">
											<td><button type="button" class="btn btn-danger "
													data-bill_id="${d.bill_id}" data-toggle="modal" onclick=""
													data-target="#fareModal">
													<i class="fa fa-user-times">未缴纳</i>
												</button></td>
										</c:when>
										<c:otherwise>
											<td><font color="red">未缴纳</font></td>
										</c:otherwise>
									</c:choose>

									<c:if test="${sessionScope.status=='admin'}">
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-default "
													data-bill_id="${d.bill_id}" data-dor_id="${d.dor_id}"
													data-time="${d.time}" data-water_consum="${d.water_consum}"
													data-water_charge="${d.water_charge}"
													data-electricity_consum="${d.electricity_consum}"
													data-electricity_charge="${d.electricity_charge}"
													data-is_pay="${d.is_pay}" data-toggle="modal"
													onclick="readOnly()" data-target="#addUserModal">
													<i class="fa fa-user-o">&nbsp;修改</i>
												</button>

												<button type="button" class="btn btn-danger "
													data-bill_id="${d.bill_id}" data-toggle="modal" onclick=""
													data-target="#delUserModal">
													<i class="fa fa-user-times">&nbsp;删除</i>
												</button>
											</div>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- 更新模态框示例（Modal） -->
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
												<label for="user_id" class="col-sm-3 control-label">单号</label>
												<div class="col-sm-9">
													<input type="hidden" class="form-control" id="tab"
														name="tab" placeholder="" value="water_and_electricity">
													<input type="text" class="form-control" id=bill_id
														name="bill_id" value="" placeholder="" readonly="readonly">
												</div>
											</div>

											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">宿舍号</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="dor_id"
														name="dor_id" value="" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">日期</label>
												<div class="col-sm-9">
													
														
														<input type="text" class="form-control datetimepicker-input"
														id="time" name="time"  data-toggle="datetimepicker" />
													<script type="text/javascript">
														$(function() {
															$('#time').datetimepicker(
																{
																				format : 'YYYY-MM-DD  hh:mm:ss  dddd',
																				locale : 'zh-CN'
																			});
														});
													</script>
												</div>
											</div>
											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">用水量</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="water_consum"
														name="water_consum" value="" placeholder="">
												</div>
											</div>

											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">水费</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="water_charge"
														name="water_charge" value="" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">用电量</label>
												<div class="col-sm-9">
													<input type="hidden" class="form-control" id="tab"
														name="tab" placeholder="" value="stu_info"> <input
														type="text" class="form-control" id="electricity_consum"
														name="electricity_consum" value="" placeholder="">
												</div>
											</div>

											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">电费</label>
												<div class="col-sm-9">
													<input type="text" class="form-control"
														id="electricity_charge" name="electricity_charge" value=""
														placeholder="">
												</div>
											</div>

											<div class="form-group">
												<label for="user_id" class="col-sm-3 control-label">是否已付清</label>
												<div class="col-sm-9">
													<select name="is_pay" class="form-control">
														<option>0</option>
														<option>1</option>
													</select>
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
														name="tab" placeholder="" value="water_and_electricity">
													<input type="hidden" class="form-control" id="bill_id"
														name="bill_id" placeholder="">
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
					<!-- 水电费单模态框示例（Modal） -->
					<form method="post" action="../servlet/FareServlet"
						class="form-horizontal" style="margin-top: 0px" role="form"
						id="form_data" onsubmit="return confirm()" style="margin: 20px;">
						<div class="modal fade" id="fareModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">水电费单</h4>
									</div>
									<div class="modal-body">
										<form class="form-horizontal" role="form">
											<div class="form-group">

												<div class="col-sm-9">
													<h3 class="col-sm-18 control-label" id="fareLabel">水电费信息</h3>
													<input type="hidden" class="form-control" id="bill_id"
														name="bill_id" placeholder="">
												</div>
											</div>
										</form>
									</div>
									<!-- model底部按钮部分 -->
									<
									<div class="modal-footer">
										<script>
											
										</script>
										<button type="button" class="btn btn-default"
											data-dismiss="modal" onclick="">取消</button>
										<button type="submit" class="btn btn-danger">缴纳</button>
										<span id="tip"> </span>
									</div>
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
			var bill_id = button.data('bill_id') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var dor_id = button.data('dor_id')
			var water_consum = button.data('water_consum')
			var time = button.data('time')
			var water_charge = button.data('water_charge')
			var electricity_consum = button.data('electricity_consum')
			var electricity_charge = button.data('electricity_charge')
			var is_pay = button.data('is_pay')
			var modal = $(this)

			modal.find('.modal-title').text('修改单号为 ' + bill_id + '的信息')
			modal.find('#bill_id').val(bill_id)
			modal.find('#dor_id').val(dor_id)
			modal.find('#water_consum').val(water_consum)
			modal.find('#time').val(time)
			modal.find('#water_charge').val(water_charge)
			modal.find('#electricity_consum').val(electricity_consum)

			modal.find('#electricity_charge').val(electricity_charge)
			modal.find('#is_pay').val(is_pay)

		})

		$('#delUserModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var bill_id = button.data('bill_id') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-title').text('删除学生信息')
			modal.find('#deleteLabel').text('是否删除单号为  ' + bill_id + ' 的信息')
			modal.find('#bill_id').val(bill_id)
		})

		$('#fareModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var bill_id = button.data('bill_id') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-title').text('水电费单')
			modal.find('#fareLabel').text('是否缴纳单号为  ' + bill_id + ' 的费用')
			modal.find('#bill_id').val(bill_id)
		})

		function confirm() {
			if (confirm("是否执行该操作？")) {
				return true;
			}
			return false;
		}

		function showAll() {
	<%if (!(session.getAttribute("status").equals("stu"))) {
				List list = WaterAndElectricityFareDao.readList();
				session.setAttribute("fare", list);
			} else {
				String value = String.valueOf(session.getAttribute("dor_id"));
				List list = WaterAndElectricityFareDao.readOneList("dor_id", value);
				session.setAttribute("fare", list);
			}%>
		}
		function readOnly() {
			$('input[name=bill_id]').attr("readonly", "readonly")//将input元素设置为readonly
		}
		function read() {
			$('input[name=bill_id]').removeAttr("readonly");//去除input元素的readonly属性
		}
	</script>

</body>

</html>