<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
<title>KIXIV - 세상의 모든 사진</title>rap 5 Beta 1</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- start link -->
<options>
	<%@include file="include/option.jsp" %>
</options>
<!-- end link -->
    
</head>

<body>
	<!-- Header -->
	<header>
		<%@include file="include/header.jsp" %>
	
	</header>
	<!-- Close Header -->


	<!-- Start Service -->
	<section class="service-wrapper py-3">
		<div class="service-tag py-5 bg-secondary">
			<div class="col-md-12">
				<ul class="nav d-flex justify-content-center">
					<li class="nav-item mx-lg-4">
						<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="#">회원정보</a>
					</li>
					<li class="filter-btn nav-item mx-lg-4">
						<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="reportList" data-filter=".ui">신고목록</a>
					</li>
					<li class="nav-item mx-lg-4">
						<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="blackList" data-filter=".branding">블랙리스트 목록</a>
				</ul>
			</div>
		</div>

	</section>

	<section class="container overflow-hidden py-5">
		<form action="">
		<div class="input-group mb-3">
			<input type="text" name="keyword" class="form-control col-sm-10">
			<div class="input-group-append">
				<button type="button" class="btn btn-outline-secondary">search</button>
			</div>
			</form>
		</div>
		
		<div>
		
			<!-- 테이블 시작 -->
			<table class="table table-sm table-hover">
				<thead>
					<tr>
						<th scope="col">순번</td>
						<th scope="col">제목</th>
						<th scope="col">글쓴이</th>
						<th scope="col">날짜</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td >1</td>
						<td>신고합니다</td>
						<td>김대호</td>
						<td>2021-06-21</td>					
						<td>O</td>					
					</tr>
					<tr>
						<td >2</td>
						<td>신고합니다</td>
						<td>김대호</td>
						<td>2021-06-21</td>					
						<td>O</td>					
					</tr>
					<tr>
						<td >3</td>
						<td>신고합니다</td>
						<td>김대호</td>
						<td>2021-06-21</td>					
						<td>O</td>					
					</tr>
					<tr>
						<td >4</td>
						<td>신고합니다</td>
						<td>김대호</td>
						<td>2021-06-21</td>					
						<td>O</td>					
					</tr>
					<tr>
						<td >5</td>
						<td>신고합니다</td>
						<td>김대호</td>
						<td>2021-06-21</td>					
						<td>O</td>					
					</tr>
					<tr>
						<td >6</td>
						<td>신고합니다</td>
						<td>김대호</td>
						<td>2021-06-21</td>					
						<td>O</td>					
					</tr>
					<tr>
						<td >7</td>
						<td>신고합니다</td>
						<td>김대호</td>
						<td>2021-06-21</td>					
						<td>O</td>					
					</tr>
					<tr>
						<td >8</td>
						<td>신고합니다</td>
						<td>김대호</td>
						<td>2021-06-21</td>					
						<td>O</td>					
					</tr>
					<tr>
						<td >9</td>
						<td>신고합니다</td>
						<td>김대호</td>
						<td>2021-06-21</td>					
						<td>O</td>					
					</tr>
					<tr>
						<td >10</td>
						<td>신고합니다</td>
						<td>김대호</td>
						<td>2021-06-21</td>					
						<td>O</td>					
					</tr>
				</tbody>				
			</table>
		</div>
		
		
		<!-- 페이징 시작 -->
		<div class="col-md-offset-3">
			<ul class="pagination justify-content-center">
				<c:if test="true">
					<li class="page-item disabled">
						<a class="page-link" href="">이전</a>
					</li>
				</c:if>

				<c:forEach begin="1" end="10" var="idx">
					<li class="page-item"><a class="page-link" href="">${idx}</a></li>
				</c:forEach>

				<c:if test="true">
					<li class="page-item">
						<a class="page-link" href="">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
		<div class="d-grid justify-content-end">
			<button class="btn btn-primary">작성</button>
		</div>
	</section>
	<!-- End Service -->

	<!-- Start Footer -->
	<footer>
		<%@include file="include/footer.jsp" %>
	</footer>
	<!-- end Footer -->

</body>
</html>