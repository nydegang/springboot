<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	<!-- 模板引擎 -->
	<script type="text/javascript" src="bower_components/art-template/dist/template-native-debug.js"></script>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript">
		//用iframe拿数据
		//用通用函数调用
		function getData() {
			 $.ajax({
		           url:"findAllTypes",
		           dataType: "jsonp",//jsonp
		           jsonp: "cb",
		           jsonpCallback:'fillSel',
		           success: function( response ) {
		               console.log( response ); // server response
		           }
			  });

		}
		//服务器回调的函数
		function fillSel(vos) {
			var html = template("tpl-types", vos);
			document.getElementById("mySel").innerHTML = html;
		}
	</script>

<script type="text/javascript">
 
</script>
</body>
</html>