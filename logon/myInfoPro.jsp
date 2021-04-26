<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>
<script src="${logon}logon_script.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장물나라</title>
</head>
<body>
<c:if test="${result==0}">
	<script type="text/javascript">
		erroralert("db오류로 수정에 실패했습니다. 잠시 후 다시 시도해주세요.");
	</script>
</c:if>
<c:if test="${result==1}">
	<script type="text/javascript">
		erroralert("회원정보수정에 성공했습니다.");
	</script>
</c:if>

</body>
</html>