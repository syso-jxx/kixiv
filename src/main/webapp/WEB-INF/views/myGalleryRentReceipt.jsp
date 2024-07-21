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
<%@include file="include/option.jsp"%>
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
<%@include file="include/header.jsp"%>
<body>
	<section class="container overflow-hidden py-5">
	<h1 class="text-dark h1" style="text-align: left;">결제내역</h1>
		<br />	
		<div>
		<form name="fr" method="post" onsubmit="return check()" action="/myGalleryReqReceipt">
			<table style="width:70%; margin-left: 15%; border:0;">
				<tbody>
					<tr style="font-size:1.2em; border:0;">
						<td>
							<span>결제 내역 확인</span>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-bordered" style="width:70%; margin-left: 15%;">
				<tbody>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">신청자</th>
						<td>
							${detail.name}
							<input type="hidden" name="rent_num" id="rent_num_seq" value="${detail.rent_num}">
							<input type="hidden" name="rent_price" id="rent_price" value="${detail.rent_price}">
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">사용자</th>
						<td>
							${detail.rent_name}
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">갤러리명</th>
						<td>
							${detail.gallery_name}
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">사용기간</th>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${detail.rent_sdate}" /> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${detail.rent_edate}" />
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">대여료</th>
						<td>
							${detail.rent_price}
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle; text-align:center; width:30%;">결제상태</th>
						<td>
							<c:choose>
								<c:when test="${detail.cancel_status eq 'y' }">
									환불완료
								</c:when>
								<c:when test="${detail.cancel_status eq 'r' }">
									환불진행중
								</c:when>
								<c:otherwise>
									결제완료
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		
			<table style="width:70%; margin-left: 15%;">
			</table>
			<div style="width:70%; text-align: center; margin-left:15%;">
				<c:if test="${detail.cancel_status eq 'n' }">
					<input type="submit" class="btn btn-dark mt-3" id="refund" value="환불하기"/>
				</c:if>
			</div>
		</form>
	</div>
	</section>
	
<%@include file="include/footer.jsp"%>
<script type="text/javascript">

/*

pg_tid (string): PG사 승인취소번호 ,
amount (number): 취소 금액 ,
cancelled_at (integer): 결제취소된 시각 UNIX timestamp ,
reason (string): 결제취소 사유 ,
receipt_url (string, optional): 취소에 대한 매출전표 확인 URL. PG사에 따라 제공되지 않는 경우도 있음
 
 */
 
 function check() {
	if(confirm("환불하시겠습니까? 환불은 신청 이후 3~5일 정도 소요됩니다.")){
		 return true;
	}else{
		return false;
	}
}
 
 
/* function fn_refund(){
	if(confirm("환불하시겠습니까? 환불은 신청 이후 3~5일 정도 소요됩니다.")){
		 */
// 		var rent_num = $("#rent_num").val();
// 		var rent_price = $("#rent_price").val();
		
// 		IMP.init('imp17157197');
// 		$.ajax({
// 			url: "/myGalleryRentReceipt",
// 			type:"post",
// 			datatype:"json",
// 			contentType : 'application/x-www-form-urlencoded; charset = utf-8',
// 			data : {

// 				"rent_num" : rent_num,  // 주문번호
// 				"rent_price" : rent_price, //환불금액
// 				"reason" : "테스트 결제 환불" //환불사유
// 			}
// 		}).done(function(result){ //환불 성공
// 			console.log("환불 성공 : "+ result);
// 		}).fail(function(error){
// 			console.log("환불 실패 : "+ error);
// 		});//ajax
/* 	} */
</script>
</body>
</html>