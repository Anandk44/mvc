
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
<title>Orders</title>
<link rel="stylesheet" href="buy.css">
</head>






<body>

<h2><u><i>Product & Customer Detail</i></u></h2></p>


<table style="width:40%">


<form name="frm" action="orderUpdateFinal.jsp" method="post">
<input type="hidden" name="srno" value="<%=resultSet.getString("trackingno") %>">



<tr>
<td>
<h3>Tracking No</h3>
<input type="hidden" name="trackingno" value="<%=resultSet.getString("trackingno") %>">
<input type="button" name="trackingno" value="<%=resultSet.getString("trackingno") %>">
</td>
<td>
<h3>Order Status</h3>
<input type="button" name="producttype" value="<%=resultSet.getString("orderstatus") %>">

</td>




<tr>




<tr>
<td><h1><u><i>Order Status</i></u></h1></p></td>
</tr>


<tr>

        <td><h2>Current Status</h2>
         <input type="text" name="orderstatus" value=""></td>
         
        

</tr>



<tr>     
   
          <td><br><br><input type="submit" value="Update"></td>  
          
          <td><br><br> <a href="ordersUpdate.jsp"> <b>Cancel</b> </a> </td>
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