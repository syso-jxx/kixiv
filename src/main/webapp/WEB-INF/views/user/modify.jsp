<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="UTF-8">
<%@include file="../include/option.jsp" %>
<script src="/resources/asset/js/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Bootstrap CSS -->

<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.btn1{
	display:flex;
	align-items:flex-end;
}


.check_success{
		border-color: #28a745;
	    padding-right: calc(1.5em + .75rem);
	    background-image: url(https://upload.wikimedia.org/wikipedia/commons/5/59/Feedbin-Icon-check.svg);
	    background-repeat: no-repeat;
	    background-position: center right calc(.375em + .1875rem);
	    background-size: calc(.75em + .375rem) calc(.75em + .375rem);
}

.check_fail{
		border-color: #dc3545;
	    padding-right: calc(1.5em + .75rem);
	    background-image: url(https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg);
	    background-repeat: no-repeat;
	    background-position: center right calc(.375em + .1875rem);
	    background-size: calc(.75em + .375rem) calc(.75em + .375rem);
}

.check_msg{
	font-size : 12px;
	color : red;
}

</style>

<script>

	$(function(){
		$("#password").change(function(){
			$("#pwd_check").removeClass("check_success");	
			$("#pwd_check").removeClass("check_fail");	
			$("#pwdCheck_msg").text("")
		});
		
		// 비밀번호 정규식 확인
		$("#password").focusout(function(){
			$(this).removeClass("check_success");	
			$(this).removeClass("check_fail");
			$("#pwd_msg").text("");
			
			var password = $("#password").val();
			
			if($(this).val() != ''){
				// 비밀번호 정규식(8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.)
				var pwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
				
				if(pwdCheck.test(password)){
					$("#password").addClass("check_success");
				}else{
					$("#password").addClass("check_fail");
	        		$("#pwd_msg").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
				}
			}
		});

		// 비밀번호 확인
		$("#pwd_check").focusout(function(){
			$(this).removeClass("check_success");	
			$(this).removeClass("check_fail");	
			$("#pwdCheck_msg").text("")
			
			if($(this).val() != ''){
				if($(this).val() == $("#password").val()){
					$(this).addClass("check_success");
				}else{
					$(this).addClass("check_fail");
					$("#pwdCheck_msg").text("비밀번호가 일치하지 않습니다.")
				}
			}
		});

		// 이름 정규식 확인
		$("#name").focusout(function(){
			$(this).removeClass("check_success");	
			$(this).removeClass("check_fail");
			$("#name_msg").text("");
			
			var name = $("#name").val();
			
			if($(this).val() != ''){
				// 이름 정규식(2~6자의 한글만 사용 가능합니다.)
				var nameCheck = RegExp(/^[가-힣]{2,6}$/);
				
				if(nameCheck.test(name)){
					$("#name").addClass("check_success");
				}else{
					$("#name").addClass("check_fail");
	        		$("#name_msg").text("2~6자의 한글만 사용 가능합니다.");
				}
			}
			
		});
		
		// 휴대폰 번호 정규식 확인
		$("#phone").focusout(function(){
			$(this).removeClass("check_success");	
			$(this).removeClass("check_fail");
			$("#phoneCheck_msg").text("");
			
			var phone = $("#phone").val();
			
			if($(this).val() != ''){
				// 휴대폰 번호 정규식(01로 시작하여 그 다음은 0,1,7,9 중 하나와 매칭되는지 체크한뒤 7~8자리인지 검사)
				var phonNumberCheck = RegExp(/^01[0179]-[0-9]{3,4}-[0-9]{4}$/);
				
				if(phonNumberCheck.test(phone)){
					$("#phone").addClass("check_success");
				}else{
					$("#phone").addClass("check_fail");
	        		$("#phoneCheck_msg").text("휴대폰 번호를 입력양식에 맞게 작성하시오 ex) 010-1234-1234 or 010-123-1234");
				}
			}
		});
		

		// 이메일 정규식 및 중복 체크
		$("#email").focusout(function(){
			$(this).removeClass("check_success");	
			$(this).removeClass("check_fail");
			$("#email_msg").text("");

			var email = $("#email").val();
			var myEmail = $("input[name=myEmail]").val();
			
			if(email == myEmail){
        		$("#email").addClass("check_success");
			}else{

				if($(this).val() != ''){
					// 이메일 검사 정규식(이메일 형식에 맞게 썻는지 검사 ex)aa01@aa.aa)
					var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
					
					if(emailCheck.test(email)){
						$("#email").addClass("check_success");
// 						var param = "";
// 						param += "dummy=" + Math.random();
// 				        param += "&email=" + email;
// 					    $.ajax({
// 					        url: "/emailCheck",
// 					        type: "POST",
// 					        data: param,
// 					        success: function(data){
// 					        	if(data == 'ok'){
// 					        		$("#email").addClass("check_fail");
// 					        		$("#email_msg").text("현재 사용중이거나 탈퇴한 회원의 email입니다.")
// 					        	}else{
// 					        		$("#email").addClass("check_success");
// 					        	}
// 					        },
// 					        error: function(){
// 					            alert("실패ㅜㅜ err");
// 					        }
// 					    });
					}else{
						$("#email").addClass("check_fail");
		        		$("#email_msg").text("이메일 형식에 맞추어 작성하시오");
					}
				}
			}
		});


	});

	function submitCheck() {
		var form = document.getElementById("form");
		var user_id = document.getElementById("user_id");
		var password = document.getElementById("password");
		var pwd_check = document.getElementById("pwd_check");
		var name = document.getElementById("name");
		var nickname = document.getElementById("nickname");
		var phone = document.getElementById("phone");
		var email = document.getElementById("email");
		var zip = document.getElementById("zip");
		var add1 = document.getElementById("add1");
		var add2 = document.getElementById("add2");

		//검중(Validation)
		if(!password.classList.contains("check_success")){
			swal.fire({
				text:"비밀번호를 입력 양식에 맞게 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			password.focus();
			return;
		}
		if(!pwd_check.classList.contains("check_success")){
			swal.fire({
				text:"비밀번호 확인을 입력 양식에 맞게 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			pwd_check.focus();
			return;
		}
		if(!name.classList.contains("check_success")){
			swal.fire({
				text:"이름을 입력 양식에 맞게 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			name.focus();
			return;
		}
		if(!phone.classList.contains("check_success")){
			swal.fire({
				text:"휴대폰 번호를 형식에 맞게 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			phone.focus();
			return;
		}
		if(!email.classList.contains("check_success")){
			swal.fire({
				text:"이메일을 입력 양식에 맞게 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			email.focus();
			return;
		}
		if(zip.value == ''){
			swal.fire({
				text:"우편번호를 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			zip.focus();
			return;
		}
		if(add1.value == ''){
			swal.fire({
				text:"주소를 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			add1.focus();
			return;
		}
		
		form.submit();
	}
	
	function goPopup(){
		//카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	console.log(data);
                document.getElementById("zip").value = data.zonecode; // 주소 넣기
                document.getElementById("add1").value = data.address; // 주소 넣기
                document.getElementById("add2").focus(); //상세입력 포커싱
            }
        }).open();
	}

	
</script>
<title>KIXIV - 세상의 모든 사진</title>
</head>
<body>
<!--  -->
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<form name="form" id="form" class="validation-form" action="/user/modify" method="post" autocomplete="off">
				
					<div>
						<h4 class="mb-3" style="display:inline-block;">회원 정보 수정</h4>
					</div>
					<div class="row">
						<div class="col-md-5">
							<label for="user_id">아이디</label> 
							<input type="text" name="user_id" class="form-control" id="user_id" value="${userVO.user_id}" readonly required>
						</div>
					</div>
					<div>
						<p id="id_msg" class="check_msg"></p>
					</div>
					
					<div class="row">
						<div class="col-md-5">
							<div>
								<label for="password">비밀번호</label> 
								<input type="password" name="password" class="form-control" id="password" placeholder="" required>
							</div>
							<div>
								<p id="pwd_msg" class="check_msg"></p>
							</div>
						</div>
						
						<div class="col-md-5">
							<div>
								<label for="pwd_check">비밀번호 확인</label> 
								<input type="password" name="pwd_check" class="form-control" id="pwd_check" placeholder="" required>
								<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
							</div>
							<div>
								<p id="pwdCheck_msg" class="check_msg"></p>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-5">
							<div>
								<label for="name">이름</label> 
								<input type="text" class="form-control check_success" name="name" id="name" value="${userVO.name}" required>
							</div>
							<div>
								<p id="name_msg" class="check_msg"></p>
							</div>
						</div>
						<div class="col-md-4">
							<div>
								<label for="nickname">별명</label> 
								<input type="text" class="form-control" name="nickname" id="nickname" value="${userVO.nickname}" required readonly>
							</div>
							<div>
								<p id="nickname_msg" class="check_msg"></p>
							</div>
						</div>
					</div>

					<div class="mb-3">
						<div>
							<label for="phone">핸드폰 번호</label> 
							<input type="text" class="form-control check_success" name="phone" id="phone" placeholder="01X-0000-0000 or 01X-000-0000"	value="${userVO.phone}" required>
						</div>
						<div>
							<p id="phoneCheck_msg" class="check_msg"></p>
						</div>
					</div>

					<div class="mb-3">
						<div>
							<label for="email">이메일</label> 
							<input type="email"	class="form-control check_success" name="email" id="email" placeholder="you@example.com" value="${userVO.email}" required>
							<input type="hidden" name="myEmail" value="${userVO.email}">
						</div>
						<div>
							<p id="email_msg" class="check_msg"></p>
						</div>
					</div>

					<div class="mb-3">
						<div>
							<label for="sns_add">SNS<span class="text-muted">&nbsp;(필수아님)</label> 
							<input type="text"	class="form-control" id="sns_add" name="sns_add"  value="${userVO.sns_add}">
						</div>
						<div>
							<p id="snsCheck_msg" class="check_msg"></p>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="zip">우편번호</label> 
							<input type="text" class="form-control" name="zip" id="zip" placeholder="주소 입력" value="${userVO.zip}" readonly>
							<div class="invalid-feedback">우편번호를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3 btn1">
							<button type="button" class="btn btn-primary" onclick="goPopup()">검색</button>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="add1">주소</label> 
							<input type="text" class="form-control" name="add1" id="add1" value="${userVO.add1}" readonly>
							<div class="invalid-feedback">주소를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="add2">상세주소<span class="text-muted">&nbsp;(필수아님)</span></label> 
							<input type="text" class="form-control" name="add2" id="add2" placeholder="상세주소를 입력해주세요." value="${userVO.add2}">
						</div>
					</div>
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="submitCheck()">수정</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>