<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/setting/setting.jsp" %>
<script src="/JR/logon/logon_script.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장물나라-로그인</title>
</head>
<body>
	<form name="loginForm" method="post" action="loginPro.do">
	<table border="1">
		<tr>
			<th>Email-ID</th>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="${logon_btn_ok}"> <input type="button" value="${logon_btn_signup}" onclick="location='emailConfirm.do'"> <input type="button" value="${logon_btn_cancel}" onclick="location='main.do'"> </th>
		</tr>
	</table>
	</form>
</body>
</html>