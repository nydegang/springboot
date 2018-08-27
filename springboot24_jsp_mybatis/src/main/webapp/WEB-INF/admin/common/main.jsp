<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link href="resources/bs/<spring:theme code='bstheme'/>/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
	   <!-- 顶部 -->
		<div class="row">
			<div class="col-md-12">
				<%@include file="common/nav.jsp" %>
			</div>
		</div>
		<div class="row   card">
			<div class="col-md-12">
				<div class="carousel slide" id="carousel-539461">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-539461" class="active"></li>
						<li data-slide-to="1" data-target="#carousel-539461"></li>
						<li data-slide-to="2" data-target="#carousel-539461"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
								</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-539461" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-539461" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
				</div>
			</div>
		</div>
		 <!-- 底部 -->
		<div class="row  card"  >
			  <%@include  file="common/copyright.jsp" %> 
		</div>
	</div>
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.slim.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/bower_components/uri-util/dist/uri-util.min.js"></script>
	<script type="text/javascript"  src="resources/js/common.js"></script>
	<script type="text/javascript">
      $(function(){
    		$("#themeSel").val("<spring:theme code='bstheme'/>");
          })
	</script>

</body>
</html>