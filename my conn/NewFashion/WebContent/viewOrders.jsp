<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="viewOrders.css">
<title>Orders</title>
</head>
<body>

<p><marquee><h2><i>New Fashion</i></h2></marquee>
<h1><center><u><i> Orders</i></u></center></h1></p>

 <td><a href="admin.html"><button type="button" class="update">Back</button></a></td>
		           
<br>
<br>

<table border=1>

<tr>

<td><font><b>Tracking No</b></font></td>
<td><font><b>Product Type</b></font></td>
<td><font><b>Product Name</b></font></td>
<td><font><b>Brand Name</b></font></td>
<td><font><b>Product Size</b></font></td>
<td><font><b>Product Color</b></font></td>
<td><font><b>Product Price</b></font></td>
<td><font><b>Customer Name</b></font></td>
<td><font><b>Address</b></font></td>
<td><font><b>Zip Code</b></font></td>
<td><font><b>Mobile No</b></font></td>
<center><td><font><b>Action</b></font></td></center>




</tr>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

try{
		Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost/newfashion?user=abhishek&password=abhishek");
	Statement st=con.createStatement();
	ResultSet r= st.executeQuery("select * from sale");
	while(r.next()){
		String srno=r.getString("trackingno");
		%>
			
			
		<center>
		
		
		<tr>
		            <td><%=r.getString("trackingno") %></td>
		            <td><%=r.getString("producttype") %></td>
		            <td><%=r.getString("productname") %></td>
		            <td><%=r.getString("brandname") %></td>
		            <td><%=r.getString("size") %></td>
		            <td><%=r.getString("color") %></td>
		            <td><%=r.getString("saleamount") %></td>
		            <td><%=r.getString("cname") %></td>
		            <td><%=r.getString("address") %></td>
		            <td><%=r.getString("zipcode") %></td>
		            <td><%=r.getString("mobileno") %></td>
		            <td><a href="viewOrderProcess.jsp?trackingno=<%=r.getString("trackingno") %>"><button type="button" class="update">Go To Confirm</button></a></td>
		            <td><a href="cancelOrder.jsp?trackingno=<%=r.getString("trackingno") %>"><button type="button" class="update">Cancel Order</button></a></td>
		            
		            
		</tr>
		
		</center>
		<%
				
	}
	
	
}catch (Exception e){
	out.println(e);
		
}



%>

</table>
</body>
</html>