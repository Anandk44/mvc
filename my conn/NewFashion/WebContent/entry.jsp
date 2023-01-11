<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<script>
function validateForm() {
  var x = document.forms["myForm"]["billno"].value;
  if (x == "" || x == null) {
    alert("Please Enter Bill No.");
    return false;
  }
  
  var x = document.forms["myForm"]["frombill"].value;
  if (x == "" || x == null) {
    alert("Please Enter Billing Address");
    return false;
  }
  
  var x = document.forms["myForm"]["billprice"].value;
  if (x == "" || x == null) {
    alert("Please Enter Bill Price");
    return false;
  }
  
  var x = document.forms["myForm"]["pcode"].value;
  if (x == "" || x == null) {
    alert("Please Enter Product Code");
    return false;
  }
  
  var x = document.forms["myForm"]["producttype"].value;
  if (x == "" || x == null) {
    alert("Please Enter Product Type");
    return false;
  }
  
  var x = document.forms["myForm"]["productname"].value;
  if (x == "" || x == null) {
    alert("Please Enter Product Name");
    return false;
  }
  
  var x = document.forms["myForm"]["brandname"].value;
  if (x == "" || x == null) {
    alert("Please Enter Brand Name");
    return false;
  }
  
  var x = document.forms["myForm"]["quantity"].value;
  if (x == "" || x == null) {
    alert("Please Enter Quantity");
    return false;
  }
  
  var x = document.forms["myForm"]["productprice"].value;
  if (x == "" || x == null) {
    alert("Please Enter Product Price");
    return false;
  }
  
  var x = document.forms["myForm"]["size"].value;
  if (x == "" || x == null) {
    alert("Please Enter  Product Size");
    return false;
  }
 
  var x = document.forms["myForm"]["color"].value;
  if (x == "" || x == null) {
    alert("Please Enter Product Color");
    return false;
  }
  
  var x = document.forms["myForm"]["saleamount"].value;
  if (x == "" || x == null) {
    alert("Please Enter Sale Amount");
    return false;
  }
  
  var x = document.forms["myForm"]["entrydate"].value;
  if (x == "" || x == null) {
    alert("Please Enter Date");
    return false;
  }
  
  var x = document.forms["myForm"]["image"].value;
  if (x == "" || x == null) {
    alert("Please Select a Product Image");
    return false;
  }
 
}
</script>



<meta charset="ISO-8859-1">
<link rel="stylesheet" href="entry.css">





<title>Entry</title>
</head>





<body>

<marquee><h2><i>New Fashion</i></h2></marquee>
<h1><center><u><i>Fill Your Product Detail</i></u></center></h1>
                         
           
 <table style="width:70%">




<form name="myForm" action="saveData" enctype="multipart/form-data" onsubmit="return validateForm()" method="post" required>

<tr>
        <td><font><center><br>Bill No.</font> <input type="text" name="billno" value=""/></center></td>
        <td><font><center><br>From Bill<br></font> <input type="text" name="frombill" value=""/></center></td>
        <td><font><center><br>Bill Amount </font> <input type="text" name="billprice" value=""/></center></td>
  		<td><font><center><br>Product Code</font> <input type="text" name="pcode" value=""/></center></td>
       
       
</tr>        
       
<tr>        
        <td><font><center><br>Product Type</font> <input type="text" name="producttype" value=""/></center></td>
        <td><font><center><br>Product Name </font> <input type="text" name="productname" value=""/></center></td>
        <td><font><center><br>Brand Name</font> <input type="text" name="brandname" value=""/></center></td>
        <td><font><center><br>Quantity </font>  <input type="text" name="quantity" value=""/></center></td> 
        
        
</tr>
<tr>      
         <td><font><center><br>Price/Item</font>  <input type="text" name="productprice" value=""/></center></td>
         <td><font><center><br> Product Size </font> <input type="text" name="size" value=""/></center></td>
         <td><font><center><br> Product Color </font>  <input type="text" name="color" value=""/></center></td> 
         <td><font><center><br>Sale Amount</font> <input type="text" name="saleamount" value=""/></center></td>
        
             
</tr>       
      
<tr>      
       
       <td><font><center><br>Entry Date </font>  <input type="text" name="entrydate" value=""/></center></td>   
       
       <td>
                <font>  <label for="img"><center>Select Image</center></label></font>
                
                  <input type="file" id="img" name="image" accept="image/*">
       
       </td>
       
 </tr>  
       
  <tr>          
       <td><center><h4>Date:-YYYY/MM/DD</h4></center></td>  
      
</tr>       
 
 
 
 
 
 
 <tr>      
        
  </tr>    






</tr>
<tr>      
</tr>
<tr>
          <td><center><br><input type="reset" value="Clear"></center></td>
          <td><center><br><input type="submit" value="Insert"/></center></td> 
          <td><br><center><a href="admin.html">Back</a></center> </td> 
</tr>           
</form>  
</table>
     
     





</body>
</html>