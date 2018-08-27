<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajax参数传递</title>
</head>
<body>
<form action=""   method="post">
   <input  name="uname"><br>
   <input  type="submit">
</form>
 <script type="text/javascript">
     //1、get请求代码
       var xhr=new XMLHttpRequest();
       //1.1 参数只能写在url后！！！
       /*xhr.open("GET", "ajaxPrama?name=xiaosb&age=23");
       xhr.send();*/
       //1.2 get木有请求体，不能使用send传递.
      // xhr.open("GET", "ajaxPrama");
       //写了也不发送
     //  xhr.send("name=xiaosb&age=23");
     //2、post,如果木有指定Content-Type，其值为：text/plain;charset=UTF-8,普通文本。服务器不晓得请求体格式什么，不知道如何解析
     //    想让服务器解析参数：Content-Type: application/x-www-form-urlencoded，服务器就晓得格式了，就能解析了！！！！
     //2.1 如果你把参数写在url后不用设置请求头Content-Type
   //    xhr.open("POST", "ajaxPrama?name=xiaosb&age=23");
    // xhr.send();
    //2.2 在请求体中发送
     xhr.open("POST", "ajaxPrama");
     //post请求一定设置头
     xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
     //显示在地址栏的url长度是有限制，不能超过2048字节，最好在请求体传递
     xhr.send("name=xiaosb&age=23")
 </script>
</body>
</html>