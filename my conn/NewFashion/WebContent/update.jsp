<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "newfashion";
String userid = "abhishek";
String password = "abhishek";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Stock</title>

<link rel="stylesheet" href="update.css">
</head>
<body>
<p><marquee><h2><i>New Fashion</i></h2></marquee>
<h1><center><u><i>Update Your Stock</i></u></center></h1></p>



<td><a href="admin.html"><button type="button" class="update">Back</button></a></td>


<br>
<br>

<table border="1">
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

<td>Action</td>
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from entry";
resultSet = statement.executeQuery(sql);
int i=0;

int qt=0;

int amount=0;
int totalorder=0;
int dat=0;

while(resultSet.next()){	

	
	

%>

<tr>
<td><%=resultSet.getString("billno") %></td>
<td><%=resultSet.getString("frombill") %></td>
<td><%=resultSet.getString("billprice") %></td>
<td><%=resultSet.getString("pcode") %></td>
<td><%=resultSet.getString("producttype") %></td>
<td><%=resultSet.getString("productname") %></td>
<td><%=resultSet.getString("brandname") %></td>
<td><%=resultSet.getString("quantity") %></td>
<td><%=resultSet.getString("productprice") %></td>
<td><%=resultSet.getString("size") %></td>
<td><%=resultSet.getString("color") %></td>
<td><%=resultSet.getString("saleamount") %></td>
<td><%=resultSet.getString("entrydate") %></td>

<td><image src ="totalprocess.jsp?srno=<%=resultSet.getString("srno") %>" width"50" height"60"/></td>

<td><a href="updateprocess.jsp?billno=<%=resultSet.getString("billno") %>"><button type="button" class="update">Edit</button></a></td>
</tr>
<%
i++;
}%>


 
<% 
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
</div>
</div>       








</body>
</html>