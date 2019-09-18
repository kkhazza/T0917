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
</style>
<title>추가</title>
</head>
<body>
	<div>
		<form action="/new" method="post" enctype="multipart/form-data">
			<div class="form-group">
			  <label for="title">제목:</label>
			  <input type="text" class="form-control"  id="title" name="title" placeholder="제목을 입력하세요." autocomplete="on">
			</div>
			<div class="form-group">
			  <label for="comment">내용</label>
              <textarea class="form-content" id="comment" name="comment" placeholder="내용을 입력하세요." autocomplete="on"></textarea>    
			</div>
            
            <div class="form-group">
              <p>※파일은 수정이 불가합니다. 신중히 선택한 후 올려주세요!※</p>
              <label for="file">첨부파일</label>
	          <input type="file" name="file" id="file" onchange="file_Event(this)" multiple=multiple> 
			</div>
			<button type="submit" class="but">추가</button>				
		</form>
		<a href="/">Home</a>
	</div>
</body>
</html>