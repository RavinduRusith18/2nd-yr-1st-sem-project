<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String cID = request.getParameter("cID");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from custom where cID="+cID;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<html>
<head>
<title>Customer</title>
<link rel="stylesheet" href="css/forms.css">
<link rel="stylesheet" href="css/style.css">
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
                    <a href="Index.jsp" class="nav-item nav-link ">Home</a>
                    <a href="CustomerForm.jsp" class="nav-item nav-link active">Form</a>
                    <a href="CustomerView.jsp" class="nav-item nav-link">Details</a>
					<a href="#" class="nav-item nav-link">About</a>
                    <a href="#" class="nav-item nav-link">Contact</a>
                </div>
               
            </div>
        </nav>
    </div>
    <!-- Navbar End -->
    
    
<div id="bg">
<center><h2>Customer Registration</h2></center>
  <div class="module">
    
    <form class="form" action="CustomerUpdateProcess.jsp" method="post">
    
      <input type="text" placeholder="Customer ID" class="textbox" readonly="cID" name="cID" value="<%=resultSet.getInt("cID") %>">
      <input type="text" placeholder="Customer Name" class="textbox" id="Cname" name="Cname" value="<%=resultSet.getString("Cname") %>">
      <input type="text" placeholder="Address" class="textbox" id="Caddress" name="Caddress" value="<%=resultSet.getString("Caddress") %>">
      <input type="text" placeholder="Email" class="textbox" id="cEmail" name="cEmail"  value="<%=resultSet.getString("cEmail") %>">
      <input type="number" placeholder="Phone NO" class="textbox" id="CpNo" name="CpNo"  value="<%=resultSet.getString("CpNo") %>">
      
      <input type="submit" value="UPDATE" class="button" />
    </form>
  </div>
</div>    

  

<% 
 }
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
</div>

</body>
</html>
