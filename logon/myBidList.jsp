<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp" %>
<script src="logon/logon_script.js"></script>
<script src="/JR/setting/request.js"></script>
<h2>내 입찰 목록</h2>
<script type="text/javascript">
<!--
	var request = null;
	var request2 = null;
	var remainTime = null;
	var timeindex = 0;
	var otherindex = 0;

	var pageSize=${pageSize};
	
	function checking(){
		//alert('checking');
		getRemainTime();
		setInterval(countdown,1000);
		
		getOtherValues();
	}
	function getRemainTime()
	{
		//alert('getRemainTime');
		var params="";
		var i;
		for(i=0; i<pageSize; i++)
		{
			if(document.getElementById("itemnum"+i) != null)
			{
				
				params = "itemnum="+document.getElementById("itemnum"+i).value;
				//alert(params);
				timeindex=i;
				request = new Request(setRemainTime, "getRemainTime.do" , params , "GET" );
				request.sendRequest();
			}
		}
	}
	function setRemainTime()
	{
		//alert('setRemainTime'+timeindex);
		var remainTimeElement=remainTime=document.getElementById("remaintime"+timeindex);
		//alert(remainTimeElement);
		if( request.httpRequest.readyState == 4 ){
			
			if( request.httpRequest.status ==200 ){
				//alert();
				var msg = "";
				msg = request.httpRequest.responseText;
				//alert(msg);
				remainTime=Number(msg);
				msg=TimeToString(msg);
				remainTimeElement.innerHTML=msg;
			}
		}
	}
	function TimeToString(time)
	{
		
		var msg="";
		time=Number(time);
		//alert(time);
		
		if(time>86400)
		{
			msg+=Math.floor(time/86400)+"일";
		}
		else if(time>3600)
		{
			msg+=Math.floor(time/3600)+"시간";
		}
		else
		{
			msg+=Math.floor(time/60)+"분 "+time%60+"초";
		}
		//msg+=Math.floor(time/60)+"분 "+time%60+"초";
		return msg;
	}
	
	function countdown()
	{
		var remainTimeElement;
		var i;
		for(i=0; i<pageSize; i++)
		{
			remainTimeElement = document.getElementById("remaintime"+i);
			var msg="";
			if(remainTime!=null && typeof remainTime == 'number')
			{
				//alert(remainTime);
				remainTime--;
				msg+=TimeToString(remainTime);
				remainTimeElement.innerHTML=msg;	
			}
		}
		
	}
	function getOtherValues()
	{
		var params = "";
		var i;
		for(i=0; i<pageSize; i++)
		{
			if(document.getElementById("itemnum"+i) != null)
			{
				//alert();
				params = "itemnum="+document.getElementById("itemnum"+i).value;
				otherinde=i;
				request2 = new Request(setOtherValues, "getOtherValue.do" , params , "GET" );
				request2.sendRequest();
			}
		}
	}
	function setOtherValues()
	{
		//alert('setOtherValues');
		
		var msg="";
		var kingBidElement=document.getElementById("king"+otherindex);
		var readCountElement=document.getElementById("readcount"+otherindex);
		var bidCountElement=document.getElementById("bidcount"+otherindex);
		if( request2.httpRequest.readyState == 4 ){
			if( request2.httpRequest.status ==200 ){
				msg = request2.httpRequest.responseText;
				//alert(msg);
				var resArr=msg.split(" ");
				//alert(resArr);
				
				kingBidElement.innerHTML=resArr[0]+"<br>입찰금:"+resArr[1]+"gold";
				readCountElement.innerHTML=resArr[2];
				bidCountElement.innerHTML=resArr[3];
			}
		}
		
	}
//-->
</script>
<body onload="checking()">
<table border="1">
	<tr>
		<th style="width:7%"> ${mya_str_number} </th>
		<th > ${mya_str_subject} </th>
		<th > ${mya_str_writer} </th>
		<th > ${mya_str_mybidprice} </th>
		<th > ${mya_str_kingbidder} </th>
		<th > ${mya_str_remaintime} </th>
		<th > ${mya_str_reg_date} </th>
		<th > ${mya_str_end_date} </th>
		<th > ${mya_str_readcount} </th>
		<th > ${mya_str_bidcount} </th>
		<th > ${mya_str_status} </th>
	</tr>
	<c:if test="${count == 0}">
		<tr>
			<td colspan="11" style="text-align:center">
				${mya_msg_list_x} 
			</td>
		</tr>
	</c:if>				
	<c:if test="${count != 0}">
		<c:forEach var="dto" items="${myAuctions}" varStatus="status">
			<tr>
				<td style="text-align:center"> 
					${number}
					<c:set var="number" value="${number-1}"/>
				</td>
				<td style="text-align:center">
					<input type="hidden" id="itemnum${status.index}" value="${dto.itemnum}">
					<a href="auctionContent.do?itemnum=${dto.itemnum}" >${dto.title}</a>
				</td>				
				<td style="text-align:center">
					${dto.writer}
				</td>
				<td style="text-align:center">
					${dto.bidprice}
				</td>
				<td style="text-align:center">
					<!-- 최상위 입찰자 및 금액 -->
					<div id="king${status.index}"></div>
				</td>
				<td style="text-align:center">
					<!-- 남은시간 -->
					<div id="remaintime${status.index}"></div>
				</td>
				<td style="text-align:center">
					<fmt:formatDate value="${dto.regDate}"
						pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td style="text-align:center">
					<fmt:formatDate value="${dto.endDate}"
						pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td style="text-align:center">
					<!-- readcount -->
					<div id="readcount${status.index}"></div>
				</td>
				<td style="text-align:center">
					<!-- bidcount -->
					<div id="bidcount${status.index}"></div>
				</td>
				<td style="text-align:center">
					<!-- 경매 상황  -->
					<div id="status${status.index}"></div>
				</td>
			</tr>				
		</c:forEach>
	</c:if>
</table>

<br>

<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="myAuctionlist.do?mode=bid&pageNum=1">[◀◀]</a>
		<a href="myAuctionlist.do?mode=bid&pageNum=${startPage-pageBlock}">[◀]</a>			
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>
		<c:if test="${i != currentPage}">
			<a href="myAuctionlist.do?mode=bid&pageNum=${i}">[${i}]</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${pageCount > endPage }">
		<a href="myAuctionList.do?mode=bid&pageNum=${startPage+pageBlock}">[▶]</a>
		<a href="myAuctionList.do?mode=bid&pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if>
<br>
<input type="button" value="${mya_btn_tomain}" onclick="location='main.do'">
<input type="button" value="${mya_btn_toinfo}" onclick="location='myInfo.do'">
<input type="button" value="${mya_btn_toauction}" onclick="location='myAuctionList.do?mode=sell'">
</body>