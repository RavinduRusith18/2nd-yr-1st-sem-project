package customer;

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
import customer.DatabaseConnecter; 

@WebServlet("/CustomerServlet") 
public class CustomerServlet extends HttpServlet{        //Inheritance method
	
	private static final long serialVersionUID = 1L;   //encapsulation method

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
	
		String Cname = request.getParameter("Cname");		
		String Caddress = request.getParameter("Caddress");
		String cEmail = request.getParameter("cEmail");	
		String CpNo = request.getParameter("CpNo");
		
		
		 Connection conn = null; //abstraction method
		    
		    try {
		    	String sql = "insert into custom(Cname,Caddress,cEmail,CpNo) values(?,?,?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","");
			    PreparedStatement st = conn.prepareStatement(sql);
			   

			    st.setString(1, Cname);
			    st.setString(2, Caddress);			    
			    st.setString(3, cEmail);			    
			    st.setString(4, CpNo);			    

			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
		          
					PrintWriter out = response.getWriter(); 

					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( ' Customer Registerion Successfully' ,  '' ,  'success' );");
					out.println("});");
					out.println("</script>");
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/CustomerView.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
				e.printStackTrace();

      } 		
	} 	
} 



