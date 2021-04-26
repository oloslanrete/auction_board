<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>
<!--link href="${auction}style.css" rel="stylesheet" type="text/css" -->
<%
	//주석
	/*
		count 			==			글 수
		dto				== 			디비에서 받아온 내용
	*/

%>
<c:set value='${count}' var='count' />
<!--<c:set value="${count}" var="count"/>-->
<h2>${ac_page_list}</h2>
<table style="width: 100%" border=1>
	<tr>
		<td colspan="6" style="text-align:right">
			<a href="auctionwriteForm.do">${ac_str_write}</a>   <!-- 글쓰기 -->
			&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<th>${ac_str_item}</th>	<!-- 물품명 -->
		<th>${ac_str_startprice}</th>	<!-- 시작가 -->
		<th>${ac_str_price}</th>	<!-- 즉구가 -->
		<th>${ac_str_bidderCount}</th>	<!-- 입찰자 수 -->
		<th>${ac_str_seller}</th>	<!-- 판매자 -->
		<th>${ac_str_endDay}</th>	<!-- 종료일시 -->
	</tr>
	<c:if test="${count == 0}"> 
		<tr>
			<td colspan="6" style="text-align: center">
				${ac_msg_auctionlist_empty}
			</td>
		</tr>
	</c:if>
	<c:if test="${count ne 0}">
		<c:set var = "dto2" value="${images}"></c:set>
		<c:forEach var="dto" items="${articles}" varStatus="status">
			<tr>
				<td > 
						<img src="${file}${dto.itemnum}'s0bun${dto2[status.index].originalName}" border=0 style="padding-left:20% ;padding-right:10% ; height: 40px; width: 40px;">
					<a href="auctionContent.do?itemnum=${dto.itemnum}">${dto.title}</a>
				</td>
				<td style="text-align:center">
					${dto.startprice}
				</td>
				<td style="text-align:center">
					${dto.price}
				</td>
				<td style="text-align:center">
					${dto.bidCount}
				</td>
				<td style="text-align:center">
					${dto.writer}
				</td>
				<td style="text-align:center">
					<fmt:formatDate value="${dto.regDate}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
		</c:forEach>
	</c:if>

</table>

<div align="center">
<br>
<c:if test="${count > 0}">
   <c:if test="${startPage > pageBlock}">
      <a href="auctionlist.do?pageNum=1">[◀◀]</a>
      <a href="auctionlist.do?pageNum=${startPage-pageBlock}">[◀]</a>         
   </c:if>
   <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <c:if test="${i == currentPage}">
         <b>[${i}]</b>
      </c:if>
      <c:if test="${i != currentPage}">
         <a href="auctionlist.do?pageNum=${i}">[${i}]</a>
      </c:if>
   </c:forEach>
   
   <c:if test="${pageCount > endPage }">
      <a href="auctionlist.do?pageNum=${startPage+pageBlock}">[▶]</a>
      <a href="auctionlist.do?pageNum=${pageCount}">[▶▶]</a>
   </c:if>
</c:if>
</div>