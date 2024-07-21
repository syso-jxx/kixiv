<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<head>
	<title>KIXIV - 세상의 모든 사진</title>
	<meta charset="utf-8">
	<script src="/resources/asset/js/jquery.min.js"></script>
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
			width: 14%;
		}
		
		td:nth-child(3), th:nth-child(3) {
			width: 20%;
		}
		
		td:nth-child(4), th:nth-last-child(4) {
			width: 18%;
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
	
	<section class="container overflow-hidden py-5">
	<h1 class="text-dark h1" style="text-align:left;">공지사항</h1>
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
					<option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if> >제목</option>
					<option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if> >내용</option>
					<option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if> >제목+내용</option>
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
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list.size() > 0}">
							<c:forEach var="notice" items="${list}" varStatus="status">
								<tr style="cursor:pointer;" onclick="noticeDetail(${notice.notice_id})">
									<td>${status.count + (page.num-1)*page.postNum}</td>
									<td>${notice.notice_title}</td>
									<td><fmt:formatDate value="${notice.notice_sdate}" pattern="yyyy-MM-dd"/> </td>
									<td>${notice.hit}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" rowspan="10">데이터가 없습니다.</td>
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
						<a class="page-link" href="/notice/notice?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
					</li>
				</c:if>

				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
					<c:choose>
						<c:when test="${page.num != num}">
							<li class="page-item"><a class="page-link" href="/notice/notice?num=${num}${page.searchTypeKeyword}">${num}</a></li>
						</c:when>	
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="#" style="font-weight: bold" readonly">${num}</a></li>
						</c:otherwise>				
					</c:choose>
				</c:forEach>

				<c:if test="${page.next}">
					<li class="page-item">
						<a class="page-link" href="/notice/notice?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 끝 -->
		
		<c:if test="${user.user_level == 'a' }">
			<div class="d-grid justify-content-end">
				<button class="btn btn-primary" onclick="javascript:location.href='/notice/write'">작성</button>
			</div>
		</c:if>
	</section>
	
	<footer style="position:absolute;width:100%;bottom:0px;">
		<%@include file="../include/footer.jsp" %>
	</footer>
	
	<script>
 		$("#searchBtn").click(function(){
 			var searchType = $("select[name=searchType]").val();
 			var keyword = $("input[name=keyword]").val();
 			location.href="/notice/notice?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 		});
 		
 		function noticeDetail(notice_id){
 			location.href="/notice/detail?&notice_id=" + notice_id;
 		}
 		
 		
 	</script>
	
	
</body>
</html>