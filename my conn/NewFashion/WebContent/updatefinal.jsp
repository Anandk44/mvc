

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/newfashion";%>
<%!String user = "abhishek";%>
<%!String psw = "abhishek";%>
<%
String billno = request.getParameter("billno");
String producttype = request.getParameter("producttype");
String productname=request.getParameter("productname");
String quantity=request.getParameter("quantity");
String size=request.getParameter("size");
String saleamount=request.getParameter("saleamount");




if(billno != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(billno);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update entry set producttype=?,productname=?,quantity=?,size=?,saleamount=? where billno="+billno;
ps = con.prepareStatement(sql);
ps.setString(1,producttype);
ps.setString(2, productname);
ps.setString(3, quantity);
ps.setString(4, size);
ps.setString(5, saleamount);
int i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("update.jsp");
//out.print("Record Updated Successfully!");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>