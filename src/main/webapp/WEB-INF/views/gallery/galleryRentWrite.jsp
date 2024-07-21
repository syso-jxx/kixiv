<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
	<title>KIXIV - 세상의 모든 사진</title>
	<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- 서머노트를 위해 추가해야할 부분 -->
	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
	<!--  -->
  
	<%@include file="../include/option.jsp" %>
	
	<style>
/*  		td, th {  */
/*  			text-align: center;  */
/*  		}  */
		
 		th { 
 			vertical-align: middle;
 			text-align: center; 
 		} 

	</style>
</head>

<body>

	<%@include file="../include/header.jsp" %>

	<section class="container overflow-hidden py-5">
		<h1 class="text-dark h1" style="text-align:left;">갤러리 대여 상세정보</h1>
		<br/><br/>
		
		<form method="post" enctype="multipart/form-data" onsubmit="return validCheck();" action="/galleryRentWrite" >
			<div>
				<!-- 테이블 시작 -->
				
				<input type="hidden" id="selectOption" name="selectOption" value="">
				
				<table class="table table-sm">
					<tbody>
						<tr>
							<th scope="col" style="text-align:center;">갤러리 선택</th> <!-- 갤러리 회원이 등록한 갤러리 목록들 뿌려주기 -->
							<td colspan="3" style="padding:1px 15px;">
								 <select style="width:700px;" name="gallery_choice" id="gallery_choice" style="width: 100%;" onchange="fn_change();">
								    <option value="none">========================== 갤러리 선택 ==========================</option>
									<c:forEach var="list" items="${galleryList}" varStatus="status">
										<option id = "gallery_num" class="gallery_num" value="${list.gallery_num}">
											${status.count}. ${list.gallery_name} (${list.gallery_add1})
										</option>
									</c:forEach>						 
								 </select>
							</td>
						</tr>
						<tr>
							<th scope="col" style="text-align:center;">대여 가능 기간</th> <!-- datePicher 사용 -->
							<td scope="col" style="padding:1px 15px;">
								<input type="text" name="rent_sdate" id="rent_period_start" style="width: 200px;" placeholder="시작일 " value="${list.rent_sdate}"/>
									~
								<input type="text" name="rent_edate" id="rent_period_end" style="width: 200px;" placeholder="마감일 "/>
							</td>
						</tr>
						<tr>
							<th scope="col" style="text-align:center;">대여비</th>
							<td scope="col" style="padding:1px 15px;">
								<input type="text" name="rent_price" id="rent_price" style="width: 49%;"/> 원
							</td>
						</tr>
						<tr>
							<th scope="col" style="text-align:center;">펀딩 가능 여부 <i data-toggle="tooltip" title="[가능]을 선택하시면 사용자가 펀딩을 통해 갤러리를 대여할 수 있습니다." class="far fa-question-circle" style="cursor: pointer;"></i></th> <!-- 설명 -->
							<td scope="col" style="padding:1px 15px;"> <!-- 가로 정렬 -->
								<div style="display: block;">
									<div style="float:left; display: block; margin-top:4px;">
										<input type="radio" name="fund_yn" id="fundY" style="margin-left: 20px;" value="y" checked /> 가능
									</div>
									<div style="float:left; margin-top:4px;">
										<input type="radio" name="fund_yn" id="fundN" style="margin-left: 45px;" value="n"/> 불가능
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="col" style="width:150px;vertical-align : middle;">내용</th>
							<td scope="col">
								<div class="container">
								  <textarea class="summernote" name="rent_content"></textarea>    
								</div>
							
							</td>
						</tr>
					</tbody>				
				</table>
			</div>
			
			<div class="d-grid justify-content-end">
				<input type="submit" class="btn btn-primary" value="작성"/>
			</div>
		</form>
	</section>

	<%@include file="../include/footer.jsp" %>
	
	<script>
	
	var toolbar = [
	    // 글꼴 설정
	    ['fontname', ['fontname']],
	    // 글자 크기 설정
	    ['fontsize', ['fontsize']],
	    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	    // 글자색
	    ['color', ['forecolor','color']],
	    // 표만들기
	    ['table', ['table']],
	    // 글머리 기호, 번호매기기, 문단정렬
	    ['para', ['ul', 'ol', 'paragraph']],
	    // 줄간격
	    ['height', ['height']],
	    // 그림첨부, 링크만들기, 동영상첨부
	    ['insert',['picture','link','video']],
	    // 코드보기, 확대해서보기, 도움말
	    ['view', ['codeview','fullscreen', 'help']]
	  ];

	var setting = {
        height : 500,
        minHeight : null,
        maxHeight : null,
        focus : true,
        lang : 'ko-KR',
        toolbar : toolbar,
        callbacks : { //여기 부분이 이미지를 첨부하는 부분
        onImageUpload : function(files, editor, welEditable) {
	            for (var i = files.length - 1; i >= 0; i--) {
	            	uploadSummernoteRentImageFile(files[i], this);
            	}
        	}
        }
	};
	
	$('.summernote').summernote(setting);
	    
	function uploadSummernoteRentImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteRentImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
	
	function validCheck(){
		var price = $.trim($("input[name=rent_price]").val());
		var content = $.trim($("textarea[name=rent_content]").val());
		if(price == ''){
			swal.fire({
				text:"대여비를 입력하세요",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			return false;
		}
		if(content == ''){
			swal.fire({
				text:"내용을 입력하세요",
				icon:"warning", 
				confirmButtonText:"확인"
			});
			return false;
		}
		return true;
	}
	
	
     $(function () {
         $("#rent_period_start, #rent_period_end").datepicker();
     });
     
     $.datepicker.setDefaults({
         dateFormat: 'yy-mm-dd',
         prevText: '이전 달',
         nextText: '다음 달',
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
         dayNames: ['일', '월', '화', '수', '목', '금', '토'],
         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
         showMonthAfterYear: true,
         yearSuffix: '년',
         minDate: "+7D",
     });
     
	function fn_change(){
		var selectOption = document.getElementById("gallery_choice");
		selectOption = selectOption.options[selectOption.selectedIndex].value;
		var gallery_num = selectOption;
		$('input[id=selectOption]').attr('value',gallery_num);
// 		alert("gallery_num : " + gallery_num);
	}
		
 </script>

</body>
</html>