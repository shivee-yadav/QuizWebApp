<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

<div class="jumbotron text-center">
  <h2> Hello <%= session.getAttribute("uname") %></h2>
  <p><h4>Top 5  Result History</h4></p>
</div>


<div class="container">
  <h2>History</h2>
  <p></p>            
  <table class="table">
    <thead>
      <tr>
        <th>Name</th>
        <th>Subject </th>
        <th>Marks</th>
      </tr>
    </thead>
    <tbody>
    <%
    DBConnect x = new DBConnect();
    String sql = "select * from resultanalysis where rownum<=5 order by marks desc  ";
    ResultSet rs = x.QueryReturner(sql);
    while(rs.next())
    {
             %>
 
 <tr>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
      </tr>
 
 
 
 
 
    <%}
    
    %>
    
    
      
      
    </tbody>
  </table>
</div>

<p>


</body>
</html>
