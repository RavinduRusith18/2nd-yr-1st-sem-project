package pharmacy;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Import Database Connection Class file 
import pharmacy.DatabaseConnecter; 

@WebServlet("/PharmacyServlet") 
public class PharmacyServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
	
		String mediName = request.getParameter("mediName");		
		String mQty = request.getParameter("mQty");
		String mDate = request.getParameter("mDate");	
		String mSupplier = request.getParameter("mSupplier");
		
		
		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into pharmacy1(mediName,mQty,mDate,mSupplier) values(?,?,?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","");
			    PreparedStatement st = conn.prepareStatement(sql);
			   

			    st.setString(1, mediName);
			    st.setString(2, mQty);			    
			    st.setString(3, mDate);			    
			    st.setString(4, mSupplier);			    

			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
		          
					PrintWriter out = response.getWriter(); 

					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( ' Pharmacy Manage Successfully' ,  '' ,  'success' );");
					out.println("});");
					out.println("</script>");
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/PharmacyView.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
				e.printStackTrace();

      } 		
	} 	
} 



