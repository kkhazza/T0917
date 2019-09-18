<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="hyun.jung.kim.Beans.UploadBean"%>
<%@page import="hyun.jung.kim.Beans.FileBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.form-group {
		margin: 20px 0px;
	}
    
	input {
		width: 300px;
	}
    
	html,body {
		background-color: #d2ffff;
        color: #4e4e4e;
	}
	
	.but {
		border: none;
		background-color: #4285F4;
		width: 70px;
		height: 30px;
        font-weight: bold;
        color: #FFFFFF;
        cursor: pointer;
	}
	
	.but:hover {
		opacity: 0.8;
	}   
    .form-content {
        display: block;
        margin-top: 10px;
        width:50%;
        height: 200px;
    }
    
    label {
        font-weight: bold;
    }
    
    #file {
        display: block;
        margin-top: 10px;
    }
    .ub {
    	background-color: #ffdada;
    	width: 200px;
    }
    
    .ub:hover{
    	border: 1px solid #ffa5a5;
    	color: #ffa5a5;
    	background-color: #FFFFFF;
    }
</style>
<title>자세히 보기</title>
</head>
<body>
<%
List<FileBean> fb = (List<FileBean>) request.getAttribute("fb");
List<UploadBean> ub = (List<UploadBean>) request.getAttribute("ub");
String id = (String) request.getAttribute("id");
boolean idcheck = false;
if(fb.get(0).getId().equals(id) || ("admin").equals(id)){
	idcheck = true;
} 
%>
	<div>
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="no" value="<%=fb.get(0).getNo()%>">
			<div class="form-group">
			  <label for="title">제목:</label>
			  <input type="text" class="form-control" value="<%=fb.get(0).getTitle() %>"  id="title" name="title" placeholder="제목을 입력하세요." autocomplete="on" readonly="readonly">
			</div>
			<div class="form-group">
			  <label for="comment">내용</label>
              <textarea class="form-content" id="comment" name="comment" placeholder="내용을 입력하세요." autocomplete="on" readonly="readonly"><%=fb.get(0).getComment() %></textarea>    
			</div>
            <div class="form-group">
            <%
            System.out.println(ub.size());
            for(int i = 0; i < ub.size(); i++){ 
            	if(id == null){
            %>
              <button type="submit" class="but ub" formaction="javascript:window.alert('로그인 후 이용가능합니다!');"><%=ub.get(i).getFn() %></button>
            <% 
            	} else {
            %>
              <button type="submit" class="but ub" formaction="/download/<%=ub.get(i).getNo()%>"><%=ub.get(i).getFn() %></button>
            <%
            	}
            }
            %>           
			</div>
			<button type="submit" class="but" id="edit" style="display: none;" formaction="/file/edit">수정</button>
			<button type="submit" class="but" id="delete" style="display: none;" formaction="/file/delete">삭제</button>					
		</form>
		<a href="/">Home</a>
	</div>
</body>
<script type="text/javascript">
if(<%=idcheck %> == true){
	document.getElementById('edit').style.display = 'inline-block';
	document.getElementById('delete').style.display = 'inline-block';
	document.getElementById('title').readOnly="";
	document.getElementById('comment').readOnly="";
}
</script>
</html>