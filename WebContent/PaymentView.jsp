<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "medicine";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href="css/table.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
 <style>
h1 {
  text-align: center;
  padding: 12px;
  font-size: 32px;
  text-transform: uppercase;
  color: #8a2be2;
}
h2 {
  text-align: center;
  padding: 10px;
  font-size: 40px;
  text-transform: uppercase;
  color: #800000;
}
.button1 {
  background-color: #408080;
  bPayment: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
.button2 {
  background-color: #ff0000;
  bPayment: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
 </style>   
<title>Payment Details</title>
</head>
<body>
<!-- Navbar Start -->
    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-2 py-lg-0 px-lg-5">
           
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between px-0 px-lg-3" id="navbarCollapse">
                <div class="navbar-nav mr-auto py-0">
                    <a href="Index.jsp" class="nav-item nav-link">Home</a>
                    <a href="PaymentForm.jsp" class="nav-item nav-link ">Form</a>
                    <a href="PaymentView.jsp" class="nav-item nav-link active">Details</a>
					<a href="#" class="nav-item nav-link">About</a>
                    <a href="#" class="nav-item nav-link">Contact</a>
                </div>
               
            </div>
        </nav>
    </div>
    <!-- Navbar End -->
  
<h2>Medicine Payment Details</h2>


        
<div class="">
			  <center>
							
							<table id="mytable" class="content-table">
								 
								 <thead>
								 <th scope="col">Payment ID</th>
								 <th scope="col">Order NO</th>
								 <th scope="col">Price</th>
								  <th scope="col">Date</th>
								   <th scope="col">Payment Method</th>
							  
									<th>Update</th>									
									 <th>Delete</th>
								 </thead>
				  
				  
				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from pay";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
				  <tbody>
				  
				  <tr>
				  <td><%=resultSet.getInt("payID") %></td>
				  <td><%=resultSet.getString("oID") %></td>
				  <td><%=resultSet.getString("price") %></td>
				  <td><%=resultSet.getString("pDate") %></td>
				  <td><%=resultSet.getString("pMethod") %></td>
				  
				  
				   <td><a href="PaymentUpdate.jsp?payID=<%=resultSet.getInt("payID") %>"><button class="button1" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-trash-alt"></span></button></p></a></td>				 
				  <td><a href="PaymentDelete.jsp?payID=<%=resultSet.getInt("payID") %>"><button class="button2" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				  
				  </tr>
				  
				  <%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
				  
				  </tbody>
					  
			  </table>
			</center>			
		</div>
</div>
</div>
</div>
</div>
</body>
</html>