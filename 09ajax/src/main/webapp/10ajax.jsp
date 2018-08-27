<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=“UTF-8”>
<title>iframe+txt</title>
</head>
<body>
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
	<script type="text/javascript">
		//用iframe拿数据
		function getData() {
			  //1 买手机

			 var  xhr=new XMLHttpRequest();
			 //2 开机--拨号
			 xhr.open("GET","types.json");
			 //3 拨打
			 xhr.send();
			 //4 等对方接了再说话----事件编程
			 //只要readystate发生改变，就调用该函数一次
			 xhr.onreadystatechange=function(){
                 //等对方把内容全部传递过来
                 if (xhr.readyState==4) {//
					 if (xhr.status==200) {//响应可能是成功，也可能失败
						  var obj=JSON.parse(xhr.responseText);
						  fillSel(obj);
					}
				 }
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