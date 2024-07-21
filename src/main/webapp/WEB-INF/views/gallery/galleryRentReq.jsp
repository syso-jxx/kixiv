<%@page import="java.util.List"%>
<%@page import="org.springframework.format.Printer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>

<html>
<head>
<meta charset="UTF-8">
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<%@include file="../include/option.jsp"%>
<script src="/asset/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<style>

	li	{
		  list-style:none;
	}
</style>
</head>
<%@include file="../include/header.jsp"%>
<body>
	<section class="container overflow-hidden py-5">
	<h1 class="text-dark h1" style="text-align: left;">대여/결제</h1>
		<br />	
		<div>
			<table style="width:70%; margin-left: 15%; border:0;">
				<tbody>
					<tr style="font-size:1.2em; border:0;">
						<td>
							<span>결제 내역 확인</span>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-bordered" style="width:70%; margin-left: 15%; ">
				<thead>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:50%;">갤러리 정보</th>
						<th style="vertical-align: middle; text-align:center; width:50%;">결제 내역</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="vertical-align: middle; width:50%;">
							<div style="text-align: center;">
								<img alt="" src="${rent.gallery_img}" style="width:80%; height:80%;">
							</div>
							<div style="text-align: center;">
								${rent.gallery_name}
							</div>
						</td>
						<td style="vertical-align: middle; width:50%;">
								
							<div style="display: block;">
								<a style="font-weight:bold; float: left; height: 35px; margin-right: 10px; position: relative; top: 2px;">
								위치
								</a> 
								<div style="display: block; padding-left: 80px;">
									<div style="display: flex;">
										<div style="display: inline-block;">
											<a>${rent.gallery_add1} ${rent.gallery_add2}</a>
										</div>
									</div>
								</div>
							</div>
							<br/>
							<div style="display: block;">
								<a style="font-weight:bold; float: left; height: 35px; margin-right: 10px; position: relative; top: 2px;">
								연락처
								</a> 
								<div style="display: block; padding-left: 80px;">
									<div style="display: flex;">
										<div style="display: inline-block;">
											<a>${rent.gallery_tel}</a>
										</div>
									</div>
								</div>
							</div>
							<br/>
							<div style="display: block;">
								<a style="font-weight:bold; float: left; height: 35px; margin-right: 10px; position: relative; top: 2px;">
								기간
								</a> 
								<div style="display: block; padding-left: 80px;">
									<div style="display: flex;">
										<div style="display: inline-block;">
											<a>${rent.rent_sdate} ~ ${rent.rent_edate}</a>
										</div>
									</div>
								</div>
							</div>
							<br/>
							<div style="display: block;">
								<a style="font-weight:bold; float: left; height: 35px; margin-right: 10px; position: relative; top: 2px;">
								대여료
								</a>
								<div style="display: block; padding-left: 80px;">
									<div style="display: flex;">
										<div style="display: inline-block;">
											<a><fmt:formatNumber value="${rent.rent_price}" pattern="#,###" />원</a>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<table style="width:70%; margin-left: 15%;">
				<tbody>
					<tr style="font-size:1.2em;">
						<td>
							<span>이용자 정보 입력</span>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-bordered" style="width:70%; margin-left: 15%;">
				<tbody>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">이용자 정보 선택</th>
						<td>
							<input type="radio" name="userInfo" id="same" style="margin-left: 20px;" onchange="fn_setDisplay()" checked/> 회원 정보와 동일
							<input type="radio" name="userInfo" id="differ" style="margin-left: 20px;" onchange="fn_setDisplay()"/> 새로 입력
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">신청자</th>
						<td>
							<div class="oldInfo"><input type="text" name="name" id="name_0" value="${user.name}" readonly></div>
							<div class="newInfo" style="display:none;"><input type="text" name="name" id="name_1" value="${user.name}" readonly></div>
							<input type="hidden" name="rent_seq" id="rent_seq" value="${rent.rent_seq}">
							<input type="hidden" name="rent_price" id="rent_price" value="${rent.rent_price}">
							<input type="hidden" name="gallery_name" id="gallery_name" value="${rent.gallery_name}">
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">사용자</th>
						<td>
							<div class="oldInfo">
								<input type="text" name="rent_name" class="rent_name" id="rent_name_0" value="${user.name}" readonly>
							</div>
							<div class="newInfo" style="display:none;">
								<input type="text" name="rent_name" class="rent_name" id="rent_name_1" value="${galleryRentVO.rent_name}">
								<span style="font-size:13px;"> 2~6자를 한글로 입력해 주시기 바랍니다.</span>
								<div><span id="rent_name_span"></span></div>
							</div>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">휴대전화번호</th>
						<td>
							<div class="oldInfo">
								<input type="text" placeholder="01X-XXXX-XXXX" name="rent_tel" id="rent_tel_0" value="${user.phone}" readonly>
							</div>
							<div class="newInfo" style="display:none;">
								<input type="text" placeholder="01X-XXXX-XXXX" name="rent_tel" id="rent_tel_1" value="${galleryRentVO.rent_tel}">
								<span style="font-size:13px;"> * 실제로 수신이 가능한 연락처를 기재하여 주시기 바랍니다.</span>
								<div><span id="rent_tel_span"></span></div>
							</div>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">
							이메일주소
						</th>
						<td>
							<div class="oldInfo">
								<input type="text" name="rent_email" id="rent_email_0" style="width:50%;" value="${user.email}" readonly>
							 </div>
							 <div class="newInfo" style="display:none;">
								<input type="text" name="rent_email" id="rent_email_1" style="width:50%;" value="${galleryRentVO.rent_email}">
								  <div><span id="rent_email_span"></span></div>
							 </div>
						</td>
					</tr>
				</tbody>
			</table>
			<div style="width:70%; text-align: center; margin-left:15%;">
				<input type="button" class="btn btn-dark mt-3" id="iamport" onclick="fn_check();" value="결제하기"/>
			</div>
	</div>
	</section>
	
<%@include file="../include/footer.jsp"%>

<script type="text/javascript">
	var nameValue = $('input[name=rent_name]').eq('1').val().trim();
	var telValue = $('input[name=rent_tel]').eq('1').val().trim();
	var emailValue = $('input[name=rent_email]').eq('1').val().trim();

	var nameReg = /^[가-힣]{2,6}$/;
	var telReg = /^01[0179]-[0-9]{3,4}-[0-9]{4}$/;
	var mailReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

$(function(){
	$('input[name=rent_name]').eq('1').on(
		'keyup',
		function(){
			nameValue = $('input[name=rent_name]').eq('1').val().trim();
			if (nameValue.length < 1) {
				$('#rent_name_span').html("이름을 입력하세요").css('color', 'red')
						.css('font-size', '0.8em');
				return;
			}
			if (nameReg.test(nameValue)) {
				$('#rent_name_span').html("사용 가능한 형식")
						.css('color', '#0080FF')
						.css('font-size', '0.8em');
			} else {
				$('#rent_name_span').html("올바른 형식이 아닙니다").css('color', 'red')
						.css('font-size', '0.8em');
			}
		}
	)
	$('input[name=rent_tel]').eq('1').on(
		'keyup',
		function() {
			telValue = $('input[name=rent_tel]').eq('1').val().trim();
			if (telValue.length < 1) {
				$('#rent_tel_span').html("전화번호를 입력하세요").css('color', 'red')
						.css('font-size', '0.8em');
				return;
			}
			if (telReg.test(telValue)) {
				$('#rent_tel_span').html("사용 가능한 형식").css('color', '#0080FF')
						.css('font-size', '0.8em');
			} else {
				$('#rent_tel_span').html("올바른 형식이 아닙니다").css('color', 'red')
						.css('font-size', '0.8em');
			}
		}
	)
	$('input[name=rent_email]').eq('1').on(
		'keyup',
		function() {
			emailValue = $('input[name=rent_email]').eq('1').val().trim();
			if (emailValue.length < 1) {
				$('#rent_email_span').html("이메일을 입력하세요").css('color', 'red')
						.css('font-size', '0.8em');
				return;
			}
			if (mailReg.test(emailValue)) {
				$('#rent_email_span').html("사용 가능한 형식").css('color',
						'#0080FF').css('font-size', '0.8em');
			} else {
				$('#rent_email_span').html("올바른 형식이 아닙니다")
						.css('color', 'red').css('font-size', '0.8em');
			}
		}
	)
});//end function()

function fn_check(){
	
	if($('input:radio[id=same]').is(':checked')){
		var params = {
	 			rent_seq      	: $('input[name=rent_seq]').val().trim()
	            , rent_name     : $('input[name=rent_name]').eq('0').val().trim()
	            , rent_tel      : $('input[name=rent_tel]').eq('0').val().trim()
	            , rent_email    : $('input[name=rent_email]').eq('0').val().trim()
	            , rent_price 	: $('input[name=rent_price]').val().trim()
	            , gallery_name 	: $('input[name=gallery_name]').val().trim()
	            , rent_num		: 'merchant_' + new Date().getTime()
	    }
	}else{
		var nameValue = $('input[name=rent_name]').eq('1').val().trim();
		var telValue = $('input[name=rent_tel]').eq('1').val().trim();
		var emailValue = $('input[name=rent_email]').eq('1').val().trim();
		
		if(nameValue == ""){
			alert("이름을 입력하세요")
			$("input[name=rent_name]").eq('1').focus();
			return;
		}
		if(nameValue.length < 2 || nameValue.length > 6 ){
			alert("이름의 길이를 확인하세요")
			$("input[name=rent_name]").eq('1').focus();
			return;
		}
		if(telValue == ""){
			alert("전화번호를 입력하세요")
			$("input[name=rent_tel]").eq('1').focus();
			return;
		}
		if(!telReg.test(telValue)){
			alert("전화번호 형식이 아닙니다")
			$("input[name=rent_tel]").eq('1').focus();
			return;
		}
		if(emailValue == ""){
			alert("이메일을 입력하세요")
			$("input[name=rent_email]").eq('1').focus();
			return;
		}
		if(!mailReg.test(emailValue)){
			alert("이메일 형식이 아닙니다")
			$("input[name=rent_email]").eq('1').focus();
			return;
		}
		
		var params = {
	 			rent_seq      	: $('input[name=rent_seq]').val().trim()
	            , rent_name     : $('input[name=rent_name]').eq('1').val().trim()
	            , rent_tel      : $('input[name=rent_tel]').eq('1').val().trim()
	            , rent_email    : $('input[name=rent_email]').eq('1').val().trim()
	            , rent_price 	: $('input[name=rent_price]').val().trim()
	            , gallery_name 	: $('input[name=gallery_name]').val().trim()
	            , rent_num		: 'merchant_' + new Date().getTime()
	    }
	}
	IMP.init('imp17157197');
	IMP.request_pay({
		pg : 'html5_inicis',
 	    pay_method : 'card',
 	    merchant_uid : params.rent_num,
 	    name : params.gallery_name, //결제창에서 보여질 이름
 	    amount : params.rent_price, //실제 결제되는 가격
 	    buyer_email : params.rent_email,
 	    buyer_name : params.rent_name,
 	    buyer_tel : params.rent_tel
	}, function(rsp) {
		console.log(rsp);
		// 결제검증
		$.ajax({
        	type : "POST",
        	url : "/verifyIamport/" + rsp.imp_uid 
        }).done(function(data) {
        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
        	if(rsp.paid_amount == data.response.amount){
        		$.ajax({
        	        type : "POST",            	  // HTTP method type(GET, POST) 형식이다.
        	        url : "/galleryRentReq",      // 컨트롤러에서 대기중인 URL 주소이다.
        	        data : params,
        	        success : function(res){
        	        	alert("결제가 완료되었습니다")
		        		if(confirm("펀딩을 오픈하시겠습니까?")){
		        			location.href = "/fundWriteFront";
		        		}else{
				        	location.href = "/myGalleryRentReqList"; // *** 마이페이지 결제 내역으로 보내기
		        		}
        	        }
        		})
        	} else {
        		alert("결제 실패");
        	}
        });
	});
}

function fn_setDisplay(){
	if($('input:radio[id=same]').is(':checked')){
		$('.oldInfo').show();
		$('.newInfo').hide();
	}else {
		$('.oldInfo').hide();
		$('.newInfo').show();
	}
}

</script>
</body>
</html>