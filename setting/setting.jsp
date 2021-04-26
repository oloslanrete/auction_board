<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="project" value="장물나라"/>

<!-- main -->
<c:set var="main" value="/JR/main/"/> 
<c:set var="main_str_login" value="로그인"/>
<c:set var="main_str_logout" value="로그아웃"/>
<c:set var="main_str_auctionBoard" value="경매 게시판"/>
<c:set var="main_str_QnA" value="문의사항"/>
<c:set var="main_str_myInfo" value="나의 정보"/>
<c:set var="main_str_auctionAdd" value="경매 등록"/>
<c:set var="main_str_admin" value="관리자 페이지"/>
<c:set var="main_str_myInfo" value="내 정보 보기"/>
<c:set var="main_str_signup" value="회원 가입"/>

<!-- logon -->
<c:set var="logon" value="/JR/logon/"/> 
<c:set var="logon_str_passwd" value="비밀번호"/>
<c:set var="logon_str_passwdCheck" value="비밀번호 확인"/>
<c:set var="logon_str_name" value="이름"/>
<c:set var="logon_str_tel" value="핸드폰 번호"/>
<c:set var="logon_str_zipcode" value="우편 번호"/>
<c:set var="logon_btn_zipcode_search" value="우편번호 검색"/>
<c:set var="logon_str_address" value="주소"/>
<c:set var="logon_btn_signup_ok" value="확인"/>
<c:set var="logon_btn_signup_cancel" value="취소"/>
<c:set var="logon_btn_ok" value="로그인"/>
<c:set var="logon_btn_cancel" value="취소"/>
<c:set var="logon_str_email" value="이메일"/>
<c:set var="logon_btn_signup" value="회원가입"/>
<c:set var="logon_btn_close" value="닫기"/>

<!-- myboard -->
<c:set var="my" value="/JR/myboard/"/>  

<!-- auctionboard -->
<c:set var="file" value="/JR/file/"/>
<c:set var="auction" value="/JR/auctionboard/"/>

<!-- myAuctionList -->
<c:set var="mya_msg_list_x" value="진행중인 경매가 없습니다."/>
<c:set var="mya_str_number" value="번호"/>
<c:set var="mya_str_subject" value="제목"/>
<c:set var="mya_str_reg_date" value="등록일자"/>
<c:set var="mya_str_end_date" value="종료 시간"/>
<c:set var="mya_str_readcount" value="조회수"/>
<c:set var="mya_str_writer" value="작성자"/>
<c:set var="mya_str_mybidprice" value="내 입찰금"/>
<c:set var="mya_str_kingbidder" value="최고 입찰자"/>
<c:set var="mya_str_remaintime" value="남은시간"/>
<c:set var="mya_str_bidcount" value="입찰수"/>
<c:set var="mya_str_status" value="상태"/>
<c:set var="mya_btn_tomain" value="메인으로"/>
<c:set var="mya_btn_toinfo" value="개인정보보기"/>
<c:set var="mya_btn_toauction" value="내 경매 보기"/>
<c:set var="mya_btn_tobid" value="내 입찰 보기"/>

<!-- mail -->
<c:set var="mail" value="/JR/mail/"/> 
<c:set var="mail_str_email" value="E-mail"/>
<c:set var="mail_str_confirmNumber" value="인증번호"/>
<c:set var="mail_btn_confirmEmail" value="인증번호 전송"/>
<c:set var="mail_btn_confirmEmail_ok" value="확인"/>
<c:set var="mail_btn_confirmEmail_cancel" value="취소"/>
<c:set var="mail_str_emailCheck" value="E-mail 인증"/>

<!-- QnA -->
<c:set var="qna_header" value="장물나라 - QnA"/>
<c:set var="qna_title" value="문의 메일 보내기"/>
<c:set var="qna_to" value="Email : "/>
<c:set var="qna_subject" value="문의 사항 제목 :"/>
<c:set var="qna_message" value="문의 사항 내용 :"/>
<c:set var="qna_send" value="작성 완료"/>
<c:set var="qna_send_cancel" value="작성 취소"/>

<!-- 경매 리스트  -->
<c:set var="ac_page_list" value="경매장"/>
<c:set var="ac_str_write" value="경매물품 등록"/>
<c:set var="ac_str_item" value="물&nbsp;품"/>
<c:set var="ac_str_startprice" value="최고 입찰가"/>
<c:set var="ac_str_price" value="즉구가"/>
<c:set var="ac_str_bidderCount" value="입찰자 수"/>
<c:set var="ac_str_seller" value="판매자"/>
<c:set var="ac_str_endDay" value="종료일시"/>
<c:set var="ac_msg_auctionlist_empty" value="진행중인 경매가 없습니다"/>

<!-- admin -->
<c:set var="admin_str_search" value="Email 입력"/>
<c:set var="admin_btn_search" value="검색"/>
<c:set var="admin_str_searchresult" value="검색 결과"/>
<c:set var="admin_str_result_email" value="사용자 Email"/>
<c:set var="admin_str_result_name" value="사용자 이름"/>
<c:set var="admin_str_result_rank" value="사용자 등급"/>
<c:set var="admin_btn_change_rank" value="등급 변경"/>
<c:set var="admin_btn_delete_content" value="글 삭제"/>

<!-- myInfo -->
<c:set var="my_gold" value="내 골드"/>
<c:set var="my_rank" value="내 등급"/>
<c:set var="my_email" value="Email"/>
<c:set var="my_passwd" value="비밀번호"/>
<c:set var="my_repasswd" value="비밀번호 확인"/>
<c:set var="my_name" value="이름"/>
<c:set var="my_hp" value="핸드폰 번호"/>
<c:set var="my_address" value="주소"/>
<c:set var="my_btn_modify" value="수정"/>
<c:set var="my_btn_modify_cancel" value="취소"/>
<c:set var="my_btn_myauction" value="내 경매보기"/>
<c:set var="my_btn_gold" value="충전하기"/>

<!-- cash -->
<c:set var="cash_charge" value="충전 페이지"/>
<c:set var="cash_btn_charge" value="충전하기"/>
<c:set var="cash_btn_cancel" value="충전취소"/>
