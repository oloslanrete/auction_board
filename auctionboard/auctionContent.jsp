<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>Content Page</h2>
<%@ include file="/setting/setting.jsp"%>
<script src="${auction}/auctionboard_script.js"></script>
<script src="/JR/setting/request.js"></script>
<script type="text/javascript">
<!--
	var request = null;
	function biddings(){
		var params = "startprice=" + document.contentForm.startprice.value + "&itemnum=" + document.contentForm.itemnum.value;
		request = new Request(bidPro, "bidding.do" , params , "GET" );
		request.sendRequest();
		
	}
	function bidPro(){
		
		var bid = document.getElementById("biddingprice");
		var mybid = document.getElementById("mybid");
		if( request.httpRequest.readyState == 4 ){
			if( request.httpRequest.status ==200 ){
				var msg = "";
				msg = request.httpRequest.responseText;
				bid.innerHTML = msg;
				mybid.innerHTML = msg;
			}
		}
	}
//-->
</script>

<form name="contentForm">
	<input type="hidden" name="itemnum" value="${dto.itemnum}">
	<table border="1">
		<tr>
			<th colspan="6">판매물품 View</th>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="5">${dto.title}</td>
		</tr>
		<tr>
			<th>판매자</th>
			<td colspan="2">${dto.writer}</td>
			<th>종료일자</th>
			<td colspan=2>${dto.endDate}</td>
		</tr>
		<tr>
			<th>최고 입찰 가격</th>
			<td><div id ="biddingprice">${dto.startprice}</div></td>
			<th>내 입찰 금액</th>
			<td><div id ="mybid">${mybidprice}</div></td>
		</tr>
		<tr>
			<th>즉시 구매 가격</th>
			<td>${dto.price}</td>
			<th>입찰자 수</th>
			<td>${dto.bidCount}</td>
			<th>조회 수</th>
			<td>${dto.count}</td>
		</tr>
		<tr>
			<td colspan="6">
				<input type="text" name="startprice" onkeypress="SetNum(this)">
				<input type="button" name="bidding" onclick="biddings()" value="입찰!">
			</td>
		</tr>
		<tr>
			<th colspan="6">등록 물품 내용</th>
		</tr>
		<tr>
			<td colspan="6"><pre>${dto.content}</pre></td>
		</tr>
		<tr>
			<th colspan="6">
			<c:forEach var="images" items="${images}">
				<img src="${file}${images.systemName}" border=0 style="width: 300px"> <br>
			</c:forEach>
			</th>
		</tr>
	</table>
	
</form>