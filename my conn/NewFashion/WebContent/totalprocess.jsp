
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%

Blob image= null;
byte[] imgData = null;

Statement stmt = null;
ResultSet rs = null;

String srno = request.getParameter("srno");

                    
                    
        try {
        
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection con= DriverManager.getConnection("jdbc:mysql://localhost/newfashion?user=abhishek&password=abhishek");
        	stmt=con.createStatement();
        	rs= stmt.executeQuery("select image from entry where srno = '" + srno + "' ");
        	
        	if (rs.next()){
        	
        	image = rs.getBlob(1);
        	
        	imgData = image.getBytes(1, (int) image.length());
        	
        	} else {
        	
        	    out.println("Display Blob Example");
        	    
        	    out.println("Image Not Found");
        	    
        	    return;
        	    }
        	    
        	    response.setContentType("image/gif");
        	    
        	    OutputStream o = response.getOutputStream();
        	    
        	    o.write(imgData);
        	    
        	    o.flush();
        	    o.close();
        	    
        	    } catch (Exception e) {
        	    
        	    out.println("Dont Display");
        	    
        	    out.println("Image Display error" + e.getMessage());
        	    
        	    return;
        	    
        	    } finally {
        	    	
        	    	try {
        	    		
        	    		rs.close();
        	    		stmt.close();
        	    		
        	    	} catch (SQLException e) {
        	    		
        	    		e.printStackTrace();
        	    		
        	    	}
        	    	
        	    }
        
        %>
        	    	
        	    

        	    