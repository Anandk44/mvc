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
 
@WebServlet("/saveData")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class Entry extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/newfashion";
    private String dbUser = "root";
    private String dbPass = "";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
        String billno = request.getParameter("billno");
        String frombill = request.getParameter("frombill");
        String billprice = request.getParameter("billprice");
        String pcode = request.getParameter("pcode");  
        String producttype = request.getParameter("producttype");
        String productname = request.getParameter("productname");
        String brandname = request.getParameter("brandname");
        String quantity = request.getParameter("quantity");      
        String productprice = request.getParameter("productprice");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String saleamount = request.getParameter("saleamount");
        String entrydate = request.getParameter("entrydate");
     
         
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("image");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost/newfashion?user=root&password=");
 
            // constructs SQL statement
            String sql = "INSERT INTO entry (billno ,frombill ,billprice ,pcode ,producttype ,productname ,brandname ,quantity ,productprice ,size ,color ,saleamount ,entrydate ,image) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, billno);
            
            statement.setString(2, frombill);
            statement.setString(3, billprice);
            statement.setString(4, pcode);
            statement.setString(5, producttype);
            statement.setString(6, productname);
            statement.setString(7, brandname);
            statement.setString(8, quantity);
            statement.setString(9, productprice);
            statement.setString(10, size);
            statement.setString(11, color);
            statement.setString(12, saleamount);
            statement.setString(13, entrydate);
           
           
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(14, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
               //message = "File uploaded and saved into database";
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
            getServletContext().getRequestDispatcher("/entry.jsp").forward(request, response);
        }
    }
}