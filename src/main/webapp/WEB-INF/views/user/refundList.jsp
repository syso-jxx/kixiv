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

		td{
			vertical-align :middle;
			height:47px;
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
	<h1 class="text-dark h1" style="text-align:left;">환불 요청 리스트</h1>
	<br/>
		
		<div>
		
			<!-- 테이블 시작 -->
			<table class="table table-sm table-hover">
				<thead>
					<tr>
						<th scope="col">No.</th>
						<th scope="col">갤러리명</th>
						<th scope="col">아이디</th>
						<th scope="col">환불가격</th>
						<th scope="col">환불요청일</th>
						<th scope="col">환불상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list.size() > 0}">
							<c:forEach var="refund" items="${list}" varStatus="status">
								<tr style="cursor:pointer;">
<%-- 									<td>${status.count + (page.num-1)*page.postNum}</td> --%>
									<td>${status.count}</td>
									<td>${refund.GALLERY_NAME}</td>
									<td>${refund.USER_ID}</td>
									<td>${refund.RENT_PRICE}</td>
									<td><fmt:formatDate value="${refund.CANCEL_DATE}" pattern="yyyy-MM-dd"/> </td>
									<c:choose>
										<c:when test="${refund.CANCEL_STATUS eq 'r'}">
											<td><button class="btn btn-warning" onclick="javascript:location.href='/permissionRefund?rent_num=${refund.RENT_NUM}'">승인</button></td>
										</c:when>
										<c:when test="${refund.CANCEL_STATUS eq 'y'}">
											<td style="color: blue">환불완료</td>
										</c:when>
									</c:choose>
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
						<a class="page-link" href="/refundList?num=${page.startPageNum - 1}">이전</a>
					</li>
				</c:if>

				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
					<c:choose>
						<c:when test="${page.num != num}">
							<li class="page-item"><a class="page-link" href="/refundList?num=${num}">${num}</a></li>
						</c:when>	
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="#" style="font-weight: bold" readonly">${num}</a></li>
						</c:otherwise>				
					</c:choose>
				</c:forEach>

				<c:if test="${page.next}">
					<li class="page-item">
						<a class="page-link" href="/refundList?num=${page.endPageNum + 1}">다음</a>
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
 			location.href="/notice/notice?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 		});
 		
 	</script>
	
	
</body>
</html>