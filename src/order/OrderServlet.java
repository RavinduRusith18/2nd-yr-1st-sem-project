package order;

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
import order.DatabaseConnecter; 

@WebServlet("/OrderServlet") 
public class OrderServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
	
		String mediName = request.getParameter("mediName");		
		String cName = request.getParameter("cName");
		String cAge = request.getParameter("cAge");	
		String cAddress = request.getParameter("cAddress");
		
		
		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into order1(mediName,cName,cAge,cAddress) values(?,?,?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","");
			    PreparedStatement st = conn.prepareStatement(sql);
			   

			    st.setString(1, mediName);
			    st.setString(2, cName);			    
			    st.setString(3, cAge);			    
			    st.setString(4, cAddress);			    

			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
		          
					PrintWriter out = response.getWriter(); 

					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( ' Order Medicine Successfully' ,  '' ,  'success' );");
					out.println("});");
					out.println("</script>");
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/OrderView.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
				e.printStackTrace();

      } 		
	} 	
} 



