/**
 * 경매 게시판
 */
//writeform msg var
var msg_writer_empty="작성자를 기입해주세요.";
var msg_subject_empty="제목을 기입해주세요.";
var msg_content_empty="내용을 기입해주세요.";
var msg_passwd_empty="비밀번호를 기입해주세요.";

//erroralert message var
var ac_insert_error ="경매글 작성에 실패 했습니다. \n 잠시후 다시시도해주세요";

function SetNum(obj){
	val=obj.value;
	re=/[^0-9]/gi; 
	obj.value=val.replace(re,"");
}

function erroralert(msg){
	alert(msg);
	history.back();
}
/*
function modifyfocus(){
	document.modifyform.email.focus();
}
function modifycheck(){
	if(!document.modifyform.subject.value){
		alert(msg_subject_empty);
		document.modifyform.subject.focus();
		return false;
	}else if(!document.modifyform.content.value){
		alert(msg_content_empty);
		document.modifyform.content.focus();
		return false;
	}else if(!document.modifyform.passwd.value){
		alert(msg_passwd_empty);
		document.modifyform.passwd.focus();
		return false;
	}
}

function passwdfocus(){
	document.passwdform.passwd.focus();
}

function passwdcheck(){
	if(!document.passwdform.passwd.value){
		alert(msg_passwd_empty);
		document.passwdform.passwd.focus();
		return false;
	}
}
function writefocus(){	
	document.writeform.writer.focus();
}

function writecheck(){	
	if(!document.writeform.writer.value){
		alert(msg_writer_empty);
		document.writeform.writer.focus();
		return false;
	}else if(!document.writeform.subject.value){
		alert(msg_subject_empty);
		document.writeform.subject.focus();
		return false;
	}else if(!document.writeform.content.value){
		alert(msg_content_empty);
		document.writeform.content.focus();
		return false;
	}else if(!document.writeform.passwd.value){
		alert(msg_passwd_empty);
		document.writeform.passwd.focus();
		return false;
	}
}
*/