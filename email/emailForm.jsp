<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/setting/setting.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> ${qna_header}</title>
</head>
<body>
    <center>
        <h1>${qna_title}</h1>
        <form method="post" action="emailPro.do">
            <table border="0" width="80%">
                <tr>
                    <td>${qna_to}</td>
                    <td><input type="text" name="recipient" size="65" /></td>
                </tr>
                <tr>
                    <td>${qna_subject}</td>
                    <td><input type="text" name="subject" size="65" /></td>
                </tr>
                <tr>
                    <td>${qna_message}</td>
                    <td><textarea cols="50" rows="10" name="message"></textarea></td>
                </tr>               
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="${qna_send}" />
                        <input type="button" value="${qna_send_cancel}" />
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>