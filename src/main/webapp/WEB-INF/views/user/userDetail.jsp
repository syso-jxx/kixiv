<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
		
		a.galleryLink {
		    text-decoration: none;
		}
		a.galleryLink:hover {
		    text-decoration: underline;
		}
	</style>
</head>

<body>
	<%@include file="../include/header.jsp" %>
	
	<!-- Start Service -->
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
	<h1 class="text-dark h1" style="text-align:left;">회원 상세</h1>
	<br/>
			<!-- 테이블 시작 -->
			<table class="table table-bordered">
				<thead>
				</thead>
				<tbody>
					<tr>
						<!-- DB에서 불러와서 채우는 부분 -->
						<th style="width:33%">아이디</th>
						<td class="">${userVO.user_id}</td>
					</tr>
						
					<tr>
						<th>별명</th>
						<td class="">${userVO.nickname}</td>
					</tr>

					<tr>
						<th>이름</th>
						<td class="">${userVO.name}</td>
					</tr>

					<tr>
						<th>휴대폰번호</th>
						<td class="">${userVO.phone}</td>
					</tr>

						<th>우편번호</th>
						<td class="">${userVO.zip}</td>
					</tr>

					<tr>
						<th>주소</th>
						<td class="">${userVO.add1}</td>
					</tr>

					<tr>
						<th>상세주소</th>
						<td class="">${userVO.add2}</td>
					</tr>

					<tr>
						<th>이메일</th>
						<td class="">${userVO.email}</td>
					</tr>

					<tr>
						<th>SNS</th>
						<td class="">${userVO.sns_add}</td>
					</tr>

					<tr>
						<th>가입일</th>
						<td class=""><fmt:formatDate value="${userVO.join_date}" pattern="yyyy-MM-dd"/> </td>
					</tr>

					<c:choose>
						<c:when test="${userVO.user_level eq 'u'}">
							<tr>
								<th>회원레벨</th>
								<td>
										일반회원
								</td>
							</tr>
						</c:when>

						<c:when test="${userVO.user_level eq 'g'}">
						
							<tr>
								<th>회원레벨</th>
								<td>
										갤러리회원
								</td>
							</tr>
							<tr>
								<th>갤러리 리스트</th>
								<td>
								<c:choose>
									<c:when test="${!empty galleryList}">
											|
										<c:forEach var="gallery" items="${galleryList}">
										<span><a href="/myGalleryDetail?gallery_num=${gallery.gallery_num}" class="galleryLink">${gallery.gallery_name}</a></span> |
										</c:forEach>
									</c:when>
									
									<c:otherwise>
										<span style="color: red;">갤러리 목록 없음</span>
									</c:otherwise>
								
								</c:choose>
									
								</td>
							</tr>
						</c:when>
					</c:choose>

					<tr>
						<th>탈퇴여부</td>
						<td class="">${userVO.exit_yn}</td>
					</tr>
				</tbody>				
			</table>
		
	</section>

	<%@include file="../include/footer.jsp" %>
	
	<script>
		function delete_confirm(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href='/notice/delete?notice_id=${notice.notice_id}';
			}else{
				return;
			}
		}
	</script>
	
</body>
</html>