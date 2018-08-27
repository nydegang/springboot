<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=“UTF-8”>
<title>iframe-xml</title>
</head>
<body>
	<!-- 让iframe去拿数据 -->
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
				//xml会被浏览器自动解析，产生一个document对象
				var doc=window.frames[0].document;
				//生成模板引擎需要的数据
				var typeNodes=doc.getElementsByTagName("type");
				var  arr=new Array();
				for(var i=0;i<typeNodes.length;i++){
                       arr.push({ name:typeNodes[i].getElementsByTagName("name")[0].innerHTML,id:typeNodes[i].id});
				 }
				 var obj={vos:arr};
				 //调用函数开始填充
				 fillSel(obj);
			} catch (e) {
           
			}

		}
	</script>
	<iframe id="myIframe"  onload="exeJs()"  style="display: none;"></iframe>
	<!-- 模板引擎 -->
	<script type="text/javascript" src="bower_components/art-template/dist/template-native-debug.js"></script>
	<script type="text/javascript">
		//用iframe拿数据
		function getData() {
			//http://localhost:8080/09ajax/07types.jsp
			document.getElementById("myIframe").src = "http://127.0.0.1:8080/09ajax/types.xml";

		}
		//服务器回调的函数
		function fillSel(vos) {
			var html = template("tpl-types", vos);
			document.getElementById("mySel").innerHTML = html;
		}
	</script>

</body>
</html>