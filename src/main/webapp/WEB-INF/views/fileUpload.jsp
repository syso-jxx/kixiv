<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<%@include file="include/option.jsp"%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>	

<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, San Francisco,
		Helvetica Neue, Helvetica, Ubuntu, Roboto, Noto, Segoe UI, Arial,
		sans-serif;
	font-weight: 400;
}

.tagcloud02 div {
	/* 			   	width: auto;    */
	margin: 5em auto 2.5em;
}

.tagcloud02 div:first-child {
	margin-top: 3em;
}

.tagcloud02 ul {
	margin: 0;
	padding: 0;
	list-style: none;
	overflow: hidden;
}

.tagcloud02 ul li {
	float: left;
	width: auto;
	margin: 0 10px 10px 0;
	padding: 0;
}

.tagcloud02 ul li a {
	display: inline-block;
	width: 100%;
	height: 32px;
	line-height: 32px;
	padding: 0 1em;
	background-color: white;
	border: 1px solid black;
	border-radius: 3px;
	white-space: nowrap;
	/* 				text-overflow: ellipsis; */
	overflow: hidden;
	font-size: 19px;
	text-decoration: none;
	-webkit-transition: .2s;
	transition: .2s;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	color: black;
}

.tagcloud02 ul li a:hover {
	border: 2.5px solid #4000FF;
	color: black;
}

.dragAndDropDiv {
	border: 2px dashed #BDBDBD;
	width: 10%;
	height: 300px;
	color: #BDBDBD;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 200%;
	display: table-cell;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}

#btm_mv {
	margin-left: 30%;
}

#table_mv {
	margin-left: 15%;
}

#menubar {
	text-align: center;
	font-size: 50px;
	font-weight: 20px;
	width: 100%;
	height: 20%
}

textarea::placeholder {
	color: #6E6E6E;
	font-size: 17px;
}

table {
	border-collapse: separate;
	border-spacing: 0 10px;
}

textarea {
	background-color: rgb(245, 247, 249);
	border: none;
}

textarea:focus {
	outline: none;
}
</style>


</head>

<body>
	<%@include file="include/header.jsp"%>
	<!-- Start Service -->
	<section class="container overflow-hidden py-5">
		<div style="width: 100%;">
			<h1 style="margin-bottom: 100px;">그림 업로드</h1>
			<form id="file_upload" method="post" onsubmit="return submitCheck();">
				<div style="border: 1px solid black; margin-bottom: 20px;">
				<table style="width: 98%; margin: 1px 1% 1px 1%;">
					<tr style="width: 100%; border: none;">
						<td colspan="2" class="inputArea">
						
							<div style="cursor: pointer;" id="fileUpload" class="dragAndDropDiv">
								Drag & Drop Files Here or Browse Files
								<p style="font-size: 20px;">영역을 클릭하거나 파일을 올려 놓아 주세요 .</p>
							</div> 
							
							<input type="file" name="fileUpload" id="fileUpload" style="display: none;" multiple />
							
							<div class="select_img">
								<img src="" />
							</div>
							
						</td>
					</tr>
					<tr>
						<td>
							<div class="container">
								<div class="row">
									<div class="col">
										<p style="font-size:35px; margin-top: 40px; margin-bottom: 40px;"><strong>태그목록</strong></p>
										<div class="btn-group-toggle" data-toggle="buttons">
											<c:choose>
												<c:when test="${tag.size() > 0}">
													<c:forEach var="tags" items="${tag}">
														<label class="btn btn-primary" style="margin-bottom: 8px;">
															<input class="myBtn" type="checkbox" name="myBtn" value="${tags.tag_id}"> ${tags.tag_name}
														</label>
													</c:forEach>
												</c:when>
												
												<c:otherwise>
													<h1>해쉬태그가 없습니다</h1>
												</c:otherwise>
											</c:choose>	
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
				</div>
				<input style="background: black; border-color: black; float: right; margin-left: 5px;" class="btn btn-primary" type="button" value="뒤로가기">
				<input style="background: black; border-color: black; float: right;" class="btn btn-primary" type="submit" value="등록" > 
			</form>
		</div>
		<div style="width: 100%; margin-bottom: 100px;">
			<div id="btm_mv" style="float: right;"></div>
		</div>
		

	</section>
</body >
<%@include file="include/footer.jsp"%>
</html>


<script type="text/javascript">
	var files;
	arr = new Array();
	

	
	//서브밋 예외처리
	function submitCheck() {
		$('.myBtn:checked').each(function(){
			arr.push($(this).val());
		})
		
	 	if(typeof files == "undefined"){
			Swal.fire({
				  icon: 'error',
				  title: '잠깐...',
				  text: '최소 하나의 이미지는 등록하셔야합니다..',
			})
			return false;
		}else if(arr.length <= 0){
			Swal.fire({
				  icon: 'error',
				  title: '잠깐...',
				  text: '해쉬태그를 하나이상 선택해야 합니다..',
			})
    		return false;
		}
    	Swal.fire({
  		  icon: 'success',
  		  title: '등록 성공',
  		  text: '정상적으로 등록되었습니다.',
  		});
		return true
	}
	
	
	$(document).ready(function() {
		var objDragAndDrop = $(".dragAndDropDiv");

		$(document).on("dragenter", ".dragAndDropDiv", function(e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).css('border', '2px solid #0B85A1');
		});
		$(document).on("dragover", ".dragAndDropDiv", function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		$(document).on("drop", ".dragAndDropDiv", function(e) {
			$(this).css('border', '2px dotted #0B85A1');
			e.preventDefault();
			files = e.originalEvent.dataTransfer.files;
			for (var i = 0; i < files.length; i++) {
				var pathFileName = files[i].name.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
				var extension = (files[i].name.substr(pathFileName, files[i].name.length)).toLowerCase();	//확장자명
				
				if(extension == "gif" || extension == "jpg" || extension == "png"){
					
				}else{
					Swal.fire({
						  icon: 'error',
						  title: '이런...',
						  text: 'jpg , png , gif 파일만 업로드 할 수 있습니다.',
					})
					return;
				}
			}
			handleFileUpload(files, objDragAndDrop);
		});

		$(document).on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		$(document).on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			objDragAndDrop.css('border', '2px dotted #0B85A1');
		});
		$(document).on('drop', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		//drag 영역 클릭시 파일 선택창
		objDragAndDrop.on('click', function(e) {
			$('input[type=file]').trigger('click');
		});

		$('input[type=file]').on('change', function(e) {
			files = e.originalEvent.target.files;
			for (var i = 0; i < files.length; i++) {
				var pathFileName = files[i].name.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
				var extension = (files[i].name.substr(pathFileName, files[i].name.length)).toLowerCase();	//확장자명
				
				if(extension == "gif" || extension == "jpg" || extension == "png"){
					
				}else{
					Swal.fire({
						  icon: 'error',
						  title: '이런...',
						  text: 'jpg , png , gif 파일만 업로드 할 수 있습니다.',
					})
					return;
				}
			}
			handleFileUpload(files, objDragAndDrop);
		});

		$('#choice_ganre').click(function() {
			$('#span1').show();
			$('#span2').hide();
		});

	});

	function handleFileUpload(files, obj) {
		for (var i = 0; i < files.length; i++) {
			var fd = new FormData();
			fd.append('file', files[i]);

			var status = new createStatusbar(obj); //Using this we can set progress.
			status.setFileNameSize(files[i].name, files[i].size);
			sendFileToServer(fd, status);

		}
	}//end function

	var rowCount = 0;
	function createStatusbar(obj) {
	
		rowCount++;
		var row = "odd";
		if (rowCount % 2 == 0)
			row = "even";
		this.statusbar = $("<div class='statusbar "+row+"'></div>");
		this.filename = $("<div class='filename'></div>").appendTo(
				this.statusbar);
		this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
		this.progressBar = $("<div class='progressBar'><div></div></div>")
				.appendTo(this.statusbar);
		this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);

		obj.after(this.statusbar);

		this.setFileNameSize = function(name, size) {
			var sizeStr = "";
			var sizeKB = size / 1024;
			if (parseInt(sizeKB) > 1024) {
				var sizeMB = sizeKB / 1024;
				sizeStr = sizeMB.toFixed(2) + " MB";
			} else {
				sizeStr = sizeKB.toFixed(2) + " KB";
			}

			this.filename.html(name);
			this.size.html(sizeStr);
		}

		this.setProgress = function(progress) {
			var progressBarWidth = progress * this.progressBar.width() / 100;
			this.progressBar.find('div').animate({
				width : progressBarWidth
			}, 10).html(progress + "% ");
			if (parseInt(progress) >= 100) {
				this.abort.hide();
			}
		}

		this.setAbort = function(jqxhr) {
			var sb = this.statusbar;
			this.abort.click(function() {
				jqxhr.abort();
				sb.hide();
			});
		}
	}//end function

	function sendFileToServer(formData, status) {
		var uploadURL = "/fileUpload/post"; //Upload URL  
		var extraData = {}; //Extra Data.
		var jqXHR = $.ajax({
			xhr : function() {
				var xhrobj = $.ajaxSettings.xhr();
				if (xhrobj.upload) {
					xhrobj.upload.addEventListener('progress', function(event) {
						var percent = 0;
						var position = event.loaded || event.position;
						var total = event.total;
						if (event.lengthComputable) {
							percent = Math.ceil(position / total * 100);
						}
						//Set progress
						status.setProgress(percent);
					}, false);
				}
				return xhrobj;
			},
			url : uploadURL,
			type : "POST",
			contentType : false,
			processData : false,
			cache : false,
			data : formData,
			success : function(data) {
			status.setProgress(100);

				//$("#status1").append("File upload Done<br>");           
			}
		});

		status.setAbort(jqXHR);
	}//end function

	function fn_toggle() {
		if ($('#ganre').val() == "other") {
			$('#span1').hide();
			$('#span2').show();
		}
	}//end function

	
</script>