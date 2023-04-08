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
  <p><h4>Test Result History</h4></p>
</div>

<div class="container">
  <h2>History</h2>
  <p></p>            
  <table class="table">
    <thead>
      <tr>
        <th>Subject</th>
        <th>Date </th>
        <th>Result</th>
      </tr>
    </thead>
    <tbody>
    <%
    DBConnect x = new DBConnect();
    String sql = "select distinct testresult.testid, subject,dateofexam from testresult where emailid='"+
    session.getAttribute("email")+"'";
    ResultSet rs = x.QueryReturner(sql);
    while(rs.next())
    {
      DBConnect x1 = new DBConnect();
          sql = "select count(*) from testresultdesc where testid="+
          rs.getInt(1)+" and yourans=correctans";
          ResultSet rs1 = x1.QueryReturner(sql);
          rs1.next();
          int marks = rs1.getInt(1);
          
          %>
 
 <tr>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= marks %></td>
      </tr>
 
 
 
 
 
    <%}
    
    %>
    
    
      
      
    </tbody>
  </table>
</div>

<p>

</body>
</html>
