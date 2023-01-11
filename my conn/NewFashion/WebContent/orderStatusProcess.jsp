
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String trackingno = request.getParameter("trackingno");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from vieworder where trackingno="+trackingno; 
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
		
%>


<!DOCTYPE html>
<html>

<head>
<title>Status</title>
<link rel="stylesheet" href="orderStatusProcess.css">
</head>






<body>
<h2><u><i>Your Order Status</i></u></h2></p>
<table style="width:40%">
<form name="frm" action="orderUpdateFinal.jsp" method="post">
<input type="hidden" name="srno" value="<%=resultSet.getString("trackingno") %>">
<tr>
<td>
<h3>Tracking No</h3>
<input type="button" name="trackingno" value="<%=resultSet.getString("trackingno") %>">
</td>
<td>
<h3>Status</h3>
<input type="button" name="producttype" value="<%=resultSet.getString("orderstatus") %>">
</td>
</tr>

<tr>

 <td><br><br> <a href="shopping.jsp"> <b>Continue Shopping</b> </a> </td>

</tr>

</form>
<%
}
connection.close();
} catch (Exception e) {
	
e.printStackTrace();
}
%>
</body>


</html>