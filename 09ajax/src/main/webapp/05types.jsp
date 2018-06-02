<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=“UTF-8”>
<title>用iframe发送请求拿js数据</title>
</head>
<body>
	<!-- 1 点击让iframe帮我们拿数据 -->
	<button onclick="getData()">拿书籍类型</button>
	<!--2 拿到数据后使用模板引擎填充到select内部-->
	<select id="mySel"></select>
	<!-- 3 写模板 -->
	<script id="tpl-types" type="text/html">
           <\% for(var i=0;i<vos.length;i++){%>
              <option  value="<\%=vos[i].id%>"><\%=vos[i].name%></option>
          <\%}%>
</script>
	<script type="text/javascript">
	  //4当iframe拿到数据后，再读取里面内容
		function exeJs() {
			//直接通过访问不了iframe的文档undefined
			//console.log( document.getElementById("myIframe").document);
			try {
				//返回的包含JavaScript代码的字符串
				var strJs=window.frames[0].document.getElementsByTagName("pre")[0].innerHTML;
				//该方法让位于字符串中JavaScript代码执行
				window.eval(strJs);
			} catch (e) {

			}

		}
	</script>
	<iframe id="myIframe" onload="exeJs()"  style="display: none;"></iframe>
	<!-- 5 模板引擎 -->
	<script type="text/javascript" src="bower_components/art-template/dist/template-native-debug.js"></script>
	<script type="text/javascript">
		//用iframe拿数据
		function getData() {
			//修改它的src即可发送请求
			document.getElementById("myIframe").src = "types.js";
		}
		//服务器回调的函数
		function fillSel(vos) {
			var html = template("tpl-types", vos);
			document.getElementById("mySel").innerHTML = html;
		}
	</script>

</body>
</html>