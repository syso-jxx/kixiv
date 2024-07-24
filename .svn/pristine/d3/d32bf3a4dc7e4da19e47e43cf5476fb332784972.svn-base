<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/resources/asset/js/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
<style>
td {
	text-align: center;
}

th {
	font-size: 1.2em;
}

td:nth-child(1), th:nth-child(1) {
	width: 20%;
}

td:nth-child(3), th:nth-child(3) {
	width: 20%;
}

select {
	border: 1px solid #ced4da;
	height: 38px;
	border-radius: 7%;
}

.contextmenu {
	display: none;
	position: absolute;
	width: 200px;
	margin: 0;
	padding: 0;
	background: #FFFFFF;
	border-radius: 5px;
	list-style: none;
	box-shadow: 0 15px 35px rgba(50, 50, 90, 0.1), 0 5px 15px
		rgba(0, 0, 0, 0.07);
	overflow: hidden;
	z-index: 999999;
}

.contextmenu li {
	border-left: 3px solid transparent;
	transition: ease .2s;
}

.contextmenu li a {
	display: block;
	padding: 10px;
	color: black;
	text-decoration: none;
	transition: ease .2s;
}

.contextmenu li:hover {
	background: #CE93D8;
	border-left: 3px solid #9C27B0;
}

</style>
<script type="text/javascript">
$(document).ready(function(){

	//Show contextmenu:
	$(".blackUser").click(function(e){
		//Get window size:
		var winWidth = $(document).width();
		var winHeight = $(document).height();
		//Get pointer position:
		var posX = e.pageX;
		var posY = e.pageY;
		//Get contextmenu size:
		var menuWidth = $(".contextmenu").width();
		var menuHeight = $(".contextmenu").height();
		//Security margin:
		var secMargin = 10;
		//Prevent page overflow:
		if(posX + menuWidth + secMargin >= winWidth
		&& posY + menuHeight + secMargin >= winHeight){
		  //Case 1: right-bottom overflow:
		  posLeft = posX - menuWidth - secMargin + "px";
		  posTop = posY - menuHeight - secMargin + "px";
		}
		else if(posX + menuWidth + secMargin >= winWidth){
		  //Case 2: right overflow:
		  posLeft = posX - menuWidth - secMargin + "px";
		  posTop = posY + secMargin + "px";
		}
		else if(posY + menuHeight + secMargin >= winHeight){
		  //Case 3: bottom overflow:
		  posLeft = posX + secMargin + "px";
		  posTop = posY - menuHeight - secMargin + "px";
		}
		else {
		  //Case 4: default values:
		  posLeft = posX + secMargin + "px";
		  posTop = posY + secMargin + "px";
		};
		//Display contextmenu:
		$(".contextmenu").css({
		  "left": posLeft,
		  "top": posTop
		}).show();
		
		var userId = $(this).children("td:eq(1)").text();
		var blackReason = $(this).children("td:eq(2)").text();
		var delete_url = "/blackUser/delete?userId=" + userId;
		
		$("#a_modify").attr("onclick", "fn_modify('" + userId +"','" + blackReason + "')");
		$("#a_delete").attr("onclick", "fn_delete('" + userId +"')");
		

		//Prevent browser default contextmenu.
		return false;
	});
  
	//Hide contextmenu:
	$(document).click(function(){
	  	$(".contextmenu").hide();
	});

	$("#cancel").click(function(){
		$("#modify_modal").css("display", "none");
	});
	
	
	$("#searchBtn").click(function(){
		var searchType = $("select[name=searchType]").val();
		var keyword = $("input[name=keyword]").val();
		location.href="/blackUser/blackList?&searchType=" + searchType + "&keyword=" + keyword;
	});

	$("input[name=keyword]").keydown(function(key){
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
			var searchType = $("select[name=searchType]").val();
			var keyword = $("input[name=keyword]").val();
			location.href="/blackUser/blackList?&searchType=" + searchType + "&keyword=" + keyword;
        }
    });
	
});
function fn_modify(userId, blackReason){
	$("input[name=userId]").val(userId);
	$("input[name=blackReason").val(blackReason)
	$("#modify_modal").css("display", "block");
}

function fn_delete(userId){
	swal.fire({
	     title: "정말 삭제하시겠습니까?",
	     text: "",
	     icon: "warning", //"info,success,warning,error,question" 중 택1
	     showCancelButton: true,
	     confirmButtonText:'삭제',
	     cancelButtonText:'취소'
	}).then((result) => {
	     if (result.isConfirmed) {
	  		location.href="/blackUser/delete?userId=" + userId;
	     }
	});
}


</script>

</head>
<body>
	<options> 
		<%@include file="../include/option.jsp"%>
	</options>
	<!-- Header -->
	<header>
		<%@include file="../include/header.jsp"%>
	</header>
	<!-- Close Header -->

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
		<h1 class="text-dark h1" style="text-align:left;">블랙리스트</h1>
		<br/>
		<div style="float: right; margin-bottom: 30px;">
			<div class="input-group" style="width: 250px; float: right;">
				<input type="text" name="keyword" class="form-control col-sm-10"
					value="${keyword}">
				<div class="input-group-append">
					<button type="button" id="searchBtn" class="btn btn-outline-secondary">search</button>
				</div>
			</div>
			<div class="" style="float: right;">
				<select name="searchType">
					<option value="id"
						<c:if test="${searchType eq 'id'}">selected</c:if>>아이디</option>
					<option value="reason"
						<c:if test="${searchType eq 'reason'}">selected</c:if>>블랙사유</option>
				</select>
			</div>
		</div>

		<div>

			<!-- 테이블 시작 -->
			<table class="table table-sm table-hover">
				<thead>
					<tr>
						<th style="text-align: center; width: 20px;">No.</th>
						<th style="text-align: center; width: 400px;">블랙 아이디</th>
						<th style="text-align: center; width: 600px;">블랙 사유</th>
						<th style="text-align: center;">블랙 날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list.size() > 0}">
							<c:forEach var="blackUser" items="${list}" varStatus="status">
								<tr class="blackUser" style="cursor: pointer;">
									<td style="width: 20px;">${status.count}</td>
									<td style="width: 400px;">${blackUser.userId}</td>
									<td style="width: 600px;">${blackUser.blackReason}</td>
									<td><fmt:formatDate value="${blackUser.blackDate}" pattern="yyyy-MM-dd" /></td>
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
						<a class="page-link" href="/blackUser/blackList?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
					</li>
				</c:if>

				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
					<c:choose>
						<c:when test="${page.num != num}">
							<li class="page-item"><a class="page-link" href="/blackUser/blackList?num=${num}${page.searchTypeKeyword}">${num}</a></li>
						</c:when>	
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="#" style="font-weight: bold" readonly">${num}</a></li>
						</c:otherwise>				
					</c:choose>
				</c:forEach>

				<c:if test="${page.next}">
					<li class="page-item">
						<a class="page-link" href="/blackUser/blackList?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 끝 -->

		<!-- 모달 시작-->
		<ul class="contextmenu">
			<li><a id="a_modify">수정</a></li>
			<li><a id="a_delete">삭제</a></li>
		</ul>
		<!-- 모달 끝 -->

	</section>
	<!-- End Service -->

	<!-- modal start -->
	<form name="frm" id="frm" class="validation-form" action="/blackUser/modify" method="post" autocomplete="off" onsubmit="return modify_submit()">
		<div id="modify_modal" style="position: absolute; top:35%; left:40%; width:300px; height:210px;border:2px solid black;background-color: white;padding:10px; border-radius: 3%; display:none;">
			<h3 style="margin-bottom:10px;text-align: center; margin-bottom:30px;">블랙 사유 변경</h3>
			<div>
				<span for="userId">아이디&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<input name="userId" style="width:110px;" readonly> 
			</div>
			<div style="margin:10px 0">
				<label for="user_id">블랙 사유</label> 
				<select name="blackReason">
					<option value="욕설">욕설</option>
					<option value="비방">비방</option>
					<option value="혐오발언">혐오발언</option>
					<option value="음란물 취급">음란물 취급</option>
				</select>
			</div>
			<div style="float:right;">
				<button type="submit" class="btn btn-primary">수정</button>
				<button type="button" id="cancel" class="btn btn-dark">취소</button>
			</div>
		</div>
	</form>		
	<!-- modal end -->

	<!-- Start Footer -->
	<footer style="position:absolute;width:100%;bottom:0px;">
		<%@include file="../include/footer.jsp" %>
	</footer>
	<!-- end Footer -->

</body>
</html>