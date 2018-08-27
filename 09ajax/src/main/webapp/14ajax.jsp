<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=“UTF-8”>
<title>iframe+txt</title>
</head>
<body>
	<button onclick="getData()">拿书籍类型</button>
	<script type="text/javascript">
		function getData() {
          //1 告诉xhr向谁个发请求，回调函数
			 var  xhr=new XMLHttpRequest();
			 xhr.onreadystatechange=function(){             
					console.log("+++++++++++++++++++++++"+xhr.readyState)				 
			}
			 xhr.open("GET","types.txt",false);
			 xhr.send();//让对象开始去做
			
			//网页做的事情
			console.log("---我要等到xhr把事情做完才能执行----")

		}
	
	</script>

</body>
</html>