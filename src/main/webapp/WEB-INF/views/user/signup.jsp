<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KIXIV - 세상의 모든 사진</title>
<%@include file="../include/option.jsp"%>
<script src="asset/js/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
	    background-image: url(asset/images/check.svg);
	    background-repeat: no-repeat;
	    background-position: center right calc(.375em + .1875rem);
	    background-size: calc(.75em + .375rem) calc(.75em + .375rem);
}

.check_fail{
		border-color: #dc3545;
	    padding-right: calc(1.5em + .75rem);
	    background-image: url(asset/images/x.svg);
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
		
		// 정규식 및 중복 체크
		// 아이디 정규식 확인
		$("#user_id").focusout(function(){
			$(this).removeClass("check_success");	
			$(this).removeClass("check_fail");	
			$("#id_msg").text("")
			
			var user_id = $("#user_id").val();
			
			if($(this).val() != ""){
				//아이디 정규식(5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.)
				var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
				
				if(userIdCheck.test(user_id)){
					fn_idCheck(user_id);
				}else{
					$("#id_msg").text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.")
				}
			}
		});
		
		// 아이디 중복 확인
		function fn_idCheck(user_id){
			var param = "";
			param += "dummy=" + Math.random();
	        param += "&user_id=" + user_id;
		    $.ajax({
		        url: "idCheck",
		        type: "POST",
		        data: param,
		        success: function(data){
		        	if(data == 'ok'){
		        		$("#user_id").addClass("check_success");
		        	}else{
		        		$("#user_id").addClass("check_fail");
		        		$("#id_msg").text("이미 사용중이거나 탈퇴한 아이디입니다.")
		        	}
		        },
		        error: function(){
		            alert("실패ㅜㅜ err");
		        }
		    });
		}
		
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
		
		// 별명 정규식 확인
		$("#nickname").focusout(function(){
			$(this).removeClass("check_success");	
			$(this).removeClass("check_fail");	
			$("#nickname_msg").text("")
			
			var nickname = $("#nickname").val();
			
			if($(this).val() != ""){
				// 닉네임 정규식(2~10자 한글과 영어, 숫자만 사용 가능합니다.)
				var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
				
				if(nickNameCheck.test(nickname)){
					fn_nicknameCheck(nickname);
				}else{
					$("#nickname_msg").text("2~10자 한글과 영어, 숫자만 사용 가능합니다.")
				}
			}
		});
		
		
		var nick = $("input[name=nick]").val();
		
		
		// 별명 중복 확인
		function fn_nicknameCheck(nickname){
			var param = "";
			param += "dummy=" + Math.random();
	        param += "&nickname=" + nickname;
		    $.ajax({
		        url: "nicknameCheck",
		        type: "POST",
		        data: param,
		        success: function(data){
		        	if(data == 'ok'){
		        		$("#nickname").addClass("check_success");
		        	}else{
		        		$("#nickname").addClass("check_fail");
		        		$("#nickname_msg").text("이미 사용중인 닉네임입니다.")
		        	}
		        },
		        error: function(){
		            alert("실패ㅜㅜ err");
		        }
		    });
		}
		
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
		
		// 정규식 및 중복 체크
		$("#email").focusout(function(){
			$(this).removeClass("check_success");	
			$(this).removeClass("check_fail");
			$("#email_msg").text("");
			
			var email = $("#email").val();
			
			if($(this).val() != ''){
				// 이메일 검사 정규식(이메일 형식에 맞게 썻는지 검사 ex)aa01@aa.aa)
				var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
				
				if(emailCheck.test(email)){
					$("#email").addClass("check_success");
// 					var param = "";
// 					param += "dummy=" + Math.random();
// 			        param += "&email=" + email;
// 				    $.ajax({
// 				        url: "emailCheck",
// 				        type: "POST",
// 				        data: param,
// 				        success: function(data){
// 				        	if(data == 'ok'){
// 				        		$("#email").addClass("check_fail");
// 				        		$("#email_msg").text("현재 사용중이거나 탈퇴한 회원의 email입니다.")
// 				        	}else{
// 				        		$("#email").addClass("check_success");
// 				        	}
// 				        },
// 				        error: function(){
// 				            alert("실패ㅜㅜ err");
// 				        }
// 				    });
				}else{
					$("#email").addClass("check_fail");
	        		$("#email_msg").text("이메일 형식에 맞추어 작성하시오");
				}
			}
		});
	
		// 이메일 인증번호 확인
		$("#tmpCheck").focusout(function(){
			$(this).removeClass("check_success");	
			$(this).removeClass("check_fail");	
			$("#tmpCheck_msg").text("")
			
			if($(this).val() != ''){
				if($(this).val() == $("#tempKey").val()){
					$(this).addClass("check_success");
				}else{
					$(this).addClass("check_fail");
					$("#tmpCheck_msg").text("인증번호가 일치하지 않습니다.")
				}
			}
		});
	
	});
	
	
	function certifyEmail(){
		
		if($("#email_msg").text() != ''){
			return
		}
		
		var email = $("#email").val();
		
		var param = "";
		param += "dummy=" + Math.random();
        param += "&email=" + email;
	    $.ajax({
	        url: "certifyEmail",
	        type: "POST",
	        data: param,
	        success: function(tempKey){
	        	swal.fire({
					text:"이메일 인증번호를 발송했습니다.",
					icon:"success", 
					confirmButtonText:"확인"
				});
	        	$("#tempKey").val(tempKey)
	        },
	        error: function(){
	        	swal.fire({
					text:"이메일 인증번호를 발송하지 못했습니다. 다시 시도해 주세요.",
					icon:"error", 
					confirmButtonText:"확인"
				});
	        }
	    });
	}

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
		var tmpCheck = document.getElementById("tmpCheck");
		var sns_add = document.getElementById("sns_add");
		var user_level = $("input[name=user_level]:checked").val();

		//검중(Validation)
		if(!user_id.classList.contains("check_success")){
			swal.fire({
				text:"아이디를 입력 양식에 맞게 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			user_id.focus();
			return;
		}
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
		if(!nickname.classList.contains("check_success")){
			swal.fire({
				text:"닉네임을 입력 양식에 맞게 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			nickname.focus();
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
		if(!tmpCheck.classList.contains("check_success")){
			swal.fire({
				text:"인증번호를 정확히 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			tmpCheck.focus();
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
		
		var param = "";
		param += "dummy=" + Math.random();
        param += "&user_id=" + user_id.value;
        param += "&password=" + password.value;
        param += "&name=" + name.value;
        param += "&nickname=" + nickname.value;
        param += "&phone=" + phone.value;
        param += "&email=" + email.value;
        param += "&zip=" + zip.value;
        param += "&add1=" + add1.value;
        param += "&add2=" + add2.value;
        param += "&sns_add=" + sns_add.value;
        param += "&user_level=" + user_level;
        
	    $.ajax({
	        url: "signup",
	        type: "POST",
	        data: param,
	        success: function(data){
	        	if(data == 'ok'){
					swal.fire({
						text:user_id.value + "님 회원가입이 완료되었습니다.",
						icon:"success", 
						confirmButtonText:"확인",
						timer: 5000
					}).then((result) => {
			        	location.href="/login"
					});
	        	}else{
					swal.fire({
						text:"회원가입을 완료하지 못했습니다. 다시 시도해 주세요.",
						icon:"error", //"info,success,warning,error,question" 중 택1
						confirmButtonText:"확인"
					}).then((result) => {
			        	location.href="/login"
					});
	        	}
	        },
	        error: function(){
	            alert("실패ㅜㅜ err");
	        }
	    });
	}
	
	function goPopup(){
		//다음 지도 검색
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
				<form name="form" id="form" class="validation-form" action="/signup" method="post" autocomplete="off">
					<div>
						<h4 class="mb-3" style="display:inline-block;">회원가입</h4>
						<div style="display:inline-block;margin-left:100px;">
							<input type="radio" name="user_level" value="u" checked> 일반회원&nbsp;&nbsp;
							<input type="radio" name="user_level" value="g"> 갤러리회원
						</div>
					</div>
				
					<!-- 이메일 인증 임시번호  -->
					<input type="hidden" name="tempKey" id="tempKey">
				
					<div class="row">
						<div class="col-md-5 mr-3">
							<div>
								<label for="user_id">아이디</label> 
								<input type="text" name="user_id" class="form-control" id="user_id" placeholder="" required>
							</div>
							<div>
								<p id="id_msg" class="check_msg"></p>
							</div>
						</div>
						<div class="col-md-5">
							<div>
								<label for="sns_add">SNS<span class="text-muted">&nbsp;(필수아님)</label> 
								<input type="text"	class="form-control" id="sns_add" name="sns_add" placeholder="">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-5 mr-3">
							<div>
								<label for="password">비밀번호</label> 
								<input type="password" name="password" class="form-control" id="password" placeholder="" required>
							</div>
							<div>
								<p id="pwd_msg" class="check_msg">5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능</p>
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
						<div class="col-md-5 mr-3">
							<div>
								<label for="name">이름</label> 
								<input type="text" class="form-control" name="name" id="name" placeholder="" value="" required>
							</div>
							<div>
								<p id="name_msg" class="check_msg"></p>
							</div>
						</div>
						<div class="col-md-4">
							<div>
								<label for="nickname">별명</label> 
								<input type="text" class="form-control" name="nickname" id="nickname" placeholder="" value="" required>
							</div>
							<div>
								<p id="nickname_msg" class="check_msg"></p>
							</div>
						</div>
					</div>

					<div class="mb-3">
						<div>
							<label for="phone">핸드폰 번호</label> 
							<input type="text" class="form-control" name="phone" id="phone" placeholder="01X-0000-0000 or 01X-000-0000"	required>
						</div>
						<div>
							<p id="phoneCheck_msg" class="check_msg"></p>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-7 pr-0 mr-2">
							<div>
								<div>
									<label for="email">이메일</label> 
								</div>
								<div>
									<input type="email"	class="form-control" name="email" id="email" placeholder="you@example.com" style="display: inline-block; width:290px;" required>
									<button type="button" class="btn btn-primary btn1" onclick="certifyEmail()" style="display: inline-block;vertical-align: top">인증</button>
								</div>
							</div>
							<div>
								<p id="email_msg" class="check_msg"></p>
							</div>
						</div>
						<div class="col-md-4 pl-0">
							<div>
								<label for="tmpCheck">이메일인증</label> 
								<input type="text" class="form-control" name="tmpCheck" id="tmpCheck" required>
							</div>
							<div>
								<p id="tmpCheck_msg" class="check_msg"></p>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-md-3 mb-3 pr-1">
							<label for="zip">우편번호</label> 
							<input type="text" class="form-control" name="zip" id="zip" placeholder="주소 검색" readonly>
							<div class="invalid-feedback">우편번호를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3 pl-0 btn1">
							<button type="button" class="btn btn-primary" onclick="goPopup()">검색</button>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="add1">주소</label> 
							<input type="text" class="form-control" name="add1" id="add1" readonly>
							<div class="invalid-feedback">주소를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="add2">상세주소<span class="text-muted">&nbsp;(필수아님)</span></label> 
							<input type="text" class="form-control" name="add2" id="add2" placeholder="상세주소를 입력해주세요.">
						</div>
					</div>
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="submitCheck()">가입완료</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>