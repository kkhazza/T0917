<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
  h1{
    text-align: center;
    color: #57b7f9;
  }
  div{
  	width: 1000px;
  	padding: 0 10%;
  }
  ul{
    width: 862px;
    list-style: none;
    text-align: center;
  }
  li{
    border: 1px solid #57b7f9;
    display: inline-block;
    float: left;
  }
  .w1{width: 100px;}
  .w3{width: 150px;}
  .w5{width: 300px;}
</style>
<title>회원목록</title>
</head>
<body>
	<h1>회원 목록</h1>
	<div>
	  <ul>
	    <li class="w1"><input type="checkbox"></li>
	    <li class="w1">No</li>
	    <li class="w3">Id</li>
	    <li class="w5">Email</li>
	    <li class="w1">delYn</li>
	    <li class="w1">appYn</li>
	  </ul>
	</div>
</body>
</html>