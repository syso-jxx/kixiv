<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KIXIV - 세상의 모든 사진</title>
<%@include file="include/option.jsp"%>
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
		
		$("#gallery_img").click(function(){
			$("input[type=file]").click();
		});
		
		// 갤러리 이미지 저장
		$("input[type=file]").change(function(e){
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			 
			filesArr.forEach(function(f){
				console.log(f)
				
			    if(!f.type.match("image.*")){
			        alert("확장자는 이미지 확장자만 가능합니다.");
			        return;
			    }
					
			    sel_file = f;
				console.log(sel_file)
			   
			    var reader = new FileReader();
			    reader.onload = function(e){
					console.log(e)
			 	    $("#gallery_img").attr("src", e.target.result);
					imgUpload();
			    }

				reader.readAsDataURL(f);
		    });
		});

		function imgUpload(){
			// 이미지 업로드 및 DB에 경로 저장 시작
		    var formData = new FormData($("#frm")[0]);
			
			$.ajax({ 
				type: "POST", 
				enctype: 'multipart/form-data',   
				url: '/galleryImgUpload', 
				data: formData, 
				processData: false, 
				contentType: false, 
				cache: false, 
				success: function (profile) {
					alert("성공")
					$("input[name=gallery_img]").val(profile);
				}, 
				error: function (e) { 
					console.log(e);
				} 
			});
			// 이미지 업로드 및 DB에 경로 저장 끝
		}	

		// 갤러리 전화번호 공백 체크
		$("#gallery_tel").focusout(function(){
			$(this).removeClass("check_fail");	
			$("#tel_msg").text("")
			
			var gallery_tel = $("#gallery_tel").val();
			
			if($(this).val() != ''){
				// 휴대폰 번호 정규식(01로 시작하여 그 다음은 0,1,7,9 중 하나와 매칭되는지 체크한뒤 7~8자리인지 검사)
				var telCheck = RegExp(/^[0-9]{2,4}-[0-9]{3,4}-[0-9]{4}$/);
				
				if(telCheck.test(gallery_tel)){
					$(this).addClass("check_success");
				}else{
					$(this).addClass("check_fail");
	        		$("#tel_msg").text("ex) 02-123-1234 or 010-1234-1234");
				}
			}
		});
	
		// 갤러리 소개 공백 확인
		$("#gallery_intro").focusout(function(){
			$(this).removeClass("check_fail");	
			$("#intro_msg").text("")
			
			var gallery_intro = $("#gallery_intro").val();
			
			if($.trim($(this).val()) != ""){
				$(this).addClass("check_success");
			}else{
				$(this).addClass("check_fail");
        		$("#intro_msg").text("갤러리 소개 내용을 작성하시오.");
			}
		});

		// 주소 중복 확인
		$("#gallery_add1").change(function(){
			$(this).removeClass("check_fail");	
			$("#id_msg").text("")
			
			var gallery_add1 = $("#gallery_add1").val();
			var old_add = $("#old_add").val(); // 저장된 주소
			
			if($(this).val() != ""){
				fn_addressCheck(gallery_add1, old_add);
			}
		});
		
	});
	
	// 주소 중복 확인
	function fn_addressCheck(gallery_add1, old_add){
		
		var param = "";
		param += "dummy=" + Math.random();
        param += "&gallery_add1=" + gallery_add1;
        param += "&old_add=" + old_add;
	    $.ajax({
	        url: "addressCheck",
	        type: "POST",
	        data: param,
	        success: function(data){
	        	if(data == 'ok'){
					$("#gallery_add1").removeClass("check_fail");	
	        		$("#add1_msg").text("")
	        	}else{
	        		$("#gallery_add1").addClass("check_fail");
	        		$("#add1_msg").text("이미 등록된 주소입니다.")
	        	}
	        },
	        error: function(){
	            alert("실패ㅜㅜ err");
	        }
	    });
	}
	

	function submitCheck() {
		var form = document.getElementById("form");
		var gallery_name = document.getElementById("gallery_name");
		var gallery_tel = document.getElementById("gallery_tel");
		var tel_msg = document.getElementById("tel_msg");
		var gallery_intro = document.getElementById("gallery_intro");
		var homepage = document.getElementById("homepage");
		var gallery_zip = document.getElementById("gallery_zip");
		var gallery_add1 = document.getElementById("gallery_add1");
		var gallery_add2 = document.getElementById("gallery_add2");
		
		//검중(Validation)
		if(gallery_name.value == ''){
			swal.fire({
				text:"갤러리명을 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			gallery_name.focus();
			return;
		}
		if(!gallery_tel.classList.contains("check_success")){
			swal.fire({
				text:"갤러리 번호를 바르게 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			gallery_tel.focus();
			return;
		}
		
		
		if(!gallery_intro.classList.contains("check_success")){
			swal.fire({
				text:"갤러리 소개를 입력해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			gallery_intro.focus();
			return;
		}
		if(gallery_zip.value == ''){
			swal.fire({
				text:"주소 검색해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			gallery_zip.focus();
			return;
		}
		if(gallery_add1.value == ''){
			swal.fire({
				text:"주소 검색해주세요.",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			gallery_add1.focus();
			return;
		}else{
			var add1_msg = document.getElementById("add1_msg");
			console.log(add1_msg.innerText);
			if(add1_msg.innerText != ''){
				return;
			}
		}

		form.submit();
	}
	
	function goPopup(){
		//카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	console.log(data);
                document.getElementById("gallery_zip").value = data.zonecode; // 주소 넣기
                document.getElementById("gallery_add1").value = data.address; // 주소 넣기
                
                var gallery_add1 = $("#gallery_add1").val();
        		fn_addressCheck(gallery_add1);
                
                document.getElementById("gallery_add2").focus(); //상세입력 포커싱
            }
        }).open();
	}
	
</script>
<title>KIXIV - 세상의 모든 사진</title>
</head>
<body>
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">갤러리 수정</h4>
				
				<form id="frm" name="frm" method="post" enctype="multipart/form-data">
					<input type="file" name="file" style="display:none"/>
				</form>
				
				<form name="form" id="form" class="validation-form" action="/modifyGallery" method="post" autocomplete="off">
					<div class="row">
						<div class="col-md-6 mt-3">
							<div class="row mb-2">
								<div class="col-md-12">
									<label for="gallery_name">갤러리명</label> 
									<input type="text" name="gallery_name" class="form-control" id="gallery_name" value="${galleryVO.gallery_name}"  readonly>
								</div>
							</div>
							<div>
								<p id="name_msg" class="check_msg"></p>
							</div>
							
							<div class="row mb-2">
								<div class="col-md-12">
									<label for="gallery_tel">갤러리 전화번호</label> 
									<input type="text" class="form-control check_success" name="gallery_tel" id="gallery_tel"	value="${galleryVO.gallery_tel}" placeholder="ex) 02-123-1234 or 010-1234-1234" required>
								</div>
							</div>
							<div>
								<p id="tel_msg" class="check_msg"></p>
							</div>
						</div>
						<div class="col-md-6" style="width:300px;height:200px; overflow: hidden;">
							<img src="${galleryVO.gallery_img}" alt="이미지 없음" id="gallery_img" style="height:200px;" >
							<input type="hidden" name="gallery_img" value="${galleryVO.gallery_img}">						
							<input type="hidden" name="user_id" value="${user.user_id}">						
							<input type="hidden" name="gallery_num" value="${galleryVO.gallery_num}">						
						</div>
					</div>
					
					<div class="row mb-2">
						<div class="col-md-12">
							<label for="gallery_intro">갤러리 소개</label> 
							<textarea type="text" name="gallery_intro" class="form-control check_success" id="gallery_intro" rows="5" cols="33" required>${galleryVO.gallery_intro}</textarea>
						</div>
					</div>
					<div>
						<p id="intro_msg" class="check_msg"></p>
					</div>
					

					<div class="mb-3">
						<div>
							<label for="homepage">갤러리 홈페이지(필수아님)</label> 
							<input type="text" class="form-control" name="homepage" id="homepage" value="${galleryVO.homepage}">
						</div>
						<div>
							<p id="email_msg" class="check_msg"></p>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="gallery_zip">우편번호</label> 
							<input type="text" class="form-control" name="gallery_zip" id="gallery_zip" placeholder="주소 입력" value="${galleryVO.gallery_zip}" readonly>
							<div class="invalid-feedback">우편번호를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3 btn1">
							<button type="button" class="btn btn-primary" onclick="goPopup()">검색</button>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<div>
								<label for="gallery_add1">주소</label> 
								<input type="text" class="form-control" name="gallery_add1" id="gallery_add1" value="${galleryVO.gallery_add1}" readonly>
								<input type="hidden" name="old_add" id="old_add" value="${galleryVO.gallery_add1}">
								<div class="invalid-feedback">주소를 입력해주세요.</div>
							</div>
							<div>
								<p id="add1_msg" class="check_msg"></p>
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="gallery_add2">상세주소<span class="text-muted">&nbsp;(필수아님)</span></label> 
							<input type="text" class="form-control" name="gallery_add2" id="gallery_add2" value="${galleryVO.gallery_add2}" placeholder="상세주소를 입력해주세요.">
						</div>
					</div>
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="submitCheck()">갤러리 수정</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>