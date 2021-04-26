

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>
<script src="${auction}/auctionboard_script.js"></script>
<script src="/JR/setting/jquery-1.11.3.js"></script>
<script type="text/javascript">
<!--
	var count=0;
	
		
		
	var count = 0;

	
	$(document).ready(
		function(){
			$('#result'+count).change(
				function(){
					if(count<2){
					alert(count);
					$('#result'+count).append('<td id=result'+(++count)+'><input type="file" name="upload"></td>');		
					}
				}
			);
			
		}
	);
	
//-->
</script>
<h2>경매글 작성 페이지</h2>
<form name="auctioninputform" method="post" enctype="multipart/form-data" action="auctionwritePro.do">

	<table border=1 >
		<tr>
			<th style="width: 100px;">제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2">
			<textarea rows="15" cols="40" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<th>종료일자</th>
			<td>

			<c:set var="year" value='<%=new SimpleDateFormat("YYYY").format(new Date())%>'></c:set>
			${year} 
			<input type="hidden" name="year" value="${year}">
			/
			<select name="month">
				<c:set var="count" value="1"/>
				<c:forEach begin="1" end="12">
					<option value="${count}">${count}
					<c:set var="count" value="${count+1}"/>
				</c:forEach>
			</select>
			/
			<select name="day">
				<c:set var="count" value="1"/>
				<c:forEach begin="1" end="31">
				<option value="${count}">${count}
				<c:set var="count" value="${count+1}"/>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<th>시작가</th>
			<td>
			<input type="text" name="startprice" style="ime-mode:disabled"
					onkeypress= "SetNum(this);" 
					onblur="SetNum(this)" >
					</td>
		</tr>
		<tr>
			<th>즉시구매가</th>
			<td>
			<input type="text" name="price"
					onkeypress= "SetNum(this)" >
					</td>
		</tr>
		<tr >
			<th>파일 </th>
			<td id = "result0"><input type="file" name="upload" multiple="multiple"> </td>
		</tr>
		
		<tr>
			<th colspan="2">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</th>
		</tr>
		
		<tr>
	</table>
</form>