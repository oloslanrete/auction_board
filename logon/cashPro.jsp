<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp" %>
<script src="/JR/logon/logon_script.js"></script>

<c:if test="${result==0}">
	<script type="text/javascript">
		erroralert(dberror);
	</script>
</c:if>
<c:if test="${result!=0}">
	<c:redirect url="myInfo.do"/>
</c:if>

