<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
    <title>메인페이지</title>
    <meta charset="utf-8">
    <link rel="icon" href="assets/images/Etcher-icon" type="image/x-icon">
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="/resources/asset/js/jquery.min.js"></script>
    <script>
	    $(function() {
		   	  $("#newTop5").click(function(){
		          $.ajax({
		              url : '/mainBannerNew',
		              type : 'post',
		              success : function(data) {
		              console.log(data);
		              console.log("newtop5 성공");
		              
			              let top1 = data[0].pic_path;
			              let top1_b= data[0].board_id;
		                  let top2 = data[1].pic_path;
		                  let top2_b = data[1].board_id;
		                  let top3 = data[2].pic_path;
		                  let top3_b = data[2].board_id;
		                  let top4 = data[3].pic_path;
		                  let top4_b = data[3].board_id;
		                  let top5 = data[4].pic_path;
		                  let top5_b = data[4].board_id;
		                  
		                  console.log(top1);
		                  console.log(top2);
		                  console.log(top3);
		                  console.log(top4);
		                  console.log(top5);
		                  
		                  
		                  let listHtml = "";
		                  
		                  listHtml +="<a href='../picture/picDetail?board_id="+top1_b+"'>";
		                  listHtml +='	<img alt="" src="./assets/img/Top1.png" style="width: 700px; height: 450px; position: absolute; z-index: 3;">';
		                  listHtml +="	<img alt='' src='"+top1+"' style='width: 500px; height: 300px; margin-top:78px; margin-left:15%; position: absolute; z-index: 2;'>";
		                  listHtml +="</a>";
		                  $("#top1").html(listHtml);
		                  
		                  let listHtml1 = "";
		                  listHtml +="<a href='../picture/picDetail?board_id="+top2_b+"'>";
		                  listHtml1 +='	<img alt="" src="./assets/img/Top2.png" style="width: 580px; height: 396px; margin-left:17%; margin-top:30px; position: absolute; z-index: 3;">';
		                  listHtml1 +="	<img alt='' src='"+top2+"' style='width: 520px; height: 300px; margin-top:78px; margin-left:22%; position: absolute; z-index: 2;'>";
		                  listHtml +="</a>";
		                  $("#top2").html(listHtml1);
		                  
		                  let listHtml2 = "";
		                  listHtml +="<a href='../picture/picDetail?board_id="+top3_b+"'>";
		                  listHtml2 +='	<img alt="" src="./assets/img/Top3.png" style="width: 580px; height: 396px; margin-left:17%; margin-top:30px; position: absolute; z-index: 3;">';
		                  listHtml2 +="	<img alt='' src='"+top3+"' style='width: 490px; height: 300px; margin-top:78px; margin-left:22%; position: absolute; z-index:2;'>";
		                  listHtml +="</a>";
		                  $("#top3").html(listHtml2);
		                  
		                  let listHtml3 = "";
		                  listHtml +="<a href='../picture/picDetail?board_id="+top4_b+"'>";
		                  listHtml3 +='	<img alt="" src="./assets/img/Top4.png" style="width: 580px; height: 396px; margin-left:17%; margin-top:30px; position: absolute; z-index: 3;">';
		                  listHtml3 +="	<img alt='' src='"+top4+"' style='width: 490px; height: 300px; margin-top:78px; margin-left:22%; position: absolute; z-index:2;'>";
		                  listHtml +="</a>";
		                  $("#top4").html(listHtml3);
		                  
		                  let listHtml4 = "";
		                  listHtml +="<a href='../picture/picDetail?board_id="+top5_b+"'>";
		                  listHtml4 +='	<img alt="" src="./assets/img/Top5.png" style="width: 580px; height: 396px; margin-left:17%; margin-top:30px; position: absolute; z-index: 4;">';
		                  listHtml4 +="	<div style=' position: absolute; z-index:2; background-color: white; width: 560px; height: 380px; margin-top:30px; margin-left:19%;'></div>";
		                  listHtml4 +="	<img alt='' src='"+top5+"' style='width: 490px; height: 300px; margin-top:78px; margin-left:23.5%; position: absolute; z-index:3;'>";
		                  listHtml +="</a>";
		                  $("#top5").html(listHtml4);
		                 	
		                  $("#topTitle").html("새내기 BEST Top5")
		                  $("#topTitle").css('width','410px')
		                  $("#topTitle").css('margin-left','39.5%')
		              }
		          });
		   	  });
	   	  
		   	  
		   	  
		$(function () {
			$('[data-toggle="tooltip"]').tooltip()
		}) 	  
		  
	   	  $("#news").click(function(){
	   		  $("#news_img").css("display","block");
	   		  $("#likeyImg").css("display","none");
	   		  $("#followImg").css("display","none");
	   		  $("#recommendImg").css("display","none");
	   		  $("#others1").css("display","none");
	   		  $("#others2").css("display","none");
	   	  });
	   	  
	   	  $("#likeys").click(function(){
	   		  $("#news_img").css("display","none");
	   		  $("#likeyImg").css("display","block");
	   		  $("#followImg").css("display","none");
	   		  $("#recommendImg").css("display","none");
	   		  $("#others1").css("display","none");
	   		  $("#others2").css("display","none");
	   	  });
	   	  
	   	  
	   	  $("#follows").click(function(){
	   		  $("#news_img").css("display","none");
	   		  $("#likeyImg").css("display","none");
	   		  $("#followImg").css("display","block");
	   		  $("#recommendImg").css("display","none");
	   		  $("#others1").css("display","block");
	   		  $("#others2").css("display","none");
	   	  });
	   	  
	   	  $("#recommend").click(function(){
	   		  $("#news_img").css("display","none");
	   		  $("#likeyImg").css("display","none");
	   		  $("#followImg").css("display","none");
	   		  $("#recommendImg").css("display","block");
	   		  $("#others1").css("display","none");
	   		  $("#others2").css("display","block");
	   	  });
	    });
	    
	    function notLogin() {
	    	Swal.fire({
	    		  icon: 'error',
	    		  title: '잠깐!',
	    		  text: '로그인을 먼저 진행하셔야 이용하실 수 있습니다.',
	    		  footer: '<a href="/login"> 로그인 하시겠습니까?</a>'
	    	})

	    }
    </script>
	<%@include file="include/option.jsp" %>
</head>
<body>
  	<%@include file="include/header.jsp" %>
    <!-- Start Banner Hero -->   
    <div class="banner-wrapper bg-light" style="height: 516px">
       <div id="index_banner" class="banner-vertical-center-index container-fluid" style="height:550px; background-image: url('./assets/img/walls.jpg'); padding-top:0px;">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel " >
            <!-- 	<p id="topTitle" style="font-size: 50px; color: #6266ea; width: 400px; margin-left: 44%; position: absolute; z-index: 3;  text-shadow: 2px 2px 5px red;" >BEST TOP5</p> -->
            	<p id="topTitle" style="font-size: 50px; color:white; width: 400px; margin-left: 44%; position: absolute; z-index: 3;  text-shadow: 2px 2px 5px red;" >BEST TOP5</p>
                <ol class="carousel-indicators" style="top: 473px;">
                    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
                    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
                    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
                    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"></li>
                    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"></li>
                </ol>
                
                <ol class="carousel-indicators" style="top: 400px; margin-left: 1200px;">
                	<a href="/" ><li style="width: 30px; height: 30px;"               data-toggle="tooltip" data-placement="bottom" title="좋아요를 많이 받음 Top5"> </li></a>
					<a href="#" ><li id="newTop5" style="width: 30px; height: 30px;"  data-toggle="tooltip" data-placement="bottom" title="신규회원중 좋아요를 많이받은 Top5"> </li></a>
                </ol>
               
                <div class="carousel-inner" style=" height: 532px;">
                	
                    <div class="carousel-item active">
                        <div class="row d-flex align-items-center" style="padding-top: 50px;">
                            <div class="banner-content col-lg-8 col-8 offset-2 m-lg-auto text-left" >
                            	<div id="top1" style=" position: relative; z-index: 1; width: 700px; height: 450px; margin-left: 22%;">
	                       			<a href="../picture/picDetail?board_id=${likeyList[0].board_id}">
		                       			<img alt="" src="./assets/img/Top1.png" style="width: 700px; height: 450px; position: absolute; z-index: 3;"> 
		                       			<img alt="" src="${likeyList[0].pic_path}" style="width: 500px; height: 300px; margin-top:78px; margin-left:15%; position: absolute; z-index: 2;">
                            		</a>
                            	</div>
                            </div>
                        </div>                    
                    </div>

                    <div class="carousel-item">
                        <div class="row d-flex align-items-center" style="padding-top: 50px;" >
                            <div class="banner-content col-lg-8 col-8 offset-2 m-lg-auto text-left">
	                            <div  id="top2" style=" position: relative; z-index: 1; width: 700px; height: 450px; margin-left: 17%; ">
	                       			<a href="../picture/picDetail?board_id=${likeyList[1].board_id}">
	                            		<img alt="" src="./assets/img/Top2.png" style="width: 580px; height: 396px; margin-left:17%; margin-top:30px; position: absolute; z-index: 3;">
	                       				<img alt="" src="${likeyList[1].pic_path}" style="width: 520px; height: 300px; margin-top:78px; margin-left:22%; position: absolute; z-index: 2;">
	                          		</a>
	                          	</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="carousel-item">
                        <div class="row d-flex align-items-center" style="padding-top: 50px;">
                           <div class="banner-content col-lg-8 col-8 offset-2 m-lg-auto text-left">
	                            <div id="top3" style=" position: relative; z-index: 1; width: 700px; height: 450px; margin-left: 17%; ">
		                       		<a href="../picture/picDetail?board_id=${likeyList[2].board_id}">
		                           		<img alt="" src="./assets/img/Top3.png" style="width: 580px; height: 396px; margin-left:17%; margin-top:30px; position: absolute; z-index: 3;">
		                       			<img alt="" src="${likeyList[2].pic_path}" style="width: 490px; height: 300px; margin-top:78px; margin-left:22%; position: absolute; z-index:2;">
	                            	</a>
	                            </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="carousel-item">
                        <div class="row d-flex align-items-center" style="padding-top: 50px;">
                           <div class="banner-content col-lg-8 col-8 offset-2 m-lg-auto text-left">
	                           <div id="top4" style=" position: relative; z-index: 1; width: 700px; height: 450px; margin-left: 17%; ">
	                            	<a href="../picture/picDetail?board_id=${likeyList[3].board_id}">
		                            	<img alt="" src="./assets/img/Top4.png" style="width: 580px; height: 396px; margin-left:17%; margin-top:30px; position: absolute; z-index: 3;">
	                       				<img alt="" src="${likeyList[3].pic_path}" style="width: 490px; height: 300px; margin-top:78px; margin-left:22%; position: absolute; z-index:2;">
	                            	</a>
	                            </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="carousel-item">
                        <div class="row d-flex align-items-center">
                           <div class="banner-content col-lg-8 col-8 offset-2 m-lg-auto text-left" style="padding-top: 50px;">
	                            <div id="top5" style=" position: relative; z-index: 1; width: 700px; height: 450px; margin-left: 17%; ">
	                         		<a href="../picture/picDetail?board_id=${likeyList[4].board_id}">
	                         			<img alt="" src="./assets/img/Top5.png" style="width: 580px; height: 396px; margin-left:17%; margin-top:30px; position: absolute; z-index: 4;">
	                         			<div style=" position: absolute; z-index:2; background-color: white; width: 560px; height: 380px; margin-top:30px; margin-left:19%;" ></div>
	                       				<img alt="" src="${likeyList[4].pic_path}" style="width: 490px; height: 300px; margin-top:78px; margin-left:23.5%; position: absolute; z-index:3;">
	                       			</a>
	                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev text-decoration-none" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                    <i class='bx bx-chevron-left'></i>
                    <span class="visually-hidden">Previous</span>
                </a>
                <a class="carousel-control-next text-decoration-none" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                    <i class='bx bx-chevron-right'></i>
                    <span class="visually-hidden">Next</span>
                </a>
            </div> 
          

        </div>
    </div>
     

    <!-- End Banner Hero -->


    <!-- Start Service -->
    <section class="service-wrapper py-3">
       <div class="service-tag py-5 bg-secondary">
           <div class="col-md-12">
               <ul class="nav d-flex justify-content-center">
                   <li class="nav-item mx-lg-4">
                       <a style="cursor:pointer" class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" id="news"  >최신사진</a>
                   </li>
                   
                   <c:if test="${user.user_id != null}">
	                   <li class="nav-item mx-lg-4">
	                       <a style="cursor:pointer" class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" id="recommend">MyPick</a>
	                   </li>
                   </c:if>
                   
                   <li class="filter-btn nav-item mx-lg-4">
                       <a style="cursor:pointer" class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" id="likeys" >인기사진</a>
                   </li>
                   
                   <c:if test="${user.user_id != null}">
	                   <li class="nav-item mx-lg-4">
	                       <a style="cursor:pointer" class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" id="follows">구독작가사진</a>
	                   </li>
                   </c:if>
                   
                   <li class="nav-item mx-lg-4">
                   		<c:choose>
	                   		<c:when test="${user.user_id != null}">
		                       <a style="cursor:pointer" href="picture/piclist"  class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300">더보기 + </a>
	                   		</c:when>
	                   		<c:otherwise>
	                   			<a style="cursor:pointer" href="#"  class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" onclick="notLogin()">더보기 + </a>
	                   		</c:otherwise>
                   		</c:choose>
                   </li>
                   
               </ul>
           </div>
       </div>
    </section>
    
	<!-- 최신사진  -->
    <section class="container overflow-hidden py-5" id="news_img" style="display: block;">
        <div class="row gx-5 gx-sm-3 gx-lg-5 gy-lg-5 gy-3 pb-3 projects">
        <c:choose>
			<c:when test="${user.user_id != null}">
				 <c:forEach var="newsList" items="${newsList}" begin="0" end="7"> 
		            <!-- Start Recent Work -->
		            <div class="col-xl-3 col-md-4 col-sm-6 project ui branding">
		                <a href="../picture/picDetail?board_id=${newsList.board_id}" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
		                    <img class="service card-img" src="${newsList.pic_path}" alt="Card image" style="widows: 256px; height: 256px;">
		                    <div class="service-work-vertical card-img-overlay d-flex align-items-end">
		                        <div class="service-work-content text-left text-light" style="width: 100%;">
		                        	<img alt="프로필이미지" src="${newsList.profile_img} " style="width: 30px; height: 30px; border-radius: 50%; background-size: cover; float: left;" >
		                            <p class="card-text" style="width:65%; float: left; margin-left: 10px;">${newsList.user_id}</p>
		                        </div>
		                    </div>
		                </a>
		            </div><!-- End Recent Work -->
				 </c:forEach>
			</c:when>
			<c:otherwise>
				 <c:forEach var="newsList" items="${newsList}" begin="0" end="7"> 
		            <!-- Start Recent Work -->
		            <div class="col-xl-3 col-md-4 col-sm-6 project ui branding">
		                <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0" onclick="notLogin()">
		                    <img class="service card-img" src="${newsList.pic_path}" alt="Card image" style="widows: 256px; height: 256px;">
		                    <div class="service-work-vertical card-img-overlay d-flex align-items-end">
		                        <div class="service-work-content text-left text-light" style="width: 100%;">
		                        	<img alt="프로필이미지" src="${newsList.profile_img} " style="width: 30px; height: 30px; border-radius: 50%; background-size: cover; float: left;" >
		                            <p class="card-text" style="width:65%; float: left; margin-left: 10px;">${newsList.user_id}</p>
		                        </div>
		                    </div>
		                </a>
		            </div><!-- End Recent Work -->
				 </c:forEach>
			</c:otherwise>
			</c:choose>
        </div>
    </section>
    <!-- End Service -->
	<!-- 인기사진  -->
    <section class="container overflow-hidden py-5" id="likeyImg" style="display: none;">
        <div class="row gx-5 gx-sm-3 gx-lg-5 gy-lg-5 gy-3 pb-3 projects">
           <c:choose>
				<c:when test="${user.user_id != null}">
					 <c:forEach var="likeyList" items="${likeyList}" begin="0" end="7"> 
			            <!-- Start Recent Work -->
			            <div class="col-xl-3 col-md-4 col-sm-6 project ui branding">
			                <a href="../picture/picDetail?board_id=${likeyList.board_id}" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
			                    <img class="service card-img" src="${likeyList.pic_path}" alt="Card image" style="widows: 256px; height: 256px;">
			                    <div class="service-work-vertical card-img-overlay d-flex align-items-end">
			                        <div class="service-work-content text-left text-light" style="width: 100%;">
			                        	<img alt="프로필이미지" src="${likeyList.profile_img}" style="width: 30px; height: 30px; border-radius: 50%; background-size: cover; float: left;" >
			                            <p class="card-text" style="width:65%; float: left; margin-left: 3px;">${likeyList.user_id}</p>
			                        </div>
			                    </div>
			                </a>
			            </div><!-- End Recent Work -->
					 </c:forEach>
				 </c:when>
				 <c:otherwise>
				 	 <c:forEach var="likeyList" items="${likeyList}" begin="0" end="7"> 
			            <!-- Start Recent Work -->
			            <div class="col-xl-3 col-md-4 col-sm-6 project ui branding">
			                <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0" onclick="notLogin()">
			                    <img class="service card-img" src="${likeyList.pic_path}" alt="Card image" style="widows: 256px; height: 256px;">
			                    <div class="service-work-vertical card-img-overlay d-flex align-items-end">
			                        <div class="service-work-content text-left text-light" style="width: 100%;">
			                        	<img alt="프로필이미지" src="${likeyList.profile_img}" style="width: 30px; height: 30px; border-radius: 50%; background-size: cover; float: left;" >
			                            <p class="card-text" style="width:65%; float: left; margin-left: 3px;">${likeyList.user_id}</p>
			                        </div>
			                    </div>
			                </a>
			            </div><!-- End Recent Work -->
					 </c:forEach>
				 </c:otherwise>
			</c:choose>
        </div>
    </section>
    
    <!-- 구독작가사진  -->
    <c:if test="${user.user_id != null}">
	    <c:choose>
		    <c:when test="${followList.size()>0}">
				<section class="container overflow-hidden py-5" id="followImg" style="display: none;">
			        <div class="row gx-5 gx-sm-3 gx-lg-5 gy-lg-5 gy-3 pb-3 projects">
						 <c:forEach var="followList" items="${followList}" begin="0" end="7"> 
				            <!-- Start Recent Work -->
				            <div class="col-xl-3 col-md-4 col-sm-6 project ui branding">
				                <a href="../picture/picDetail?board_id=${followList.board_id}" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
				                    <img class="service card-img" src="${followList.pic_path}" alt="Card image" style="widows: 256px; height: 256px;">
				                    <div class="service-work-vertical card-img-overlay d-flex align-items-end">
				                        <div class="service-work-content text-left text-light" style="width: 100%;">
				                        	<img alt="프로필이미지" src="${followList.profile_img}" style="width: 30px; height: 30px; border-radius: 50%; background-size: cover; float: left;" >
				                            <p class="card-text" style="width:65%; float: left; margin-left: 3px;">${followList.user_id}</p>
				                        </div>
				                    </div>
				                </a>
				            </div><!-- End Recent Work -->
						 </c:forEach>
			        </div>
			    </section>
		    </c:when>
		    <c:otherwise>
		    	<h1 id="others1" style="text-align: center; display: none;">"구독 한 작가가 없습니다"</h1>
		    </c:otherwise>
		</c:choose>
	</c:if>
	
    <!-- 추천사진  -->
    <c:if test="${user.user_id != null}">
	    <c:choose>
		    <c:when test="${recomList.size()>0}">
				<section class="container overflow-hidden py-5" id="recommendImg" style="display: none;">
			        <div class="row gx-5 gx-sm-3 gx-lg-5 gy-lg-5 gy-3 pb-3 projects">
						 <c:forEach var="recomList" items="${recomList}" begin="0" end="7"> 
				            <!-- Start Recent Work -->
				            <div class="col-xl-3 col-md-4 col-sm-6 project ui branding">
				                <a href="../picture/picDetail?board_id=${recomList.board_id}" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
				                    <img class="service card-img" src="${recomList.pic_path}" alt="Card image" style="widows: 256px; height: 256px;">
				                    <div class="service-work-vertical card-img-overlay d-flex align-items-end">
				                        <div class="service-work-content text-left text-light" style="width: 100%;">
				                        	<img alt="프로필이미지" src="${recomList.profile_img}" style="width: 30px; height: 30px; border-radius: 50%; background-size: cover; float: left;" >
				                            <p class="card-text" style="width:65%; float: left; margin-left: 3px;">${recomList.user_id}</p>
				                        </div>
				                    </div>
				                </a>
				            </div><!-- End Recent Work -->
						 </c:forEach>
			        </div>
			    </section>
		    </c:when>
		    <c:otherwise>
		    	<h1 id="others2" style="text-align: center; display: none;">"PICK한 사진이 없습니다."</h1>
		    </c:otherwise>
		</c:choose>
	</c:if>
    <!-- End Service -->
   <%@include file="include/footer_script.jsp" %>
   <%@include file="include/footer.jsp" %>

</body>
</html>