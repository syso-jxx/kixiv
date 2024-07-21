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
	<h1 class="text-dark h1" style="text-align:left;">펀딩 리스트</h1>
	<br/>
		
		<div>
		
			<!-- 테이블 시작 -->
			<table class="table table-sm table-hover">
				<thead>
					<tr>
						<th scope="col">No.</th>
						<th scope="col">펀딩종류</th>
						<th scope="col">펀딩제목</th>
						<th scope="col">펀딩기간</th>
						<th scope="col">목표금액</th>
						<th scope="col">달성율</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list.size() > 0}">
							<c:forEach var="invest" items="${list}" varStatus="status">
								<tr style="cursor:pointer;" onclick="javascript:location.href='fundDetail?fund_id=${invest.FUND_ID}'">
									<td>${status.count + (page.num-1)*page.postNum}</td>
									<td>${invest.FUND_SORT}</td>
									<td>${invest.FUND_TITLE}</td>
									<td>
										<fmt:formatDate value="${invest.FUND_SDATE}" pattern="yyyy-MM-dd"/>
										~
										<fmt:formatDate value="${invest.FUND_EDATE}" pattern="yyyy-MM-dd"/>
									</td>
									<td>${invest.FUND_ACHIEVE}원</td>
									<td>${invest.RATE}%</td>
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
		</div>
		
		
		<!-- 페이징 시작 -->
		<div class="col-md-offset-3">
			<ul class="pagination justify-content-center">
				<c:if test="${page.prev}">
					<li class="page-item">
						<a class="page-link" href="/myFundList?num=${page.startPageNum - 1}">이전</a>
					</li>
				</c:if>

				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
					<c:choose>
						<c:when test="${page.num != num}">
							<li class="page-item"><a class="page-link" href="/myFundList?num=${num}">${num}</a></li>
						</c:when>	
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="#" style="font-weight: bold" readonly">${num}</a></li>
						</c:otherwise>				
					</c:choose>
				</c:forEach>

				<c:if test="${page.next}">
					<li class="page-item">
						<a class="page-link" href="/myFundList?num=${page.endPageNum + 1}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 끝 -->
		
	</section>
	
	<footer style="position:absolute;width:100%;bottom:0px;">
		<%@include file="../include/footer.jsp" %>
	</footer>
	
</body>
</html>