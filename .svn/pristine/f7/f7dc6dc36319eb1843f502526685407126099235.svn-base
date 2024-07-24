<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML>
<head>
	<title>KIXIV - 세상의 모든 사진</title>
	<meta charset="utf-8">
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
						<th scope="col" colspan="3" style="font-size:1.5em;">${notice.notice_title}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- DB에서 불러와서 채우는 부분 -->
						<td class="ntd">No.</td>
						<td class="ntd">작성일 : <fmt:formatDate value="${notice.notice_sdate}" pattern="yyyy-MM-dd"/> </td>
						<td class="ntd">조회수 : ${notice.hit}</td>
					</tr>
					<tr style="height:500px; overflow: auto;">
						<td colspan="3" id="content"></td>
						<script>
							$("#content").append('${notice.notice_content}');		
						</script>
					</tr>
				</tbody>				
			</table>
		<c:if test="${user.user_id == 'admin' }">
		<div style="text-align: right; ">
			<button class="btn btn-primary" onclick="javascript:location.href='/notice/modify?notice_id=${notice.notice_id}'">수정</button>
			<button class="btn btn-primary" onclick="delete_confirm()">삭제</button>
		</div>
		</c:if>
		
	</section>

	<%@include file="../include/footer.jsp" %>
	
	<script>
	
		function delete_confirm(){
			swal.fire({
			     title: "정말 삭제하시겠습니까?",
			     text: "",
			     icon: "warning", //"info,success,warning,error,question" 중 택1
			     showCancelButton: true,
			     confirmButtonText:'삭제',
			     cancelButtonText:'취소'
			}).then((result) => {
			     if (result.isConfirmed) {
			    	 location.href='/notice/delete?notice_id=${notice.notice_id}';
			     }
			})
		}
	</script>
	
</body>
</html>