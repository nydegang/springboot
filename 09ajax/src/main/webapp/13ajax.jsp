<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=“UTF-8”>
<title>iframe+txt</title>
</head>
<body>
	<select  onchange="getData(event)">
		<option value="-1">--请选择类型--</option>
		<option value="types.js">js</option>
		<option value="types.json">json</option>
		<option value="types.xml">xml</option>
		<option value="types.txt">txt</option>
	</select>
	<select id="mySel">
	</select>
	<!-- 写模板 -->
	<script id="tpl-types" type="text/html">
<\% for(var i=0;i<vos.length;i++){%>
              <option  value="<\%=vos[i].id%>"><\%=vos[i].name%></option>
          <\%}%>
</script>

	<!-- 模板引擎 -->
	<script type="text/javascript" src="bower_components/art-template/dist/template-native-debug.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript">
		//用iframe拿数据
		function getData(event) {
			//ie5木有event木有target属性，因而undefined,接着表达式要继续计算，用后面的赋值；如果有target属性，就把||前的赋值
			//属性兼容：1 ||  2 属性判断法
			 var target=event.target||event.srcElement;
			var url=target.options[target.selectedIndex].value;
			if (url!='-1') {
				 AjaxUtil(url);
			}
           
		}
		//服务器回调的函数
		function fillSel(vos) {
			var html = template("tpl-types", vos);
			document.getElementById("mySel").innerHTML = html;
		}
	</script>

</body>
</html>