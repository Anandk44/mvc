<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="update.css">
<title>Total Stock</title>
</head>
<body>

<p><marquee><h2><i>New Fashion</i></h2></marquee>
<h1><center><u><i>Your Stock</i></u></center></h1></p>

<a href="admin.html"><button type="button" class="update">Back</button></a>
<br>
<br>
<table border=1>

<tr>
<td>Bill No.</td>
<td>From Bill</td>
<td>Bill Amount</td>
<td>Product Code</td>
<td>Product Type</td>
<td>Product Name</td>
<td>Brand Name</td>
<td>Quantity</td>
<td>Price/Item</td>
<td>Product Size</td>
<td>product color</td>
<td>Sale Amount</td>
<td>Entry Date</td>
<td>Image</td>


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
	ResultSet r= st.executeQuery("select * from entry");
	while(r.next()){
		String srno=r.getString("srno");
		%>
			
			
		<center>
		
		
		<tr>
		            <td><%=r.getString("billno") %></td>
		            <td><%=r.getString("frombill") %></td>
		            <td><%=r.getString("billprice") %></td>
		            <td><%=r.getString("pcode") %></td>
		            <td><%=r.getString("producttype") %></td>
		            <td><%=r.getString("productname") %></td>
		            <td><%=r.getString("brandname") %></td>
		            <td><%=r.getString("quantity") %></td>
		            <td><%=r.getString("productprice") %></td>
		            <td><%=r.getString("size") %></td>
		            <td><%=r.getString("color") %></td>
		            <td><%=r.getString("saleamount") %></td>
		            <td><%=r.getString("entrydate") %></td>
		            <td><image src ="totalprocess.jsp?srno=<%=srno%>" width"50" height"60"/></td>
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