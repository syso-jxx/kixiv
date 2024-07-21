<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<%@include file="../include/optionImg.jsp" %>
<%@include file="../include/option.jsp" %>
<style>
	.btn_profile{
		width: 200px; 
		height: 200px;
		border-radius: 50%;
		background-size: cover;
	}
	
	.flower{
		widows: 100px;
		height: 40px;
		border-radius: 10%;
		background: #20c997;
		color: white;
		border: none;
		margin-top:10px;
		text-align: center;
	}
	#peulopil{
		margin-top:30px;
		float: right;
		margin-right: 100px;
	}
</style>
<script src="asset/js/jquery.min.js"></script>

<script>
	var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
	 
	$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
	     getList(page);
	     page++;
	     
	     
	 	//팔로워  	
	     $('#click-follow').click( function() {
	 		var b_userId = "${userVO.user_id}";
	 		alert("b_userId : "+ b_userId);
	         if( $(this).html() == '팔로우' ) {
	              $.ajax({
	                 url : '/followIng',
	                 type : 'get',
	                 dataType : 'text',
	                 data : {
	                 	b_userId : b_userId,
	                 },
	                 success : function(data) {
	                     console.log("팔로우등록 성공");
	                 },
	                 error : function() {
	                     alert('서버 에러');
	                 }
	             }); 
	                 
	        	        $(this).html('언팔로우');
	        	        $(this).css('color','white');
	        	        $(this).attr('class','btn btn-primary');  
	  
	         }
	         else {
	              $.ajax({
	                 url : '/unfollowIng',
	                 type : 'get',
	                 dataType : 'text',
	                 data : {
	                 	b_userId : b_userId,
	                 },
	                 success : function(data) {
	                     console.log("언팔로우 성공");
	                 },
	                 error : function() {
	                     alert('서버 에러');
	                 }
	             }); 
	        		    $(this).html('팔로우');
	        		    $(this).attr('class','btn btn-outline-light');   
	        		    $(this).css({'border-color':'#4232c2', color:'#4232c2'});
	 		}
	 	});
	     
	}); 
	 
	$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	     if($(window).scrollTop() >= $(document).height() - $(window).height()){
	          getList(page);
	           page++;   
	     } 
	});
	
	function getList(page){
	 	//alert("ㅎㅇㅇㅇㅇ");
	    $.ajax({
	        type : 'POST',  
	        dataType : 'json', 
	        data : {"page" : page,
	        		"user_id" : "${userVO.user_id}"
	        		},
	        url : '/picture/userListMake',
	        success : function(returnData) {
	        	//alert("ㅎㅇㅇㅇㅇ1");
	            var data = returnData.rows;
	            var html = "";
	            var data2 = JSON.stringify(data);
           			console.log(data2);
	            if (page==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
	                  $("#myPicList").html(""); 
	            }
	            if (returnData.startNum<=returnData.totCnt){
	                if(data.length>0){
	                	for(const i in data){
	                		let pic_num = data[i].pic_num; 				//댓글번호
	                		let pic_path = data[i].pic_path; 			//파일경로
	                		let pic_name = data[i].pic_name; 			//원본이름
	                		let thum_name = data[i].thum_name; 			//썸내일
	                		let board_id = parseInt(data[i].board_id); 	//글번호
	                		let user_id = data[i].user_id; 				//글쓴이이름
	                		let profile_img = data[i].profile_img; 		//끌쓴이프로필이미지
	             
	                		
	                		html += "<div class='col-sm-6 col-md-4 col-lg-3 col-xl-3 item' data-aos='fade'>";
	                		html += "	<a href= ../picture/picDetail?board_id=" + board_id + ">";
	                		html += "		<img src = '" + pic_path + "' alt='IMage' class='img-fluid' style='width: 100%; height: 326px; margin-bottom: 20px;'>";
	                		html += "	</a>";
	                		html += "</div>";
	                		
	               		}
	                }else{
	                //데이터가 없을경우
	                	html += "<div><h1 style='text-align: center;'>구독한 작가가 없습니다.</h1></div>";
	                }
	            }
	            html = html.replace(/%20/gi, " ");
	            if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
	                $("#myPicList").html(html); 
	            }else{
	            	let timerInterval
	            	Swal.fire({
	            	  title: '파일불러오는중',
	            	  html: '작업까지 <b></b> milliseconds 남았습니다.',
	            	  timer: 300,
	            	  timerProgressBar: true,
	            	  didOpen: () => {
	            	    Swal.showLoading()
	            	    timerInterval = setInterval(() => {
	            	      const content = Swal.getHtmlContainer()
	            	      if (content) {
	            	        const b = content.querySelector('b')
	            	        if (b) {
	            	          b.textContent = Swal.getTimerLeft()
	            	        }
	            	      }
	            	    }, 50)
	            	  },
	            	  willClose: () => {
	            	    clearInterval(timerInterval)
	            	  }
	            	}).then((result) => {
	            	  /* Read more about handling dismissals below */
	            	  if (result.dismiss === Swal.DismissReason.timer) {
	            	    console.log('I was closed by the timer')
	            	  }
	            	})
	            	
	                $("#myPicList").append(html);
	            }
	       },error:function(e){
	           if(e.status==300){
	               alert("데이터를 가져오는데 실패하였습니다.");
	           };
	       }
	    }); 
	}


</script>
<style>
	select{
		border:1px solid #ced4da;
		width: 180px;
		height: 38px;
			border-radius:7%; 
	}
	
	p{
		text-align: center;
	}
	
</style>

</head>

<body>
	<!-- Header -->
	<%@include file="../include/header.jsp" %>
	<!-- Close Header -->
	
	<div class="site-section" data-aos="fade">
		<div class="container-fluid">
		
			<div style="display: flex; align-items: center;justify-content : center;">
				<div>
					<button class="btn_profile" id="btn_img" style="background-image: url(${userVO.profile_img});border:0;outline:0;"></button>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div>
					<div>
						<a style="vertical-align:middle; font-size: 30px; font-weight: bold; margin-right: 8px;">${userVO.nickname}</a>
						<c:if test="${user.user_id ne userVO.user_id}">
							<c:choose>
								<c:when test="${followCnt == 1}">
									<button type="button" id="click-follow" class="btn btn-primary" style=" border-radius: 7% ; width: 90px;">언팔로우</button>
								</c:when>
								<c:otherwise>
									<button type="button" id="click-follow" class="btn btn-outline-light" style=" border-radius: 7%; width: 90px; border-color: #4232c2; color: #4232c2;">팔로우</button>
								</c:otherwise>
							</c:choose>
						</c:if>
						
						<h4>${userVO.email}</h4>
						<div>
							<img src="https://s.pximg.net/www/js/build/0a4c9bfd385304c0ffe26bd08fab34ba.svg" width="32" height="32" style="vertical-align:text-bottom;">
							<a style="margin-left: 3px;font-size:24px;vertical-align:text-bottom;">${myLookCnt}</a>
						</div>
					</div>
				</div>
			</div>

			<div style="margin-top:100px;margin: 5px 10px;">
				<h1>사진</h1>
				<hr/>
			</div>
			<div class="row">
				<div class="row" id="myPicList" class="stList"></div>
			</div>
		</div>
	</div>
	<%@include file="../include/footer.jsp" %>
	<%@include file="../include/footer_script.jsp" %>
	
	
</body>
</html>