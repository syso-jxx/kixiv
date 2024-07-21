<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 변경확인 -->
<!DOCTYPE HTML>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/asset/js/jquery.min.js"></script>
<%@include file="../include/option.jsp" %>

<style>
	body {
	  font-family: Arial;
	  margin: 0;
	}
	
	* {
	  box-sizing: border-box;
	}
	
	img {
	  vertical-align: middle;
	}
	
	/* Position the image container (needed to position the left and right arrows) */
	.container {
	  position: relative;
	}
	
	/* Hide the images by default */
	.mySlides {
	  display: none;
	}
	
	/* Add a pointer when hovering over the thumbnail images */
	.cursor {
	  cursor: pointer;
	}
	
	/* Next & previous buttons */
	.prev,
	.next {
	  cursor: pointer;
	  position: absolute;
	  top: 40%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: white;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	
	/* Position the "next button" to the right */
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover,
	.next:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	}
	
	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}
	
	/* Container for image text */
	.caption-container {
	  text-align: center;
	  background-color: #222;
	  padding: 2px 16px;
	  color: white;
	}
	
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	/* Six columns side by side */
	.column {
	  float: left;
	  width: 16.66%;
	}
	
	/* Add a transparency effect for thumnbail images */
	.demo {
	  opacity: 0.6;
	}
	
	.active,
	.demo:hover {
	  opacity: 1;
	}
	
	hr {
		margin: 0;
	}
</style>

<script>
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("demo");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	}
</script>

</head>
<body>
<%@include file="../include/header.jsp" %>
	<!-- Start Service -->
	<section class="service-wrapper py-3">
		<div class="service-tag py-5 bg-secondary" style="padding-top:1rem!important; padding-bottom:1rem!important;">
			<div class="col-md-12">
				<ul class="nav d-flex justify-content-center">
					<li class="nav-item mx-lg-4"><a
						class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="funding">목록</a>
					</li>
					<c:forEach var="code" items="${codeList}">
					<li class="filter-btn nav-item mx-lg-4">
						<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="funding?fund_code=${code.fund_code}">${code.code_name}</a>
					</li>
					</c:forEach>
					<li class="filter-btn nav-item mx-lg-4">
						<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="funding?fund_code=cms">오픈예정</a>
					</li>
					<li class="filter-btn nav-item mx-lg-4">
						<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="funding?fund_code=end">마감된펀딩</a>
					</li>
					
					<c:if test="${user.user_id != null}">
						<li class="filter-btn nav-item mx-lg-4">
							<a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="fundWriteFront">글쓰기</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</section>
	
	<section class="container overflow-hidden py-5">
		<!-- Pre-loader start -->
  <div class="theme-loader">
      <div class="loader-track">
          <div class="preloader-wrapper">
              <div class="spinner-layer spinner-blue">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
              <div class="spinner-layer spinner-red">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-yellow">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-green">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  
  <!-- jstl 변수선언부 시작 -->
  <c:set var="sdate"><fmt:formatDate value="${fund.fund_sdate}" pattern="yyyy/MM/dd"/></c:set>
  <c:set var="edate"><fmt:formatDate value="${fund.fund_edate}" pattern="yyyy/MM/dd"/></c:set>
  <c:set var="today"><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy/MM/dd"/></c:set>
  
  <fmt:parseDate value="${today}" var="todayPlanDate" pattern="yyyy/MM/dd"/>
  <fmt:parseNumber value="${todayPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="todayDate"></fmt:parseNumber>
  <fmt:parseDate value="${edate}" var="endPlanDate" pattern="yyyy/MM/dd"/>
  <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
  
  <c:set var="total"><fmt:formatNumber value="${fund.total}" pattern="#,###"/></c:set>
  <c:set var="achieve"><fmt:formatNumber value="${fund.fund_achieve}" pattern="#,###"/></c:set>
  
  <fmt:parseNumber var="rate" type="number" value="${fund.rate}" />
  
  <c:set var="add">${fund.fund_add1} ${fund.fund_add2}</c:set>
  <!-- jstl 변수선언부 끝-->
  
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                      <!-- Page-header end -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <div class="row">
                                        	<!-- task, page, download counter  start -->
                                            <div class="col-xl-3 col-md-6" style="margin-bottom: 50px;">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-muted m-b-0">펀딩 목표액</h4>
                                                                <h2 class="text-c-purple">${achieve}</h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-muted m-b-0">현재 모금액</h4>
                                                                <h2 class="text-c-blue">${total}</h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6" style="margin-bottom: 50px;">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-muted m-b-0">펀딩 시작일</h4>
                                                            	<h2 class="text-c-blue">${sdate}</h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-muted m-b-0">펀딩 종료일</h4>
                                                                <h2 class="text-c-blue">${edate}</h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- task, page, download counter  end -->
                                        
                                            <!--  sale analytics start -->
                                            <div class="col-xl-8 col-md-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>${fund.fund_title}</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div id="sales-analytics" style="height: 400px;">
                                                        	<pre>${fund.fund_content}</pre>
                                                        </div>
                                                    </div>
                                                    <hr/>
                                                    <!-- 사진스크롤 시작 -->
                                                    <c:if test="${fn:length(fundPicList) != 0}">
	                                                    <div class="card-header">
	                                                       <h5>작가의 사진</h5>
	                                                    </div>
	                                                    <div class="card-block">
															<div class="container" style="padding:0;">
																<c:forEach items="${fundPicList}" var="picture" varStatus="status">
																	<div class="mySlides">
																		<div class="numbertext">${status.count} / ${fn:length(fundPicList)}</div>
																		<img src="${picture.FUND_PICPATH}" style="width:100%; height:500px;">
																	</div>
																</c:forEach>
																<a class="prev" onclick="plusSlides(-1)">❮</a>
																<a class="next" onclick="plusSlides(1)">❯</a>
																	
																<div class="row">
																	<c:forEach items="${fundPicList}" var="picture" varStatus="status">
																		<div class="column">
																			<img class="demo cursor" src="${picture.FUND_PICPATH}" style="width:100%; height:100px;" 
																				onclick="currentSlide(${status.count})" alt="${picture.PICSEQ}">
																		</div>
																	</c:forEach>
																</div>
															</div>
	                                                    </div>
                                                    </c:if>
                                                    <!-- 사진스크롤 끝 -->
                                                    <hr/>
                                                    <!-- 카카오맵 -->
                                                    <c:if test="${fundCode == 'A001'}">
			                                            <!--  project and team member start -->
	                                                    <div class="card-header">
	                                                        <h5>갤러리 위치</h5>
	                                                        <div class="card-header-right">
															<!-- Markers map start -->
							                                    <div class="card">
							                                        <div class="card-block">
							                                            <div id="map" style="width: 100%; height: 350px;" class="set-map"></div>
							                                            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bebcbe6a6f8b33e98024ed2fec67eafe&libraries=services"></script>
							                                        </div>
							                                    </div>
	                                    					<!-- Markers map end -->
	                                                    	</div>
		                                              	</div>
			                                        </c:if>
			                                        
												</div>
                                            </div>

                                            <div class="col-xl-4 col-md-12">
                                                <div class="card" style="margin-bottom: 5%;">
                                                    <div class="card-block">
                                                        <div class="row">
                                                            <div class="col">
                                                            	<h5>1인당 펀딩금액</h5>
                                                                <h1><fmt:formatNumber value="${fund.one_price}" pattern="#,###"/></h1>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>
                                           				<button id="fundBtn" class="btn btn-info waves-effect waves-light" style="width:100%; height: 80px;" onclick="fn_pay()">투자하기</button>		
                                                   		<button id="report" class="btn btn-danger waves-effect waves-light" style="width:100%; height: 80px; margin-top: 5px;" onclick="fn_report()">신고하기</button>
                                                   		<button id="update" class="btn btn-info waves-effect waves-light" style="width:100%; height: 80px; margin-top: 5px;" onclick="fn_update()">수정하기</button>
                                                   		<button id="delete" class="btn btn-info waves-effect waves-light" style="width:100%; height: 80px; margin-top: 5px;" onclick="fn_delete()">삭제하기</button>
                                                   		<!-- 로그인한 유저가 글쓴이일 경우 -->
                                                   		<c:choose>
                                                   			<c:when test="${user.user_id == fund.user_id}">
                                                   				<script type="text/javascript">
	                                                   				document.getElementById("fundBtn").style.display="none";
	                                                   				document.getElementById("report").style.display="none";
	                                                   			</script>
                                                   			</c:when>
                                                   			
                                                   			<c:when test="${user.user_level == 'a'}">
                                                   				<script type="text/javascript">
	                                                   				document.getElementById("fundBtn").style.display="none";
	                                                   				document.getElementById("report").style.display="none";
	                                                   				document.getElementById("update").style.display="none";
	                                                   			</script>
                                                   			</c:when>
                                                   			
                                                   			<c:otherwise>
                                                   				<script type="text/javascript">
                                                   					document.getElementById("update").style.display="none";
                                                   					document.getElementById("delete").style.display="none";
                                                   				</script>
                                                   			</c:otherwise>
                                                   		</c:choose>
                                                   		
                                                   		<c:if test="${edate < today}">
                                                   			<script type="text/javascript">
                                               					document.getElementById("fundBtn").style.display="none";
                                              				</script>
                                                   		</c:if>
                                          			</div>
                                                </div>
                                                <!-- ======================== 작가 정보 작성 예정 ========================-->
                                                <div class="card quater-card" style="margin-bottom: 5%;">
                                                    <div class="card-block">
                                                        <p class="text-muted">작가 페이지</p>
                                                        <div>
                                                        	<img alt="프로필" src="/${fundUser.profile_img}" style="width:50px; height:50px; margin-left:10px%; cursor:pointer;" onclick="location.href='userPage?user_id=${fundUser.user_id}'">
                                                        </div>
									                    <br/>
									                    <p class="text-muted">작가명</p>
									                    <h5>${fundUser.nickname}</h5>
									                    <br/>
									                    <p class="text-muted">작가이메일</p>
									                    <h5>${fundUser.email}</h5>
                                                    </div>
                                                </div>
                                                <!-- ================================================-->
                                                <div class="card quater-card">
                                                    <div class="card-block">
                                                        <p class="text-muted">목표 달성률</p>
                                                        <h5>${fund.rate}%</h5>
                                                        <c:choose>
                                                        	<c:when test="${rate > 100}">
                                                        		<div class="progress" style="height:20px; text-align: center;"><div class="progress-bar bg-c-blue" style="width: 100%;"></div></div>
                                                        	</c:when>
                                                        	
                                                        	<c:otherwise>
                                                        		<div class="progress" style="height:20px; text-align: center;"><div class="progress-bar bg-c-blue" style="width: ${fund.rate}%;"></div></div>	
                                                        	</c:otherwise>
                                                        </c:choose>
                                                        <br/>
                                                        <p class="text-muted">목표 달성까지 남은금액</p>
                                                        <h5>
                                                        <c:choose>
                                                        	<c:when test="${rate >= 100}">
                                                        		목표달성!
                                                        	</c:when>
                                                        	
                                                        	<c:otherwise>
                                                        		<fmt:formatNumber value="${fund.fund_achieve-fund.total}" pattern="#,###"/>
                                                        	</c:otherwise>
                                                        
                                                        </c:choose>
                                                        </h5>
                                                        <br/>
                                                        <h6 class="text-muted m-b-15">펀딩 마감일까지</h6>
                                                        <h5>
                                                        <c:choose>
                                                        	<c:when test="${edate < today}">
                                                        		마감됨
                                                        	</c:when>
                                                        	
                                                        	<c:when test="${sdate > today}">
                                                        		오픈예정
                                                        	</c:when>
                                                        	
                                                        	<c:otherwise>
                                                        		D - ${endDate - todayDate}
                                                        	</c:otherwise>
                                                        
                                                        </c:choose>
                                                        
                                                        </h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--  sale analytics end -->
                                    	</div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	</section>
	<!-- End Service -->

	<%@include file="../include/footer.jsp" %>
	<%@include file="../include/footer_script.jsp" %>

<script type="text/javascript">
	currentSlide(1);
	
	// ============== 지도 api =================
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(
			"${add}",
				function(result, status) {
					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position : coords
						});
						// 인포윈도우로 장소에 대한 설명을 표시합니다
						var infowindow = new kakao.maps.InfoWindow(
								{
									content : '<div style="width:150px;text-align:center;padding:6px 0;">갤러리</div>'
								});
						kakao.maps.event.addListener(marker,
								'mouseover', function() {
									// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
									infowindow.open(map, marker);
								});
						//마커에 마우스아웃 이벤트를 등록합니다
						kakao.maps.event.addListener(marker,
								'mouseout', function() {
									//마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
									infowindow.close();
								});
						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						map.setCenter(coords);
					}
				});
		// 지도 api 끝
	function fn_delete() {
		var del_dateChk = ${sdate > today}
		if(!del_dateChk) {
			alert("글 삭제는 펀딩 시작 전만 가능합니다.")
			return;
		}
			
		if(confirm("정말로 삭제하시겠습니까?")) {
			var delData = { "fundId" : '${fund.fund_id}' }
			
			$.ajax({
				url: "fundDelete",
				type: "POST",
				data: delData,
				success: function(data){
				    if (data == 'ok') {
				    	alert("삭제가 완료되었습니다.")
				    	location.href = "funding";
				    } else {
				    	alert("삭제 도중 문제가 발생했습니다.")
				    	location.reload();
				    }
				},
				error: function(){
				    alert("삭제 도중 문제가 발생했습니다.");
				}
			});
		}
	}
		
	function fn_update() {
		location.href="fundUpdate?fund_id=${fund.fund_id}"
	}
	
	function fn_report() {
		if('${user.user_id}' == ''){
			notLogin();
			return;
		} else {
			if(confirm("해당 게시글을 신고하시겠습니까?")) {
	 			var url = '';
	 			var user_id = '${fundUser.user_id}';
	 			console.log("user_id : " + user_id)
	 			url = window.document.location.href;
	 			var urls = '../report/reportWhite?url='+url+'&bad_user_id='+user_id;
	 			window.open(urls); 
	 			location.reload();
			}
		}
	}
	
	function notLogin() {
		if('${user.user_id}' == '') {
	    	Swal.fire({
	    		  icon: 'error',
	    		  title: '잠깐!',
	    		  text: '로그인을 먼저 진행하셔야 이용하실 수 있습니다.',
	    		  footer: '<a href="/login"> 로그인 하시겠습니까?</a>'
	    	})
		}
    }
	
	function fn_pay() {
		let user_level = "${user.user_level}";
		let payable = !${sdate > today};
		
		if('${user.user_id}' == ''){
			notLogin();
			return;
		} else {
			if(user_level == 'u' && payable == true) {
				location.href="fundPay?fund_id="+${fund.fund_id};
			} else if (user_level == 'u' && payable == false) {
				alert("펀딩 시작일 이후 펀딩이 가능합니다.");
				return;
			} else {
				alert("투자는 일반회원만 가능합니다.");
				return;
			}
		}
	}
</script>
</body>
</html>