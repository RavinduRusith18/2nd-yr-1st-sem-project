<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String cID = request.getParameter("cID");
	int no = Integer.parseInt(cID);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from custom where cID ='" +cID+"'");
	response.sendRedirect("CustomerView.jsp");
	%>