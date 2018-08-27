<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- 1、记住script元素发送请求只能一次,也即是被赋值一次后再不发送请求了！！！ -->
	<button onclick="getData()">拿书籍类型</button>
	 <div id="myDiv"></div>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript">
		//动态script去拿数据
		function getData() {
			//把加载的数据填充到选中的元素中
			 $("#myDiv").load("types.txt");

		}
	
	</script>
</body>
</html>