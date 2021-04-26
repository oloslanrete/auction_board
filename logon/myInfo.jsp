<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>

<c:set var="hp" value="${dto.hp}"/>
<c:set var="zip" value="${dto.zipcode}"/>

<h2>${main_str_myInfo}</h2>

<form>
	<table>
		<tr><th align="right"> <input type="button" value="${my_btn_myauction}" onclick="location='myAuctionList.do'"> 
			<input type="button" value="${my_btn_gold}" onclick="location='cash.do'"></th></tr> 
		<tr>
			<th> ${my_gold} </th>
			<td> <input style="width:80px" type="text" name="my_gold" value="${dto.gold}" readonly="readonly"> </td>
			<th> ${my_rank} </th>
			<td> <input style="width:60px" type="text" name="my_rank" value="${dto.rank}" readonly="readonly"> </td>
		</tr>
	</table>
</form>
<form name="myInfoForm" action="myInfoPro.do" method="post">
	<table>
		<tr>
			<th> ${my_email}</th>
			<td> <input type="text" name="my_email" value="${dto.email}" readonly="readonly">
		</tr>
		<tr>
			<th> ${my_passwd}</th>
			<td> <input type="password" name="my_passwd" value="${dto.passwd}">
		</tr>
		<tr>
			<th> ${my_repasswd}</th>
			<td> <input type="password" name="my_repasswd">
		</tr>
		<tr>
			<th> ${my_name}</th>
			<td> <input type="text" name="my_name" value="${dto.name}" readonly="readonly">
		</tr>
		
		<tr>
			<th> ${my_hp} </th>
			<td> <input style="width:50px" type="text" name="my_hp1" value="${fn:substring(hp,0,3)}" maxlength="3"> 
			- <input style="width:50px" type="text" name="my_hp2" value="${fn:substring(hp,4,8)}" maxlength="4"> 
			- <input style="width:50px" type="text" name="my_hp3" value="${fn:substring(hp,9,13)}" maxlength="4">
		</tr>
		<tr>
			<th> ${my_address}</th>
			<td> <input style="width:200px" type="text" name="my_address" value="${dto.address}"><br>
				<input style="width:50px" type="text" name="my_zip1" maxlength="3" value="${fn:substring(zip,0,3)}"> - 
				<input style="width:50px" type="text" name="my_zip2" maxlength="3" value="${fn:substring(zip,4,7)}">
			</td>
		</tr>		
		<tr>
			<th colspan="2"> <input type="submit" value="${my_btn_modify}">
				<input type="button" value="${my_btn_modify_cancel}" onclick="location='main.do'">
			</th>
		</tr>
	</table>
</form>