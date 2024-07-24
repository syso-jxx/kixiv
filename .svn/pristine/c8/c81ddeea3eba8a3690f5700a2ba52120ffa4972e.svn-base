<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../include/option.jsp" %>
<script src="/resources/assets_img/js/jquery-3.3.1.min.js"></script>
<title>신고 하기</title>
</head>
<style>
	#user_icons{
		width: 150px;
		height: 150px;
		border-radius: 50%;
		background-size: cover;
		margin-left: 30px;
		float: left;
		margin-right: 20px;
	}
</style>

<script>

/* $(document).ready(function() { 
	$("form").submit(function(event) {
		var report_title = $('#report_title').val(); 
		var report_content = $('#report_content').val(); 
		if (report_title == "") {
			alert("제목을 입력해주세요."); event.preventDefault(); 
			return; 
		} 
		if (pw == "") {
			alert("신고 할 내용을 작성해주세요.");
			event.preventDefault(); 
			return; 
			} 
		});
	$('#btn').click(function () {
		$("form").submit();
	}); 
});
 */

 $(document).ready(function() {

	 $('#myForm').submit(function(event) { //submit이 발생하면
		 
			var queryString = $("form[name=myForm]").serialize() ;
			
            $.ajax({
            	url: "/report/reportAdd",
                type : 'post',
                data : queryString,
			    success: function(resp){
			    	
			    	alert(resp);
			    	alert(JSON.stringify(resp));
			    	
			    	if(resp == 'ok'){
				    	alert("신고가 접수 되었습니다.")
				    	window.close();
			    	} else {
			    		alert(resp);
			    	}
			    	
			    },
			    error: function(){
			        alert("에러가 발생했습니다.")
			    }
            });
            
			event.preventDefault();
			
		    return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.
		    
	 });
	 
}); 
</script>
<body>
	<%@include file="../include/header.jsp" %>
		<div class="container" style="margin-top: 30px;">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">신고</h4>
				
				<form name="myForm" id="myForm" action="/report/reportAdd" method="post"  >
					<div class="row">
						<div class="col-md-5">
							<label for="user_id">신고할 유저</label> 
							<br/>
							<br/>
							<img alt="프로필이미지" src="/${user.profile_img}"  id="user_icons" >
							<div style="margin-top: 40px;">
								<a style= "font-size: 40px;">${user.nickname}</a>
								<input type="hidden" name="bad_user_id" value="${user.user_id}">
							</div>
						</div>
				
					</div>
					<div>
						<p id="id_msg" class="check_msg"></p>
					</div>
					
					<div class="row">
						<div class="col-md-5" style="width: 100%;"  >
							<label for="what">신고할 내용의 콘텐츠</label> 
							<select name="report_what" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" style="width: 100%;">
							    <option selected value="갤러리">갤러리</option>
							    <option value="그림게시글">작품 투고 게시글</option>
							    <option value="펀딩" selected="selected">펀딩</option>
							</select>
						</div>
						
						<div class="col-md-5" style="width: 100%;" >
							<label for="what">신고사유</label> 
							<select name="report_reason" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" style="width: 100%;">
							    <option value="지나치게 성적인 표현이 포함(음란)"> 지나치게 성적인 표현이 포함되어 있다 (음란)</option>
							    <option value="저작권 등을 침해한 작품을 투고함"> 저작권 등을 침해한 작품을 투고함</option>
							    <option value="아동 포르노,아동 학대에 상당하는 작품 투고" > 아동 포르노 또는 아동 학대에 상당하는 작품을 투고함</option>
							    <option value="상업용 광고, 선전, 권유를 목적투고"> 상업용 광고, 선전, 권유를 목적으로 하는 정보를 투고했다</option>
							    <option value="작품 무단전재">나의 작품이 무단전재됐다</option>
							    <option value="기타 및 이용약관 위배" selected="selected">기타, 이용약관을 위반함</option>
							</select>
						</div>
						<div class="col-md-5"  style="width: 100%;">
							<div>
								<label for="name">제목</label> 
								<input type="text" class="form-control" name="report_title" id="report_title" value="" required>
							</div>
							<div>
								<p id="name_msg" class="check_msg"></p>
							</div>
						</div>
						
						<div class="col-md-5" style="width: 100%;">
							<div class="form-floating">
								  <textarea class="form-control" id="report_content" name="report_content" rows="1000" cols="1000" style="width: 100%; height: 300px;"></textarea>
								  <label for="floatingTextarea">신고 할 내용 작성</label>
							</div>
						</div>
					</div>
					<br/>
					<button class="btn btn-primary" type="submit" >신고</button>
					
					<input type="hidden" id="report_add" name="report_add" value="${report_add}">
<!-- 					<input type="submit" class="btn btn-primary btn-lg btn-block" value="신고하기">  -->
<!-- 					<input type="button" id="btn" class="btn btn-primary btn-lg btn-block" value="신고하기">  -->
<!-- 					<button id="btn" type="button" class="btn btn-primary btn-lg btn-block">신고하기</button> -->
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>