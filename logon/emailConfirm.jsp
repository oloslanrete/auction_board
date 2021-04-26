<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp" %>
<script src="/JR/logon/logon_script.js"></script>
<%
/*
	request.getParameter
	{
		email:이전 이메일 인증 단계에서 인증번호를 보냈고 제대로 된 인증번호를 입력한 이메일 주소.
	}
*/
%>

<head>
<title>${project}-${mail_str_emailCheck}</title>
</head>

<h2> ${mail_str_emailCheck}</h2>

<body onload="confirmEmailFocus()">
<form name="confirmEmailForm" method="post" action="signupForm.do" onsubmit="return checkAutho()">
	<input type="hidden" value="" name="autho">
	<table border="1">
		<tr>		
			<th>${mail_str_email}</th>
			<td> <input type="text" name="email" maxlength="30">
				<input type="button" value="${mail_btn_confirmEmail}" onclick="confirmEmail()">
			</td>			
		</tr>
		<tr>
			<th>${mail_str_confirmNumber}</th>
			<td> <input type="text" name="emailNumber" maxlength="4"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="${mail_btn_confirmEmail_ok}">
				<input type="button" value="${mail_btn_confirmEmail_cancel}"
					 onclick="location='main.do'"> 
			</th>
		</tr>
	</table>
</form>
</body>



