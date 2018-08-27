<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="resources/bs/<spring:theme code='bstheme'/>/bootstrap.css" rel="stylesheet" type="text/css" />
<style type="text/css">
          .container-fluid.w-50{
             position: fixed;
             top: 50%;
             left: 50%;
          }
</style>
</head>
<body>
	<div class="container-fluid   w-50  "   >
		<div class="row  card">
		<div class="card-header">
			${msg }
		</div>
			<div class="col-md-12">
			
				<form action="login" method="post">
					<div class="form-group row">
						<label for="inputName" class="col-sm-2 col-form-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name" value="${param.name }">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputPassword3" class="col-sm-2 col-form-label">密码:</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPassword3" placeholder="密码" name="pwd">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputVcode" class="col-sm-2 col-form-label">验证码:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="inputVcode" placeholder="验证码" name="vcode"  maxlength="4">
							</div>
							<div class="col-sm-4">
							<img   title="点击换图片" src="vcode.png"   class="vcodeimg"><a  class="vcodeimg">看不清，换一张</a>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-10   offset-md-2">
							<button type="submit" class="btn btn-primary">登陆</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 写在这里提高网页响应速度 -->
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.slim.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">

 $(function(){
          $(".col-sm-4  .vcodeimg").click(function(){
              //追加一个随机数，要不然只能换一次
                        $(".col-sm-4  img.vcodeimg").attr("src","vcode.png?t="+Math.random());

              });
          //移动到对应位置
           console.log($(" .container-fluid.w-50").width());
          $(" .container-fluid.w-50").css({
                   
                     "margin-left":-$(" .container-fluid.w-50").width()/2+"px",
                     "margin-top":-$(" .container-fluid.w-50").height()/2+"px"
              });
	 });
	</script>
</body>
</html>