<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String billno=request.getParameter("billno");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/newfashion", "abhishek", "abhishek");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM entry WHERE billno="+billno);
response.sendRedirect("removeprocess.jsp");
//out.println("Record Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>