<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KIXIV - 세상의 모든 사진</title>
<script src="asset/js/jquery.min.js"></script>
</head>
<body>
	<form id="fileForm" method="post" enctype="multipart/form-data">
		<input type="file" name="file" multiple="true" /> 
		<input type="text" name="p_name" />
		<input type="button" value="전송" onclick="fileUpload()"/>
	</form>


	<script>
	function fileUpload(){
		
		alert("접근");
		
		var formData = new FormData($("#fileForm")[0]); 
		
		$.ajax({ 
			type: "POST", 
			enctype: 'multipart/form-data',   
			url: '/profileFileUpload', 
			data: formData, 
			processData: false, 
			contentType: false, 
			cache: false, 
			success: function (result) { 
				alert("성공?")
				window.opener.$("profile_img").attr("style", "background-image: url('result');")
			}, 
			error: function (e) { 
				alert("실패?")
			} 
		});
	}


</script>
</body>
</html>