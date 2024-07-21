	<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
List<List> alist = (List<List>)session.getAttribute("alist");
List<String> dlist = alist.get(0);
List<String> ulist = alist.get(1);
List<String> glist = alist.get(2);
List<String> fdlist = alist.get(3);
List<String> cclist = alist.get(4);
List<String> taglist = alist.get(5);
List<String> tCntlist = alist.get(6);
List<String> taglistRankList = alist.get(7);
List<String> tCntRankList = alist.get(8);
List<String> userRankList = alist.get(9);
List<String> userRankCntList = alist.get(10);
List<String> newUserRank = alist.get(11);
List<String> newUserRankList = alist.get(12);
%> 
<!DOCTYPE HTML>
<head>
<title>KIXIV - 세상의 모든 사진</title>
<meta charset="utf-8">
<%@include file="../include/optionImg.jsp" %>
<%@include file="../include/option.jsp" %>

<!-- tui chart 생성 -->
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
<!-- tui chart 여기까지 -->


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
				alert("성공")
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
</head>

<body>
	<!-- Header -->
	<%@include file="../include/header.jsp" %>
	<!-- Close Header -->
	
	<div class="site-section" data-aos="fade">
		<div class="container-fluid">
		
			<div style="display: flex; align-items: center;justify-content : center;">
				<div>
						<c:choose>
								<c:when test="${userVO.profile_img eq ''}">
									<button class="btn_profile" id="btn_img" style="background-image: url(imgProfileUpload/default.svg);border:0;outline:0;"></button>
								</c:when>
								<c:otherwise>
									<button class="btn_profile" id="btn_img" style="background-image: url(${userVO.profile_img});border:0;outline:0;"></button>
								</c:otherwise>
						</c:choose>				
					<form id="frm" name="frm" method="post" enctype="multipart/form-data">
						<input type="file" name="file" style="display:none"/>
					</form>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div>
					<h2>${userVO.nickname}</h2>
					<h4>${userVO.email}</h4>
					<button class="flower" onclick="javascript:location.href='/user/userList'">회원정보관리</button>							
					<button class="flower" onclick="javascript:location.href='/refundList'">환불관리</button>							
				</div>
			</div>
			
			<div>
				<h1></h1>
				<hr/>
			</div>
			<div>
				<div id="chart-sign" style="margin-left: 30%; margin-top: 60px;" ></div>
				<div id="chart-fund" style="margin-left: 30%; margin-top: 60px;"></div>
				<div id="chart-tag" style="margin-left: 5%; margin-top: 60px;"></div>
				<div id="chart-tagRank" style="margin-left: 25%; margin-top: 60px;"></div>
				<div id="chart-likey" style="margin-left: 30%; margin-top: 60px;"></div>
				<div id="chart-newlikey" style="margin-left: 30%; margin-top: 60px;"></div>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp" %>
	<%@include file="../include/footer_script.jsp" %>
	
<script>
 	  $(function(){
		const el = document.getElementById('chart-sign');
	      const data = {
	        categories: [
    	<%	
    	for(int i=0;i<dlist.size();i++){
    		out.print("'" + dlist.get(i)+ "월"  +  "',");
    	}
    	%>
	        ],
	        series: [
	          {
	            name: '일반 회원 가입',
	            data: [
         <%	
         for(int i=0;i<ulist.size();i++){
         	out.print(ulist.get(i) + ",");
         }
         %>      		            	
	            ],
	          },
	          {
	            name: '갤러리 회원 가입',
	            data: [
         	<%	
             for(int i=0;i<glist.size();i++){
             	out.print(glist.get(i) + ",");
             }
             %>	            	
	            ],
	          },
	        ],
	      };
	      const options = {
	        chart: { title: '1년 가입자 현황', width: 900, height: 400 },
	        xAxis: { pointOnColumn: false, title: { text: 'Month' } },
	        yAxis: { title: '가입자 (수)' },
	        series: { showDot: true, dataLabels: { visible: true, offsetY: 10 } },
	      };
	      const chart = toastui.Chart.areaChart({ el, data, options });  
	}); 
 	  
 	  
 	  
 	  
	 $(function(){
	 const el = document.getElementById('chart-fund');
     const data = {
       categories: [
           <%	
           for(int i=0;i<fdlist.size();i++){
        	   out.print("'" + fdlist.get(i)+ "월"  +  "',");
           }
           %> 
       ],
       series: [
         {
           name: '등록 된 펀딩 글 수',
           data: [
        	   <%	
               for(int i=0;i<cclist.size();i++){
               	out.print(cclist.get(i) + ",");
               }
               %> 
        	   ],
         },
        
       ],
     };
     const options = {
       chart: { title: '1년간 등록된 펀딩 수 ', width: 900, height: 400 },
       xAxis: { pointOnColumn: false, title: { text: 'Month' } },
       yAxis: { title: '갯수(개)' },
     };

     const chart = toastui.Chart.areaChart({ el, data, options });
	}); 
//  	data: [out.print(tCntlist.get(i));]} 
	   $(function(){
	      const el = document.getElementById('chart-tag');
	      const data = {
	        categories: [
	        	  <%	
	              for(int i=0;i<taglist.size();i++){
	           	   out.print("'" + taglist.get(i)+ "',");
	              }
	              %> 
	        	
	        ],
	        series: [
	          {
	            name: '태그들',
	            data: [
	         	   <%	
	               for(int i=0;i<tCntlist.size();i++){
	               	out.print(tCntlist.get(i) + ",");
	               }
	               %> 
	            ],
	          },
	        ],
	      };
	      const options = {
	        chart: { title: '태그 사용률', width: 1500, height: 600 },
	      };

	      const chart = toastui.Chart.columnChart({ el, data, options });
	    
	});
	 
	 
	<%--  $(function(){
	      const el = document.getElementById('chart-tag');
	      const data = {
	        categories: [
        	  <%	
              for(int i=0;i<fdlist.size();i++){
           	   out.print("'" + taglist.get(i)+"',");
              }
              %> 
	        ],
	        series: [
		        <%
		          for(int i=0;i<taglist.size();i++){
		         	 out.print("{name: '"+taglist.get(i)+"', data:["+ tCntlist.get(i)+ "], },");
		          }
		        %> 
	        ],
	      };
	      const options = {
	        chart: { title: 'Monthly Revenue', width: 900, height: 400 },
	      };

	      const chart = toastui.Chart.columnChart({ el, data, options });
	}); --%>
    

	$(function(){
      //태크 선호도
		const el = document.getElementById('chart-tagRank');
	      const data = {
	        categories: ['태그선호도'],
	        series: [
	        <%
	          for(int i=0;i<taglistRankList.size();i++){
	         	 out.print("{name: '"+taglistRankList.get(i)+"', data:"+ tCntRankList.get(i)+ ", },");
	          }
	        %> 

	        ],
	      };
	      const theme = {
	        series: {
	          dataLabels: {
	            fontFamily: 'monaco',
	            useSeriesColor: true,
	            lineWidth: 2,
	            textStrokeColor: '#ffffff',
	            shadowColor: '#ffffff',
	            shadowBlur: 4,
	            callout: {
	              lineWidth: 3,
	              lineColor: '#f44336',
	              useSeriesColor: false,
	            },
	            pieSeriesName: {
	              useSeriesColor: false,
	              color: '#f44336',
	              fontFamily: 'fantasy',
	              fontSize: 13,
	              textBubble: {
	                visible: true,
	                paddingX: 1,
	                paddingY: 1,
	                backgroundColor: 'rgba(158, 158, 158, 0.3)',
	                shadowOffsetX: 0,
	                shadowOffsetY: 0,
	                shadowBlur: 0,
	                shadowColor: 'rgba(0, 0, 0, 0)',
	              },
	            },
	          },
	        },
	      };

	      const options = {
	        chart: { title: '태그 선호도', width: 800, height: 700 },
	        series: {
	          dataLabels: {
	            visible: true,
	            pieSeriesName: { visible: true, anchor: 'outer' },
	          },
	        },
	        theme,
	      };

	      const chart = toastui.Chart.pieChart({ el, data, options });
	});
	
	
	$(function(){
      //차트2
		const el = document.getElementById('chart-newlikey');
	      const data = {
	        categories: ['유저 RANK TOP5'],
	        series: [
		        <%
		          for(int i=0;i<userRankList.size();i++){
		         	 out.print("{name: '"+userRankList.get(i)+"', data:"+ userRankCntList.get(i)+ ", },");
		          }
		        %> 
	        ],
	      };
	      const theme = {
	        series: {
	          dataLabels: {
	            fontFamily: 'monaco',
	            useSeriesColor: true,
	            lineWidth: 2,
	            textStrokeColor: '#ffffff',
	            shadowColor: '#ffffff',
	            shadowBlur: 4,
	            callout: {
	              lineWidth: 3,
	              lineColor: '#f44336',
	              useSeriesColor: false,
	            },
	            pieSeriesName: {
	              useSeriesColor: false,
	              color: '#f44336',
	              fontFamily: 'fantasy',
	              fontSize: 13,
	              textBubble: {
	                visible: true,
	                paddingX: 1,
	                paddingY: 1,
	                backgroundColor: 'rgba(158, 158, 158, 0.3)',
	                shadowOffsetX: 0,
	                shadowOffsetY: 0,
	                shadowBlur: 0,
	                shadowColor: 'rgba(0, 0, 0, 0)',
	              },
	            },
	          },
	        },
	      };

	      const options = {
	        chart: { title: '유저 RANK TOP5', width: 600, height: 500 },
	        series: {
	          dataLabels: {
	            visible: true,
	            pieSeriesName: { visible: true, anchor: 'outer' },
	          },
	        },
	        theme,
	      };

	      const chart = toastui.Chart.pieChart({ el, data, options });
		});
	
    
	$(function(){
      //차트2
      const el = document.getElementById('chart-newlikey');
      const data = {
        categories: ['신규유저 RANK TOP5'],
        series: [
	        <%
	          for(int i=0;i<newUserRankList.size();i++){
	         	 out.print("{name: '"+newUserRankList.get(i)+"', data:"+ newUserRank.get(i)+ ", },");
	          }
	        %> 
        ],
      };
      const theme = {
        series: {
          dataLabels: {
            fontFamily: 'monaco',
            useSeriesColor: true,
            lineWidth: 2,
            textStrokeColor: '#ffffff',
            shadowColor: '#ffffff',
            shadowBlur: 4,
            callout: {
              lineWidth: 3,
              lineColor: '#f44336',
              useSeriesColor: false,
            },
            pieSeriesName: {
              useSeriesColor: false,
              color: '#f44336',
              fontFamily: 'fantasy',
              fontSize: 13,
              textBubble: {
                visible: true,
                paddingX: 1,
                paddingY: 1,
                backgroundColor: 'rgba(158, 158, 158, 0.3)',
                shadowOffsetX: 0,
                shadowOffsetY: 0,
                shadowBlur: 0,
                shadowColor: 'rgba(0, 0, 0, 0)',
              },
            },
          },
        },
      };

      const options = {
        chart: { title: '신규유저 RANK TOP5', width: 600, height: 500 },
        series: {
          dataLabels: {
            visible: true,
            pieSeriesName: { visible: true, anchor: 'outer' },
          },
        },
        theme,
      };

      const chart = toastui.Chart.pieChart({ el, data, options });
	});
</script>	
</body>
</html>