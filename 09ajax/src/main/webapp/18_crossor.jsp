<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="bower_components/jquery/dist/jquery.min.js">
</script>
</head>
<body>
<script type="text/javascript">
//根据是否有属性withCredentials来判断是否是第二版实现

     var  xhr=new XMLHttpRequest();
     console.dir(xhr);
      $.get("http://127.0.0.1:8080/09ajax/AajxCrossOrginServlet",function(data){
                console.log(data);
          });
</script>
</body>
</html>