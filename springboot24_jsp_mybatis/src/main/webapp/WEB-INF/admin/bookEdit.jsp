<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑书籍</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="resources/bs/<spring:theme code='bstheme'/>/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.custom-file-label::after {
	content: "请选择文件"
}
</style>
</head>
<body>

	<div class="container ">
		<!-- 我们网页设计时，需要把多个部分视觉上分割，这里加上card，它是bootstrap4的一个特性 -->
		<!-- 顶部 -->
		<div class="row  ">
			<div class="col-md-12" style="padding: 0px">
				<%@include file="common/nav.jsp"%>
			</div>
		</div>
		<!-- 中间 -->
		<div class="row  card">
			<div class="col-md-12">
				<div class="card-header">图书编辑</div>
					<form:form action="bookEdit" method="post" enctype="multipart/form-data" modelAttribute="book"  >
						<!--  -->
						<form:hidden path="id" />
						<!--  name -->
						<div class="form-group row">
							<form:label path="name" cssClass="col-sm-2 col-form-label">
								<spring:message code="book.name"></spring:message>
							</form:label>
							<div class="col-sm-10">
								<form:input path="name" cssClass="form-control" />
								<form:errors path="name" element="div" cssClass="invalid-feedback"></form:errors>
							</div>
						</div>
						<!-- tid-->
						<div class="form-group row">
							<form:label path="tid" cssClass="col-sm-2 col-form-label">
								<spring:message code="book.tid"></spring:message>
							</form:label>
							<div class="col-sm-10">
								<form:select path="tid" items="${types}" itemLabel="name" itemValue="id" cssClass="form-control"></form:select>
								<form:errors path="tid" element="div" cssClass="invalid-feedback"></form:errors>
							</div>
						</div>
						<!-- desci -->
						<div class="form-group row">
							<form:label path="descri" cssClass="col-sm-2 col-form-label">描述</form:label>
							<div class="col-sm-10">
								<form:textarea path="descri" cssClass="form-control" htmlEscape="true" />
								<form:errors path="descri" element="div" cssClass="invalid-feedback"></form:errors>
							</div>
						</div>
						<!-- phot0 -->
						<div class="form-group row">
							<label for="inputName" class="col-sm-2 col-form-label">图片</label>
							<div class="col-sm-10">
								<div class="custom-file">
									<input type="file" name="photox" class="custom-file-input" /> <label class="custom-file-label" for="customFile"> 选择图片 </label> <img alt="" src="/up/${book.photo }"
										style="max-width: 100px;">
								</div>
							</div>
						</div>
						<!-- pubdate -->
						<div class="form-group row">
							<form:label path="pubDate" cssClass="col-sm-2 col-form-label">出版日期</form:label>
							<div class="col-sm-10">
								<form:input path="pubDate" cssClass="form-control" />
								<form:errors path="pubDate" element="div" cssClass="invalid-feedback"></form:errors>
							</div>
						</div>
						<!-- price -->
						<div class="form-group row">
							<form:label path="price" cssClass="col-sm-2 col-form-label">价格</form:label>
							<div class="col-sm-10">
								<form:input path="price" cssClass="form-control" />
								<form:errors path="price" element="div" cssClass="invalid-feedback"></form:errors>
							</div>
						</div>
						<!-- author -->
						<div class="form-group row">
							<form:label path="author" cssClass="col-sm-2 col-form-label" >
								<spring:message code="book.author"></spring:message>
							</form:label>
							<div class="col-sm-10">
								<form:input path="author" cssClass="form-control" />

								<form:errors path="author" element="div" cssClass="invalid-feedback"></form:errors>
							</div>
						</div>
						<!-- vcode -->
						<div class="form-group row">
							<form:label path="vcode" cssClass="col-sm-2 col-form-label">验证码:</form:label>
							<div class="col-sm-6">
							    <form:input path="vcode"  cssClass="form-control"  maxlength="4"   autocomplete="off" />
								<form:errors path="vcode" element="div" cssClass="invalid-feedback"></form:errors>
							</div>
							<div class="col-sm-4">
								<img title="点击换图片" src="vcode.png" class="vcodeimg"><a class="vcodeimg">看不清，换一张</a>
							</div>
						</div>
						<!-- denglu -->
						<div class="form-group row">
							<div class="col-sm-10   offset-md-2">
								<button type="submit" class="btn btn-primary">编辑</button>
							</div>
						</div>
					</form:form>

			</div>
		</div>
		<!-- 底部 -->
		<div class="row  card">
			<div class="col-md-12" style="padding: 0px">

				<%@include file="common/copyright.jsp"%>
			</div>
		</div>
	</div>

	<!-- 写在这里提高网页响应速度 -->
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.slim.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/uri-util/dist/uri-util.min.js"></script>
	<script type="text/javascript" src="resources/js/common.js"></script>
	<script type="text/javascript">
		<spring:bind path="book">
		<spring:hasBindErrors name="book">
		<c:forEach  items="${requestScope.errors.fieldErrors }"  var="error">
		$("[name='${error.field}']").addClass("is-invalid");

		</c:forEach>
		</spring:hasBindErrors>
		</spring:bind>
	</script>
	<script type="text/javascript">
		$(function() {
			$("#themeSel").val("<spring:theme code='bstheme'/>");
			//日期控件
			$('#pubDate').datepicker({
				format : 'yyyy-mm-dd',//日期格式
				language : 'zh-CN',//提示中文界面
				autoclose : true
			//自动关闭
			});
		});
	</script>
	<script type="text/javascript">
		$(function() {
			$(".col-sm-4  .vcodeimg").click(function() {
				//追加一个随机数，要不然只能换一次
				$(".col-sm-4  img.vcodeimg").attr("src", "vcode.png?t=" + Math.random());

			});

		});
	</script>
</body>
</html>