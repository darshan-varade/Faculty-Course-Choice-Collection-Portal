<%@page import="java.sql.*" %>
<%@page import="com.Tejas.FCCCP.*" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int id=Integer.parseInt(request.getParameter("searchKey"));
	Connection con = connectDB.dbCon();
	PreparedStatement ps=con.prepareStatement("delete from faculty where id=?");
	ps.setInt(1,id);
	int i=ps.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("deleteFaculty.jsp");
	}
	%>
</body>
</html>