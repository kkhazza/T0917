<%@page import="hyun.jung.kim.Beans.MemberBean"%>
<%@page import="java.util.List"%>
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
  	padding: 0 25%;
  }
  ul{
    width: 862px;
    list-style: none;
    text-align: center;
  }
  li{
    border-right: 1px solid grey;
    border-bottom: 1px solid grey;
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
	<button type="submit" formaction="/admin/app" value="승인" id="app">
	<button type="submit" formaction="/admin/sec" value="탈퇴" id="sec">
	<div>	  
	  <ul>
	    <li class="w1">선택</li>
	    <li class="w1">번호</li>
	    <li class="w3">아이디</li>
	    <li class="w5">이메일</li>
	    <li class="w1">승인</li>
	    <li class="w1">탈퇴</li>
	  </ul>
<%
List<MemberBean> mb =(List<MemberBean>) request.getAttribute("mb");
for(int i = 0; i < mb.size(); i++){
	if(i==0){
		continue;
	}
%>
	 <ul>
	    <li class="w1"><input type="checkbox" id="cb" onclick="cbe(<%=mb.get(i).getNo()%>)"></li>
	    <li class="w1"><%=mb.get(i).getNo() %></li>
	    <li class="w3"><%=mb.get(i).getId() %></li>
	    <li class="w5"><%=mb.get(i).getEmail() %></li>
	    <li class="w1"><%=mb.get(i).getAppYn() %></li>
	    <li class="w1"><%=mb.get(i).getDelYn() %></li>
	  </ul>
<% 
}
%>	  
	</div>
</body>
<script type="text/javascript">
function cbe(no) {
	
}
</script>
</html>