<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=“UTF-8”>
<title>jsonp客户端</title>
</head>
<body>
	<!-- 1 点击让iframe帮我们拿数据 -->
	<button onclick="getData()">拿书籍类型</button>
	<select id="mySel">
	</select>
	<!-- 写模板 -->
	<script id="tpl-types" type="text/html">
           <\% for(var i=0;i<vos.length;i++){%>
              <option  value="<\%=vos[i].id%>"><\%=vos[i].name%></option>
          <\%}%>
</script>
	<script type="text/javascript">
		function exeJs() {
			//直接通过访问不了iframe的文档undefined
			//console.log( document.getElementById("myIframe").document);
			try {
				var strJs=window.frames[0].document.getElementsByTagName("pre")[0].innerHTML;
				//把JSON字符串解析为JavaScript对象
				  var obj=JSON.parse(strJs);
				  fillSel(obj); 
			} catch (e) {

			}

		}
	</script>
	<iframe id="myIframe"  onload="exeJs()" style="display: none;"></iframe>
	<!-- 模板引擎 -->
	<script type="text/javascript" src="bower_components/art-template/dist/template-native-debug.js"></script>
	<script type="text/javascript">
		//用iframe拿数据
		function getData() {
			document.getElementById("myIframe").src = "types.json";

		}
		//服务器回调的函数
		function fillSel(vos) {
			var html = template("tpl-types", vos);
			document.getElementById("mySel").innerHTML = html;
		}
	</script>

</body>
</html>