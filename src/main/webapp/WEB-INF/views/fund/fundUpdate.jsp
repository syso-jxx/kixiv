<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
		<h6 class="text-dark h1" style="text-align:right; font-size: 15px;">* 표시 된 항목만 수정 가능합니다.</h6>
		<br/>
		<!-- jstl 선언부 시작 -->
		<c:set var="sdate"><fmt:formatDate value="${fund.fund_sdate}" pattern="yyyy/MM/dd"/></c:set>
		<c:set var="edate"><fmt:formatDate value="${fund.fund_edate}" pattern="yyyy/MM/dd"/></c:set>
		<c:set var="today"><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy/MM/dd"/></c:set>
		
		<fmt:parseDate value="${today}" var="todayPlanDate" pattern="yyyy/MM/dd"/>
		<fmt:parseNumber value="${todayPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="todayDate"></fmt:parseNumber>
		<fmt:parseDate value="${edate}" var="endPlanDate" pattern="yyyy/MM/dd"/>
		<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
		
		<c:set var="total"><fmt:formatNumber value="${fund.total}" pattern="#,###"/></c:set>
		<c:set var="one_price"><fmt:formatNumber value="${fund.one_price}" pattern="#,###"/></c:set>
		<c:set var="achieve"><fmt:formatNumber value="${fund.fund_achieve}" pattern="#,###"/></c:set>
		<!-- jstl 선언부 끝 -->
		<form method="post" enctype="multipart/form-data" onsubmit="return validCheck();">
			<div>
				<!-- 테이블 시작 -->
				<table class="table table-sm">
					<tbody>
						<tr>
							<th scope="col">펀딩기간</th>
							<td scope="col" colspan="3" style="padding:1px 15px;">
							<input type="text" name="sdate" id="fund_sdate" style="width: 200px; text-align: center;" placeholder="시작일 " value="${sdate}" readonly/> 
							~
							<input type="text" name="edate" id="fund_edate" style="width: 200px; text-align: center;" placeholder="마감일 " value="${edate}" readonly/>
							</td>
						</tr>
						<tr>
							<th scope="col">펀딩목표액</th>
							<td scope="col" style="padding:1px 15px;">
								<input type="text" name="achieve" id="achieve" style="width: 200px; text-align: center;" onkeyup="inputNumberFormat(this)" onkeypress="inNumber();" value="${achieve}" readonly /> &nbsp;&nbsp;원
							</td>
							<th scope="col">1인당 펀딩금액</th>
							<td scope="col" style="padding:1px 15px;">
								<input type="text" name="one_price" id="one_price" style="width: 200px; text-align: center;" onkeyup="inputNumberFormat(this)" onkeypress="inNumber();" value="${one_price}" readonly /> &nbsp;&nbsp;원
							</td>
						</tr>
						<tr>
							<th scope="col">펀딩종류</th>
							<td scope="col" colspan="3" style="padding:1px 15px;">
								<div style="display: block;">
									<c:forEach var="codeList" items="${codeList}">
										<div style="float:left; display: block; margin-top:4px;">
											<input type="radio" name="fundCode" id="${codeList.fund_code}" value="${codeList.fund_code}" style="margin-left: 20px;" onclick="return(false)"/> ${codeList.code_name}
										</div>
									</c:forEach>
								</div>
								<script type="text/javascript">
									$("input:radio[name='fundCode']:radio[value='${fund.fund_code}']").prop('checked', true); 
								</script>
							</td>
						</tr>
						
						<tr class="rent-info" style="display:none;">
							<th scope="col">우편번호 *</th>
							<td scope="col" colspan="3" style="padding:1px 15px;">
								<input type="text" name="fund_zip" id="fund_zip" style="width: 200px;" readonly value="${fund.fund_zip}"/>
								<button type="button" class="btn btn-primary" onclick="goPopup()" style="line-height: 0.9; vertical-align: top; text-align: center">검색</button>
							</td>
						</tr>
						
						<tr class="rent-info" style="display:none;">
							<th scope="col">주소 *</th>
							<td scope="col" style="padding:1px 15px;">
								<input type="text" name="fund_add1" id="fund_add1" style="width: 100%;" readonly value="${fund.fund_add1}"/>
							</td>
							<th scope="col">상세주소 *</th>
							<td scope="col" style="padding:1px 15px;">
								<input type="text" name="fund_add2" id="fund_add2" style="width: 100%;" value="${fund.fund_add2}"/> 
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
								<script type="text/javascript">
									$("#place_tel1").val("${place_tel1}").prop("selected", true);
								</script>
								<input type="text" name="place_tel2" id="place_tel2" style="width: 155px;" value="${place_tel2}"/> -
								<input type="text" name="place_tel3" id="place_tel3" style="width: 155px;" value="${place_tel3}"/>
							</td>
						</tr>
						<tr>
							<th scope="col">제목 *</th>
							<td scope="col" colspan="3" style="padding:1px 15px;"><input type="text" name="fund_title" id="title" style="width: 100%;" value="${fund.fund_title}"/></td>
						</tr>
						<tr>
							<th scope="col" style="width:200px; vertical-align: middle;">내용 *</th>
							<td scope="col" colspan="3">
								<div class="container">
								  <textarea class="summernote" name="fund_content">${fund.fund_content}</textarea>    
								</div>
							</td>
						</tr>
						
						<tr>
							<th scope="col" style="width:200px; vertical-align: middle;">작가의사진 *</th>
							<td scope="col" colspan="3">
								<div class="container">
									<input type="file" id="fundImg" name="files" multiple="multiple" title="첨부파일" accept="image/*"/>
								</div>
								<br/>
								<div id="fundSlide" class="container">
									<c:forEach var="path" items="${pathList}">
										<div name="mySlides" class='mySlides'>
											<img src="${path}" style='width:100%; height:500px;'>
										</div>
									</c:forEach>
									<a class='prev' onclick='plusSlides(-1)'>＜</a> 
									<a class='next' onclick='plusSlides(1)'>＞</a>
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
	currentSlide(1);
	
	var sel_files = [];
	var slideIndex = 1;
	
	$(document).ready(function() {
		$('#fundImg').on("change", handleImgsFilesSelect);
		
		if($('input[name=fundCode]:checked').val() == 'A001') {
			$('.rent-info').css('display', '');
		} else {
			$('.rent-info').css('display', 'none');
		}
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
		var fundCode = $("input[name=fundCode]:checked").val();
		var fund_zip = $.trim($("input[name=fund_zip]").val());
		var fund_add1 = $.trim($("input[name=fund_add1]").val());
		var place_tel1 = $("#place_tel1 option:selected").val();
		var place_tel2 = $.trim($("input[name=place_tel2]").val());
		var place_tel3 = $.trim($("input[name=place_tel3]").val());
		var fund_title = $.trim($("input[name=fund_title]").val());
		var fund_content = $.trim($("textarea[name=fund_content]").val());
		
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
		
		return true;
	}
	
	
	</script>
</body>
</html>