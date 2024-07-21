<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
    <title>태그 이미지</title>
	<%@include file="../include/optionImg.jsp" %>
	<script src="/resources/asset/js/jquery.min.js"></script>
</head>
<body>
    <!-- Header -->
	<%@include file="../include/header.jsp" %>
    <!-- Close Header -->
	<div class="site-section" data-aos="fade">
		<div class="container-fluid">
		 
			<div class="row justify-content-center">
<%= request.getContextPath() %>
				<div class="col-md-7">
					<div class="row mb-5">
						<div class="col-12 ">
							<h2 class="site-section-heading text-center" style="color: black; margin-bottom: 30px;">해쉬태그 : #${TagItem.tag_name}</h2>	
						</div>
					</div>
				</div>

			</div>
			<div class="row">
		 		<c:choose>
		 			<c:when test="${list.size ()> 0}">
		 				<c:forEach var="list" items="${list}"> 
		 					<div class="col-sm-6 col-md-4 col-lg-3 col-xl-3 item" data-aos="fade">
								<a href="../picture/picDetail?board_id=${list.board_id}"><img src="${list.pic_path}" alt="IMage" class="img-fluid" style="width: 100%; height: 326px;"></a>
							</div>	
		 				</c:forEach>
		 			</c:when>
		 			<c:otherwise>
		 				<div><h1 style="text-align: center;">구독한 작가가 없습니다.</h1></div>
		 			</c:otherwise>
		 		</c:choose>
			</div>
		</div>
	</div>

	<%@include file="../include/footer_script.jsp" %>
</body>
</html>