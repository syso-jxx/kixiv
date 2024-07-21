<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<head>
	<title>Purple Buzz HTML Template with Bootstrap 5 Beta 1</title>
	<meta charset="utf-8">
	<script src="/resources/asset/js/jquery.min.js"></script>
	<c:set var="URL" value="${pageContext.request.requestURL}" />
	<%@include file="../include/option.jsp" %>
	
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
		
		td:nth-child(3), th:nth-child(3) {
			width: 45%;
		}
		
		td:nth-child(4), th:nth-last-child(4) {
			width: 26%;
		}
		
		select{
			border:1px solid #ced4da;
			height: 38px;
 			border-radius:7%; 
		}
		
	
	</style>
	
</head>

<body>
	<%@include file="../include/header.jsp" %>
	
		<section class="service-wrapper py-3">
		<div class="service-tag py-5 bg-secondary">
			<div class="col-md-12">
				<ul class="nav d-flex justify-content-center">
					<li class="nav-item mx-lg-4"><a
						class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300"
						href="/user/userList">회원정보</a></li>
					<li class="filter-btn nav-item mx-lg-4"><a
						class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300"
						href="/report/report" data-filter=".ui">신고목록</a></li>
					<li class="nav-item mx-lg-4"><a
						class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300"
						href="/blackUser/blackList" data-filter=".branding">블랙리스트 목록</a>
				</ul>
			</div>
		</div>
	</section>
	
	
	
	<section class="container overflow-hidden py-5">
	<h1 class="text-dark h1" style="text-align:left;">신고내역</h1>
	<br/>
		<form action="">
		<div class="" style="float:right;margin-bottom:30px;">
			<div class="input-group" style="width:250px;float:right;">
				<input type="text" name="keyword" class="form-control col-sm-10" value="${page.keyword}">
				<div class="input-group-append">
					<button type="button" id="searchBtn" class="btn btn-outline-secondary">search</button>
				</div>
			</div>
			<div class="" style="float:right;">
				<select name=searchType>
					<option value="reason" <c:if test="${page.searchType eq 'reason'}">selected</c:if> >사유</option>
					<option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if> >내용</option>
				</select>
			</div>
		
		</div>
		</form>
		
		<div>
			<!-- 테이블 시작 -->
			<table class="table table-sm table-hover">
				<thead>
					<tr>
						<th scope="col">No.</th>
						<th scope="col">신고제목</th>
						<th scope="col">신고사유</th>
						<th scope="col">작성일</th>
						<th scope="col">처리상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list.size() > 0}">
							<c:forEach var="report" items="${list}" varStatus="status">
								<tr style="cursor:pointer;" onclick="reportDetail(${report.report_id})">
									<td style="width: 20px;">${status.count + (page.num-1)*page.postNum}</td>
									<td style="width: 600px;">${report.report_title}</td>
									<td style="width: 600px;">${report.report_reason}</td>
									<td style="width: 250px;"><fmt:formatDate value="${report.report_date}" pattern="yyyy-MM-dd"/></td>
									<c:if test="${report.report_yn eq 'y'}">
										<td style="color:#6266ea; width: 100px;">미처리</td>
									</c:if>
									<c:if test="${report.report_yn eq 'b'}">
										<td style="color:red; width: 100px;">이용제한</td>
									</c:if>
									<c:if test="${report.report_yn eq 'r'}">
										<td style="color:skyblue; width: 100px;">반려</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" rowspan="10">데이터가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>				
			</table>
		</div>
		
		
		<!-- 페이징 시작 -->
		<div class="col-md-offset-3">
			<ul class="pagination justify-content-center">
				<c:if test="${page.prev}">
					<li class="page-item">
						<a class="page-link" href="/report/report?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
					</li>
				</c:if>

				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
					<c:choose>
						<c:when test="${page.num != num}">
							<li class="page-item"><a class="page-link" href="/report/report?num=${num}${page.searchTypeKeyword}">${num}</a></li>
						</c:when>	
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="#" style="font-weight: bold" readonly">${num}</a></li>
						</c:otherwise>				
					</c:choose>
				</c:forEach>

				<c:if test="${page.next}">
					<li class="page-item">
						<a class="page-link" href="/report/report?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 끝 -->
	</section>
	
	<footer style="position:absolute;width:100%;bottom:0px;">
		<%@include file="../include/footer.jsp" %>
	</footer>
	
	<script>
 		$("#searchBtn").click(function(){
 			var searchType = $("select[name=searchType]").val();
 			var keyword = $("input[name=keyword]").val();
 			alert(searchType)
 			location.href="/report/report?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 		});
 		
 		function reportDetail(report_id){
 			location.href="/report/reportDetail?&report_id=" + report_id;
 		}
 		
 	</script>
	
	
</body>
</html>