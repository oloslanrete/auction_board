<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>

<c:if test="${result==1}">
<!-- 글 작성 성공  -->
	<c:redirect url="auctionlist.do"/>
</c:if>
<c:if test="${result!=1}">
<!-- 글 작성 실패  (글)-->
	<script type="text/javascript">
	<!--
		erroralert(ac_insert_error);	
	//-->
</script>
</c:if>