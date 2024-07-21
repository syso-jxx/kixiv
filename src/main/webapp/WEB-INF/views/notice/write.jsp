<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
	<title>KIXIV - 세상의 모든 사진</title>
	<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<!-- 서머노트를 위해 추가해야할 부분 -->
	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
	<!--  -->
  
	<%@include file="../include/option.jsp" %>
	
	<style>
		td, th {
			text-align: center;
		}
		
		th {
			vertical-align: middle;
		}
	
	</style>

</head>

<body>
	<%@include file="../include/header.jsp" %>

	<section class="container overflow-hidden py-5">
		<h1 class="text-dark h1" style="text-align:left;">공지사항 작성</h1>
		<br/><br/>
		
		<form method="post" onsubmit="return validCheck();">
			<div>
				<!-- 테이블 시작 -->
				<table class="table table-sm">
					<tbody>
						<tr>
							<th scope="col" style="text-align:center;">제목</th>
							<td scope="col" style="padding:1px 15px;"><input type="text" name="notice_title" id="title" style="width: 100%;"/></td>
						</tr>
						<tr>
							<th scope="col" style="width:150px;vertical-align : middle;">내용</th>
							<td scope="col">
								<div class="container">
								  <textarea class="summernote" name="notice_content"></textarea>    
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
		            	uploadSummernoteImageFile(files[i], this);
	            	}
	        	}
	        }
	};
	
	$('.summernote').summernote(setting);
	    
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
	
			function validCheck(){
				var title = $.trim($("input[name=notice_title]").val());
				
				var content = $.trim($("textarea[name=notice_content]").val());
				if(title == ''){
					swal.fire({
						text:"title을 입력하세요",
						icon:"warning", 
						confirmButtonText:"확인"
					});
					return false;
				}
				if(content == ''){
					swal.fire({
						text:"content를 입력하세요",
						icon:"warning", 
						confirmButtonText:"확인"
					});
					return false;
				}
				return true;
			}
	</script>
</body>
</html>