<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
    <title>KIXIV - 세상의 모든 사진</title>
    <meta charset="utf-8">
	<%@include file="include/option.jsp" %>
	<style>
	 a{
	 	text-decoration : none;
	 	color : black;
	 }
	</style>
</head>

<body>
	<%@include file="include/header.jsp" %>

	<!-- Start Service -->


	<section class="container overflow-hidden py-5">
	<h1 class="text-dark h1" style="text-align: left;">팔로우한 목록</h1>
   		<br />
		<form action="">
			<div class="input-group mb-3">
				<input type="text" name="keyword" class="form-control col-sm-10">
				<div class="input-group-append">
					<button type="button" class="btn btn-outline-secondary">search</button>
				</div>
			</div>
		</form>
		
		<div>
			<!-- 테이블 시작 -->
			<table class="table table-sm table-hover">
				<thead>
					<tr style="font-size:1.2em;">
						<th style="text-align:center; width:8%;" scope="col">No.</th>
						<th style="text-align:center; width:55%;" scope="col">계정</th>
						<th style="text-align:center; width:37%;" scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div style="vertical-align: middle; text-align: center;">
								<div style="position: relative; top: 7px; display: inline-block;">
									1
								</div>
							</div>
						</td>
						<td>
						<div style="display: table-cell; vertical-align: middle;">
							<div style="border-radius: 70%; overflow: hidden;  width: 35px; height: 35px; float:left; margin-right:10px; position: relative; top: 2px;">
								<img class="profile"  style="width: 100%; height: 100%; object-fit: cover;"
								src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile1.uf.tistory.com%2Fimage%2F2127AC475798D9D206F733">
							</div>
							<div style="float:left; position: relative; top: 5px; "><a href="#">Hermione Jean Granger</a></div>
						</div>
						</td>
						<td style="text-align:center;">
						<span> <a style="vertical-align: middle;" idx="${tmp.no }" href="javascript:"
                    class="heart-click heart_icon${tmp.no }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                            fill="red" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
                </span>
						</td>				
					</tr>
					<tr>
						<td >
							<div style="vertical-align: middle; text-align: center;">
								<div style="position: relative; top: 7px; display: inline-block;">
									2
								</div>
							</div>
						</td>
						<td>
							<div style="border-radius: 70%; overflow: hidden;  width: 35px; height: 35px; float:left; margin-right:10px; position: relative; top: 2px; ">
								<img class="profile"  style="width: 100%; height: 100%; object-fit: cover;"
								src="https://mblogthumb-phinf.pstatic.net/MjAxOTExMTNfNTMg/MDAxNTczNjMzMDE0NDY4.zDFRs2CKoLS6YYLHqBmiNtT6C2nlGOALN-m6vWhmiOwg.Ttcb7DJGFnz7WQ9H80Hf2RRIK9wyLG-eBPKG4cOtEXsg.JPEG.minarigirl/1.jpg?type=w800">
							</div>
							<div style="float:left; position: relative; top: 5px; "><a href="#">Harry James Potter</a></div>
						</td>
						<td style="text-align:center;">
						<span> <a style="vertical-align: middle;" idx="${tmp.no }" href="javascript:"
                    class="heart-click heart_icon${tmp.no }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                            fill="red" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
                		</span>
						</td>				
					</tr>
					<tr>
						<td >
							<div style="vertical-align: middle; text-align: center;">
								<div style="position: relative; top: 7px; display: inline-block;">
									3
								</div>
							</div>
						</td>
						<td>
							<div style="border-radius: 70%; overflow: hidden;  width: 35px; height: 35px; float:left; margin-right:10px; position: relative; top: 2px; ">
								<img class="profile"  style="width: 100%; height: 100%; object-fit: cover;"
								src="https://t1.daumcdn.net/liveboard/cineplay/7590df159109423f8c29418eb27ac156.jpg">
							</div>
							<div style="float:left; position: relative; top: 5px; "><a href="#">Ronald Bilius Weasley</a></div>
						</td>
						<td style="text-align:center;">
						<span> <a style="vertical-align: middle;" idx="${tmp.no }" href="javascript:"
                    class="heart-click heart_icon${tmp.no }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                            fill="red" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
                </span>
						</td>				
					</tr>
					<tr>
						<td >
							<div style="vertical-align: middle; text-align: center;">
								<div style="position: relative; top: 7px; display: inline-block;">
									4
								</div>
							</div>
						</td>
						<td>
							<div style="border-radius: 70%; overflow: hidden;  width: 35px; height: 35px; float:left; margin-right:10px; position: relative; top: 2px; ">
								<img class="profile"  style="width: 100%; height: 100%; object-fit: cover;"
								src="https://pds.joins.com/news/component/htmlphoto_mmdata/201707/09/74fe86c9-1d64-40ea-a906-3c9142b60ea7.jpg">
							</div>
							<div style="float:left; position: relative; top: 5px; "><a href="#">Severus Snape</a></div>
						<td style="text-align:center;">
						<span> <a style="vertical-align: middle;" idx="${tmp.no }" href="javascript:"
                    class="heart-click heart_icon${tmp.no }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                            fill="red" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
                </span>
						</td>						
					</tr>
					<tr>
						<td >
							<div style="vertical-align: middle; text-align: center;">
								<div style="position: relative; top: 7px; display: inline-block;">
									5
								</div>
							</div>
						</td>
						<td>
							<div style="border-radius: 70%; overflow: hidden;  width: 35px; height: 35px; float:left; margin-right:10px; position: relative; top: 2px; ">
								<img class="profile"  style="width: 100%; height: 100%; object-fit: cover;"
								src="data:image/jpeg;base64,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">
							</div>
							<div style="float:left; position: relative; top: 5px; "><a href="#">Albus Percival Wulfric Brian Dumbledore</a></div>
						</td>
						<td style="text-align:center;">
						<span> <a style="vertical-align: middle;" idx="${tmp.no }" href="javascript:"
                    class="heart-click heart_icon${tmp.no }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                            fill="red" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
               </span>
						</td>							
					</tr>
					<tr>
						<td >
							<div style="vertical-align: middle; text-align: center;">
								<div style="position: relative; top: 7px; display: inline-block;">
									6
								</div>
							</div>
						</td>
						<td>
							<div style="border-radius: 70%; overflow: hidden;  width: 35px; height: 35px; float:left; margin-right:10px; position: relative; top: 2px; ">
								<img class="profile"  style="width: 100%; height: 100%; object-fit: cover;"
								src="data:image/jpeg;base64,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">
							</div>
							<div style="float:left; position: relative; top: 5px;"><a href="#">Tom marvolo riddle</a></div>
						</td>
						<td style="text-align:center;">
						<span> <a style="vertical-align: middle;" idx="${tmp.no }" href="javascript:"
                    class="heart-click heart_icon${tmp.no }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                            fill="red" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
                </span>
						</td>					
					</tr>
					<tr>
						<td >
							<div style="vertical-align: middle; text-align: center;">
								<div style="position: relative; top: 7px; display: inline-block;">
									7
								</div>
							</div>
						</td>
						<td>
							<div style="border-radius: 70%; overflow: hidden;  width: 35px; height: 35px; float:left; margin-right:10px; position: relative; top: 2px; ">
								<img class="profile"  style="width: 100%; height: 100%; object-fit: cover;"
								src="https://img.insight.co.kr/static/2019/01/08/700/iqx533b12l78l34erexa.jpg">
							</div>
							<div style="float:left; position: relative; top: 5px; "><a href="#">Draco Lucius Malfoy</a></div>
						</td>
						<td style="text-align:center;">
						<span> <a style="vertical-align: middle;" idx="${tmp.no }" href="javascript:"
                    class="heart-click heart_icon${tmp.no }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                            fill="red" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
                </span>
						</td>							
					</tr>
					<tr>
						<td >
							<div style="vertical-align: middle; text-align: center;">
								<div style="position: relative; top: 7px; display: inline-block;">
									8
								</div>
							</div>
						</td>
						<td>
							<div style="border-radius: 70%; overflow: hidden;  width: 35px; height: 35px; float:left; margin-right:10px; position: relative; top: 2px; ">
								<img class="profile"  style="width: 100%; height: 100%; object-fit: cover;"
								src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FWKDmE%2FbtqD2G4Mdrv%2Fy3mesiV1nhP3RrFmBPBev1%2Fimg.jpg">
							</div>
							<div style="float:left; position: relative; top: 5px; "><a href="#">Dobby</a></div>
						</td>
						<td style="text-align:center;">
						<span> <a style="vertical-align: middle;" idx="${tmp.no }" href="javascript:"
                    class="heart-click heart_icon${tmp.no }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                            fill="red" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
                </span>
						</td>							
					</tr>
					<tr>
						<td >
							<div style="vertical-align: middle; text-align: center;">
								<div style="position: relative; top: 7px; display: inline-block;">
									9
								</div>
							</div>
						</td>
						<td>
							<div style="border-radius: 70%; overflow: hidden;  width: 35px; height: 35px; float:left; margin-right:10px; position: relative; top: 2px; ">
								<img class="profile"  style="width: 100%; height: 100%; object-fit: cover;"
								src="http://file2.instiz.net/data/cached_img/upload/2014110320/f8235bc144785feda4167a7b32aea9d8.png">
							</div>
							<div style="float:left; position: relative; top: 5px; "><a href="#">Rita Skeeter</a></div>
						</td>
						<td style="text-align:center;">
						<span> <a style="vertical-align: middle;" idx="${tmp.no }" href="javascript:"
                    class="heart-click heart_icon${tmp.no }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                            fill="red" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
                </span>
						</td>							
					</tr>
					<tr>
						<td >
							<div style="vertical-align: middle; text-align: center;">
								<div style="position: relative; top: 7px; display: inline-block;">
									10
								</div>
							</div>
						</td>
						<td>
							<div style="border-radius: 70%; overflow: hidden;  width: 35px; height: 35px; float:left; margin-right:10px; position: relative; top: 2px; ">
								<img class="profile"  style="width: 100%; height: 100%; object-fit: cover;"
								src="https://i.pinimg.com/236x/fd/59/2e/fd592e3011e9b91b245c724f9ca42b07.jpg">
							</div>
							<div style="float:left; position: relative; top: 5px; "><a href="#">Bellatrix Lestrange</a></div>
						</td>
						<td style="text-align:center;">
						<span> <a style="vertical-align: middle;" idx="${tmp.no }" href="javascript:"
                    class="heart-click heart_icon${tmp.no }"><svg
                            xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                            fill="red" class="bi bi-suit-heart-fill"
                            viewBox="0 0 16 16">
                                  <path
                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                                </svg></a>
                </span>
						</td>							
					</tr>
				</tbody>				
			</table>
		</div>
		
		
		<!-- 페이징 시작 -->
		<div class="col-md-offset-3">
			<ul class="pagination justify-content-center">
				<c:if test="true">
					<li class="page-item disabled">
						<a class="page-link" href="">이전</a>
					</li>
				</c:if>

				<c:forEach begin="1" end="10" var="idx">
					<li class="page-item"><a class="page-link" href="">${idx}</a></li>
				</c:forEach>

				<c:if test="true">
					<li class="page-item">
						<a class="page-link" href="">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
	</section>
	<!-- End Service -->

	 <%@include file="include/footer.jsp" %>

	<script>
		$(window).load(function() {
			// init Isotope
			var $projects = $('.projects').isotope({
				itemSelector : '.project',
				layoutMode : 'fitRows'
			});
			$(".filter-btn").click(function() {
				var data_filter = $(this).attr("data-filter");
				$projects.isotope({
					filter : data_filter
				});
				$(".filter-btn").removeClass("active");
				$(".filter-btn").removeClass("shadow");
				$(this).addClass("active");
				$(this).addClass("shadow");
				return false;
			});
		});
	</script>

</body>
</html>