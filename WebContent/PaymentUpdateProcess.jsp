<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/medicine";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String payID = request.getParameter("payID");
String oID =request.getParameter("oID");
String price =request.getParameter("price");
String pDate=request.getParameter("pDate");
String pMethod=request.getParameter("pMethod");



if(payID != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(payID);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update pay set payID=?,oID=?,price=?,pDate=?,pMethod=? where payID="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,oID);
ps.setString(3,price);
ps.setString(4,pDate);
ps.setString(5,pMethod);

int i = ps.executeUpdate();
if(i > 0)
{
	

RequestDispatcher rd = request.getRequestDispatcher("PaymentView.jsp");
rd.include(request, response);
}
else
{
out.print("There is a problem in updating Record.");

}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%> 