<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
 <%
//不注册页可以运行：因为jdbc4.0+要求DriverManager自动找META-INF/services/java.sql.Driver
		//完成注册，因而你连注册就可以省略---自动注册
		//因为自动注册会引起内存泄漏，因而tomcat容器禁用了自动注册
		// 2启动客户端---注册驱动(安装驱动)
		/// META-INF/services/java.sql.Driver中查看
		//DriverManager.registerDriver(new Driver());
		// 3连接到数据库
		/*String url = "jdbc:mysql://localhost:3306/test";
		String user = "root";
		String password = "root";
		Connection conn = DriverManager.getConnection(url, user, password);*/
		String url="jdbc:mysql://localhost:3306/test?user=root&password=root";
		Connection conn=DriverManager.getConnection(url);
		// 4输入SQL，执行SQL
		String sql = "select * from t_user";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		// 5 看结果：一张二维表，需要行和列组合才能决定取那个值
		//5.1 直接打印com.mysql.jdbc.JDBC4ResultSet@68de145
		 //System.out.println(rs);
		while (rs.next()) {//定位行
			//数据类型--->Java类型转换
			/**
			 * varchar---->String
			 * date----->java.sql.Date
			 * 
			 */
			System.out.println(rs.getInt("id")+"\t"+rs.getString("name")+"\t"+rs.getDate("birthday"));
		}
		// 6 关闭：先告诉Statement说话，再断开连接
		rs.close();
		stmt.close();
		conn.close();

 
 %>
</body>
</html>