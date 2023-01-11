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
<title>Online Order</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="final.css">
</head>
<body>

              <marquee><h1>Online Order System</h1></marquee> 
                       <center>  <h1>------------------------------</h1></center>
                         
           
   
   
   

<table border="1">

<tr>
<td>Tracking No</td>
<td>Product Code</td>

</tr>

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


 
  <input type="reset" value="Lastorder = <%=lastorder%>"/>
 
 
<% 
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
</div>
         
</body>
</html>

