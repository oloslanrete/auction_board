<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>
<h2> 충전 페이지 </h2>

<form method="post" action="cashPro.do">
	<input type="hidden" name="email" value="${sessionScope.memId}">
	<table>		
		<tr>
			<th> ${cash_charge} </th>
			<td>
				<input type="radio" name="cash_type" value="1" checked="checked">
					<select name="cash_select">
						<option value="5000">5000원</option>
						<option value="10000">10000원</option>
						<option value="30000">30000원</option>
						<option value="50000">50000원</option>
					</select>
				<input type="radio" name="cash_type" value="2">
					<input type="text" name="cash_money" placeholder="직접입력">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="${cash_btn_charge}">
				<input type="button" value="${cash_btn_cancel}" onclick="location='main.do'">
			</th>
		</tr>
	</table>
</form>
