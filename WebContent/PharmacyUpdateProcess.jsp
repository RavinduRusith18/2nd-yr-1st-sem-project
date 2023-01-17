<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/medicine";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String pID = request.getParameter("pID");
String mediName =request.getParameter("mediName");
String mQty =request.getParameter("mQty");
String mDate=request.getParameter("mDate");
String mSupplier=request.getParameter("mSupplier");


if(pID != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(pID);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Pharmacy1 set pID=?,mediName=?,mQty=?,mDate=?,mSupplier=? where pID="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,mediName);
ps.setString(3,mQty);
ps.setString(4,mDate);
ps.setString(5,mSupplier);

int i = ps.executeUpdate();
if(i > 0)
{
	

RequestDispatcher rd = request.getRequestDispatcher("PharmacyView.jsp");
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