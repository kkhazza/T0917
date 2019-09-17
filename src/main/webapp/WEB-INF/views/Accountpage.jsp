<%@page import="hyun.jung.kim.Beans.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
	<title>내 정보</title>

<style rel="stylesheet">
html {
  width: 100%;
  height: 100%;
}

body {
  background: -webkit-linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%, rgba(66, 245, 189, 0.4) 100%);
  background: linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%, rgba(66, 245, 189, 0.4) 100%);
  color: rgba(0, 0, 0, 0.6);
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  line-height: 1.6em;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.form {
  background-color: #4285F4;
  z-index: 15;
  position: relative;
  width: 600px;
  border-radius: 4px;
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
  box-sizing: border-box;
  margin: 100px auto 10px;
  padding : 20px;
  overflow: hidden;
}
.form-group {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
          flex-wrap: wrap;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between;
  margin: 0 0 20px;
}
.form-group label {
  display: block;
  margin: 0 0 10px;
  color: rgba(0, 0, 0, 0.6);
  font-size: 12px;
  font-weight: 500;
  line-height: 1;
  text-transform: uppercase;
  letter-spacing: .2em;
}
.two .form-group label {
  color: #FFFFFF;
}
.form-group input {
  outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
  width: 100%;
  border: 0;
  border-radius: 4px;
  box-sizing: border-box;
  padding: 12px 20px;
  color: rgba(0, 0, 0, 0.6);
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.form-group input:focus {
  color: rgba(0, 0, 0, 0.8);
}
.two .form-group input {
  color: #FFFFFF;
}
.two .form-group input:focus {
  color: #FFFFFF;
}
.form-group button {
  outline: none;
  background: #4285F4;
  width: 45%;
  border: 0;
  border-radius: 4px;
  padding: 12px 20px;
  color: #FFFFFF;
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  text-transform: uppercase;
  cursor: pointer;
}
.two .form-group button {
  background: #FFFFFF;
  color: #4285F4;
}
.form-group .form-remember {
  font-size: 12px;
  font-weight: 400;
  letter-spacing: 0;
  text-transform: none;
}
.form-group .form-remember input[type='checkbox'] {
  display: inline-block;
  width: auto;
  margin: 0 10px 0 0;
}
.form-group .form-recovery {
  color: #4285F4;
  font-size: 12px;
  text-decoration: none;
}

.form-header {
  margin: 0 0 40px;
}
.form-header h1 {
  padding: 4px 0;
  color: #4285F4;
  font-size: 24px;
  font-weight: 700;
  text-transform: uppercase;
}
.two .form-header h1 {
  position: relative;
  z-index: 40;
  color: #FFFFFF;
}
.form-group a {
	color: #FFFFFF;
	font-size: 20px;
}
</style>
</head>
<body>

<%
List<MemberBean> mbDB = (List<MemberBean>) request.getAttribute("mbDB");
String id = (String) request.getAttribute("id");
int no = 0;
for(int i = 0; i < mbDB.size(); i++){
	if(id.equals(mbDB.get(i).getId())){
		no = i;
		break;
	}
}
%>

<!-- Form-->
<div class="form">
  <div class="form-panel two">
    <div class="form-header">
      <h1>My Account</h1>
    </div>
    <div class="form-content">
      <!-- register form -->
      <form method="post">
        <div class="form-group">
          <input type="hidden" id="no" name="no" value="<%=mbDB.get(no).getNo()%>"/>
          <label for="id">Id(변경불가)</label>
          <input type="text" id="id" name="id" required="required" value="<%=mbDB.get(no).getId()%>" readonly="readonly"/>
        </div>
        <div class="form-group">
          <label for="pw">Password</label>
          <input type="password" id="pw" name="pw" required="required" value="<%=mbDB.get(no).getPw()%>"/>
        </div>
        <div class="form-group">
          <label for="cpw">Confirm Password</label>
          <input type="password" id="cpw" name="cpw" required="required" value="<%=mbDB.get(no).getPw()%>"/>
        </div>
        <div class="form-group">
          <label for="email">Email Address</label>
          <input type="email" id="email" name="email" required="required" value="<%=mbDB.get(no).getEmail()%>"/>
        </div>
        <div class="form-group">
          <button type="submit" formaction="/account/edit">edit</button>
          <button type="submit" formaction="/account/delete">secession</button>
        </div>
        <div class="form-group"><a href="/">Home</a></div>
      </form>
    </div>
  </div>
</div>

</body>
</html>
