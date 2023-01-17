<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String oID = request.getParameter("oID");
	int no = Integer.parseInt(oID);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from order1 where oID ='" +oID+"'");
	response.sendRedirect("OrderView.jsp");
	%>