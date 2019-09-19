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
  button {
    padding: 3px;
    border:none;
    border-radius: 2px;
    background-color:#b0f9ff;
   	margin: 10px;
  	width: 100px;
  }
  button:hover {
  	background-color: white;
  	border: 1px #b0f9ff solid;
  }
  a {
    color: #57b7f9;
    margin: 10px 10px 10px 0px;
  }
</style>
<title>회원목록</title>
</head>
<body>
	<h1>회원 목록</h1>
	<div>
	  <ul style="text-align: left;">
	  	<a href="/">Home</a>
	    <button type="button" id="app" style="display: none;" onclick="app()">승인</button>
	    <button type="button" id="sec" style="display: none;" onclick="sec()">탈퇴</button>
	  </ul>	  
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
	boolean a = false;
	boolean d = false;
	if(i==0){
		continue;
	}
	if(mb.get(i).getAppYn().equals("N")){
		a = true;
	}
	if(mb.get(i).getDelYn().equals("N")){
		d = true;
	}
%>
	 <ul>
	    <li class="w1"><input type="checkbox" name="cb" onclick="cbe(<%=mb.get(i).getNo()%>,<%=a%>,<%=d%>)"></li>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
var ci = -1;
var no;
function cbe(DBno,a,d) {
	no = DBno;
	index = DBno - 2;
	var check = document.getElementsByName("cb");
	for(var i = 0; i < check.length; i++){
		check[i].checked = false;
	}
	if(index != ci){
		check[index].checked = true;
		if(a == true){
			document.getElementById('app').style.display = 'inline-block';
		} else {
			document.getElementById('app').style.display = 'none';
		}
		if(d == true){
			document.getElementById('sec').style.display = 'inline-block';
		} else {
			document.getElementById('sec').style.display = 'none';
		}
	} else {
		document.getElementById('app').style.display = 'none';
		document.getElementById('sec').style.display = 'none';
	}
	
	if(check[index].checked) ci = index;
	else ci = -1;
}

function app() {
	$.ajax({
		type: "POST",
		url : "/admin/app",
		data: {"no":no},
		success : function(data){
			location.href="/member";
            //success function
            //TIP : location.herf = "사용할 URL" 하면 GET방식으로 
        },
        error : function(){
            //error function
        	alert("실패");
        }
	});
}

function sec() {
	$.ajax({
		type: "POST",
		url : "/admin/sec",
		data: {"no":no},
		success : function(data){
			location.href="/member";
        },
        error : function(){
        	alert("실패");
        }
	});
}
</script>
</html>