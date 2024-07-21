<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<%@include file="include/option.jsp" %>
<script src="/resources/asset/js/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	.btn_menu{
		width: 100px; 
		height: 100px;
		border-radius: 50%;
		margin-right: 100px;
		background-size: cover;
	}
	a{
		text-decoration: none;
		color : black;
	}
/* 	tbody tr{ */
/* 		height : 105px; */
/* 	} */
	.btnhover :hover{
		font-weight: bold;
	}
</style>
</head>
<body>
	<%@include file="include/header.jsp" %>
	<section class="container overflow-hidden py-5">
	<h1 class="text-dark h1" style="text-align: left;">대여 정보</h1>
		<br />	
		<div style="text-align: right;">
			<input type="button" class="btn btn-outline-dark btn-sm" value="오늘" onclick="fn_search('today')">
			<input type="button" class="btn btn-outline-dark btn-sm" value="이번주" onclick="fn_search('week')">
			<input type="button" class="btn btn-outline-dark btn-sm" value="이번달" onclick="fn_search('month')">
			<input type="button" style="margin-right:5px;" class="btn btn-outline-dark btn-sm" value="올해" onclick="fn_search('year')">
				<input type="text" class="btn btn-outline-dark btn-sm" name="rent_period" id="rent_period_start" style="width: 130px;"/>
			~
				<input type="text" class="btn btn-outline-dark btn-sm" name="rent_period" id="rent_period_end" style="width: 130px;"/>
			<input type="button" id="period" class="btn btn-dark btn-sm" value="조회">
		</div>
		<br>
		<div>
		<table class="table table-sm table-hover">
			<thead>
				<tr style="font-size:1.2em;">
					<th style="text-align:center; width:8%;" scope="col">No.</th>
					<th style="text-align:center; width:30%;" scope="col">대표사진</th>
					<th style="text-align:center; width:52%;" scope="col">정보</th>
					<th style="text-align:center; width:10%;" scope="col">진행상황</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${myGalleryRent.content.size() > 0}">
					<c:forEach var="list" items="${myGalleryRent.content}" varStatus="st">
						<tr>
							<td style="vertical-align: middle;">
								<div style="text-align: center;">
									<div style="position:relative; display:inline-block;">
										<c:choose>
											<c:when test="${myGalleryRent.currentPage eq 1}">
												${st.count}
											</c:when>
											<c:otherwise>
												${(myGalleryRent.currentPage-1)*10 + st.count}
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</td>
							<td style="vertical-align: middle;">
								<div style="text-align:center;">
									<a href="#"><img alt="1" src="${list.GALLERY_IMG}" style="width:250px; height:150px;"></a>
								</div>
							</td>
							<td style="vertical-align: middle;">
							<button class="btnhover" style="all:unset; cursor:pointer;" onclick="location.href='/galleryRentDetail?rent_seq=${list.RENT_SEQ}'">
								<div >
									<div style="position: relative; ">${list.GALLERY_NAME}</div>
									<div style="position: relative; ">(${list.GALLERY_ZIP}) ${list.GALLERY_ADD1} ${list.GALLERY_ADD2}</div>
									<div style="position: relative; ">대여 가능 일자 : ${list.RENT_SDATE}~${list.RENT_EDATE}</div>
								</div>
							</button>
							</td>
							<td style="vertical-align: middle; text-align: center;">
								<c:choose>
							         <c:when test = "${list.RENT_STATUS eq 'n'}">
										예약
							         </c:when>
							         <c:when test = "${list.RENT_STATUS eq 'e'}">
										종료
							         </c:when>
							         <c:otherwise>
										대기
							         </c:otherwise>
							     </c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" rowspan="10" style="text-align: center; vertical-align: middle;">데이터가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		
		</table>
	</div>
	</section>

	
	<section class="ftco-section">
		<!-- 페이징 시작 -->
		<div class="col-md-offset-3">
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${myGalleryRent.keyword eq 'period'}">
						<c:if test="${myGalleryRent.startPage > 5}">
							<li class="page-item">
								<a class="page-link" href="/myGalleryRent?pageNum=${myGalleryRent.startPage-5}&keyword=period&rent_period_start=${rent_period_start}&rent_period_end=${rent_period_end}">이전</a>
							</li>
						</c:if>
						<c:forEach begin="${myGalleryRent.startPage}" end="${myGalleryRent.endPage}" var="idx">
							<li class="page-item"><a class="page-link" href="/myGalleryRent?pageNum=${idx}&keyword=period&rent_period_start=${rent_period_start}&rent_period_end=${rent_period_end}">${idx}</a></li>
						</c:forEach>
						<c:if test="${myGalleryRent.endPage < myGalleryRent.totalPages}">
							<li class="page-item">
								<a class="page-link" href="/myGalleryRent?pageNum=${myGalleryRent.startPage+5}&keyword=period&rent_period_start=${rent_period_start}&rent_period_end=${rent_period_end}">다음</a>
							</li>
						</c:if>
					</c:when>
					<c:otherwise>
						<c:if test="${myGalleryRent.startPage > 5}">
							<li class="page-item">
								<a class="page-link" href="/myGalleryRent?pageNum=${myGalleryRent.startPage-5}">이전</a>
							</li>
						</c:if>
						<c:forEach begin="${myGalleryRent.startPage}" end="${myGalleryRent.endPage}" var="idx">
							<li class="page-item"><a class="page-link" href="/myGalleryRent?pageNum=${idx}">${idx}</a></li>
						</c:forEach>
						<c:if test="${myGalleryRent.endPage < myGalleryRent.totalPages}">
							<li class="page-item">
								<a class="page-link" href="/myGalleryRent?pageNum=${myGalleryRent.startPage+5}">다음</a>
							</li>
						</c:if>
					</c:otherwise>
				
				</c:choose>
			</ul>
		</div>
	</section>

	<!-- Start Footer -->
	<%@include file="include/footer.jsp" %>
	
	<script type="text/javascript">

	$(function () {
		$("#rent_period_start").datepicker();
		$("#rent_period_end").datepicker();
		 	
		var rent_period_start = '${rent_period_start}';
		if(rent_period_start != ''){
			$('#rent_period_start').datepicker('setDate', '${rent_period_start}');
			$('#rent_period_end').datepicker('setDate', '${rent_period_end}');
		}else{
		   	$('#rent_period_start').datepicker('setDate', '-6M');
		   	$('#rent_period_end').datepicker('setDate', 'today');
		}
		       	 	
		$("#period").click(function(){
			var rent_period_start = $("#rent_period_start").val();
			var rent_period_end = $("#rent_period_end").val();
			location.href="/myGalleryRent?keyword=period&rent_period_start=" + rent_period_start + "&rent_period_end=" + rent_period_end;
		});
	});
		 
	function fn_search(keyword){
		location.href="/myGalleryRent?keyword=" + keyword;
  	}
	
	$.datepicker.setDefaults({
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
		    
	});
	</script>
	
</body>
</html>
