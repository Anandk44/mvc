package DataInformation;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/saleData")

public class Sale extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/newfashion";
    private String dbUser = "root";
    private String dbPass = "";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
         
        String producttype = request.getParameter("producttype");
        String productname = request.getParameter("productname");
        
        String brandname = request.getParameter("brandname");
        String size = request.getParameter("size");
        
        String color = request.getParameter("color");
        String saleamount = request.getParameter("saleamount");
        
        String cname = request.getParameter("cname");
        String address = request.getParameter("address");
        
        String zipcode = request.getParameter("zipcode");
        String mobileno = request.getParameter("mobileno");
       
     
         
       
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost/newfashion?user=root&password=");
 
            // constructs SQL statement
            String sql = "INSERT INTO sale (producttype ,productname ,brandname ,size ,color ,saleamount ,cname ,address ,zipcode ,mobileno ) values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            
           
            statement.setString(1, producttype);
            statement.setString(2, productname);
            statement.setString(3, brandname);
            statement.setString(4, size);
            statement.setString(5, color);
            statement.setString(6, saleamount);
            statement.setString(7, cname);
            statement.setString(8, address);
            statement.setString(9, zipcode);
            statement.setString(10, mobileno);
            
           
           
             
           
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
               // message = "File uploaded and saved into database";
            	
            	 
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/tracking.jsp").forward(request, response);
        }
    }
}