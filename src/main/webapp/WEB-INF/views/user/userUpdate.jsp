<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KIXIV - 세상의 모든 사진</title>
<script>
function submit() {
	var form = document.getElementById("signup_form");
	
	//검중(Validation)

	if(form.userpw.value == ""){
		form.userpw.focus();
		alert("비밀번호를 입력해주세요")
		return;
	}
	
	if(form.name.value == ""){
		form.username.focus();
		alert("이름을 입력해주세요")
		return;
	}
	
	if(form.address.value == ""){
		form.address.focus();
		alert("주소를 입력해주세요")
		return;
	}
	
	if(form.tel.value == ""){
		form.phone.focus();
		alert("전화번호를 입력해주세요")
		return;
	}
	
	form.submit();
}
</script>
<title>정보수정</title>
</head>
<h1>정보수정</h1>
<body>
	<form id="signup_form" action="" method="post">
		<input type="hidden" name="userid"  value="${item.userid">
		<label>패스워드</label>
		<input type="password" name="userpw" value="${item.userpw" placeholder="비밀번호를 입력해 주세요" >
		<br/>
		<label>이름</label>
		<input type="text" name="name" value="${item.name" placeholder="이름를 입력해 주세요">
		<br/>
		<label>주소</label>
		<input type="text" name="address" value="${item.address" placeholder="주소를 입력해 주세요">
		<br/>
		<label>전화번호</label>
		<input type="text" name="tel" value="${item.tel" placeholder="전화번호를 입력해 주세요">
		<br/>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>