<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=“UTF-8”>
<title>script拿数据</title>
</head>
<body>
	<!-- 1、记住script元素发送请求只能一次,也即是被赋值一次后再不发送请求了！！！ -->
	<button onclick="getData()">拿书籍类型</button>
	<!-- 注意：script标签表写src属性 -->
	<script type="text/javascript" id="myScript" ></script>
	<script type="text/javascript">
		function getData() {
			document.getElementById("myScript").src = "findAllTypes?t=" + Math.random();
		}
	</script>
	<!-- 2、拿到数据后用模板引擎填充到Select中 -->
	<select id="mySel"></select>
	<!-- 3、拿到数据后，让模板引擎填充到Select中 -->
	<!-- 3.1、写模板：注意要修改type，否则当成JavaScript执行 -->
	<script id="tpl-types" type="text/html">
           <\% for(var i=0;i<vos.length;i++){%>
              <option  value="<\%=vos[i].id%>"><\%=vos[i].name%></option>
          <\%}%>
</script>
	<!-- 3.2 加载模板引擎 -->
	<script type="text/javascript" src="bower_components/art-template/dist/template-native-debug.js"></script>
	<!-- 3.3 调用模板引擎把数据和模板生成的html填充到select中 -->
	<script type="text/javascript">
		function fillSel(vos) {
			var html = template("tpl-types", vos);
			document.getElementById("mySel").innerHTML = html;
		}
	</script>
	
</body>
</html>