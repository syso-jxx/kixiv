<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<head>
	<title>KIXIV - 세상의 모든 사진</title>
	<meta charset="utf-8">
	<script src="/resources/asset/js/jquery.min.js"></script>
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
		
		td:nth-child(2), th:nth-child(2) {
			width: 30%;
		}
		
		td:nth-child(3), th:nth-child(3) {
			width: 15%;
		}
		
		select{
			border:1px solid #ced4da;
			height: 38px;
 			border-radius:7%; 
		}
		
	
	</style>
	
</head>

<body>
	<%@include file="include/header.jsp" %>
	
	<section class="container overflow-hidden py-5">
	<h1 class="text-dark h1" style="text-align:left;">갤러리 목록</h1>
		<br/>
		
		<div>
			<!-- 테이블 시작 -->
			<table class="table table-sm table-hover">
				<thead>
					<tr>
						<th scope="col">No.</th>
						<th scope="col">갤러리명</th>
						<th scope="col">전화번호</th>
						<th scope="col">주소</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list.size() > 0}">
							<c:forEach var="gallery" items="${list}" varStatus="status">
								<c:if test="${gallery.delete_yn eq 'n'}">
									<tr style="cursor:pointer;" onclick="galleryDetail('${gallery.gallery_num}')">
										<td>${status.count}</td>
										<td>${gallery.gallery_name}</td>
										<td>${gallery.gallery_tel}</td>
										<td>${gallery.gallery_add1}</td>
									</tr>
								</c:if>
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
		</div>
		<div class="d-grid justify-content-end">
			<button class="btn btn-primary" onclick="javascript:location.href='/addGallery'">추가</button>
		</div>
		
	</section>
	
	<footer style="position:absolute;width:100%;top:900px;">
		<%@include file="include/footer.jsp" %>
	</footer>
	
	<script>
 		function galleryDetail(gallery_num){
 			location.href="/myGalleryDetail?gallery_num=" + gallery_num;
 		}
 		
 	</script>
	
</body>
</html>