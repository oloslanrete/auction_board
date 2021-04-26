<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>
<script src="/JR/jquery-1.11.3.js"></script>

<link rel="stylesheet" href="${main}style.css" type="text/css">
<!--상단 이미지 영역 -->
<script type="text/javascript" src="jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="jquery.banner2.js"></script>


<%
	//session.setAttribute("memId", "asd"); //세션 미리줘서 실험
	
	/*
		
	*/
%>

<h1 align="center" onclick="location='main.do'">장물 나라 </h1>

<body>
<c:if test="${sessionScope.memId == null}">
	<table class="menu" >
			<tr>
				<td><a href="#">${main_str_auctionBoard}</a></td>
				<td><a href="#">${main_str_auctionAdd}</a></td>		
				<td><a href="#">${main_str_QnA}</a></td>
				<td><a href="loginForm.do">${main_str_login}</a></td>
			</tr>
	</table>
</c:if>
<c:if test="${sessionScope.memId != null}">
	<table class="menu" style="align:center;">
			<tr>
				<td><a href="auctionlist.do">${main_str_auctionBoard}</a></td>				
				<td><a href="auctionwriteForm.do">${main_str_auctionAdd}</a></td>				
				<td><a href="emailForm.do">${main_str_QnA}</a></td>								
				<td><a href="logout.do">${main_str_logout}</a></td>
				<c:if test="${sessionScope.memId != 'admin'}">
					<td><a href="myInfo.do">${main_str_myInfo}</a></td>
				</c:if>
				<c:if test="${sessionScope.memId == 'admin'}">
					<td><a href="admin.do">${main_str_admin}</a></td>
				</c:if>
			</tr>
	</table>
	
</c:if>

<!-- 	<table class="content" border="1">
		<tr>
			<td id="tds">한칸</td>
			<td id="tds">두칸</td>
		</tr>
		<tr>
			<td id="tds">세칸</td>
			<td id="tds">네칸</td>
		</tr>
	</table>	 -->
	<div id="subflash_html">
	<div id="slideshow5" class="slideshow-wrapper2">
		<div class="wrapper-Num">  </div> 
		<div class="slideshow-wrapper-box2">
			<div  class="wrapper-li" out="image/icon02.gif" over="image/icon01.gif" >
				<div class="part zindex10" rel=0><a href="" target="_parent">
				<img src="image/mainimg01.jpg"  border="0" alt=""></a></div>
			</div>
			<div  class="wrapper-li" rel='0' out="image/icon02.gif" over="image/icon01.gif" >
				<div class="part zindex10" rel=0><a href="" target="_parent">
				<img src="image/mainimg02.jpg"  border="0" alt=""></a></div>
			</div>
			<div  class="wrapper-li" rel='0' out="image/icon02.gif" over="image/icon01.gif" >
				<div class="part zindex10" rel=0><a href="" target="_parent">
				<img src="image/mainimg03.jpg"  border="0" alt=""></a></div>
			</div>
			<div  class="wrapper-li" rel='0' out="image/icon02.gif" over="image/icon01.gif" >
				<div class="part zindex10" rel=0><a href="" target="_parent">
				<img src="image/mainimg04.jpg"  border="0" alt=""></a></div>
			</div>
			<div  class="wrapper-li" rel='0' out="image/icon02.gif" over="image/icon01.gif" >
				<div class="part zindex10" rel=0><a href="" target="_parent">
				<img src="image/mainimg05.jpg"  border="0" alt=""></a></div>
			</div>
			<div  class="wrapper-li" rel='0' out="image/icon02.gif" over="image/icon01.gif" >
				<div class="part zindex10" rel=0><a href="" target="_parent">
				<img src="image/mainimg06.jpg"  border="0" alt=""></a></div>
			</div>
			<div  class="wrapper-li" rel='0' out="image/icon02.gif" over="image/icon01.gif" >
				<div class="part zindex10" rel=0><a href="" target="_parent">
				<img src="image/mainimg07.jpg"  border="0" alt=""></a></div>
			</div>
											
		</div>
						  
	</div>
	<script type="text/javascript">
		 $(window).ready(function() {  
			   var options = {};
				options['animSpeed'] = 100; //애니시간
				options['pauseTime'] = 5000; //대기시간
				options['moveType'] = 'left'; //이동방향   top or bottom
				options['tailType'] = 'images'; //tail 버튼   number or images
				$("#slideshow5").hdamall2effect(options);
		 });		 
	</script>
</body>
