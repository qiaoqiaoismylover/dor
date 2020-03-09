
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>登录界面</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <!-- 引入 Bootstrap -->
 <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 <!-- 引入 font-awesome -->
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <!-- 引入CSS登录动画 -->
<link rel="stylesheet" href="css/style.css">
 <script type="text/javascript">
   function reloadCode()
        {
            var time=new Date().getTime();
            document.getElementById("imagecode").src="<%= request.getContextPath()%>/servlet/ImageServlet?d="+time;
       }
   
    </script>
</head>
<body>

<div class="container">
        <div class="form row">
            <form class="form-horizontal col-md-offset-3" id="login_form" action="<%= request.getContextPath()%>/servlet/LoginServlet" method="post">
                <h3 class="form-title">登录</h3>
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="用户名" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" type="password" placeholder="密码" id="password" name="password" maxlength="20"/>
                    </div>
                     <div class="form-group" >
                            <i class="fa fa-barcode"></i>
                            <input class="form-control required" type="text" placeholder="验证码" name="checkCode" maxlength="4"  style="width:150px"/>
                            <div style="float:right;margin-top:-28px">
                            	<img alt="验证码" id="imagecode" src="<%= request.getContextPath()%>/servlet/ImageServlet" onclick='javascript:reloadCode()'/>
                            </div>     
                    </div>
                    
                     <div class="form-group">
                      		<label class="radio-inline">
                            	<input type="radio" name="status" id="inlineRadio1" value="admin"  checked="checked" class="radio-inline"> 管理员
                       		</label>
                        	<label class="radio-inline">
                           		<input type="radio" name="status" id="inlineRadio2" value="doradmin" class="radio-inline" > 宿管
                        	</label>
                        	<label class="radio-inline">
                           		<input type="radio" name="status" id="inlineRadio3" value="stu" class="radio-inline" > 学生
                        	</label>
                     </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
   
</body>
</html>