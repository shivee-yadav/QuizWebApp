<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: center;
  padding: 16px;
}

th:first-child, td:first-child {
  text-align: left;
}

tr:nth-child(even) {
  background-color: #f2f2f2
}

.fa-check {
  color: green;
}

.fa-remove {
  color: red;
}
</style>
</head>
<body>
<%
String testid=session.getAttribute("testid").toString();
int totalmarks=0;
String ans[] = new String[10];

ans[0] = request.getParameter("fav_language1");
ans[1] = request.getParameter("fav_language2");
ans[2] = request.getParameter("fav_language3");
 ans[3] = request.getParameter("fav_language4");
ans[4] = request.getParameter("fav_language5");
 ans[5] = request.getParameter("fav_language6");
 ans[6] = request.getParameter("fav_language7");
ans[7] = request.getParameter("fav_language8");
 ans[8] = request.getParameter("fav_language9");
ans[9] = request.getParameter("fav_language10");

for (int i=0;i<10;i++)
{
	DBConnect x = new DBConnect();
	String sql = "update testresultdesc set yourans='"+ans[i]+
			"' where testid="+testid+" and qno="+(i+1);
	x.QueryExecuter(sql);
	
}


%>

<jsp:include page="Header.jsp"></jsp:include>


<div class="jumbotron text-center">
  <h2> Hello <%= session.getAttribute("uname") %></h2>
  <p><h4>Test Result :subject -
   <%= session.getAttribute("sub").toString() %></h4></p>
</div>

<div class="container">
  <div class="row">
    <div class="col-sm-1">
     
    </div>
    <div class="col-sm-10">
      
      <table>
  <tr>
    <th >Question</th>
    <th>Your Ans</th>
   
  </tr>
  
  <%
  DBConnect x = new DBConnect();
  String sql = "select * from testresultDesc where testid="+testid+" order by qno";
  ResultSet rs = x.QueryReturner(sql);
  while(rs.next())
  {%>
	<tr>
    <td> <strong><em><%= rs.getInt(2) %></em></strong>
    
    <%= rs.getString(3) %>
     </td>
     <%
     if(rs.getString(4).trim().equals(rs.getString(5)))
    		 {
    	 totalmarks++;
    		 
    		 %>
    	 <td><i class="fa fa-check"></i></td>
    		 <%}
     else
     {%>
	 <td><i class="fa fa-remove"></i></td>
	 <%}
     
     %>
    
    
  </tr>
	
	  
  <%}
  
  %>
  
  
 </table>
      
      
      <div class="alert alert-success">
  <strong>Test Result!</strong> 
  Your test result is <%= totalmarks %> out of 10 of subject -
   <%= session.getAttribute("sub").toString() %>
      
      
      <%
      DBConnect x3 = new DBConnect();
       sql ="insert into resultanalysis values("+
      testid+",'"+session.getAttribute("uname").toString()
       +"','"+
    		  session.getAttribute("sub").toString()+"',"+
      totalmarks+")";
      x3.QueryExecuter(sql);
      
      
      %>
      
    </div>
    <div class="col-sm-1">
     
    </div>
  </div>
</div>

<p>



</body>
</html>