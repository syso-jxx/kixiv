<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<%@include file="../include/option.jsp"%>
<style>
.btn_menu {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin-right: 100px;
	background-size: cover;
}
a {
	text-decoration: none;
	color: black;
}
tbody tr {
	height: 200px;
}
.btnhover :hover {
	font-weight: bold;
}
</style>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<section class="container overflow-hidden py-5">
		<h1 class="text-dark h1" style="text-align: left;">대여 정보</h1>
		<br />
		<form>
			<div class="input-group mb-3">
				<input type="text" id="keyword" name="keyword"
					class="form-control col-sm-10" value="${galleryRentList.keyword}">
				<div class="input-group-append">
					<button type="button" class="btn btn-outline-secondary"
						onclick="fn_search();" id="searchBtn">search</button>
				</div>
			</div>
			<c:if test="${user.user_level eq 'g'}">
				<input style="float: right; margin-bottom: 20px;" type="button"
					class="btn btn-dark mt-3"
					onClick="location.href='/galleryRentWrite'"
					value="글쓰기">
			</c:if>
		</form>
		<div>
			<table class="table table-sm table-hover">
				<thead>
					<tr style="font-size: 1.2em;">
						<th style="text-align: center; width: 8%;" scope="col">No.</th>
						<th style="text-align: center; width: 30%;" scope="col">대표사진</th>
						<th style="text-align: center; width: 52%;" scope="col">정보</th>
						<th style="text-align: center; width: 10%;" scope="col">진행상황</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${galleryRentList.content.size() > 0}">
							<c:forEach var="list" items="${galleryRentList.content}"
								varStatus="st">
								<tr>
									<td style="vertical-align: middle;">
										<div style="text-align: center;">
											<div style="position: relative; display: inline-block;">
												<c:choose>
													<c:when test="${galleryRentList.currentPage eq 1}">
												${st.count}
											</c:when>
													<c:otherwise>
												${(galleryRentList.currentPage-1)*10 + st.count}
											</c:otherwise>
												</c:choose>
											</div>
										</div>
									</td>
									<td style="vertical-align: middle;">
										<div style="text-align: center;">
											<a href="/galleryRentDetail?rent_seq=${list.RENT_SEQ}"><img
												alt="1" src="${list.GALLERY_IMG}"
												style="width: 250px; height: 150px;"></a>
										</div>
									</td>
									<td style="vertical-align: middle;">
										<button class="btnhover" style="all: unset; cursor: pointer;"
											onclick="location.href='/galleryRentDetail?rent_seq=${list.RENT_SEQ}'">
											<div>
												<div style="position: relative;">${list.GALLERY_NAME}</div>
												<div style="position: relative;">(${list.GALLERY_ZIP})
													${list.GALLERY_ADD1} ${list.GALLERY_ADD2}</div>
												<div style="position: relative;">대여 가능 일자 :
													${list.RENT_SDATE}~${list.RENT_EDATE}</div>
											</div>
										</button>
									</td>
									<td style="vertical-align: middle; text-align: center;">
									<c:choose>
										<c:when test="${list.RENT_STATUS eq 'n'}">
											<p style="color: red;">예약</p>
										</c:when>
										<c:when test="${list.RENT_STATUS eq 'e'}">
											<p style="color: gray;">예약불가</p>
								        </c:when>
										<c:otherwise>
											<p style="color: blue;">대기</p>
										</c:otherwise>
									</c:choose></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" rowspan="10"
									style="text-align: center; vertical-align: middle;">데이터가
									없습니다.</td>
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
				<c:if test="${galleryRentList.startPage > 5}">
					<li class="page-item"><a class="page-link"
						href="/galleryRentEvent?pageNum=${galleryRentList.startPage-5}">이전</a>
					</li>
				</c:if>

				<c:forEach begin="${galleryRentList.startPage}"
					end="${galleryRentList.endPage}" var="idx">
					<li class="page-item"><a class="page-link"
						href="/galleryRentEvent?pageNum=${idx}">${idx}</a></li>
				</c:forEach>

				<c:if test="${galleryRentList.endPage < galleryRentList.totalPages}">
					<li class="page-item"><a class="page-link"
						href="/galleryRentEvent?pageNum=${galleryRentList.startPage+5}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
	</section>


	<!-- Start Footer -->
	<%@include file="../include/footer.jsp"%>

	<script type="text/javascript">
		function fn_search() {
// 			alert("왔다")
			var keyword = document.getElementById("keyword").value
			location.href = "/galleryRentEvent?pageNum=1&keyword=" + keyword;
		}
	</script>

</body>
</html>
