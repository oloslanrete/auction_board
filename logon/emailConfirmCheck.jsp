<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/setting/setting.jsp" %>
<script src="/JR/logon/logon_script.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장물나라-인증번호</title>
</head>
<body>
<c:if test="${result==1}">
	이미 가입된 이메일주소 입니다.
	<input type="button" value="${logon_btn_close}" onclick="window.close()">
</c:if>
<c:if test="${result==0}">
	<script>
	var code=${code};
	setAutho(code);
	</script>
	인증번호가 발송되었습니다.<br>
	<input type="button" value="${logon_btn_close}" onclick="window.close()">
</c:if>
</body>
</html>