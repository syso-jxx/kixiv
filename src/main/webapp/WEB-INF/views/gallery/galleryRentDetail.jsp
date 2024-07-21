<%@page import="org.springframework.format.Printer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<%
	String rent_seq = request.getParameter("rent_seq") == null ? "1" : request.getParameter("rent_seq");
%>
<head>



<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<%@include file="../include/option.jsp"%>
<script src="/asset/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.no-js { display:none; }

ol, ul, li {
	list-style: none;
}

i {
	font-style: normal;
}

.menu {
	list-style: none;
	position: relative;
	min-height: 22px;
	margin: 15px 0;
	line-height: 22px;
	font-size: 16px;
}

.menu i {
	font-style: normal;
}

.product-item ul>li:before {
	content: '';
}

a {
	text-decoration: none;
	color: black;
}

.product-item .main-content {
	padding: 0px 46px 25px 20px;
	box-sizing: border-box;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	color: #222;
	width: 100%;
	height: 100%;
	-webkit-flex-flow: column;
	-ms-flex-flow: column;
	flex-flow: column;
}

h1 {
	letter-spacing: 0px;
	letter-spacing: .02rem;
	font-size: 48px;
	font-size: 3rem;
}

h3 {
	color: #666;
	font-size: 19px;
	font-size: 1.2rem;
	font-family: inherit;
}

.description {
	margin-top: 15px;
	width: 100%;
}

.highlight-window {
	/*margin-top: 25px;*/
	height: 550px;
	width: 400px;
	/* 	  background: #ccc; */
	transition: all .5s ease;
	background-size: cover;
	/*box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.2);*/
	z-index: 10;
	position: relative;
	background-position: center top;
    margin-left: 25%;
    margin-top: 14%;
    height: 450px;
}

a {
	text-decoration: none;
}

a:hover {
	color: #666;
}

#homepage:hover {
	text-decoration: underline;
}

.product-item .button {
	background: #333;
	border: none;
	font-weight: 400;
	height: 40px;
	margin-top: auto;
	margin-bottom: auto;
	padding-left: 25px;
	padding-right: 25px;
	box-sizing: border-box;
	color: #fff;
	cursor: pointer;
	-webkit-transition: all .3s ease;
	transition: all .3s ease;
}

.product-item .button:hover {
	background: #555;
	-webkit-transition: all .3s ease;
	transition: all .3s ease;
}

.divider {
	width: 80%;
	height: 1px;
	background: #ddd;
	margin-top: 20px;
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
}

.purchase-info {
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
}

.price {
	font-size: 40px;
	font-size: 2.5rem;
	white-space: nowrap;
}

.product-item .price span {
	text-decoration: line-through;
	margin-right: 20px;
}

.highlight-window.mobile {
	display: none;
}

.product-item .h3 {
	text-transform: uppercase;
	font-size: 12px;
	letter-spacing: 2px;
	color: #808080;
	font-family: inherit;
	/*font-style: italic;*/
	/*font-family: 'Playfair Display', serif*/
}

.product-item p {
	letter-spacing: 1px;
	font-size: 14px;
	color: #808080;
	line-height: 25px;
}

.product-item .description ul {
	margin: 0;
	padding: 0;
	margin-left: 15px;
}

.product-item .description ul li {
	font-size: 1.3rem;
	letter-spacing: 0.5px;
	/*color: #666;*/
	list-style-type: none;
	padding: 0;
	line-height: 2.5rem;
}

.product-item form {
	margin-top: 20px;
}

.product-block {
	margin-top: 10px;
}

.product-item input::-webkit-input-placeholder, .product-item textarea::-webkit-input-placeholder,
	.product-item select::-webkit-input-placeholder {
	color: #ccc;
	opacity: 1;
}

.product-item input::-moz-input-placeholder, .product-item textarea::-moz-input-placeholder,
	.product-item select::-moz-input-placeholder {
	color: #ccc;
	opacity: 1;
}

.product-item input::-ms-input-placeholder, .product-item textarea::-ms-input-placeholder,
	.product-item select::-ms-input-placeholder {
	color: #ccc;
	opacity: 1;
}

@media ( max-width : 600px) {
	.product-item .purchase-info {
		display: block;
		text-align: center;
	}
	.product-item .button {
		margin-top: 30px;
	}
	.highlight-window {
		height: 400px;
		width: auto;
	}
	.product-block {
		margin-top: 0px;
	}
}

@media ( min-width : 992px) {
	.col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3,
		.col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9 {
		float: left;
	}
	@media ( min-width : 992px) {
		.col-md-6 {
			width: 50%;
		}
	}
}
</style>
<script type="text/javascript">
	
	// 모댓글 수정
	function fn_edit(para) {
		var vara = document.getElementById("collapseStyle" + para);
		var varb = document.getElementById("collapseStyleOpt" + para);
		var varc = document.getElementById("editing" + para);
		var vard = document.getElementById("editingNull" + para);
		vara.style.display = "none";
		varb.style.display = "none";
		varc.style.display = "block";
		vard.style.display = "block";
	}
	// 모댓글 수정 취소
	function fn_show(para) {
		var vara = document.getElementById("collapseStyle" + para);
		var varb = document.getElementById("collapseStyleOpt" + para);
		var varc = document.getElementById("editing" + para);
		var vard = document.getElementById("editingNull" + para);
		vara.style.display = "block";
		varb.style.display = "block";
		varc.style.display = "none";
		vard.style.display = "none";
	}

	// 대댓글 등록 (답글쓰기 버튼을 누르면 나타나는 창)
	function fn_reply_write(para) {
		var varc = document.getElementById("reEditing" + para);
		var vard = document.getElementById("reEditingNull" + para);
		varc.style.display = "block";
		vard.style.display = "block";
	}

	// 대댓글 취소 (답글쓰기의 취소 버튼을 누르면 사라짐)
	function fn_reply_writeCancel(para) {
		var varc = document.getElementById("reEditing" + para);
		var vard = document.getElementById("reEditingNull" + para);
		varc.style.display = "none";
		vard.style.display = "none";
	}
	
	// 대댓글 수정 (답글쓰기 버튼을 누르면 나타나는 창)
	function fn_reply_edit(para) {
		var vara = document.getElementById("replyStyle" + para);
		var varb = document.getElementById("replyStyleOpt" + para);
		var varc = document.getElementById("replyEditing" + para);
		var vard = document.getElementById("replyEditingNull" + para);

		vara.style.display = "none";
		varb.style.display = "none";
		varc.style.display = "block";
		vard.style.display = "block";
	}
	// 대댓글 수정  취소 (답글쓰기 버튼을 누르면 나타나는 창)
	function fn_reply_show(para) {
		var vara = document.getElementById("replyStyle" + para);
		var varb = document.getElementById("replyStyleOpt" + para);
		var varc = document.getElementById("replyEditing" + para);
		var vard = document.getElementById("replyEditingNull" + para);

		vara.style.display = "block";
		varb.style.display = "block";
		varc.style.display = "none";
		vard.style.display = "none";
	}
	
	function goodBad(gb_status, index){
		var cmtId_1 = $('.comment-id1' + index).val();
		var rent_seq1 = $('.rent_seq1' + index).val();
 		
		 $.ajax({
			url:'/galleryRentCmtStatus',
			data : 
			{
				gb_status : gb_status,
				cmtId : cmtId_1
			},
			type:'post',
			success:function(data){
				console.log(data.gb_list)
				console.log(data.gb_list[0])
				console.log(data.gb_list[1])
				let good = data.gb_list[0].cntg; 	// 좋아요 갯수
				console.log(good);
				let bad = data.gb_list[0].cntb;		//싫어요 갯수
				console.log(bad);
				
				$(".good"+index).html(good);
				$(".bad"+index).html(bad);
			}
		}); 
	};

	
</script>
</head>

<body>

	<!-- Header -->
	<%@include file="../include/header.jsp"%>
	<!-- Close Header -->
	<section class="container overflow-hidden py-5">
		<section id='pricing' class='pricing-section'>
			<form id="frm" name="frm" method="post"
				action="delete?rent_seq=${rent.RENT_SEQ}">
				<div class='container'>
					<div class='row'>
						<div class="product-block">
							<div class="col-md-6 wow fadeInUp" data-wow-delay='.4s'>
								<div class='background-element' id='background-element'></div>
								<div class='highlight-window' id='product-img'
									style="background-repeat: no-repeat; background-size: contain; 
									background-image: url('${rent.GALLERY_IMG}')">
									<div class='highlight-overlay' id='highlight-overlay'></div>
								</div>
							</div>
							<div class="col-md-6 wow fadeInUp" data-wow-delay='.4s' >
								<div class='product-item'>
									<div class='main-content' style="margin-top: 60px;">
										<h2>${rent.GALLERY_NAME}</h2>
										<div class='description' id='description'>
											<h3 class="h3">ABOUT THE RENTAL::</h3>
											<div style="display: block;">
												<a style="font-weight:bold; float: left; height: 35px; margin-right: 10px; position: relative; top: 2px;">
												대여기간
												</a> 
												<div style="display: block; padding-left: 120px;">
													<div style="display: flex;">
														<div style="display: inline-block;">
															<a>${rent.RENT_SDATE} ~ ${rent.RENT_EDATE}</a>
														</div>
													</div>
												</div>
											</div>	
											<br/>
											<div style="display: block;">
												<a style="font-weight:bold; float: left; height: 35px; margin-right: 10px; position: relative; top: 2px;">
												연락처
												</a> 
												<div style="display: block; padding-left: 120px;">
													<div style="display: flex;">
														<div style="display: inline-block;">
															<a>${rent.GALLERY_TEL}</a>
														</div>
													</div>
												</div>
											</div>	
											<br/>
											<div>
												<a style="font-weight:bold; float: left; height: 35px; margin-right: 10px; position: relative; top: 2px;">
												장소
												</a> 
												<div style="display: block; padding-left: 120px;">
													<div style="display: flex;">
														<div style="display: inline-block;">
															<a>(${rent.GALLERY_ZIP}) ${rent.GALLERY_ADD1} ${rent.GALLERY_ADD2}</a>
														</div>
													</div>
												</div>
											</div>
											<br/>	
											<div>
												<a style="font-weight:bold; float: left; height: 35px; margin-right: 10px; position: relative; top: 2px;">
												대표홈페이지
												</a> 
												<div style="display: block; padding-left: 120px;">
													<div style="display: flex;">
														<div style="display: inline-block;">
															<a id="homepage" href="${rent.HOMEPAGE}">${rent.HOMEPAGE}</a>
														</div>
													</div>
												</div>
											</div>	
											<br/>
											<div>
												<a style="font-weight:bold; float: left; height: 35px; margin-right: 10px; position: relative; top: 2px;">
												담당자
												</a> 
												<div style="display: block; padding-left: 120px;">
													<div style="display: flex;">
														<div style="display: inline-block;">
															<a>${rent.PHONE}</a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='highlight-window  mobile' id='product-img'>
											<div class='highlight-overlay' id='highlight-overlay-mobile'></div>
										</div>
										<div class="col-sm-12">
											<div class='divider'></div>
											<div class='purchase-info'>
												<div class='price' style="margin-right: 10px;">
													<fmt:formatNumber value="${rent.RENT_PRICE}" pattern="#,###" />
													￦
												</div>
													<c:if test="${rent.RENT_STATUS eq 'y' || rent.RENT_STATUS eq 'n'}">
														<input type="button" class="button"
															style="padding: 0 50px 0 50px;" value="RENT" onclick="fn_rent('${user.user_id}');"> 
													</c:if>
													<c:if test="${rent.RENT_STATUS eq 'e'}">
														<input type="button" class="button"
															style="padding: 0 50px 0 50px;" value="예약 종료" onclick="fn_end();"> 
													</c:if>
														<input type="hidden" id="rent_status" value="${rent.RENT_STATUS}">
													<input type="hidden" id="fund_yn" value="${rent.FUND_YN}">
													<input type="hidden" id="rent_seq" value="${rent.RENT_SEQ}">
													<input type="hidden" id="user_id" value="${rent.USER_ID}">
											</div>
										</div>
									</div>
								</div>
								<a style="margin-left: 80%; text-decoration: underline; cursor: pointer;" href="#" id="report_go">신고하기</a>
							</div>
						</div>
					</div>
				</div>
				<div style="text-align: center; margin-top:100px; margin-bottom: 100px;">
				<pre>${rent.RENT_CONTENT}</pre>
				</div>
			</form>
		</section>
<!-------------------------------------------------------------------- 지도 API  --------------------------------------------------------------------->
		<!--  project and team member start -->
		<div class="col-xl-8 col-md-12"
			style="width: 100%; background-color: white; border: none;">
			<div class="card table-card" style="border: none;">
				<div class="card-header"
					style="width: 100%; text-align: center; background-color: white; border: none;">
					<div class="card-header-right"
						style="width: 50%; display: inline-block;">
						<!-- Markers map start -->
						<div class="card" style="text-align: center;">
							<div class="card-block">
								<div id="map" style="width: 100%; height: 350px;" class="set-map"></div>
							</div>
						</div>
						<!-- Markers map end -->
					</div>
				</div>
			</div>
 			<c:if test="${rent.USER_ID eq user.user_id}">
 				<c:if test="${rent.RENT_STATUS eq 'y'}">
					<div>
						<input style="float:right; margin-bottom:20px; " type="button" class="btn btn-dark mt-3" onClick="location.href='/galleryRentDelete?rent_seq=${rent.RENT_SEQ}'" value="삭제">
						<input style="float:right; margin-bottom:20px; margin-right:10px;" type="button" class="btn btn-dark mt-3" onClick="location.href='/galleryRentModify?rent_seq=${rent.RENT_SEQ}'" value="수정">
					</div>
				</c:if>
 			</c:if> 
		</div>
<!------------------------------------------------------------------ 댓글 div 시작  ------------------------------------------------------------------->
		<div class="card mb-2">
			<div class="card-header bg-light"
				style="background-color: #EFEFFB; margin-bottom: 10px;">댓글
				</div>
			<c:forEach var="list" items="${rentCmtList}" varStatus="stat" >
				<c:choose>
					<c:when test="${list.del_yn eq 'n'}">
						<!-- 깊이가 0이면 출력 -->
						<c:choose>
							<c:when test="${list.grpl eq 0}">
							
<!------------------------------------------------------------------ 댓글 목록 출력  -------------------------------------------------------------------->
						<ul style="border-bottom: 1px solid #e2e2e2;">
							<li>
								<div style="display: block;">
									<div style="width: 98%;">
										<div>
											<form action="galleryRentCmtDeletePros?rent_seq=${list.rent_seq}" method="POST" onsubmit="return fn_deleteConfirm()">
												<div>
													<a style="border-radius: 70%; overflow: hidden; width: 35px; height: 35px; float: left; margin-right: 10px; position: relative; top: 2px;">
														<img style="width: 100%; height: 100%; object-fit: cover;" src="${list.profile_img}">
													</a>
													<div style="display: block; padding-left: 46px;">
														<div style="display: flex;">
															<div style="display: inline-block;">
																<a style="font-weight: bold;" href="/userPage?user_id=${list.user_id}">${list.user_id}</a>
															</div>
															<c:choose>
																<c:when test="${list.user_id eq rent.user_id}">
																	<div style="margin-left: 8px; margin-top: 2px; display: inline-block; border: 1px solid black; border-radius: 10%; width: 50px; height: 18px; font-size: 12px; text-align: center; float: right;">작성자</div>
																</c:when>
																<c:otherwise>
																	<div></div>
																</c:otherwise>
															</c:choose>
														</div>
														<div id="collapseStyle${list.cmt_id}"
															style="display: block;">
															<p class="collapse multi-collapse-${list.cmt_id} show">
																<span style="font-size: 15px;">${list.cmt_content}</span>
															</p>
														</div>
<!------------------------------------------------------------- [모댓글] 날짜, 선택사항, 추천/비추천  ------------------------------------------------------------->
														<div id="collapseStyleOpt${list.cmt_id}"
															style="display: block;">
															<span style="font-size: 13px;">
															<fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${list.cmt_date}" /></span>
															<input type="hidden" class="comment-delYn${stat.count}" name="del_yn" value="${list.del_yn}"> 
															<input type="hidden" name="grp" value="${list.grp}"> 
															<input type="hidden" class="comment-id1${stat.count}" class="cmt_id" name="cmt_id" value="${list.cmt_id}">
															<input type="hidden" class="rent_seq1${stat.count}" value="${list.rent_seq}">
															<input type="button" value="답글쓰기"
																style="all: unset; font-size: 14px; cursor: pointer;"
																onclick="fn_reply_write('${list.cmt_id}')"> <!-- display:none 되어있던 답글쓰기 textarea 노출 -->
																
															<c:if test="${list.user_id eq user.user_id }">
																<input
																	type="button" class="comment-edit-btn" value="수정"
																	style="all: unset; font-size: 14px; cursor: pointer;"
																	onclick="fn_edit('${list.cmt_id}')">
																<input
																	type="submit" value="삭제"
																	style="all: unset; font-size: 14px; cursor: pointer;">
															</c:if>
															
															<div style="float: right; margin-right: 15px; display: block;">
															
																<button 
																	name="gb_status" 
																	class="gb_status"  
																	type="button" 
																	id="likeBtn" 
																	style="all : unset; cursor : pointer;" 
																	onclick="goodBad(1, ${stat.count});">
																		<i class="far fa-thumbs-up"></i>
																</button> 
																<span class="good${stat.count}" style="margin-right: 15px; font-size: 14px;">${list.good}</span>
																
																<button 
																	name="gb_status" 
																	class="gb_status" 
																	type="button" 
																	id="badBtn"
																	style="all : unset; cursor : pointer;" 
																	onclick="return goodBad(2, ${stat.count});" >
																		<i class="far fa-thumbs-down"></i>
																</button>
																<span class="bad${stat.count}" style="font-size: 14px;">${list.bad}</span>
															</div>
														</div>
													</div>
												</div>
											</form>
											
<!-------------------------------------------------------------------- [모댓글] 수정 폼  -------------------------------------------------------------------->
											<div id="editing${list.cmt_id}" style="display: none;">
												<form id="commentListForm" name="commentListForm"
													method="post" onsubmit="return fn_editConfirm();"
													action="galleryRentCmtUpdate?rent_seq=${list.rent_seq}"
													method="post">
													<input type="hidden" id="comment-id" name="cmt_id"
														value="${list.cmt_id}"> 
													<input type="hidden"
														id="comment-author" name="user_id" value="${list.user_id}">
													<input type="hidden"
														id="comment-author" name="rent_seq" value="${list.rent_seq}">
													<textarea name="cmt_content" class="form-control"
														id="comment-content"
														style="width: 100%; margin-top: 20px;" rows="3">${list.cmt_content}</textarea>
													<input type="button" class="btn btn-dark mt-3"
														style="float: right; margin-bottom: 10px;" value="취소"
														style="font-size:14px;cursor:pointer;"
														onclick="fn_show('${list.cmt_id}')"> 
													<input
														type="submit" class="btn btn-dark mt-3"
														style="float: right; margin-right: 10px; margin-bottom: 10px;"
														value="완료" style="font-size:14px;cursor:pointer;">
												</form>
											</div>
											<div id="editingNull${list.cmt_id}" style="display: none;"></div>
										</div>
									</div>
								</div> 
								<!--------------------------------------------- [대댓글] 작성 폼 ------------------------------------------->
								<div id="reEditing${list.cmt_id}" style="display: none; width:100%;">
											<i class="fas fa-level-up-alt fa-rotate-90 " style="width:90px; height:90px; margin-top:40px;" ></i>
										<div style=" width:88%; float:right; margin-right:30px;">
											<form id="commentListForm" name="commentListForm"
												method="post" onsubmit="return fn_reply_write();"
												action="galleryRentCmtReWrite?rent_seq=${list.rent_seq}"
												method="post">
												<input type="hidden" id="comment-id" name="cmt_id" value="${list.cmt_id}"> 
												<input type="hidden" id="comment-author" name="rent_seq" value="${list.rent_seq}">
												<textarea name="cmt_content" class="form-control" id="comment-content"
													style="width: 100%; margin-top: 20px;" rows="3"></textarea>
												<input type="button" class="btn btn-dark mt-3"
													style="float: right; margin-bottom: 10px;" value="취소"
													style="font-size:14px;cursor:pointer;"
													onclick="fn_reply_writeCancel('${list.cmt_id}')"> <!-- 다시 창 사라지게 -->
												<input
													type="submit" class="btn btn-dark mt-3"
													style="float: right; margin-right: 10px; margin-bottom: 10px;"
													value="등록" style="font-size:14px;cursor:pointer;">
											</form>
										</div>
									<div id="reEditingNull${list.cmt_id}" style="display: none;"></div>
								</div>
								
								<!-- 깊이가 1이면 출력 -->
								
								</c:when>
								<c:otherwise>
		<!-------------------------------------------------------------------- [대댓글] 시작  -------------------------------------------------------------------->
										<ul style="border-bottom: 1px solid #e2e2e2;">
											<li>
												<div style="padding: 25px; float:left; display: block; margin-top:0px; margin-left:20px;">
												<i class="fas fa-level-up-alt fa-rotate-90 " style="vertical-align:middle;"  ></i>
												</div>
												<div style="display: block; margin-left: 60px;">
													<div style="display: block; width: 96.5%; float:left;">
														<div>
				<!--------------------------------------------- [대댓글] 목록 폼------------------------------------------------>
															<form onsubmit="return fn_reDeleteConfirm();" action="galleryRentCmtReDelete?rent_seq=${list.rent_seq}" method="post">
																<div>
																	<a style="border-radius: 70%; overflow: hidden; width: 35px; height: 35px; float: left; margin-right: 10px; position: relative; top: 2px;">
																		<img style="width: 100%; height: 100%; object-fit: cover;" src="${list.profile_img}">
																	</a>
																	<div style="display: block; padding-left: 46px;">
																		<div style="display: flex;">
																			<div style="display: inline-block;">
																				<a style="font-weight: bold;" href="/userPage?user_id=${list.user_id}">${list.user_id}</a>
																			</div>
																			<c:choose>
																				<c:when test="${list.user_id eq rent.user_id}">
																					<div
																						style="margin-left: 8px; margin-top: 2px; display: inline-block; border: 1px solid black; border-radius: 10%; width: 50px; height: 18px; font-size: 12px; text-align: center; float: right;">
																						작성자</div>
																				</c:when>
																			</c:choose>
																		</div>
																		<div id="replyStyle${list.cmt_id}" style="display: block;">
																			<p class="collapse multi-collapse-${list.cmt_id} show">
																				<span style="font-size: 15px;">${list.cmt_content}</span>
																			</p>
																		</div>
				<!---------------------------------- [대댓글] 날짜, 수정, 삭제, 좋아요/싫어요 선택 폼  ------------------------------->
																		<div id="replyStyleOpt${list.cmt_id}"
																			style="display: block;">
																			<span style="font-size: 13px;"><fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${list.cmt_date}" /></span> 
																			<input type="hidden" class="comment-delYn${stat.count}" name="del_yn" value="${list.del_yn}"> 
																			<input type="hidden" class="comment-id1${stat.count}" name="cmt_id" value="${list.cmt_id}">
																			<input type="hidden" class="comment-id1${stat.count}" id="user_id" value="${user.user_id}">
																			<input type="hidden" name="grp" value="${list.grp}"> 
																			<input type="hidden" class="rent_seq1${stat.count}" value="${list.rent_seq}">
																			<c:if test="${list.user_id eq user.user_id }">
																				<input type="button"
																					class="comment-edit-btn" value="수정"
																					style="all: unset; font-size: 14px; cursor: pointer;"
																					onclick="fn_reply_edit('${list.cmt_id}')"> 
																				<input
																					type="submit" value="삭제"
																					style="all: unset; font-size: 14px; cursor: pointer;"
																					>
																			</c:if>	
																			<div style="float: right; margin-right: 15px; display: block;">
																				<button name="gb_status" class="gb_status"  type="button" id="reLikeBtn" style="all:unset; cursor:pointer" onclick="goodBad(1, ${stat.count});"><i class="far fa-thumbs-up"></i></button> 
																				<span class="good${stat.count}" style="margin-right: 15px; font-size: 14px;">${list.good}</span>
																				<button name="gb_status" class="gb_status"  type="button"  id="reBadBtn" style="all:unset; cursor:pointer" onclick="goodBad(2, ${stat.count});"><i class="far fa-thumbs-down"></i></button>
																				<span class="bad${stat.count}" style="font-size: 14px;">${list.bad}</span>
																			</div>
																		</div>
																	</div>
																</div>
															</form>
				<!--------------------------------------------- [대댓글] 수정 폼 ------------------------------------------->
															<div id="replyEditing${list.cmt_id}" style="display: none;">
																<form id="commentListForm" name="commentListForm"
																	method="post" onsubmit="return fn_reEditConfirm();"
																	action="galleryRentCmtReUpdate?rent_seq=${list.rent_seq}"
																	method="post">
																	<input type="hidden" id="comment-id" name="cmt_id"
																		value="${list.cmt_id}"> <input type="hidden"
																		id="comment-author" name="user_id"
																		value="${list.user_id}">
																	<textarea name="cmt_content" class="form-control"
																		id="comment-content"
																		style="width: 100%; margin-top: 20px;" rows="3">${list.cmt_content}</textarea>
																	<input type="button" class="btn btn-dark mt-3"
																		style="float: right; margin-bottom: 10px;" value="취소"
																		style="font-size:14px;cursor:pointer;"
																		onclick="fn_reply_show('${list.cmt_id}')"> <input
																		type="submit" class="btn btn-dark mt-3"
																		style="float: right; margin-right: 10px; margin-bottom: 10px;"
																		value="작성" style="font-size:14px;cursor:pointer;">
																</form>
															</div>
															<div id="replyEditingNull${list.cmt_id}"
																style="display: none;"></div>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</c:otherwise>
								</c:choose>
							</li>
						</ul>
					</c:when>
					<c:otherwise>
<!---------------------------------------------------------------- [모댓글] 삭제 시 출력  -------------------------------------------------------------------->
						<ul style="border-bottom: 1px solid #e2e2e2;">
							<li>
								<div style="display: block;">
									<div style="width: 98%;">
										<p class="collapse multi-collapse-${list.cmt_id} show">
											<i class="far fa-trash-alt"></i><span
												style="font-size: 15px;"> 삭제된 댓글입니다</span>
										</p>
										<div style="display: block; padding-left: 46px;">
											<div style="display: flex;">
												<div style="display: inline-block;"></div>
												<div id="collapseStyle${list.cmt_id}"
													style="display: block;"></div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</c:forEach>
<!------------------------------------------------------------------ [모댓글] 작성  -------------------------------------------------------------------->
			<div class="card-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="form-inline mb-2"></div>
						<form id="commentForm" name="commentForm"
							action="galleryRentCmtWrite?rent_seq=${rent.RENT_SEQ}"
							method="post">
							<input type="hidden" name="rent_seq" value="${rent.RENT_SEQ}">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3" id="comment" name="cmt_content" placeholder="댓글을 입력하세요"></textarea>
							<input type="submit" class="btn btn-dark mt-3" style="float: right;" value="등록">
						</form>
					</li>
				</ul>
			</div>
		</div>
	</section>
	<!-- End Service -->
	<%@include file="../include/footer.jsp"%>
<!------------------------------------------------------------------ 스크립트  -------------------------------------------------------------------->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31ab92ff81b5e802829fff6e36dc7d08&libraries=services"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						"${rent.GALLERY_ADD1} ${rent.GALLERY_ADD2}",
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">${rent.gallery_name}</div>'
										});
								kakao.maps.event.addListener(marker,
										'mouseover', function() {
											// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
											infowindow.open(map, marker);
										});
								// 마커에 마우스아웃 이벤트를 등록합니다
								kakao.maps.event.addListener(marker,
										'mouseout', function() {
											// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
											infowindow.close();
										});
								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});

		
	function fn_rent(user_id){
			
		var rent_status = $('#rent_status').val();
		var fund_yn = $('#fund_yn').val();
		var rent_seq = $('#rent_seq').val()
		
		if(typeof user_id == "undefined" || user_id == null || user_id == ""){
			alert("로그인 후 렌트 가능합니다.")
			location.href = "/login";
		}else{
			if(rent_status == 'n' || fund_yn == 'n'){
				alert("이미 예약된 갤러리입니다.")
				return false;
			}else if(rent_status == 'e'){
				alert("이미 예약 종료된 갤러리입니다.")
				return false;
			}else{
				if(confirm("이 갤러리를 대여하시겠습니까?")){
					location.href="/galleryRentReq?rent_seq=" + rent_seq ;
				}
			}
		}
	}
	
	$('#report_go').click(function () {
		var url = '';
		var bad_user_id = $('#user_id').val();
		alert(bad_user_id);
		url = window.document.location.href;
		alert("URL이 복사되었습니다.")
		var urls = '../report/reportWhite?url='+url+'&bad_user_id='+bad_user_id;
		alert(urls)
		window.open(urls); 
		location.reload();
	});
	
	function fn_end(){
		alert("이미 예약이 종료된 갤러리입니다.")
		return false;
	}
	
	function fn_editConfirm() {
		if(confirm("수정하시겠습니까?")) {
			return true;
		}
		
		return false;
	}
	
	function fn_deleteConfirm() {
		if(confirm("삭제하시겠습니까?")) {
			return true;
		}
		
		return false;
	}
	function fn_reEditConfirm() {
		if(confirm("수정하시겠습니까?")) {
			return true;
		}
		
		return false;
	}
	
	function fn_reDeleteConfirm() {
		if(confirm("삭제하시겠습니까?")) {
			return true;
		}
		
		return false;
	}
	
	
	</script>
</body>
</html>