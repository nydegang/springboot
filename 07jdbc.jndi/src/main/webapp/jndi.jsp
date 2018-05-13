<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>id</th>
			<th>name</th>
			<th>birthday</th>
		</tr>

		<%
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			//按名字找对象
			DataSource ds = (DataSource) envCtx.lookup("jdbc/UserDB");

			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from t_user");
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("id")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getDate("birthday")%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>