<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KIXIV - 세상의 모든 사진</title>
<%@include file="include/option.jsp"%>
<script src="asset/js/jquery.min.js"></script>
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

</script>
<title>KIXIV - 세상의 모든 사진</title>
</head>
<body>

<!--  -->
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">갤러리 상세</h4>
				
				<div class="row">
					<div class="col-md-6 mt-3">
						<div class="row mb-2">
							<div class="col-md-12">
								<label for="gallery_name">갤러리명</label> 
								<input type="text" class="form-control" value="${galleryVO.gallery_name}" readonly>
							</div>
						</div>
						
						<div class="row mb-2">
							<div class="col-md-12">
								<label for="gallery_tel">갤러리 전화번호</label> 
								<input type="text" class="form-control" value="${galleryVO.gallery_tel}" readonly>
							</div>
						</div>
					</div>
					<div class="col-md-6" style="width:300px;height:200px; overflow: hidden;">
						<img src="${galleryVO.gallery_img}" alt="이미지 없음" style="height:200px;" >
						<input type="hidden" name="user_id" value="${user.user_id}">						
					</div>
				</div>
				
				<div class="row mb-2">
					<div class="col-md-12">
						<label for="gallery_intro">갤러리 소개</label> 
						<textarea type="text" class="form-control" rows="5" cols="33" readonly>${galleryVO.gallery_intro}</textarea>
					</div>
				</div>
				
				<div class="mb-3">
					<div>
						<label for="homepage">갤러리 홈페이지(필수아님)</label> 
						<input type="text" class="form-control" value="${galleryVO.homepage}" readonly>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-7 mb-3">
						<label for="gallery_zip">우편번호</label> 
						<input type="text" class="form-control" value="${galleryVO.gallery_zip}" readonly>
						<div class="invalid-feedback">우편번호를 입력해주세요.</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-7 mb-3">
						<label for="gallery_add1">주소</label> 
						<input type="text" class="form-control" value="${galleryVO.gallery_add1}" readonly>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>
					<div class="col-md-5 mb-3">
						<label for="gallery_add2">상세주소<span class="text-muted">&nbsp;(필수아님)</span></label> 
						<input type="text" class="form-control" value="${galleryVO.gallery_add2}" readonly>
					</div>
				</div>
				
					<div style="float:right;">
						
						<button type="button" class="btn btn-success" onclick="javascript:location.href='/mypage'">뒤로가기</button>
						<c:if test="${galleryVO.user_id eq user.user_id}">
								<button type="button" class="btn btn-primary" onclick="javascript:location.href='/modifyGallery?gallery_num=${galleryVO.gallery_num}'">수정</button>
								<button type="button" class="btn btn-danger" onclick="javascript:location.href='/deleteGallery?gallery_num=${galleryVO.gallery_num}'">삭제</button>
						</c:if>
					</div>
			</div>
		</div>
	</div>

</body>
</html>