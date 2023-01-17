<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String pID = request.getParameter("pID");
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
String sql ="select * from pharmacy1 where pID="+pID;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<html>
<head>
<title>Pharmacy</title>
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
                    <a href="PharmacyForm.jsp" class="nav-item nav-link active">Form</a>
                    <a href="PharmacyView.jsp" class="nav-item nav-link">Details</a>
					<a href="#" class="nav-item nav-link">About</a>
                    <a href="#" class="nav-item nav-link">Contact</a>
                </div>
               
            </div>
        </nav>
    </div>
    <!-- Navbar End -->
    
    
<div id="bg">
<center><h2>Pharmacy Manage</h2></center>
  <div class="module">
    
    <form class="form" action="PharmacyUpdateProcess.jsp" method="post">
    
      <input type="text" placeholder="ID" class="textbox" readonly="pID" name="pID" value="<%=resultSet.getInt("pID") %>">
      <input type="text" placeholder="Medicine Name" class="textbox" id="mediName" name="mediName" value="<%=resultSet.getString("mediName") %>">
      <input type="text" placeholder="Quantity" class="textbox" id="mQty" name="mQty" value="<%=resultSet.getString("mQty") %>">
      <input type="date" placeholder="Date" class="textbox" id="mDate" name="mDate"  value="<%=resultSet.getString("mDate") %>">
      <input type="text" placeholder="Supplier Name" class="textbox" id="mSupplier" name="mSupplier"  value="<%=resultSet.getString("mSupplier") %>">
      
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
