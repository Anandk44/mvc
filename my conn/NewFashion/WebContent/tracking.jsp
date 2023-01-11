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
<link rel="stylesheet" href="tracking.css">
<title>Shopping</title>
</head>
<body>
<marquee><h1><i>New Fashion</i></h1></marquee>


<center><h2><i>Thank You</i></h2></center>
<center><h2><i>You will get the poduct soon</i></h2></center>

 
 
 
 
 
 
 
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
	lastorder= Integer.parseInt(resultSet.getString("trackingno"));	
%>
<tr>
</tr>
<%
i++;
}%> 
  <center><input type="reset" value="Your Tracking No. is = <%=lastorder%>"/></center>
 
 
<% 
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<br>
<br>


<center><a href="order.jsp"> <b>Continue Shopping</b> </a> </center>


</body>
</html>