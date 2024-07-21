<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="UTF-8">
<%@include file="../include/option.jsp"%>
<script src="asset/js/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
		$("#user_id").focusout(function(){
			$(this).removeClass("check_fail");	
			$("#id_msg").text("")
			
			var user_id = $("#user_id").val();
			
			if($(this).val() != ""){
				fn_idCheck(user_id);
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
		        		$("#user_id").addClass("check_fail");
		        		$("#id_msg").text("사용중인 유저 아이디가 아닙니다.")
		        	}
		        },
		        error: function(){
		            alert("실패ㅜㅜ err");
		        }
		    });
		}
		
		// 이메일 정규식 및 중복 체크
		$("#email").focusout(function(){
			$(this).removeClass("check_success");	
			$(this).removeClass("check_fail");
			$("#email_msg").text("");
			
			var email = $("#email").val();
			
			if($(this).val() != ''){
				// 이메일 검사 정규식(이메일 형식에 맞게 썻는지 검사 ex)aa01@aa.aa)
				var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
				
				if(emailCheck.test(email)){
					fn_emailCheck(email)
				}else{
					$("#email").addClass("check_fail");
	        		$("#email_msg").text("이메일 형식에 맞추어 작성하시오 ex)abc@ab.a, abc@ab.cd.d");
				}
			}
		});
		
		function fn_emailCheck(email){
			var param = "";
			param += "dummy=" + Math.random();
	        param += "&email=" + email;
		    $.ajax({
		        url: "emailCheck",
		        type: "POST",
		        data: param,
		        success: function(data){
		        	if(data == 'ng'){
		        		$("#email").addClass("check_fail");
		        		$("#email_msg").text("현재 kixiv를 이용중인  회원의 email이 아닙니다.")
		        	}
		        },
		        error: function(){
		            alert("실패ㅜㅜ err");
		        }
		    });
		}
		
	});


	function submitCheck() {
		var user_id = document.getElementById("user_id");
		var email = document.getElementById("email");
		
		//검중(Validation)
		if(user_id.value == ''){
			swal.fire({
						text:"아이디를 입력해주세요.",
						icon:"warning", 
						confirmButtonText:"확인"
					});
			user_id.focus();
			return;
		}
		
		if(email.value == ''){
			swal.fire({
						text:"이메일을 입력해주세요.",
						icon:"warning", 
						confirmButtonText:"확인"
					});
			email.focus();
			return;
		}
		
		var param = "";
		param += "dummy=" + Math.random();
        param += "&user_id=" + user_id.value;
        param += "&email=" + email.value;
	    $.ajax({
	        url: "findPwd",
	        type: "POST",
	        data: param,
	        success: function(data){
	        	if(data == 'ok'){
	        		sendPwd();
	        	}else{
	        		swal.fire({
						text:"아이디와 이메일이 일치하지 않습니다.",
						icon:"error", 
						confirmButtonText:"확인"
					});
	        	}
	        },
	        error: function(){
	            alert("실패ㅜㅜ err");
	        }
	    });
	}
	
	function sendPwd(){
		var user_id = document.getElementById("user_id");
		var email = document.getElementById("email");

		var param = "";
		param += "dummy=" + Math.random();
        param += "&user_id=" + user_id.value;
        param += "&email=" + email.value;
	    $.ajax({
	        url: "sendPwd",
	        type: "POST",
	        data: param,
	        success: function(data){
	        	if(data == 'ok'){
					swal.fire({
						text:user_id.value + "님의 임시비밀번호를 " + email.value + "로 발송하였습니다.",
						icon:"success", 
						confirmButtonText:"확인"
					}).then((result) => {
			        	location.href="/login"
					});
	        	}else{
					swal.fire({
						text:"임시비밀번호를 발송하지 못했습니다. 다시 시도해 주세요.",
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
	
</script>
<title>KIXIV - 세상의 모든 사진</title>
</head>
<body>

	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<div style="text-align: center;">
					<h1 class="h4 text-gray-900 mb-2">비밀번호를 잊으셨나요?</h1>
			        <p class="mb-4">
			              이메일을 입력하시면<br>
			              임시 비밀번호를 발급해드립니다.<br>
			              임시 비밀번호 발급 후에는<br>
			              기존 비밀번호로 로그인이 불가합니다.
					</p>
				</div>
				
				<form name="form" id="form" class="validation-form" action="/sendPwd" method="post" autocomplete="off">
					<div class="row">
						<div>
							<label for="user_id">아이디</label> 
							<input type="text" name="user_id" class="form-control" id="user_id" placeholder="" required>
						</div>
					</div>
					<div>
						<p id="id_msg" class="check_msg"></p>
					</div>
					
					<div class="mb-3">
						<div>
							<label for="email">이메일</label> 
							<input type="email"	class="form-control" name="email" id="email" placeholder="you@example.com" required>
						</div>
						<div>
							<p id="email_msg" class="check_msg"></p>
						</div>
					</div>		
					
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="submitCheck()">임시비밀번호 발급</button>
				</form>
				<hr>
				<div style="text-align: center">
	  				<a href="signup" >회원가입</a>
				</div>
				<div style="text-align: center">
					<a href="login">이미 회원이신가요? 로그인</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>