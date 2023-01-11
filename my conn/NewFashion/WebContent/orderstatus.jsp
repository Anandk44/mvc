<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Order Status</title>
<link rel="stylesheet"  href="CSS/ordernavi.css">
<link rel="stylesheet"  href="orderstatus.css">
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


<table style="width:90%">


<form name="frm" action="orderStatusProcess.jsp" method="post">


<tr>
<td><h2>Enter Tracking No</h2></td>
</tr>



<tr>
<td>
<input type="text" name="trackingno" value="">
</td>
</tr>

<tr>
<td>
 		            
<input type="submit" value="Search">
</td>        
</tr>
</form>






</body>
</html>


