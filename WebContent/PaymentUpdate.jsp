<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String payID = request.getParameter("payID");
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
String sql ="select * from pay where payID="+payID;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<html>
<head>
<title>Payment</title>
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
                    <a href="PaymentForm.jsp" class="nav-item nav-link active">Form</a>
                    <a href="PaymentView.jsp" class="nav-item nav-link">Details</a>
					<a href="#" class="nav-item nav-link">About</a>
                    <a href="#" class="nav-item nav-link">Contact</a>
                </div>
               
            </div>
        </nav>
    </div>
    <!-- Navbar End -->
    
    
<div id="bg">
<center><h2>Medicine Payment</h2></center>
  <div class="module">
    
    <form class="form" action="PaymentUpdateProcess.jsp" method="post">
    
      <input type="text" placeholder="Payment ID" class="textbox" readonly="payID" name="payID" value="<%=resultSet.getInt("payID") %>">
      <input type="text" placeholder="Order NO" class="textbox" id="oID" name="oID" value="<%=resultSet.getString("oID") %>">
      <input type="text" placeholder="Price" class="textbox" id="price" name="price" value="<%=resultSet.getString("price") %>">
      <input type="date" placeholder="Date" class="textbox" id="pDate" name="pDate"  value="<%=resultSet.getString("pDate") %>">
      <select id="pMethod" name="pMethod" class="textbox">
    	<option value="Cash" selected="<%=resultSet.getString("pMethod").equals("Cash")%>">Cash</option>
    	<option value="Card" selected="<%=resultSet.getString("pMethod").equals("Card")%>">Card</option>
 	  </select>
 	  
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
