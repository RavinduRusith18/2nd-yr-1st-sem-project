<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String payID = request.getParameter("payID");
	int no = Integer.parseInt(payID);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from pay where payID ='" +payID+"'");
	response.sendRedirect("PaymentView.jsp");
	%>