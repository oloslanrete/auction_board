<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/setting/setting.jsp" %>
<script src="/JR/logon/logon_script.js"></script>
<html>
<%
/*
	request.getParameter
	{
		email:이전 이메일 인증 단계에서 인증번호를 보냈고 제대로 된 인증번호를 입력한 이메일 주소.
	}
*/
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장물나라-회원가입</title>
</head>
<body>
<c:set var="email" value="${email}"/>
<form name="signupForm" method="post" action="signupPro.do" onsubmit="return inputcheck()">
	<input type="hidden" name="email" value="${email}">
	<table border="1">
		<tr>
			<th>Email</th>
			<td>${email}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd" maxlength="30" style="ime-mode:disabled"></td>
		</tr>
		<tr>
			<th>비밀번호 재입력</th>
			<td><input type="password" name="passwd2" maxlength="30" style="ime-mode:disabled"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" maxlength="30" style="width:80px"></td>
		</tr>
		<tr>
			<th>핸드폰 번호</th>
			<td>
				<input type="text" name="hp1" maxlength="3" style="width:40px">
				- 
				<input type="text" name="hp2" maxlength="4" style="width:50px">
				- 
				<input type="text" name="hp3" maxlength="4" style="width:50px">
			</td>
		</tr>
		<tr>
			<th>우편 번호</th>
			<td>
				<input type="text" name="zip1" maxlength="3" style="width:40px">
				-
				<input type="text" name="zip2" maxlength="3" style="width:40px">
				<input type="button" value="우편번호 검색" onclick="location.href='http://www.juso.go.kr'">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" maxlength="50"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="${logon_btn_signup_ok}"><input type="button" value="${logon_btn_cancel}" onclick="location='main.do'">
			</th>
		</tr>
	</table>
</form>
</body>
</html>