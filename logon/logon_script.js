/**
 * logon
 */

var passwderror="비밀번호가 잘못되었습니다.";
var iderror="아이디가 잘못되었습니다.";

function erroralert(msg)
{
	alert(msg);
	history.back();
}


function inputcheck()
{
	if(! document.signupForm.passwd.value){
		alert("비밀번호를 입력해주세요.");
		document.signupForm.passwd.focus();
		return false;
	}
	else if(document.signupForm.passwd.value != document.signupForm.passwd2.value){
		alert("재입력 비밀번호가 다릅니다.");
		document.signupForm.passwd2.focus();
		return false;
	}
	else if(! document.signupForm.name.value){
		alert("이름을 입력 하세요.");
		document.signupForm.name.focus();
		return false;
	}
	else if(! document.signupForm.hp1.value){
		alert("핸드폰 번호를 입력하세요.");
		document.signupForm.hp1.focus();
		return false;
	}
	else if(! document.signupForm.hp2.value){
		alert("핸드폰 번호를 입력하세요.");
		document.signupForm.hp1.focus();
		return false;
	}
	else if(! document.signupForm.hp3.value){
		alert("핸드폰 번호를 입력하세요.");
		document.signupForm.hp1.focus();
		return false;
	}
	else if(!document.signupForm.zip1.value){
		alert("주소를 입력하세요.");
		document.signupForm.zip1.focus();
		return false;
	}
	else if(!document.signupForm.zip2.value){
		alert("주소를 입력하세요.");
		document.signupForm.zip2.focus();
		return false;
	}
	else if(!document.signupForm.address.value){
		alert("주소를 입력하세요.");
		document.signupForm.address.focus();
		return false;
	}
}

function confirmEmail(){
	
	
	if(!document.confirmEmailForm.email.value)
	{
		alert("email을 입력하세요.");
		confirmEmailFocus();
	}
	else
	{
		var url = "emailConfirmCheck.do?email="+document.confirmEmailForm.email.value;
		window.open( url, "randomGen", "menubar=no, toolbar=no, scrollbar=no, statusbar=no, width=300, height=200" );
	}
}
function confirmEmailFocus(){
	
	document.confirmEmailForm.email.focus();
}
function setAutho(code)
{
	opener.document.confirmEmailForm.autho.value=code;
}
function checkAutho()
{
	if(!document.confirmEmailForm.emailNumber.value){
		alert("인증번호를 입력하세요");
		document.confirmEmailForm.emailNumber.focus();
		return false;
	}else if(document.confirmEmailForm.emailNumber.value != document.confirmEmailForm.autho.value){
		alert("인증번호가 맞지 않습니다");
		return false;
	}else{
		return true;
	}
	
}
