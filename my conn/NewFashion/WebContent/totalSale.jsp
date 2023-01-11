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
<link rel="stylesheet"  href="totalSale.css">
<title>Total Sale</title>
</head>
<body>


<marquee><h1><i>New Fashion</i></h1></marquee>




 
 
 
 
 
 
 
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from sale";
resultSet = statement.executeQuery(sql);
int i=0;
int qt=0;
int amount=0;
int totalorder=0;
int lastorder=0;
int dat=0;

while(resultSet.next()){	
	amount= amount+ Integer.parseInt(resultSet.getString("saleamount"));	
%>
<tr>
</tr>
<%
i++;
}%> 
  <center><input type="reset" value="Your Total Sale is = <%=amount%>"/></center>
 
 
<% 
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<br>
<br>


<center><a href="admin.html"> <b>Back</b> </a> </center>





</body>
</html>