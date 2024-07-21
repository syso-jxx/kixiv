<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML>
<head>
	<title>Purple Buzz HTML Template with Bootstrap 5 Beta 1</title>
	<meta charset="utf-8">
	<script src="/resources/asset/js/jquery.min.js"></script>
	<%@include file="../include/option.jsp" %>
	
	<style>
		td, th {
			text-align: center;
		}
		
		.ntd { width:33%; }
	</style>
</head>

<body>
	<%@include file="../include/header.jsp" %>
	<section class="container overflow-hidden py-5">
			<!-- 테이블 시작 -->
			<table class="table">
				<thead>
					<tr>
						<th scope="col" colspan="3" style="font-size:1.5em; margin-bottom: 100px;">신고상세</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- DB에서 불러와서 채우는 부분 -->
						<td class="ntd">No.</td>
						<td class="ntd">신고제목 : <fmt:formatDate value="${reportVo.report_date}" pattern="yyyy-MM-dd"/> </td>
						<c:if test="${reportVo.report_yn eq 'y'}">
							<td class="ntd" style="color:#6266ea">처리상태 : 미처리</td>
						</c:if>
						<c:if test="${reportVo.report_yn eq 'b'}">
							<td class="ntd" style="color:red;">처리상태 : 이용제한</td>
						</c:if>
						<c:if test="${reportVo.report_yn eq 'r'}">
							<td class="ntd" style="color:skyblue">처리상태 : 반려</td>
						</c:if>
					</tr>
					<tr>
						<!-- DB에서 불러와서 채우는 부분 -->
						<td class="ntd">신고장소: ${reportVo.report_what}</td>
						<td class="ntd">신고사유 : ${reportVo.report_reason} </td>
						<td class="ntd">작성일 : <fmt:formatDate value="${reportVo.report_date}" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<!-- DB에서 불러와서 채우는 부분 -->
						<td class="ntd">신고자: ${reportVo.user_id}</td>
						<td class="ntd"></td>
						<td class="ntd">작성자 : ${reportVo.bad_user_id} </td>
					</tr>
					<tr style="height:500px; overflow: auto;">
						<td colspan="3" id="content">
							${reportVo.report_content}	
						</td>
					</tr>
					<tr>
						<td class="ntd">신고경로</td>
						<td class="ntd" colspan="2">
							<a href="${reportVo.report_add}">${reportVo.report_add}</a>
						</td>
						<td class="ntd"></td>
					</tr>
				</tbody>				
			</table>
			
			
			<c:if test="${user.user_id == 'admin'}">
				<div style="text-align: right; ">
					<button class="btn btn-primary" onclick="black_confirm()">접수</button>
					<button class="btn btn-primary" onclick="delete_confirm()">반려</button>
				</div>
			</c:if>
	</section>

	<%@include file="../include/footer.jsp" %>
	
	<script>
	function black_confirm(){
		if(confirm("해당유저를 블랙리스트에 추가하시겠습니까?")){
			location.href='/blackUser/blackAdd?userId=${reportVo.user_id}&blackReason=${reportVo.report_reason}&report_id=${reportVo.report_id}';
		}else{
			return;
		}
	}
	
		function delete_confirm(){
			if(confirm("신고내역을 반려하시겠습니까?")){
				location.href='/blackUser/blackUpdate?report_id=${reportVo.report_id}';
			}else{
				return;
			}
		}
	</script>
	
</body>
</html>