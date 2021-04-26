<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../setting/setting.jsp" %>
<script src="/JR/logon/logon_script.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장물나라-로그인 처리중</title>
</head>
<body>
<c:set var="result" value="${result}"/>
<c:if test="${result==0}">
		<script type="text/javascript">
			<!--
			erroralert(iderror);
			//-->
		</script>
</c:if>
<c:if test="${result==-1}">
		<script type="text/javascript">
			<!--
			erroralert(passwderror);
			//-->
		</script>
</c:if>
<c:if test="${result==1}">
		<c:redirect url="main.do"/>
</c:if>
</body>
</html>