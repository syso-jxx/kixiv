<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<head>
	<title>KIXIV - 세상의 모든 사진</title>
	<meta charset="utf-8">
	<script src="/resources/asset/js/jquery.min.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<%@include file="include/option.jsp" %>
	
	<style>
		td, th {
			text-align: center;
		}
		
		tr{
			height: 15px;
		}
		
		th {
			font-size: 1.2em;
		}
		
		td:nth-child(1), th:nth-child(1) {
			width: 5%;
		}
		
/* 		td:nth-child(2), th:nth-child(2) { */
/* 			width: 30%; */
/* 		} */
		
		td:nth-child(3), th:nth-child(3) {
			width: 15%;
		}
		
		select{
			border:1px solid #ced4da;
			height: 38px;
 			border-radius:7%; 
		}
		#insert_list .drop_the_text input{
		  background: #343a40;
		  background-image: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbEIOHH%2Fbtq8reXoCbL%2Fl78C3cWW5KpLAEySFIQpk0%2Ftfile.svg');
		  background-position: right;
/* 		  padding-left: 40px; */
/* /* 		  border: 1px solid #2e3238; */
/* 		  width: 100%; */
/* 		  height: 30px; */
		  box-sizing: border-box;
		  outline: none;
/* 		  border-radius: 3px; */
		}
	</style>
	
</head>

<body>
	<%@include file="include/header.jsp" %>
	<section class="container overflow-hidden py-5">
	<h1 class="text-dark h1" style="text-align:left;">갤러리 렌트 목록</h1>
		<br/>
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
		<br/>
		<div>
			<!-- 테이블 시작 -->
			<form>
			<table class="table table-sm table-hover">
				<thead>
					<tr>
						<th scope="col">No.</th>
						<th scope="col">갤러리명</th>
						<th scope="col">예약일자</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${myRentReqList.content.size() > 0}">
							<c:forEach var="gallery" items="${myRentReqList.content}" varStatus="st">
								<tr>
									<td style="text-align:center; width:8%; vertical-align: middle;" scope="col">
										${st.count + (myRentReqList.currentPage-1)*10}
										<input type="hidden" name="rent_imp_uid" value="${gallery.RENT_IMP_UID}">
										<input type="hidden" name="rent_num" value="${gallery.RENT_NUM}">
									</td>
									<td style="text-align:center; width:52%;vertical-align: middle;" scope="col">${gallery.GALLERY_NAME}</td>
									<td style="text-align:center; width:30%;vertical-align: middle;" scope="col">${gallery.RENT_REQ_DATE}</td>
									<c:choose>
										<c:when test="${gallery.CANCEL_STATUS eq 'n'}">
											<td style="text-align:center; vertical-align: middle; width:10%;" scope="col">
												<button style="all:unset; text-decoration: underline; cursor:pointer;" type="button" onclick="location.href='/myGalleryRentReceipt?rent_num=${gallery.RENT_NUM}'">결제완료</button>
											</td>
										<a></a>
										</c:when>
										<c:when test="${gallery.CANCEL_STATUS eq 'y'}">
											<td style="text-align:center; vertical-align: middle; width:10%;" scope="col">
												<button style="all:unset; text-decoration: underline; cursor:pointer;" type="button" onclick="location.href='/myGalleryRentReceipt?rent_num=${gallery.RENT_NUM}'">환불완료</button>
											</td>
										<a></a>
										</c:when>
										<c:otherwise>
											<td style="text-align:center; vertical-align: middle; width:10%;" scope="col">
												<button style="all:unset; text-decoration: underline; cursor:pointer;" type="button" onclick="location.href='/myGalleryRentReceipt?rent_num=${gallery.RENT_NUM}'">환불진행중</button>
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" rowspan="10">데이터가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>				
			</table>
			</form>
		</div>
	</section>
	<section class="ftco-section">
		<!-- 페이징 시작 -->
		<div class="col-md-offset-3">
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${myRentReqList.keyword eq 'period'}">
						<c:if test="${myRentReqList.startPage > 5}">
							<li class="page-item">
								<a class="page-link" href="/myGalleryRentReqList?keyword=period&rent_period_start=${rent_period_start}&rent_period_end='${rent_period_end}'&pageNum='${myRentReqList.startPage-5}'">이전</a>
							</li>
						</c:if>
						<c:forEach begin="${myRentReqList.startPage}" end="${myRentReqList.endPage}" var="idx">
							<li class="page-item">
								<a class="page-link" href="/myGalleryRentReqList?keyword=period&rent_period_start=${rent_period_start}&rent_period_end=${rent_period_end}&pageNum=${idx}">${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${myRentReqList.endPage < myRentReqList.totalPages}">
							<li class="page-item">
								<a class="page-link" href="/myGalleryRentReqList?keyword=period&rent_period_start=${rent_period_start}&rent_period_end=${rent_period_end}&pageNum=${myRentReqList.startPage+5}">다음</a>
							</li>
						</c:if>
					</c:when>
					<c:otherwise>
						<c:if test="${myRentReqList.startPage > 5}">
							<li class="page-item">
								<a class="page-link" href="/myGalleryRentReqList?keyword=${myRentReqList.keyword}&pageNum=${myRentReqList.startPage-5}">이전</a>
							</li>
						</c:if>
						<c:forEach begin="${myRentReqList.startPage}" end="${myRentReqList.endPage}" var="idx">
							<li class="page-item"><a class="page-link" href="/myGalleryRentReqList?keyword=${myRentReqList.keyword}&pageNum=${idx}">${idx}</a></li>
						</c:forEach>
						<c:if test="${myRentReqList.endPage < myRentReqList.totalPages}">
							<li class="page-item">
								<a class="page-link" href="/myGalleryRentReqList?keyword=${myRentReqList.keyword}&pageNum=${myRentReqList.startPage+5}">다음</a>
							</li>
						</c:if>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</section>
	
	
	<footer style="position:absolute;width:100%;top:900px;">
		<%@include file="include/footer.jsp" %>
	</footer>
	<script>

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
    		location.href="/myGalleryRentReqList?keyword=period&rent_period_start=" + rent_period_start + "&rent_period_end=" + rent_period_end;
    	});
    });
		 
	function fn_search(keyword){
   	 location.href="/myGalleryRentReqList?keyword=" + keyword;
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