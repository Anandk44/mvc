
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
String sql ="select * from sale where trackingno="+trackingno; 
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


<table style="width:90%">


<form name="frm" action="viewOrderData.jsp" method="post">
<input type="hidden" name="srno" value="<%=resultSet.getString("trackingno") %>">



<tr>


<td>
<h3>Tracking No</h3>
<input type="button" name="trackingno" value="<%=resultSet.getString("trackingno") %>">
<input type="hidden" name="trackingno" value="<%=resultSet.getString("trackingno") %>">
</td>
<td>
<h3>Product Type</h3>
<input type="button" name="producttype" value="<%=resultSet.getString("producttype") %>">
<input type="hidden" name="producttype" value="<%=resultSet.getString("producttype") %>">
</td>
<td>
<h3>Product Name</h3>
<input type="button" name="productname" value="<%=resultSet.getString("productname") %>">
<input type="hidden" name="productname" value="<%=resultSet.getString("productname") %>">
</td>
<td>
<h3>Brand Name</h3>
<input type="button" name="brandname" value="<%=resultSet.getString("brandname") %>">
<input type="hidden" name="brandname" value="<%=resultSet.getString("brandname") %>">
</td>
</tr>


<tr>

<td>
<h3>Size</h3>
<input type="button" name="size" value="<%=resultSet.getString("size") %>">
<input type="hidden" name="size" value="<%=resultSet.getString("size") %>">
</td>
<td>
<h3>Color</h3>
<input type="button" name="color" value="<%=resultSet.getString("color") %>">
<input type="hidden" name="color" value="<%=resultSet.getString("color") %>">
</td>
<td>
<h3>Price </h3>
<input type="button" name="saleamount" value="<%=resultSet.getString("saleamount") %>">
<input type="hidden" name="saleamount" value="<%=resultSet.getString("saleamount") %>">
</td>
<td>
<h3>Customer Name</h3>
<input type="button" name="cname" value="<%=resultSet.getString("cname") %>">
<input type="hidden" name="cname" value="<%=resultSet.getString("cname") %>">
</td>
</tr>




<tr>

<td>
<h3>Address</h3>
<input type="button" name="address" value="<%=resultSet.getString("address") %>">
<input type="hidden" name="address" value="<%=resultSet.getString("address") %>">
</td>
<td>
<h3>Zip code</h3>
<input type="button" name="zipcode" value="<%=resultSet.getString("zipcode") %>">
<input type="hidden" name="zipcode" value="<%=resultSet.getString("zipcode") %>">
</td>
<td>
<h3>Mobile No.</h3>
<input type="button" name="mobileno" value="<%=resultSet.getString("mobileno") %>">
<input type="hidden" name="mobileno" value="<%=resultSet.getString("mobileno") %>">
</td>
</tr>



<tr>

</tr>


<tr>
<td><h1><u><i>Order Status</i></u></h1></p></td>
</tr>


<tr>

        <td><h2>Enter Status</h2>
         <input type="text" name="orderstatus" value=""></td>
         
        

</tr>



<tr>     
   
          <td><br><br><input type="submit" value="SAVE"></td>  
          
          <td><br><br> <a href="viewOrders.jsp"> <b>LATER</b> </a> </td>
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