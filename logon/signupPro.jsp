<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/setting/setting.jsp" %>
<script src="/JR/logon/logon_script.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장물나라-회원가입 처리</title>
</head>
<c:set var="result" value="${result}"/>
<body>
<c:if test="${result==1}">
	<script type="text/javascript">
		alert('회원가입에 성공하였습니다.');
		window.location="main.do";
	</script>
	
</c:if>
<!-- db 처리 실패 -->
<c:if test="${result!=1}">
	<script>
		erroralert('원인 모를 이상 현상으로 회원가입에 실패했습니다. 잠시후 다시 시도하여 주십시오');
	</script>
</c:if>
</body>
</html>