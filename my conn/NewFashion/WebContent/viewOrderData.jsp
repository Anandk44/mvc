

<%@ page language="java" import="java.sql.*"%>
<%
 
    
    
    String trackingno = request.getParameter("trackingno");
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
    
    String orderstatus = request.getParameter("orderstatus");
    
    

    try {

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/newfashion?user=abhishek&password=abhishek");

        PreparedStatement ps = con.prepareStatement("insert into vieworder values(?,?,?,?,?,?,?,?,?,?,?,?)");
     
        ps.setString(1,  trackingno);
        ps.setString(2,  producttype);   
        ps.setString(3,  productname); 
        ps.setString(4,  brandname);   
        ps.setString(5,  size);
        ps.setString(6,  color);
        ps.setString(7,  saleamount);       
        ps.setString(8,  cname);
        ps.setString(9,  address);        
        ps.setString(10,  zipcode);         
        ps.setString(11,  mobileno);        
        ps.setString(12,  orderstatus);
        
        
      
        
        ps.executeUpdate();
        
      // out.println("Record saved successfully!");
        
       response.sendRedirect("viewOrders.jsp");
        
      

    } catch (Exception e) {

        out.println(e);

    } 

%>