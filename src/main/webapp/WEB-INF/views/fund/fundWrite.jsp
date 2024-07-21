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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
	<!-- 서머노트를 위해 추가해야할 부분 -->
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<!--  -->
  
	<%@include file="../include/option.jsp" %>
	
	<style>
		th {
			vertical-align: middle;
			text-align: center;
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
		
		input[readonly] {
			background-color: #e9ecef;
			border: 1px solid gray;
		}
		
		#place_tel1 {
			padding: 1px 2px;
		    font-size: 16.8px;
		}
		
	</style>
	
</head>

<body>
	<%@include file="../include/header.jsp" %>
	<section class="container overflow-hidden py-5">
		<h1 class="text-dark h1" style="text-align:left;">펀딩글 작성</h1>
		<h6 class="text-dark h1" style="text-align:right; font-size: 15px;"><span style="color:red;">* 글 작성 후엔 <b>펀딩 기간, 금액, 종류</b>는 변경이 불가능하며, 펀딩 시작 후엔 글 삭제가 불가능합니다.</span></h6>
		<h6 class="text-dark h1" style="text-align:right; font-size: 15px;"><span style="color:red;">* 표시 된 항목은 필수 작성</span></h6>
		<br/>
		<form method="post" enctype="multipart/form-data" onsubmit="return validCheck();" action="/fundWritePros">
			<div>
				<!-- 테이블 시작 -->
				<table class="table table-sm">
					<tbody>
						<tr>
							<th scope="col">펀딩기간 *</th>
							<td scope="col" colspan="3" style="padding:1px 15px;">
							<input type="text" name="sdate" id="fund_sdate" style="width: 200px; text-align: center;" placeholder="시작일 "/>
							~
							<input type="text" name="edate" id="fund_edate" style="width: 200px; text-align: center;" placeholder="마감일 "/>
							</td>
						</tr>
						<tr>
							<th scope="col">펀딩목표액 *</th>
							<td scope="col" style="padding:1px 15px;">
								<input type="text" name="achieve" id="achieve" style="width: 200px; text-align: center;" onkeyup="inputNumberFormat(this)" onkeypress="inNumber();" /> &nbsp;&nbsp;원
							</td>
							<th scope="col">1인당 펀딩금액 *</th>
							<td scope="col" style="padding:1px 15px;">
								<input type="text" name="one_price" id="one_price" style="width: 200px; text-align: center;" onkeyup="inputNumberFormat(this)" onkeypress="inNumber();" /> &nbsp;&nbsp;원
							</td>
						</tr>
						<tr>
							<th scope="col">펀딩종류 *</th>
							<td scope="col" colspan="3" style="padding:1px 15px;">
								<div style="display: block;">
									<c:forEach var="codeList" items="${codeList}">
										<div style="float:left; display: block; margin-top:4px;">
											<input type="radio" name="fundCode" id="${codeList.fund_code}" value="${codeList.fund_code}" style="margin-left: 20px;" /> ${codeList.code_name}
										</div>
									</c:forEach>
								</div>
							</td>
						</tr>
						
						<tr class="rent-info" style="display:none;">
							<th scope="col">우편번호 *</th>
							<td scope="col" colspan="3" style="padding:1px 15px;">
								<input type="text" name="fund_zip" id="fund_zip" style="width: 200px;" readonly />
								<button type="button" class="btn btn-primary" onclick="goPopup()" style="line-height: 0.9; vertical-align: top; text-align: center">검색</button>
							</td>
						</tr>
						
						<tr class="rent-info" style="display:none;">
							<th scope="col">주소 *</th>
							<td scope="col" style="padding:1px 15px;">
								<input type="text" name="fund_add1" id="fund_add1" style="width: 100%;" readonly/>
							</td>
							<th scope="col">상세주소</th>
							<td scope="col" style="padding:1px 15px;">
								<input type="text" name="fund_add2" id="fund_add2" style="width: 100%;" /> 
							</td>
						</tr>
						
						<tr class="rent-info" style="display:none;">
							<th scope="col">대관장소 연락처 *</th>
								<td scope="col" colspan="3" style="padding:1px 15px;">
								<select name="place_tel1" id="place_tel1" style="width:83px; text-align: center;">
									<option value="">---</option>
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="044">044</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
								</select>
								<input type="text" name="place_tel2" id="place_tel2" style="width: 155px;" /> -
								<input type="text" name="place_tel3" id="place_tel3" style="width: 155px;" />
							</td>
						</tr>
						<tr>
							<th scope="col">제목 *</th>
							<td scope="col" colspan="3" style="padding:1px 15px;"><input type="text" name="fund_title" id="title" style="width: 100%;"/></td>
						</tr>
						<tr>
							<th scope="col" style="width:200px; vertical-align: middle;">내용 *</th>
							<td scope="col" colspan="3">
								<div class="container">
								  <textarea class="summernote" name="fund_content"></textarea>    
								</div>
							</td>
						</tr>
						
						<tr>
							<th scope="col" style="width:200px; vertical-align: middle;">작가의사진 *</th>
							<td scope="col" colspan="3">
								<div class="container">
									<input type="file" id="fundImg" name="files" multiple="multiple" title="첨부파일" accept="image/*"/>
								</div>
								
								<div id="fundSlide" class="container">
								
								</div>
							</td>
						</tr>
						
					</tbody>				
				</table>
				<div class="d-grid justify-content-end">
				<input type="submit" class="btn btn-primary" value="작성"/>
				</div>
			</div>
			
		</form>
	</section>

	<%@include file="../include/footer.jsp" %>

	<script>
	var sel_files = [];
	var slideIndex = 1;
	
	$(document).ready(function() {
		$('#fundImg').on("change", handleImgsFilesSelect);
		$('input[name=fundCode]').click(function() {
			if($('input[name=fundCode]:checked').val() == 'A001') {
				$('.rent-info').css('display', '');
			} else {
				$('.rent-info').css('display', 'none');
			}
			
		})
	});
	
	function handleImgsFilesSelect(e) {
		$("#fundSlide").children().remove();
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var length = filesArr.length;
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var img_html = 
				"<div name='mySlides' class='mySlides'>" +
				"	<img src=\'"+e.target.result+"\' style='width:100%; height:500px;'>" +
				"</div>";
				$('#fundSlide').append(img_html);
				showSlides(slideIndex);
			}
			reader.readAsDataURL(f);
		})
		
		$('#fundSlide').append(
			"<a class='prev' onclick='plusSlides(-1)'>＜</a>" + 
			"<a class='next' onclick='plusSlides(1)'>＞</a>"
		);
	}
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	 slides[slideIndex-1].style.display = "block";  
	}
	
	var toolbar = [
	    // 글자 크기 설정
	    ['fontsize', ['fontsize']],
	    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	    // 글자색
	    ['color', ['forecolor','color']],
	    // 글머리 기호, 번호매기기, 문단정렬
	    ['para', ['ul', 'ol', 'paragraph']],
	    // 줄간격
	    ['height', ['height']],
	  ];

	var setting = {
	        height : 300,
	        minHeight : null,
	        maxHeight : null,
	        focus : true,
	        lang : 'ko-KR',
	        toolbar : toolbar
	};
	
	$('.summernote').summernote(setting);
	
	$(function () {
         $("#fund_sdate, #fund_edate").datepicker();
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
     
     function inputNumberFormat(obj) {
         obj.value = comma(uncomma(obj.value));
     }

     function comma(str) {
         str = String(str);
         return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
     }

     function uncomma(str) {
         str = String(str);
         return str.replace(/[^\d]+/g, '');
     }
     
     function inNumber(){
         if(event.keyCode<48 || event.keyCode>57){
            event.returnValue=false;
         }
	}
     
     function goPopup(){
 		//카카오 지도 발생
         new daum.Postcode({
             oncomplete: function(data) { //선택시 입력값 세팅
             	console.log(data);
                 document.getElementById("fund_zip").value = data.zonecode; // 주소 넣기
                 document.getElementById("fund_add1").value = data.address; // 주소 넣기
                 document.getElementById("fund_add2").focus(); //상세입력 포커싱
             }
         }).open();
 	}
	
	// 입력값 체크
	function validCheck(){
		var sdate = $.trim($("input[name=sdate]").val());
		var edate = $.trim($("input[name=edate]").val());
		var achieve = $.trim($("input[name=achieve]").val());
		var one_price = $.trim($("input[name=one_price]").val());
		var fundCode = $("input[name=fundCode]:checked").val();
		var fund_zip = $.trim($("input[name=fund_zip]").val());
		var fund_add1 = $.trim($("input[name=fund_add1]").val());
		var place_tel1 = $("#place_tel1 option:selected").val();
		var place_tel2 = $.trim($("input[name=place_tel2]").val());
		var place_tel3 = $.trim($("input[name=place_tel3]").val());
		var fund_title = $.trim($("input[name=fund_title]").val());
		var fund_content = $.trim($("textarea[name=fund_content]").val());
		var files = $("#fundImg").val();
		
// 		console.log("sdate : " + sdate);
// 		console.log("edate : " + edate);
// 		console.log("achieve : " + achieve);
// 		console.log("one_price : " + one_price);
// 		console.log("fundCode : " + fundCode);
// 		console.log("fund_zip : " + fund_zip);
// 		console.log("fund_add1 : " + fund_add1);
// 		console.log("place_tel1 : " + place_tel1);
// 		console.log("place_tel2 : " + place_tel2);
// 		console.log("place_tel3 : " + place_tel3);
// 		console.log("fund_title : " + fund_title);
// 		console.log("fund_content : " + fund_content);
// 		console.log("files : " + files);
		
		if(sdate == ''){
			alert("시작일을 입력해주세요");
			return false;
		}
		if(edate == ''){
			alert("마감일을 입력해주세요");
			return false;
		}
		if(achieve == ''){
			alert("펀딩목표 금액액을 입력해주세요");
			return false;
		}
		if(one_price == ''){
			alert("1인당 펀딩금액을 입력해주세요");
			return false;
		}
		if(!fundCode){
			alert("펀딩종류를 선택해주세요");
			return false;
		}
		if(fundCode == 'A001' && fund_zip == ''){
			alert("우편번호를 입력해주세요");
			return false;
		}
		if(fundCode == 'A001' && fund_add1 == ''){
			alert("주소를 입력해주세요");
			return false;
		}
		if(fundCode == 'A001' && (place_tel1 == '' || place_tel2 == '' || place_tel3 == '')){
			alert("대관장소 연락처를 전부 입력해주세요");
			return false;
		}
		if(fund_title == ''){
			alert("제목을 입력해주세요");
			return false;
		}
		if(fund_content == ''){
			alert("내용을 입력해주세요");
			return false;
		}
		if(files == ''){
			alert("예시사진을 한장 이상 첨부해주세요");
			return false;
		}
		return true;
	}
	
	
	</script>
</body>
</html>