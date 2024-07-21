<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- start link -->
<options>
	<%@include file="../include/option.jsp" %>
</options>
<!-- end link -->
<style>
	p{
		margin-bottom:0px;
	}
	#userName{
		margin-bottom: 10px;
		font-size: 30px;
	}
</style>
<script>

</script>
</head>

<body>
	<!-- Header -->
	<header>
		<%@include file="../include/header.jsp" %>
	</header>
	<!-- Close Header -->
	<section class="container overflow-hidden py-5">
		<div>
			<h1>블랙리스트 등록</h1><hr style="width:270px;border: 2px solid purple">
		</div>
		<div class="row" style="margin: 100px 0;vertical-align:bottom;">
			<div class="col" style="text-align: right;padding-right: 50px">
				<img class="img-thumbnail rounded-circle" src="asset/images/sana.gif" style="width:200px;">
			</div>
			<div class="col" style="padding-top:10px; text-align: left;">
				<p id="userName">KJW</p>
				<p>좋아요</span>
				<p>dut753@naver.com</p>
				<p>1,112,937</p>
				<button type="button" class="btn btn-dark" onclick="fn_click()">블랙리스트 등록</button>				
			</div>
		</div>
	</section>
	
	<!-- End Service -->

	<!-- Start Footer -->
	<footer>
		<%@include file="../include/footer.jsp" %>
	</footer>
	<!-- end Footer -->
	
	<script>
		function fn_click(){
			alert("블랙리스트 함수 호출")
			id = document.getElementById("userName").innerText;
		}
	</script>
	
</body>
</html>