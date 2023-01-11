
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String srno = request.getParameter("srno");
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
String sql ="select * from entry where srno="+srno; 
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
		
%>


<!DOCTYPE html>
<html>

<head>
<title>Shopping</title>
<link rel="stylesheet" href="buy.css">


<script>
function validateForm() {
  var x = document.forms["myForm"]["cname"].value;
  if (x == "" || x == null) {
    alert("Please Enter Name");
    return false;
  }
  
  
  
  var x = document.forms["myForm"]["address"].value;
  if (x == "" || x == null) {
    alert("Please Enter Address");
    return false;
  }
  
  var x = document.forms["myForm"]["zipcode"].value;
  if (x == "" || x == null) {
    alert("Please Enter Zip code");
    return false;
  }
  
  var x = document.forms["myForm"]["mobileno"].value;
  if (x == "" || x == null) {
    alert("Please Enter Mobile No.");
    return false;
  }
  
}
</script>

</head>






<body>
<p><marquee><h1><i>New Fashion</i></h1></marquee>
<h2><u><i>Product Detail</i></u></h2></p>


<table style="width:90%">




<form name="myForm" action="saleData" onsubmit="return validateForm()" method="post" required>

<input type="hidden" name="srno" value="<%=resultSet.getString("pcode") %>">



<tr>
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
<h3>Price Rs</h3>
<input type="button" name="saleamount" value="<%=resultSet.getString("saleamount") %>">
<input type="hidden" name="saleamount" value="<%=resultSet.getString("saleamount") %>">

</td>
</tr>

<tr>
<td><h2><u><i>Customer Detail</i></u></h2></p></td>
</tr>


<tr>

        <td><h3>Name</h3>
         <input type="text" name="cname" value=""></td>
         
        <td><h3>Address</h3>
         <input type="text" name="address" value=""></td>
         
        <td><h3>Zip Code</h3>
         <input type="text" name="zipcode" value=""></td>
         
  		<td><h3>Mobile No.</h3>
  		<input type="text" name="mobileno" value=""></td>


</tr>



<tr>     
   
          <td><br><br><input type="submit" value="Confirm Order"></td>  
          
          <td><br><br> <a href="shopping.jsp"> <b>Cancel Order</b> </a> </td>
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