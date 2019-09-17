<%@page import="hyun.jung.kim.Beans.FileBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>메인 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
    .col-sm-4:hover {
    	cursor: pointer;
    	opacity: 0.8;
    }
  </style>
</head>
<body>

<div style="background-color: #abfbff;" class="jumbotron">
  <div class="container text-center">
    <h1><a href="/">File Share</a></h1>      
    <p>Please share your file :D</p>
  </div>
</div>

<%
String id = (String) request.getAttribute("id");
String account = "Your Account";
String logout = "Logout";
String apath = "/account";
String lpath = "/logout";
if(id == null) {
	account = "Guest";
	logout = "Login";
	apath = "javascript:window.alert('로그인 해주세요!');";
	lpath = "/loginpage";
	
}
%>

<nav style="background-color: #4285F4; border: none;" class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=apath %>"><span class="glyphicon glyphicon-user"></span><%=account %></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
		<li><a href="<%=lpath %>"><%=logout %></a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">    
  <div class="row">
<%
List<FileBean> fb = (List<FileBean>) request.getAttribute("fb");
for(int i = 0; i < fb.size(); i++){
%>
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading"><%=fb.get(i).getTitle() %></div>
        <div class="panel-body"><%=fb.get(i).getComment() %></div>
        <div class="panel-footer">작성자 : <%=fb.get(i).getId() %></div>
      </div>
    </div>
<%
}
%>    
  </div>
</div><br>



<footer class="container-fluid text-center">
  <p>我想去家</p>  
  <form action="/" method="post" class="form-inline">제목 :
    <input type="text" class="form-control" size="50" name="title" placeholder="제목을 검색하세요">
    <button type="submit" class="btn btn-danger">검색</button>
  </form>
</footer>

</body>
</html>
