<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp" %>
<h2>내 경매 목록</h2>
<table border="1">
	<tr>
		<th > ${mya_str_number} </th>
		<th > ${mya_str_subject} </th>
		<th > ${mya_str_writer} </th>
		<th > ${mya_str_kingbidder} </th>
		<th > ${mya_str_remaintime} </th>
		<th > ${mya_str_reg_date} </th>
		<th > ${mya_str_end_date} </th>
		<th > ${mya_str_readcount} </th>
		<th > ${mya_str_bidcount} </th>
	</tr>
	<c:if test="${count == 0}">
		<tr>
			<td colspan="9" style="text-align:center">
				${mya_msg_list_x} 
			</td>
		</tr>
	</c:if>				
	<c:if test="${count != 0}">
		<c:forEach var="dto" items="${myAuctions}">
			<tr>
				<td style="text-align:center"> 
					${number}
					<c:set var="number" value="${number-1}"/>
				</td>				
				<td style="text-align:center">
					${dto.writer}
				</td>
				<td style="text-align:center">
					<fmt:formatDate value="${dto.reg_date}"
						pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td style="text-align:center">
					${dto.count}
				</td>							
			</tr>				
		</c:forEach>
	</c:if>
</table>

<br>
<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="myAuctionlist.do?pageNum=1">[◀◀]</a>
		<a href="myAuctionlist.do?pageNum=${startPage-pageBlock}">[◀]</a>			
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>
		<c:if test="${i != currentPage}">
			<a href="myAuctionlist.do?pageNum=${i}">[${i}]</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${pageCount > endPage }">
		<a href="myAuctionList.do?pageNum=${startPage+pageBlock}">[▶]</a>
		<a href="myAuctionList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if>
<br>
<input type="button" value="${mya_btn_tomain}" onclick="location='main.do'">
<input type="button" value="${mya_btn_toinfo}" onclick="location='myInfo.do'">
<input type="button" value="${mya_btn_tobid}" onclick="location='myAuctionList.do?mode=bid'">
