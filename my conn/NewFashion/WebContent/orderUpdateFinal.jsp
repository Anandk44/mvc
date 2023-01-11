

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/newfashion";%>
<%!String user = "abhishek";%>
<%!String psw = "abhishek";%>
<%
String trackingno = request.getParameter("trackingno");
String orderstatus = request.getParameter("orderstatus");





if(trackingno != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(trackingno);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update vieworder set orderstatus=? where trackingno="+trackingno;
ps = con.prepareStatement(sql);
ps.setString(1,orderstatus);

int i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("ordersUpdate.jsp");
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