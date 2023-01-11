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
<title>Shopping</title>
<link rel="stylesheet"  href="CSS/ordernavi.css">
<link rel="stylesheet"  href="shopping.css">
<link rel="stylesheet"  href="update.css">
</head>
<body>


<ul>
  <li><font><b>New Fashion</b></font></li><br>
  <center>
  <li ><a href="order.jsp"><u>Home</u></a></li>
  <li><a href="shopping.jsp"><u>Shopping</u></a></li>
  <li><a href="orderstatus.jsp"><u>Order Status<u></a></li>
   <li style="float:right"><a href="home.html">Signout</a></li>
</ul>

<br>



<table border=1>

<tr>


<td><font>Code</font></td>
<td><font>Product Type</font></td>
<td><font>Product Name</font></td>
<td><font>Brand Name</font></td>
<td><font>Product Size</font></td>
<td><font>Product Color</font></td>
<td><font>Product Price</font></td>
<td><font>Image</font></td>


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
<td><%=resultSet.getString("srno") %></td>

<td><%=resultSet.getString("producttype") %></td>
<td><%=resultSet.getString("productname") %></td>
<td><%=resultSet.getString("brandname") %></td>
<td><%=resultSet.getString("size") %></td>
<td><%=resultSet.getString("color") %></td>
<td><%=resultSet.getString("saleamount") %></td>


<td><image src ="totalprocess.jsp?srno=<%=resultSet.getString("srno") %>" width"50" height"60"/></td>

<td><a href="buy.jsp?srno=<%=resultSet.getString("srno") %>"><button type="button" class="update">Buy</button></a></td>
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
