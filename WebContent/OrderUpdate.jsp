<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String oID = request.getParameter("oID");
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
String sql ="select * from order1 where oID="+oID;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<html>
<head>
<title>Order</title>
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
                    <a href="OrderForm.jsp" class="nav-item nav-link active">Form</a>
                    <a href="OrderView.jsp" class="nav-item nav-link">Details</a>
					<a href="#" class="nav-item nav-link">About</a>
                    <a href="#" class="nav-item nav-link">Contact</a>
                </div>
               
            </div>
        </nav>
    </div>
    <!-- Navbar End -->
    
    
<div id="bg">
<center><h2>Medicine Order</h2></center>
  <div class="module">
    
    <form class="form" action="OrderUpdateProcess.jsp" method="post">
    
      <input type="text" placeholder="Order ID" class="textbox" readonly="oID" name="oID" value="<%=resultSet.getInt("oID") %>">
      <input type="text" placeholder="Medicine Name" class="textbox" id="mediName" name="mediName" value="<%=resultSet.getString("mediName") %>">
      <input type="text" placeholder="Customer Name" class="textbox" id="cName" name="cName" value="<%=resultSet.getString("cName") %>">
      <input type="text" placeholder="Age" class="textbox" id="cAge" name="cAge"  value="<%=resultSet.getString("cAge") %>">
      <input type="text" placeholder="Address" class="textbox" id="cAddress" name="cAddress"  value="<%=resultSet.getString("cAddress") %>">
      
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
