
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String billno = request.getParameter("billno");
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
String sql ="select * from entry where billno="+billno; 
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
		
%>


<!DOCTYPE html>
<html>

<head>
<title>Update</title>
<link rel="stylesheet" href="updateprocess.css">
</head>






<body>
<p><marquee><h2><i>New Fashion</i></h2></marquee>
<h1><center><u><i>Update Your Stock</i></u></center></h1></p>


<form method="post" action="updatefinal.jsp">

<input type="hidden" name="pcode" value="<%=resultSet.getString("pcode") %>">

<input type="hidden" name="billno" value="<%=resultSet.getString("billno") %>">


<font>Product Type</font><br>
<input type="text" name="producttype" value="<%=resultSet.getString("producttype") %>">
<br><br>

<font>Product Name</font><br>
<input type="text" name="productname" value="<%=resultSet.getString("productname") %>">
<br><br>

<font>Quantity</font><br>
<input type="text" name="quantity" value="<%=resultSet.getString("quantity") %>">
<br><br>

<font>Product Size</font><br>
<input type="text" name="size" value="<%=resultSet.getString("size") %>">
<br><br>

<font>Sale Amount</font><br>
<input type="text" name="saleamount" value="<%=resultSet.getString("saleamount") %>">
<br><br>


<br>
<input type="submit" value="Update">
<br>
<br>
<a href="update.jsp"><button type="button" class="update">Back</button></a>

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