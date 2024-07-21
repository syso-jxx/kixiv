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
<style>

	li	{
		  list-style:none;
	}
</style>
</head>
<%@include file="../include/header.jsp"%>
<body>

<!-- jstl 변수선언부 시작 -->
<c:set var="sdate"><fmt:formatDate value="${fund.fund_sdate}" pattern="yyyy/MM/dd"/></c:set>
<c:set var="edate"><fmt:formatDate value="${fund.fund_edate}" pattern="yyyy/MM/dd"/></c:set>
<c:set var="today"><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy/MM/dd"/></c:set>

<fmt:parseDate value="${today}" var="todayPlanDate" pattern="yyyy/MM/dd"/>
<fmt:parseNumber value="${todayPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="todayDate"></fmt:parseNumber>
<fmt:parseDate value="${edate}" var="endPlanDate" pattern="yyyy/MM/dd"/>
<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>

<c:set var="total"><fmt:formatNumber value="${fund.total}" pattern="#,###"/></c:set>
<c:set var="achieve"><fmt:formatNumber value="${fund.fund_achieve}" pattern="#,###"/></c:set>

<fmt:parseNumber var="rate" type="number" value="${fund.rate}" />

<c:set var="add">${fund.fund_add1} ${fund.fund_add2}</c:set>
<!-- jstl 변수선언부 끝-->

	<section class="container overflow-hidden py-5">
	<h1 class="text-dark h1" style="text-align: left;">투자하기</h1>
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
						<th colspan="2" style="vertical-align: middle; text-align:center; width:50%;">투자 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="vertical-align: middle; width:50%;">
	                    	<p class="text-muted">투자 금액</p>
	                    	<h5><fmt:formatNumber value="${fund.one_price}" pattern="#,###"/></h5>	
	                    	<p class="text-muted">투자 목표액</p>
	                    	<h5>${achieve}</h5>	
	                    </td>
	                    <td>
	                    	<p class="text-muted">현재 모금액</p>
	                    	<h5>${total} (${rate}%)</h5>
	                    	<p class="text-muted">잔여 모금액</p>
	                    	<h5><fmt:formatNumber value="${fund.fund_achieve-fund.total}" pattern="#,###"/></h5>
						</td>
					</tr>
					</tbody>
					
					<thead> 
						<tr>
							<th style="vertical-align: middle; text-align:center; width:50%;">작가 정보</th>
							<th style="vertical-align: middle; text-align:center; width:50%;">기타 정보</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td style="vertical-align: middle; width:50%;">
								<p class="text-muted">작가명</p>
			                    <h5>${fundUser.nickname}</h5>
			                    <br/>
			                    <p class="text-muted">작가이메일</p>
			                    <h5>${fundUser.email}</h5>
							</td>
			                    
		                    <td style="vertical-align: middle; width:50%;">
								<c:choose>
									<c:when test="${not empty fund.fund_add1}">
										<div style="display: block;">
					                    	<p class="text-muted">대관장소</p>
					                    	<h5>${fund.fund_add1} ${fund.fund_add2}</h5>	
										</div>
									</c:when>
									
									<c:otherwise>
									---
									</c:otherwise>
								</c:choose>
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
						<th style="vertical-align: middle; text-align:center; width:30%;">투자자</th>
						<td>
							<div class="oldInfo">
								<input type="text" name="rent_name" class="fund_name" id="fund_name" value="${user.name}" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">휴대전화번호</th>
						<td>
							<div class="oldInfo">
								<input type="text" placeholder="01X-XXXX-XXXX" name="fund_tel" id="fund_tel" value="${user.phone}" readonly>
								<span class="newInputInfo" style="font-size:13px; display:none"> * 실제로 수신이 가능한 연락처를 기재하여 주시기 바랍니다.</span>
								<div><span id="fund_tel_span"></span></div>
							</div>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">
							이메일주소
						</th>
						<td>
							<div class="oldInfo">
								<input type="text" name="fund_email" id="fund_email" style="width:50%;" value="${user.email}" readonly>
								<div><span id="fund_email_span"></span></div>
							 </div>
						</td>
					</tr>
				</tbody>
			</table>
			<div style="width:70%; text-align: center; margin-left:15%;">
				<input type="button" style="float:right;" class="btn btn-dark mt-3" id="iamport" onclick="fn_check();" value="결제하기"/>
			</div>
	</div>
	</section>
	
<%@include file="../include/footer.jsp"%>

<script type="text/javascript">
	var telValue = $('input[name=fund_tel]').val().trim();
	var emailValue = $('input[name=fund_email]').val().trim();

	var telReg = /^01[0179]-[0-9]{3,4}-[0-9]{4}$/;
	var mailReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

$(function(){
	$('input[name=fund_tel]').on(
		'keyup',
		function() {
			telValue = $('input[name=fund_tel]').val().trim();
			if (telValue.length < 1) {
				$('#fund_tel_span').html("전화번호를 입력하세요").css('color', 'red')
						.css('font-size', '0.8em');
				return;
			}
			if (telReg.test(telValue)) {
				$('#fund_tel_span').html("사용 가능한 형식").css('color', '#0080FF')
						.css('font-size', '0.8em');
			} else {
				$('#fund_tel_span').html("올바른 형식이 아닙니다").css('color', 'red')
						.css('font-size', '0.8em');
			}
		}
	)
	$('input[name=fund_email]').on(
		'keyup',
		function() {
			emailValue = $('input[name=fund_email]').val().trim();
			if (emailValue.length < 1) {
				$('#fund_email_span').html("이메일을 입력하세요").css('color', 'red')
						.css('font-size', '0.8em');
				return;
			}
			if (mailReg.test(emailValue)) {
				$('#fund_email_span').html("사용 가능한 형식").css('color',
						'#0080FF').css('font-size', '0.8em');
			} else {
				$('#fund_email_span').html("올바른 형식이 아닙니다")
						.css('color', 'red').css('font-size', '0.8em');
			}
		}
	)
});//end function()

function fn_check(){
	
	if($('input:radio[id=same]').is(':checked')){
		var params = {
	 			fund_id      	: '${fund.fund_id}'
	            , fund_name     : $('#fund_name').val().trim()
	            , fund_tel      : $('#fund_tel').val().trim()
	            , fund_email    : $('#fund_email').val().trim()
	            , price 		: 100//'${fund.one_price}'
	            , pay_name	 	: '${fundUser.nickname}님의 펀딩'
	            , merchant_uid	: 'merchant_' + new Date().getTime()
	    };
	}else{
		var telValue = $('#fund_tel').val().trim();
		var emailValue = $('#fund_email').val().trim();
		
		if(telValue == ""){
			alert("전화번호를 입력하세요")
			$("#fund_tel").focus();
			return;
		}
		if(!telReg.test(telValue)){
			alert("전화번호 형식이 아닙니다")
			$("#fund_tel").focus();
			return;
		}
		if(emailValue == ""){
			alert("이메일을 입력하세요")
			$("#fund_email").focus();
			return;
		}
		if(!mailReg.test(emailValue)){
			alert("이메일 형식이 아닙니다")
			$("#fund_email").focus();
			return;
		}
		
		var params = {
				fund_id      	: '${fund.fund_id}'
	            , fund_name     : $('#fund_name').val().trim()
	            , fund_tel      : $('#fund_tel').val().trim()
	            , fund_email    : $('#fund_email').val().trim()
	            , price 		: 100//'${fund.one_price}'
	            , pay_name	 	: '${fundUser.nickname}님의 펀딩'
	            , merchant_uid	: 'merchant_' + new Date().getTime()
	    };
	}
	IMP.init('imp17157197');
	IMP.request_pay({
		pg : 'html5_inicis',
 	    pay_method : 'card',
 	    merchant_uid : params.merchant_uid,
 	    name : params.pay_name, //결제창에서 보여질 이름
 	    amount : params.price, //실제 결제되는 가격
 	    buyer_email : params.fund_email,
 	    buyer_name : params.fund_name,
 	    buyer_tel : params.fund_tel
	}, function(rsp) {
		console.log(rsp);
		// 결제검증
		$.ajax({
        	type : "POST",
        	url : "/fundVerifyIamport/" + rsp.imp_uid 
        }).done(function(data) {
        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
        	if(rsp.paid_amount == data.response.amount){
        		$.ajax({
        	        type : "POST",            	  // HTTP method type(GET, POST) 형식이다.
        	        url : "/fundPay",      // 컨트롤러에서 대기중인 URL 주소이다.
        	        data : params,
        	        success : function(res){
        	        	if(res == "ok") {
	        	        	alert("결제가 완료되었습니다");
	        	        	location.href="fundDetail?fund_id="+params.fund_id;
        	        	} else {
        	        		alert("결제 실패");
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
	if($('input:radio[id=differ]').is(':checked')){
		$('#fund_tel').val("");
		$('#fund_tel').attr("readonly", false);
		$('#fund_email').val("");
		$('#fund_email').attr("readonly", false);
		
		$('.newInputInfo').css("display", "inline");
	}else {
		$('#fund_tel').val('${user.phone}');
		$('#fund_tel').attr("readonly", true);
		$('#fund_email').val('${user.email}');
		$('#fund_email').attr("readonly", true);
		
		$('.newInputInfo').css("display", "none");
	}
}

</script>
</body>
</html>