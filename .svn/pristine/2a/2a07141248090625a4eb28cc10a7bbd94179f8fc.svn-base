<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
	<%@include file="../include/option.jsp" %>
	<%@include file="../include/optionFunding.jsp" %>
<style>
	.btn_menu{
		width: 100px; 
		height: 100px;
		border-radius: 50%;
		margin-right: 100px;
		background-size: cover;
	}
	
</style>
</head>

<body>
	<%@include file="../include/headerFunding.jsp" %>
 <!-- Start Banner Hero -->
 	<div class="banner-wrapper bg-light" style="height: 580px;">
        <div id="index_banner" class="banner-vertical-center-index container-fluid pt-5" style="height:596px; background-image: url('./assets/img/walls.jpg')" >
            <!-- Start slider -->
            <p id="topTitle" style="font-size: 50px; color: white; width: 400px; margin-left: 44%; text-shadow: 2px 2px 5px red; margin-bottom: 0px;" >마감임박!</p>
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="height: 500px;">
                <ol class="carousel-indicators" style="margin-top: 473px;">
                    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
	                <c:forEach begin="1" end="${fn:length(fundBannerList)-1}" varStatus="status">
	                   	<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.count}"></li>
	                </c:forEach>
                </ol>
                <div class="carousel-inner" style="height: 580px;">
	                <c:forEach var="banner" items="${fundBannerList}" varStatus="status">
						<div class="carousel-item">
	                        <div class="row d-flex align-items-center">
	                            <div class="banner-content col-lg-8 col-8 offset-2 m-lg-auto text-left" style="background-color: white; border-radius:.25rem; text-shadow: 2px 2px 5px gray ">
									<div style="width: 100%; height: 80%;">
										<a href="fundDetail?fund_id=${banner.FUND_ID}&fund_code=${banner.FUND_CODE}">
											<img alt="사진" src="${banner.THUMBNAIL}" style="width: 46%; height: 396px; float: left; margin-top: 2%; margin-left: 1%;">
										</a>
										<p style="font-size: 35px; color: black; width: 500px; float: right;"  >
											${banner.NICKNAME}님의 펀딩(D-${banner.DDAY})
										</p>
										<p style="font-size: 25px; color: black; width: 500px; float: right; text-align: center;  margin-right: 5%;"  >
											${banner.FUND_TITLE} 
										</p>
										<p style="font-size: 20px; color: black; width: 500px; float: right; text-align: center;  margin-right: 5%;"  >
											목표금액
										</p>
										<p style="font-size: 20px; color: black; width: 500px; float: right; text-align: center;  margin-right: 5%;"  >
											<fmt:formatNumber value="${banner.FUND_ACHIEVE}" pattern="#,###" /> 원
										</p>
										<p style="font-size: 20px; color: black; width: 500px; float: right; text-align: center; margin-right: 5%;">
											진행률
										</p>
										<div class="progress" style="margin-left: 49%; width:45%; height: 20px;">
										    <div class="progress-bar progress-bar-striped" style="width: ${banner.RATE}%; height: 20px">
												${banner.RATE}%
											</div>
										</div>
										<button type="button" style="width: 200px; height: 80px; margin-left:19%; margin-top: 2%; margin-bottom: 2.5%" class="fund-btn btn-primary" onclick="location.href='fundDetail?fund_id=${banner.FUND_ID}&fund_code=${banner.FUND_CODE}'">펀딩하러가기</button>
									</div>
	                            </div>
	                        </div>                    
						</div>
					</c:forEach>
				
				<script type="text/javascript">
					document.querySelector( '.carousel-item' ).classList.add("active");
				</script>
				
					
                </div>
                <a class="carousel-control-prev text-decoration-none" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                    <i class='bx bx-chevron-left'></i>
                    <span class="visually-hidden">Previous</span>
                </a>
                <a class="carousel-control-next text-decoration-none" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                    <i class='bx bx-chevron-right'></i>
                    <span class="visually-hidden">Next</span>
                </a>
            </div>
            <!-- End slider -->
        </div>
    </div>
    <!-- End Banner Hero -->
    
    <section class="service-wrapper py-3">
		<div class="service-tag py-5 bg-secondary" style="padding-top:1rem!important; padding-bottom:1rem!important;">
			<div class="col-md-12">
				<ul class="nav d-flex justify-content-center">
					<li class="nav-item mx-lg-4"><a
						class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="funding">전체</a>
					</li>
					<c:forEach var="code" items="${codeList}">
					<li class="filter-btn nav-item mx-lg-4">
						<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="funding?fund_code=${code.fund_code}">${code.code_name}</a>
					</li>
					</c:forEach>
					<li class="filter-btn nav-item mx-lg-4">
						<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="funding?fund_code=cms">오픈예정</a>
					</li>
					<li class="filter-btn nav-item mx-lg-4">
						<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="funding?fund_code=end">마감된펀딩</a>
					</li>
					
					<c:if test="${user.user_id != null and user.user_level == 'u'}">
						<li class="filter-btn nav-item mx-lg-4">
							<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="/fundWriteFront">글쓰기</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</section>
    <div class="input-group" style="width:13.3%; margin:0 0 0 65.8%;"> 
		<input type="text" id="searchBar" name="keyword" class="form-control" placeholder="닉네임으로 검색">
		<button type="button" class="btn btn-outline-secondary" id="searchBtn">search</button>
	</div>
	<section class="ftco-section" style="padding: 4em 0;">
		<div class="container">
			<div class="row">
			<c:forEach var="fund" items="${fundList.content}">
			
			<!-- jstl 변수선언부 시작 -->
			<fmt:parseNumber var="rate" type="number" value="${fund.RATE}" />
			<!-- jstl 변수선언부 끝 -->
			
				<div class="col-md-6 col-lg-3">
					<div class="causes causes-2 text-center ftco-animate">
						<a href="fundDetail?fund_id=${fund.FUND_ID}&fund_code=${fund.FUND_CODE}" class="img w-100">
							<c:choose>
								<c:when test="${fund.THUMBNAIL == null}">
									<img src="/imgUpload/sample/no_img.gif">
								</c:when>
								
								<c:otherwise>
									<img src="${fund.THUMBNAIL}">	
								</c:otherwise>
							</c:choose>
						</a>
						<div class="text p-3">
							<h2>
								<a href="fundDetail?fund_id=${fund.FUND_ID}">${fund.FUND_TITLE}</a>
							</h2>
							<p>${fund.NICKNAME}</p>
							<div class="goal mb-4">
								<p>
									<span><fmt:formatNumber value="${fund.FUND_ACHIEVE}" pattern="#,###"/></span>원
								</p>
								<div class="progress" style="height: 20px">
								<c:choose>
									<c:when test="${rate > 100}">
									<div class="progress-bar progress-bar-striped" style="width: 100%; height: 20px">
									${rate}%
									</div>
									</c:when>
									
									<c:otherwise>
									<div class="progress-bar progress-bar-striped" style="width: ${rate}%; height: 20px">
									${rate}%
									</div>
									</c:otherwise>
								</c:choose>								
								</div>
							</div>
							<p>
								<a href="fundDetail?fund_id=${fund.FUND_ID}&fund_code=${fund.FUND_CODE}" class="btn btn-light w-100">펀딩하기</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
	
			<!-- 페이징 시작 -->
			<div class="col-md-offset-3">
				<ul class="pagination justify-content-center">
					<c:if test="${fundList.startPage > 5}">
						<li class="page-item">
							<c:choose>
								<c:when test="${fund_code eq ''}">
									<a class="page-link" href="/funding?pageNum=${fundList.startPage-5}">이전</a>		
								</c:when>
								
								<c:otherwise>
									<a class="page-link" href="/funding?fund_code=${fund_code}&pageNum=${fundList.startPage-5}">이전</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:if>
					
					<c:choose>
						<c:when test="${fund_code eq ''}">
							<c:forEach begin="${fundList.startPage}" end="${fundList.endPage}" var="idx">
								<li class="page-item"><a class="page-link" href="/funding?pageNum=${idx}">${idx}</a></li>
							</c:forEach>		
						</c:when>
						
						<c:otherwise>
							<c:forEach begin="${fundList.startPage}" end="${fundList.endPage}" var="idx">
								<li class="page-item"><a class="page-link" href="/funding?fund_code=${fund_code}&pageNum=${idx}">${idx}</a></li>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${fundList.endPage < fundList.totalPages}">
						<c:choose>
							<c:when test="${fund_code eq ''}">
								<a class="page-link" href="/funding?pageNum=${fundList.startPage+5}">다음</a>		
							</c:when>
							
							<c:otherwise>
								<a class="page-link" href="/funding?fund_code=${fund_code}&pageNum=${fundList.startPage+5}">다음</a>
							</c:otherwise>
						</c:choose>
					</c:if>
					
				</ul>
			</div>
		</div>
	</div>
	</section>
	
	<%@include file="../include/footer.jsp" %>
	<%@include file="../include/footer_script.jsp" %>
	
	<script type="text/javascript">
	$(document).ready(function () {
		const fundCode = "${fund_code}";
			
		$("#searchBtn").click(function() {
			let keyword = $("#searchBar").val();
			fn_search(fundCode, keyword);
		});
		
		$("#searchBar").keydown(function(key) {
            if (key.keyCode == 13) {
            	let keyword = $("#searchBar").val();
            	fn_search(fundCode, keyword);    			
            }
        });
		
		function fn_search(fundCode, keyword) {
			console.log("fundCode", fundCode);
 			console.log("keyword", keyword);
 			
 			if (fundCode != '' && fundCode != null && fundCode != 'all') {
				location.href="/funding?fund_code="+fundCode+"&keyword="+keyword;
 			} else {
 				location.href="/funding?keyword="+keyword;
 			}
		}
	});
	</script>
	
	
</body>

</html>									