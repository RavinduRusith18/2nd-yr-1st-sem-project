<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/medicine";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String oID = request.getParameter("oID");
String mediName =request.getParameter("mediName");
String cName =request.getParameter("cName");
String cAge=request.getParameter("cAge");
String cAddress=request.getParameter("cAddress");



if(oID != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(oID);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update order1 set oID=?,mediName=?,cName=?,cAge=?,cAddress=? where oID="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,mediName);
ps.setString(3,cName);
ps.setString(4,cAge);
ps.setString(5,cAddress);

int i = ps.executeUpdate();
if(i > 0)
{
	

RequestDispatcher rd = request.getRequestDispatcher("OrderView.jsp");
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