<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Pharmacy</title>
<link rel="stylesheet" href="css/forms.css">
<link href="css/style.css" rel="stylesheet">
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
    
    <form class="form" action="PharmacyServlet" method="post">
    
      <input type="text" placeholder="Medicine Name" class="textbox" id="mediName" name="mediName" required>
      <input type="text" placeholder="Quantity" class="textbox" id="mQty" name="mQty" required>
      <input type="Date" placeholder="Date" class="textbox" id="mDate" name="mDate" required>
      <input type="text" placeholder="Supplier Name" class="textbox" id="mSupplier" name="mSupplier"  required>
     
      <input type="submit" value="SUBMIT" class="button" />
    </form>
  </div>
</div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>