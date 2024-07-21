<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<%-- <%@include file="../include/optionImg.jsp" %> --%>
<%@include file="../include/option.jsp" %>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css">
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
	
	.slider-outline { 
/* 	 	background: #ccc;  */
	 } 
	
	.main {
		font-family: Arial;
		width: 800px;
		display: block;
		margin: 0 auto;
	}
	
	h3 {
		background: #fff;
		color: #3498db;
		font-size: 36px;
		line-height: 100px;
		margin: 10px;
		padding: 2%;
		position: relative;
		text-align: center;
	}
	
</style>
<!-- <script src="asset/js/jquery.min.js"></script> -->

<script>

// 미리보기 시작
var sel_file;

$(function(){
	$("#btn_img").click(function(){
		$("input[type=file]").click();
	});

	$("input[type=file]").change(function(e){
		console.log(e)
		var files = e.target.files;
		console.log(files)
		var filesArr = Array.prototype.slice.call(files);
		console.log(filesArr)
		 
		filesArr.forEach(function(f){
			console.log(f)
			
		    if(!f.type.match("image.*")){
		        alert("확장자는 이미지 확장자만 가능합니다.");
		        return;
		    }
				
		    sel_file = f;
			console.log(sel_file)
		   
		    var reader = new FileReader();
		    reader.onload = function(e){
				console.log(e)
		 	    $("#btn_img").attr("style", "background-image: url(" + e.target.result + ");");
				$(".profile_icon").attr("style", "background-image: url(" + e.target.result + ");");
				imgUpload();
		    }

			reader.readAsDataURL(f);
	    });
	});
	//미리보기 끝
							
	function imgUpload(){
		// 이미지 업로드 및 DB에 경로 저장 시작
	    var formData = new FormData($("#frm")[0]);
		
		$.ajax({ 
			type: "POST", 
			enctype: 'multipart/form-data',   
			url: '/profileFileUpload', 
			data: formData, 
			processData: false, 
			contentType: false, 
			cache: false, 
			success: function (profile) {
// 				setTimeout(function() {
// 					  console.log('Works!');
// 					  $("#btn_img").attr("style", "background-image: url(" + profile + ");");
// 					  $(".profile_icon").attr("style", "background-image: url(" + profile + ");");
// 				}, 4000);
			}, 
			error: function (e) { 
				console.log(e);
			} 
		});
		// 이미지 업로드 및 DB에 경로 저장 끝
	}
	
})
	
</script>
<script>
	var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
	 
	$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
	     getList(page);
	     page++;
	}); 
	 
	$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	     if($(window).scrollTop() >= $(document).height() - $(window).height()){
	          getList(page);
	           page++;   
	     } 
	});
	
	function getList(page){
	    $.ajax({
	        type : 'POST',  
	        dataType : 'json', 
	        data : {"page" : page},
	        url : '/picture/myListMake',
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
	                	html += "<div><h1 style='text-align: center;'>사진이 없습니다.</h1></div>";
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


 $(function() {
	$("#selectImg").change(function(){
		var value = $("#selectImg option:selected").val();
		console.log(value);
 		if(value == "구독작가순"){
 			console.log(value);
 			$(location).attr("href","../picture/followList");
		}else if (value == "인기순") {
			console.log(value);
			$(location).attr("href","../picture/likeyPicList");
		}else {
			console.log(value);
			$(location).attr("href","../picture/piclist");
		}
	});
});
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
			
			<div style="display: flex; align-items: center;justify-content : center;margin-top:80px;">
				<div>
					<button class="btn_profile" id="btn_img" style="background-image: url(${userVO.profile_img});border:0;outline:0;"></button>
					<form id="frm" name="frm" method="post" enctype="multipart/form-data">
						<input type="file" name="file" style="display:none"/>
					</form>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div>
					<h2>${userVO.nickname}</h2>
					<h4>${userVO.email}</h4>
					<div>
						<img src="https://s.pximg.net/www/js/build/0a4c9bfd385304c0ffe26bd08fab34ba.svg" width="32" height="32" style="vertical-align:text-bottom;">
						<a style="margin-left: 3px;font-size:24px;vertical-align:text-bottom;">${myLookCnt}</a>
					</div>
					
					<button class="flower" onclick="javascript:location.href='/user/modify'">내정보수정</button>	
					<button class="flower" onclick="javascript:location.href='/myFundList'">펀딩목록</button>							
					<button class="flower" onclick="javascript:location.href='/investList'">투자목록</button>							
					<br>							
					<button class="flower" onclick="javascript:location.href='/report/myReportList'">신고내역</button>
					<button class="flower" onclick="javascript:location.href='/myGalleryRentReqList'">갤러리대여</button>							
				</div>
			</div>
			
			<div style="margin-top:100px;margin-left:100px;">
				<h1>팔로잉</h1>
			</div>
			<hr/>
	
			<div class="slider-outline">
				<div class="main">
					<div class="slider slider-nav">
						
						<c:forEach var="follow" items="${followList}">
							<div style="display: inline-block;">
								<a href="/userPage?user_id=${follow.from_id}"><img src="/${follow.profile_img}" width="75px" height="75px" style="border-radius: 50%; margin:auto;object-fit:cover;"></a>
								<p style="text-align: center;">${follow.nickname}</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<div style="margin-top:40px;margin-left:100px;">
				<h1>내 사진</h1>
			</div>
			<hr/>
			<div class="row">
				<div class="row" id="myPicList" class="stList"></div>
			</div>
		</div>
	</div>
	
	<%@include file="../include/footer.jsp" %>
	
</body>
<script>
	$('.slider-nav').slick({
		slidesToShow : 7,
		slidesToScroll : 7,
		asNavFor : '.slider-for',
		dots : true,
		focusOnSelect : true
	});
</script>
</html>