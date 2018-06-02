<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>动态script标签去拿数据</title>
</head>
<body>
	<!-- 记住script元素发送请求只能一次,也即是被赋值一次后再不发送请求了！！！ -->
	<button onclick="getData()">拿书籍类型</button>
	<select id="mySel"></select>
	<!-- 写模板 -->
	<script id="tpl-types" type="text/html">
           <\% for(var i=0;i<vos.length;i++){%>
              <option  value="<\%=vos[i].id%>"><\%=vos[i].name%></option>
          <\%}%>
</script>
	<script type="text/javascript" src="bower_components/art-template/dist/template-native-debug.js"></script>
	<script type="text/javascript">
		function getData() {
			//若不删除，一段后会有很多script标签
			if (document.getElementById("myScript")) {
				document.body.removeChild(document.getElementById("myScript"));
			}
			//因为script标签只能发送一次请求，为了每次点击都发送请求，动态创建script元素---动态script方法
			var script = document.createElement("script");
			script.src = "findAllTypes";
			script.id = "myScript";
			//不添加到网页不发送请求
			document.body.appendChild(script);

		}
		function fillSel(vos) {
			var html = template("tpl-types", vos);
			document.getElementById("mySel").innerHTML = html;
		}
	</script>

</body>
</html>