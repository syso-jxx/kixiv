<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String boardId = request.getParameter("board_id")==null?"1":request.getParameter("board_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 게시글</title>
<script src="/resources/asset/js/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@include file="../include/optionImg.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style>
	.btn_menu{
		width: 50px; 
		height: 50px;
		border-radius: 50%;
		background-size: cover;
	}
	
	.btn_menus{
		width: 50px; 
		height: 50px;
		border-radius: 50%;
		background-size: cover;
	}
	
	.imgCss{
		width: 690px;
		height: 450px;
		
	}
	
	a { 
		color: #3d7699; 
		text-decoration:none;
	}
	
	.img_down{
	    -webkit-text-size-adjust: 100%;
	    -webkit-font-smoothing: antialiased;
	    font-kerning: normal;
	    font-family: inherit;
	    font-size: 100%;
	    line-height: 1.15;
	    overflow: visible;
	    text-transform: none;
	    -webkit-appearance: button;
	    width: 32px;
	    height: 32px;
	    margin: 0;
	    padding: 0;
	    cursor: pointer;
	    border: 1px solid transparent;
	    background: transparent;
	    color: inherit;
	}
	.toggleBtn{
		-webkit-text-size-adjust: 100%;
	    -webkit-font-smoothing: antialiased;
	    font-kerning: normal;
	    font-family: inherit;
	    font-size: 100%;
	    line-height: 1.15;
	    overflow: visible;
	    text-transform: none;
	    -webkit-appearance: button;
	    width: 32px;
	    height: 32px;
	    margin: 0;
	    padding: 0;
	    cursor: pointer;
	    border: 1px solid transparent;
	    background: transparent;
	    color: inherit;
	}
    
/*     .btn-out{
    	color:rgb(0, 0, 0);
    }
    .btn-heart{
    	color:rgb(255, 64, 96);
    }
    .btn-outs{
    	color:rgb(0, 0, 0);
    }
    .btn-hearts{
    	color:rgb(255, 64, 96);
    } */
    
    .form-control{
    	color: black;
    }
	.contextmenu {
	  display: none;
	  position: absolute;
	  width: 200px;
	  margin: 0;
	  padding: 0;
	  background: #FFFFFF;
	  border-radius: 5px;
	  list-style: none;
	  box-shadow:
	    0 15px 35px rgba(50,50,90,0.1),
	    0 5px 15px rgba(0,0,0,0.07);
	  overflow: hidden;
	  z-index: 999999;
	}
	
	.contextmenu li {
	  border-left: 3px solid transparent;
	  transition: ease .2s;
	}
	
	.contextmenu li a {
	  display: block;
	  padding: 10px;
	  color: #B0BEC5;
	  text-decoration: none;
	  transition: ease .2s;
	}
	
	.contextmenu li:hover {
	  background: #CE93D8;
	  border-left: 3px solid #9C27B0;
	}
	
	.contextmenu li:hover a {
	  color: #FFFFFF;
	}
	.reply_list_profileImage{
		width: 50px;
		height: 50px;
		border-radius: 50%;
		background-size: cover;
		margin-left: 30px;
		
	}
	.rereply-magin{
		margin-top: 10px;
	}
	

</style>
<script>
$(function(){

	
	$(".btn_menu").click(function() {
		 location.href="../userPage?user_id=${userImp.user_id}";

	})
	
	$(".heart-click").click(function() {
        // 게시물 번호(no)를 idx로 전달받아 저장합니다.
        let no = $(this).attr('idx');
		console.log(" 하트 이미지 변경하기 ",no);
		
        console.log("heart-click");
        console.log("heart_icon" + no);
        
        var heartId = "heart_icon" + no;
        
       	
       	//alert($(".heart_icon" + no).children('img').attr('class'));
       	

        // 빈하트를 눌렀을때
//         if($(this).attr('class') == heartId){
        if($(".heart_icon" + no).children('img').attr('class') == "bi bi-suit-heart"){
            console.log("빈하트 클릭" + no);

            $.ajax({
                url : '/saveHeart',
                type : 'get',
                data : {
                    no : no,
                },
                success : function(pto, request, settings) {
                    //페이지 새로고침
                    //document.location.reload(true);

                    let heart = pto;
                    $("#all-Likey" + 	no).text(pto);
                    // 페이지, 모달창에 하트수 갱신
	                // $('#m_heart'+no).text(heart); 
                    //$('#heart'+no).text(heart);
                    console.log("하트추가 성공");
                },
                error : function() {
                    alert('서버 에러');
                }
            });
            console.log("꽉찬하트로 바껴라!");

            // 꽉찬하트로 바꾸기
            $(".heart_icon" + no).html('<img alt="" src="/resources/asset/images/her2.png" width="25px" height="25px" class="bi bi-suit-heart-fill">');
            $(".heart_icons" + no).html('<img alt="" src="/resources/asset/images/her2.png" width="25px" height="25px" class="bi bi-suit-heart-fill" style="z-index: 2; right: 35px; top:10px; position: absolute;">');
            $("#all-Likey").val(heart);
        // 꽉찬 하트를 눌렀을 때
        }else if($(".heart_icon" + no).children('img').attr('class') == "bi bi-suit-heart-fill"){
            console.log("꽉찬하트 클릭" + no);

            $.ajax({
                url : '/removeHeart',
                type : 'get',
                data : {
                    no : no,
                },
                success : function(pto) {
                    //페이지 새로고침
                    //document.location.reload(true);

                    let heart = pto.heart;
                    $("#all-Likey" + no).text(pto);
                    // 페이지, 모달창에 하트수 갱신
                    // $('#m_heart'+no).text(heart);
                    // $('#heart'+no).text(heart);
                    console.log("하트삭제 성공");
                },
                error : function() {
                    alert('서버 에러');
                }
            });
            console.log("빈하트로 바껴라!");
			
            // 빈하트로 바꾸기
            $(".heart_icon" + no).html('<img alt="" src="/resources/asset/images/her1.png" width="25px" height="25px" class="bi bi-suit-heart">');
            $(".heart_icons" + no).html('<img alt="" src="/resources/asset/images/her1.png" width="25px" height="25px" class="bi bi-suit-heart" style="z-index: 2; right: 35px; top:10px; position: absolute;">');
          
    	}
        
    });


    // 로그인 안한 상태에서 하트를 클릭하면 로그인해야한다는 알림창이 뜹니다.
    // (로그인한 상태인 하트의 <a></a> class명: heart-notlogin)
    $(".heart-notlogin").unbind('click');
    $(".heart-notlogin ").click(function() {
        alert('로그인 하셔야 하트를 누를수 있습니다!');
    });
	
    $('.toggleBtn').click(function(e){
    	
        //Get window size:
        var winWidth = $(document).width();
        var winHeight = $(document).height();
        //Get pointer position:
        var posX = e.pageX;
        var posY = e.pageY;
        //Get contextmenu size:
        var menuWidth = $(".contextmenu").width();
        var menuHeight = $(".contextmenu").height();
        //Security margin:
        var secMargin = 10;
        //Prevent page overflow:
        if(posX + menuWidth + secMargin >= winWidth
        && posY + menuHeight + secMargin >= winHeight){
          //Case 1: right-bottom overflow:
          posLeft = posX - menuWidth - secMargin + "px";
          posTop = posY - menuHeight - secMargin + "px";
        }
        else if(posX + menuWidth + secMargin >= winWidth){
          //Case 2: right overflow:
          posLeft = posX - menuWidth - secMargin + "px";
          posTop = posY + secMargin + "px";
        }
        else if(posY + menuHeight + secMargin >= winHeight){
          //Case 3: bottom overflow:
          posLeft = posX + secMargin + "px";
          posTop = posY - menuHeight - secMargin + "px";
        }
        else {
          //Case 4: default values:
          posLeft = posX + secMargin + "px";
          posTop = posY + secMargin + "px";
        };
        //Display contextmenu:
        $(".contextmenu").css({
          "left": posLeft,
          "top": posTop
        }).show();
        //Prevent browser default contextmenu.
        return false;
      });
    
      //Hide contextmenu:
      $(document).click(function(){
        $(".contextmenu").hide();
      });
    
      
  	$(".img_down").on("click",function(){
  		Swal.fire({
  		  icon: 'warning',
  		  title: '디자인 저작권 안내',
  		  text: 'Kixiv에서 사용되고 있는 모든 이미지의 저작권은 작가에게 있으므로  본 페이지에 사용된 사진 및 모든 이미지와 문구를 무단 도용시 저작권법 위반으로 사전 경고 없이 형사 처벌을 받을 수 있습니다.',
  		  imageWidth: 400,
  		  imageHeight: 200,
  		  imageAlt: 'Custom image',
  		})	
  	
  		var v = $(this).attr('name');
  		window.open('/picture/download?picId='+v);
//   		$.ajax({ 
//   			type: 'post', 
//   			url: '/download',
//   			data: {picId: v},
//   			dataType : 'json' , 
//       		success: function(data) {
//       			  $("#listDiv").html(data); 
//       		} 
//   		});
  	});
  	

	//팔로워  	
    $('#click-follow').click( function() {
		var b_userId = document.getElementById("userId");
		b_userId = b_userId.value;
        if( $(this).html() == '팔로우' ) {
             $.ajax({
                url : '/followIng',
                type : 'get',
                dataType : 'text',
                data : {
                	b_userId : b_userId,
                },
                success : function(data) {
                    console.log("팔로우등록 성공");
                },
                error : function() {
                    alert('서버 에러');
                }
            }); 
                
       	        $(this).html('언팔로우');
       	        $(this).css('color','white');
       	        $(this).attr('class','btn btn-primary');  
 
        }
        else {
             $.ajax({
                url : '/unfollowIng',
                type : 'get',
                dataType : 'text',
                data : {
                	b_userId : b_userId,
                },
                success : function(data) {
                    console.log("언팔로우 성공");
                },
                error : function() {
                    alert('서버 에러');
                }
            }); 
       		    $(this).html('팔로우');
       		    $(this).attr('class','btn btn-outline-light');   
       		    $(this).css({'border-color':'#4232c2', color:'#4232c2'});
		}
	});
    
    //댓글
  	$('.write_reply').click(function () {
		 var cmt_content = $('#input_reply<%=boardId%>').val();
		 var board_id = <%=boardId%>
		 if(cmt_content == ''){
			 Swal.fire({
		 	 icon: 'warning',
			 title: '이런...',
		 	 text: '글을 입력하세요!!',
		})
		 }else{
			 $("#input_reply" + <%=boardId%>).val("");
           	$.ajax({
               url : '/picture_write_reply',
               type : 'post',
               data : {
               		board_id : board_id,
                	cmt_content: cmt_content
                },
                success : function(pto) {
/* 					
                    let reply = pto
                    // 페이지, 모달창에 댓글수 갱신
                    //$('#m_reply'+board_id).text(reply);//
                    $('#reply'+board_id).text(reply); */

                    console.log("댓글 작성 성공");

                    // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
                    ReplyList(board_id);
                },
                error : function() {
                    alert('서버 에러');
                }
            });  
		 
		 }	
		
	});
    
	
 	$(".img-thumbnail").on("click",function(){
  		var v = $(this).attr('name');
  		var picWidth= document.getElementById("picbox"+v).naturalWidth;
  		var picHeight = document.getElementById("picbox"+v).naturalHeight; 
  		if(picWidth < picHeight){
  			$(".look_box").css("display","none");
  	  		$("#index-box"+v).css("display","block");
  	  		$("#picbox"+v).css("margin-left","180px");
  	 		$("#picbox"+v).css("width","390px");
  	  		$("#picbox"+v).css("height ","650px");
  		}else{
  			$(".look_box").css("display","none");
  	  		$("#index-box"+v).css("display","block");
  	  		$("#picbox"+v).css("width","750px");
  	  		$("#picbox"+v).css("height ","480px");
  	  		
  		
  		}
  		
	});
    var firstPicW = document.getElementById("picbox1").naturalWidth;
    var firstPich = document.getElementById("picbox1").naturalHeight;
    $("#index-box1").css("display","block");
    if(firstPicW < firstPich){
    	$("#picbox1").css("margin-left","180px");
		$("#picbox1").css("width","390px");
	  	$("#picbox1").css("height ","650px");
    }else if(firstPicW > firstPich){
    	$("#picbox1").css("width","750px");
  	  	$("#picbox1").css("height","480px");
    }
    
	  	
    
    
	$("#reply_play").on("click",function(){
		var board_id = <%=boardId%>;
		
		$("#reply_play").css("display","none");
		ReplyList(board_id);
		$(".collapse").css("display","block");
	});
	
	
	$("#reply_play").on("click",function(){
		var board_id = <%=boardId%>;
		
		$("#reply_play").css("display","none");
		$("#reply_play_out").css("display","block");
		ReplyList(board_id);
		$(".collapse").css("display","block");
	});
	
	$("#reply_play_out").on("click",function(){
		$(".collapse").css("display","none");
		
		$("#reply_play").css("display","block");
		$("#reply_play_out").css("display","none");
	});
		//$(".write_reply_start")
/* 	    function handleFileSelect(vara) 
	    {
	    	alert(vara.src);
	        //이미지 뷰
	        var img_view = ['<img src="', vara.src, '" class="imgCss" />'].join('');    
	        document.getElementById('list').innerHTML = img_view;   
	    } */
	 
	
    //댓글 AJAX
    const ReplyList = function(board_id) {
        $.ajax({
            url : '/picture_replyList',
            type : 'post',
            data : {
            	board_id : board_id
            },
            success : function(data) {

                console.log("댓글 리스트 가져오기 성공");

                // 댓글 목록을 html로 담기
                let listHtml = "";
                for(const i in data){
                    let cmt_id = data[i].cmt_id; 	//댓글번호
                    console.log(cmt_id);
                    let board_id = data[i].board_id;	//글 번호
                    console.log(board_id);
                    let grp = data[i].grp;		//댓글이 속한 댓글번호
                    console.log(grp);
                    let grps = data[i].grps;	//같은 GRP순서
                    console.log(grps);
                    let grpl = data[i].grpl;	// 댓글인지 답글인지 여부확인
                    console.log(grpl);
                    let nickname = data[i].nickname; //작성자 닉네임
                    console.log(nickname);
                    let cmt_content = data[i].cmt_content; 	//뎃/답글내용
                    console.log(cmt_content);
                    let cmt_date = data[i].cmt_date;  		//작성날짜
                    console.log(cmt_date);
                    let wgap = data[i].wgap;			//경과날짜
                    console.log(wgap);
                    let profile_img = data[i].profile_img;		//프로필사진
                    console.log(profile_img);
                    let user_id = data[i].user_id		//작성자아이디
                    console.log(user_id);
                    
                    
                    console.log(grpl);	// 모댓글일땐 0, 답글일땐 1

                    listHtml += "<div class='row replyrow reply" + cmt_id + "'>";

                    if(cmt_content == " "){		// 삭제된 댓글일때
                        listHtml += "	<div>";
                        listHtml += "		<br/>";
                        listHtml += "		&nbsp;&nbsp;(삭제된 댓글입니다)";
                        listHtml += "	</div>";
                    }else{
                        if(grpl == 0){	// 댓글일때
                            listHtml += "	<br/>";
                            listHtml += "	<br/>";
                            listHtml += "	<br/>";
                            listHtml += "	<div class='col-1'>";
                            listHtml += "		<a href='../userPage?user_id="+user_id+"'>";
                            listHtml += "			<img class='reply_list_profileImage' src=/"+ profile_img +" />";
                            listHtml += "		</a> ";
                            listHtml += "	</div>";
                            listHtml += "	<div class='rereply-content col-8'>";
                            listHtml += "		<div>";
                            listHtml += "			<span>";
                            listHtml += "				<b>"+ nickname +"</b>";
                            listHtml += "			</span>";
                            listHtml += "			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                            listHtml += "			<span>";
                            listHtml += 				cmt_content;
                            listHtml += "			</span>";
                            listHtml += "		</div>";

                            // 현재 로그인 상태일때 답글작성 버튼이 나온다.
                            if("${sessionScope.user.nickname}" != ""){
                                listHtml += "		<div>";
                                // 함수에 게시글번호(bno), 모댓글번호(no), 모댓글 작성자(writer)를 인자로 담아서 넘긴다.
                                // 이때 모댓글 작성자 writer는 string인데 string을 인자에 넣기 위해선''나""로 감싸줘야한다.
                                // 여기선 ''와 ""가 이미 둘다 쓰이고 있는데  href를 감싸고 있는 ''와 겹치지 않는 ""를 \" 처리해서 넣어줬다.
                                listHtml += "			<a href='#' class='write_reply_start' data-bs-toggle='collapse' data-bs-target='#re_reply"+ cmt_id +"' aria-expanded='false' aria-controls='collapseExample'>답글&nbsp;달기</a>";
                                listHtml += "		</div>";
                            }
                            listHtml += "	</div>";

                        }else{	// 답글일때
                            listHtml += "	<div class='col-1'>"
                            listHtml += "	</div>"
                            listHtml += "	<div class='col-1'>";
                            listHtml += "	   	<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-arrow-return-right' viewBox='0 0 16 16'>	";
                            listHtml += "			<path fill-rule='evenodd' d='M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z'/>";
                            listHtml += "	   	</svg>"
                            listHtml += "	   	<a href='../userPage?user_id="+user_id+"'>";
                            listHtml += "			<img class='reply_list_profileImage' name ="+ user_id +" src=/"+ profile_img +" />";
                            listHtml += "		</a> ";
                            listHtml += "	</div>";
                            listHtml += "	<div class='rereply-content"+ cmt_id +" col-7'>";
                            listHtml += "		<div class='rereply-magin'>";
                            listHtml += "			<span>";
                            listHtml += "				<b>"+ nickname +"</b>";
                            listHtml += "			</span>";
                            listHtml += "			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                            listHtml += "			<span>";
                            listHtml += 				cmt_content;
                            listHtml += "			</span>";
                            listHtml += "		</div>";
                            listHtml += "	</div>";
                            listHtml += "	<br/>";
                            listHtml += "	<br/>";
                            listHtml += "	<br/>";
                            
                        }

                        listHtml += "	<div class='col-3 reply-right'>";
                        listHtml += "		<div>";
                        listHtml += 			cmt_date;
                        listHtml += "		</div>";
                        // 책갈피
                        // 현재 로그인 상태이고..
                        if("${sessionScope.user.nickname}" != ""){

                            //현재 사용자가 이 댓글의 작성자일때 삭제 버튼이 나온다.
                            if("${sessionScope.user.nickname}" == nickname){
                                listHtml += "		<div>";
                                // 수정할 댓글의 no를 grpl과 함께 넘긴다. 
                                // 모댓글 수정칸과 답글 수정칸을 화면에 다르게 나타내야하기 때문에 모댓글과 답글을 구분하는 grpl을 함께 넘겨주어야한다.
                                //listHtml += "			<a href='javascript:' no='"+ no +"' grpl='"+ grpl +"' class='reply_modify'>수정</a>";
                                //listHtml += "			&nbsp;|&nbsp;";
                                // 삭제는 no만 넘겨주면 된다.
                                listHtml += "			<a href='javascript:' cmt_id='"+ cmt_id +"' grpl='"+ grpl + "' board_id='"+ board_id +"' grp='"+ grp +"' class='reply_delete'>삭제</a>";
                                listHtml += "		</div>";
                            }
                        }

                        listHtml += "	</div>";
                        // 댓글에 답글달기를 누르면 답글입력란이 나온다.
                        // ---- 답글입력란
                        listHtml += "	<div class='collapse row rereply_write' id='re_reply"+ cmt_id +"'>";
                        listHtml += "		<div class='col-1'>"
                        listHtml += "		</div>"
                        listHtml += "		<div class='col-1'>"
                        listHtml += "			<a href='../userPage?user_id="+user_id+"'>";
                        listHtml += "				<img id='write_reply_profileImage' src='${profile}'/>"
                        listHtml += "			</a> ";
                        listHtml += "		</div>"
                        listHtml += "		<div class='col-7'>"
                        listHtml +=  "  		<input class='w-100 input_rereply_div form-control' id='input_rereply"+ cmt_id +"' type='text' placeholder='댓글입력...' style='color: black;'>"
                        listHtml += "		</div>"
                        listHtml += "		<div class='col-3'>"
                        // 답글달기 버튼이 눌리면 모댓글 번호(no)와 게시물번호(bno)를 함수에 전달한다.

                        // 동적으로 넣은 html태그에서 발생하는 이벤트는 동적으로 처리해줘야한다 !!!!!
                        // 예를들어, 동적으로 넣은 html태그에서 발생하는 click 이벤트는 html태그 안에서 onclick으로 처리하면 안되고, jquery에서 클래스명이나 id값으로 받아서 처리하도록 해야한다.
                        // 아래코드를 보자~~~~
                        // listHtml += "			<button onclick='javascript:WriteReReply("+ no +","+ bno +")' type='button' class='btn btn-success mb-1 write_rereply' >답글&nbsp;달기</button>"
                        // 위 코드는 클릭되어도 값이 넘겨지지 않는다. 값이 undefined가 된다.
                        // 아래코드처럼 짜야한다. click이벤트를 처리하지 않고 데이터(no, bno)만 속성으로 넘겨주도록 작성한다.
                        listHtml += "			<button type='button' class='btn btn-success mb-1 write_rereply' cmt_id='" + cmt_id + "' board_id='" + board_id + "'>답글&nbsp;달기</button>"
                        listHtml += "		</div>";
                        listHtml += "	</div>";
                        // ---- 답글입력란 끝
                    }

                    listHtml += "</div>";


                };

                ///////////// 동적으로 넣어준 html에 대한 이벤트 처리는 같은 함수내에서 다 해줘야한다.
                ///////////// $(document).ready(function(){}); 안에 써주면 안된다.

                // 댓글 리스트 부분에 받아온 댓글 리스트를 넣기
                $(".reply-list"+board_id).html(listHtml);

                // 답글에서 답글달기를 누르면 input란에 "@답글작성자"가 들어간다.
                //$('.write_re_reply_start').on('click', function(){
                //	$('#input_rereply'+ $(this).attr('no')).val("@"+$(this).attr('writer')+" ");
                //});

                //답글을 작성한 후 답글달기 버튼을 눌렀을 때 그 click event를 아래처럼 jquery로 처리한다.
                $('button.btn.btn-success.mb-1.write_rereply').on( 'click', function() {
                    console.log( 'cmt_id', $(this).attr('cmt_id') );
                    console.log( 'board_id', $(this).attr('board_id') );

                    // 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
                    WriteReReply($(this).attr('board_id'), $(this).attr('cmt_id') );
                });

                // 삭제버튼을 클릭했을 때
                $('.reply_delete').on('click', function(){
                    // 댓글 삭제일때
                    if($(this).attr('grpl') == 0){	
                        DeleteReply($(this).attr('cmt_id'), $(this).attr('board_id'));

                    // 답글 삭제일때
                    }else{
                        DeleteReReply($(this).attr('cmt_id'), $(this).attr('board_id'), $(this).attr('grp'));
                    }

                })
            },
            error : function() {
                alert('서버 에러');
            }
        });
    };
 // 답글 달기 버튼 클릭시  실행 - 답글 저장, 댓글 갯수 가져오기
    const WriteReReply = function(board_id,cmt_id) {
        console.log(board_id);
        console.log(cmt_id);
        console.log($("#input_rereply" + cmt_id).val());

        // 댓글 입력란의 내용을 가져온다. 
        // ||"" 를 붙인 이유  => 앞뒤 공백을 제거한다.(띄어쓰기만 입력했을때 댓글작성안되게 처리하기위함)
        let cmt_content = $("#input_rereply" + cmt_id).val();
        cmt_content = cmt_content.trim();


        if(cmt_content == ""){	// 입력된게 없을때
            alert("글을 입력하세요!");
        }else{	
            // 입력란 비우기
            $("#input_rereply" + cmt_id).val("");

            // reply+1 하고 그 값을 가져옴
            $.ajax({
                url : '/picture_write_rereply',
                type : 'post',
                data : {
                	cmt_id : cmt_id,
                	board_id : board_id,
                	cmt_content: cmt_content
                },
                success : function(pto) {

                    let reply = pto.reply;
                    // 페이지, 모달창에 댓글수 갱신
                    //$('#m_reply'+board_id).text(reply);//
                    $('#reply'+board_id).text(reply);

                    console.log("답글 작성 성공");

                    // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
                    ReplyList(board_id);
                },
                error : function() {
                    alert('서버 에러');
                }
            });

        };
    };

    //댓글 삭제일때
    const DeleteReply = function(cmt_id, board_id){
    	alert("댓글삭제");
    
        // grp이 no인 댓글이 있는 경우 content에 null을 넣고 없으면 삭제한다.
        $.ajax({
            url : '/picture_delete_reply',
            type : 'post',
            data : {
            	cmt_id : cmt_id,
                board_id : board_id
            },
            success : function(pto) {

                let reply = pto.reply;

                // 페이지, 모달창에 댓글수 갱신
                //$('#m_reply'+board_id).text(reply);
                $('#reply'+board_id).text(reply);

                console.log("모댓글 삭제 성공");

                // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
                ReplyList(board_id);
            },
            error : function() {
                alert('서버 에러');
            }
        });
    };

    // 답글 삭제일때
    const DeleteReReply = function(cmt_id, board_id, grp){
        //console.log("grp : " + grp);

        // 답글을 삭제한다.
        $.ajax({
            url : '/picture_delete_rereply',
            type : 'post',
            data : {
            	cmt_id : cmt_id,
            	board_id : board_id,
                grp : grp
            },
            success : function(pto) {

                let reply = pto.reply;

                // 페이지, 모달창에 댓글수 갱신
              	//$('#m_reply'+board_id).text(reply);
                $('#reply'+board_id).text(reply);

                console.log("답글 삭제 성공");

                // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
                ReplyList(board_id);
            },
            error : function() {
                alert('서버 에러');
            }
        });

    };
    
    // 경로 가져오기
    
	$('#report_go').click(function () {
		var url = '';
		var bad_user_id = '${userImp.user_id}';
		url = window.document.location.href;
		var urls = '../report/reportWhite?url='+url+'&bad_user_id='+bad_user_id;
		window.open(urls); 
		location.reload();
	});
    
    
})
</script>
</head>
<body>
<input type="hidden" name="userId" id="userId" value="${userImp.user_id}" />
	<%@include file="../include/header.jsp" %>
<%-- 	prev : ${pageMaker.prev} <br />
	next : ${pageMaker.next} <br />
	startPage : ${pageMaker.startPage} <br />
	endPage : ${pageMaker.endPage} <br />
		<!-- 페이징 시작 -->
	 --%>	
<div class="container" >
	<c:forEach var="list" items="${userPic}" varStatus="i">
		<div id="index-box${i.count}" class="look_box" style="display: none;">
			<div class="row align-items-start" style="margin-bottom: 20px;">
				<div style="width: 100%; margin-top: 50px; margin-bottom: 30px; margin-left: 23%;">
					<img src="${list.pic_path}" alt="IMage" style="all: none;" id="picbox${i.count}" >
				</div>
				<div class="col" style="margin-left: 18%;" >
					<img src="https://s.pximg.net/www/js/build/0a4c9bfd385304c0ffe26bd08fab34ba.svg" width="20" height="20"><a style="margin-left: 3px;">${lookCnt}</a>
					
					<svg viewBox="0 0 12 12" width="12" height="12" class="j89e3c-4 gXONWs">
						<path fill="currentColor" d="
							M9,0.75 C10.6568542,0.75 12,2.09314575 12,3.75 C12,6.68851315 10.0811423,9.22726429 6.24342696,11.3662534
							L6.24342863,11.3662564 C6.09210392,11.4505987 5.90790324,11.4505988 5.75657851,11.3662565
							C1.9188595,9.22726671 0,6.68851455 0,3.75 C1.1324993e-16,2.09314575 1.34314575,0.75 3,0.75
							C4.12649824,0.75 5.33911281,1.60202454 6,2.66822994 C6.66088719,1.60202454 7.87350176,0.75 9,0.75 Z">
						</path>
					</svg>
					<span id="all-Likey${list.pic_num}">${list.likey_cnt}</span>
				</div>
				<div class="col" >
			
				</div>
				<div class="col" id="contents" style="padding-left: 300px;" >
					<c:choose>
						<c:when test="${not empty sessionScope.userId}">
							<c:choose>
								<c:when test="${list.cnt > 0}">
									<span>
										<a idx="${list.pic_num}" href="javascript:" class="heart-click heart_icon${list.pic_num} btn-hearts" style="color:rgb(255, 64, 96)">
											<img alt="" src="/resources/asset/images/her2.png" width="25px" height="25px" class="bi bi-suit-heart-fill">
		                                </a>
									</span>
									
								</c:when>
								<c:otherwise>
									<!-- 빈 하트일때 -->
									<span> 
										<!-- idx에 해당 그림(게시글)번호 세팅 -->
										<a idx="${list.pic_num}" href="javascript:" class="heart-click heart_icon${list.pic_num} btn-outs" style="color:rgb(0, 0, 0);">
											<img alt="" src="/resources/asset/images/her1.png" width="25px" height="25px" class="bi bi-suit-heart">
		                               	</a>
									</span>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<span> 
								<a href="javascript:" class="heart-notlogin"> 
									<svg class="heart3" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
		                         		<path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
		                        	</svg>
								</a>
							</span>
						</c:otherwise>
					</c:choose>
					<!-- 큰 좋아요 끝 -->
					<button type="button" class="img_down" aria-haspopup="true" name="${list.pic_num}" style="margin-left: 7px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-download" viewBox="0 0 20 20">
						  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
						  <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
						</svg>
					</button>
					
			
					
					<button type="button" class="toggleBtn" aria-haspopup="true">
						<svg viewBox="0 0 32 32" size="32" class="sc-11csm01-0 kkmyAs">
							<path d="M16,18 C14.8954305,18 14,17.1045695 14,16 C14,14.8954305 14.8954305,14 16,14
								C17.1045695,14 18,14.8954305 18,16 C18,17.1045695 17.1045695,18 16,18 Z M9,18
								C7.8954305,18 7,17.1045695 7,16 C7,14.8954305 7.8954305,14 9,14 C10.1045695,14 11,14.8954305 11,16
								C11,17.1045695 10.1045695,18 9,18 Z M23,18 C21.8954305,18 21,17.1045695 21,16
								C21,14.8954305 21.8954305,14 23,14 C24.1045695,14 25,14.8954305 25,16 C25,17.1045695 24.1045695,18 23,18 Z" transform="">
							</path>
						</svg>
					</button>
					<ul class="contextmenu">
						<c:if test="${user.user_id ne userImp.user_id && user.user_id ne 'admin' }">
							<li><a href="#" id="report_go">신고하기</a></li>
						</c:if>
						<c:if test="${user.user_id eq userImp.user_id}">
							<li><a href="/chageUpdate?board_id=<%=boardId%>">글 수정</a></li>
							<li><a href="../picture/deleteBoard?board_id=<%=boardId%>">글 삭제</a></li>
						</c:if>
						<c:if test="${user.user_id eq 'admin'}">
							<li><a href="../picture/delteYnBoard?board_id=<%=boardId%>">삭제처리 하기</a></li>
						</c:if>
					</ul>
					</div>
				</div>
		</div>
		</c:forEach>
		
		<div class="row align-items-start" style="margin-bottom: 20px; margin-left: 220px; width: 100%;">
			<div class="col">
				<a>태그 :&nbsp;</a>
				<c:choose>
					<c:when test="${tagList.size()> 0}">
						<c:forEach var="tagList" items="${tagList}"> 
							<a href="hashTag?tag_id=${tagList.tag_id}" style="color: #3d7699; width: 100%;">#${tagList.tag_name}</a>
						</c:forEach>
					</c:when>
					<c:otherwise>
						"태그가 없습니다"
					</c:otherwise>
				</c:choose>	
			</div>
			<div class="col" >
		
			</div>
			<div class="col" >
		
			</div>
		</div>

		

		
		
		<div style="margin-left: 230px;">
			<div class="row align-items-center">
				<div class="col">
				<c:choose>
					<c:when test="${userImp.profile_img eq ''}">
						<img class="btn_menu" src="/imgProfileUpload/default.jpg" alt="IMage" style="all: none; margin-right: 20px;" onclick="javascript:location.href='search.jsp?user_id='${userImp.user_id}">
					</c:when>
					<c:otherwise>
						<img class="btn_menu" src="/${userImp.profile_img}"  alt="IMage" style="all: none;">
					</c:otherwise>
				</c:choose>			
					<a style="font-size: 20px; font-weight: bold; margin-right: 8px;">${userImp.nickname}</a>
					<c:if test="${userId ne userImp.user_id}">
						<c:choose>
							<c:when test="${followCnt == 1}">
								<button type="button" id="click-follow" class="btn btn-primary" style=" border-radius: 7% ; width: 90px;">언팔로우</button>
							</c:when>
							<c:otherwise>
								<button type="button" id="click-follow" class="btn btn-outline-light" style=" border-radius: 7%; width: 90px; border-color: #4232c2; color: #4232c2;">팔로우</button>
							</c:otherwise>
						</c:choose>
					</c:if>
			</div>
					
			<div class="row align-items-end">
				<div class="col" style="margin-left: 70px;">

				</div>
			</div>
			<div class="row align-items-end">
				<div class="col">
					<a style="font-size: 15px; font-weight: bold; margin-left: 57px;"><fmt:formatDate value="${pocboard.board_date}" pattern="yyyy-MM-dd"/></a>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="col-md-offset-3" style="margin-top: 30px;">
		<ul class="pagination justify-content-center">
			<c:if test="${page.prev}">
				<li style="margin-top: 43px;">
					<a href="picDetail?board_id=<%=boardId%>&num=${page.startPageNum - 1}" >
						<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 30 30">
 							 <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
						</svg>
					</a>
				</li>
			</c:if>  
			<c:forEach var="list" items="${userPic}" varStatus="j">
				<img src="${list.pic_path}" class="img-thumbnail" alt="IMage" style="all: none; width: 230px; height: 130px; margin-right: 20px;" name="${j.count}">
				<c:choose>
					<c:when test="${not empty sessionScope.userId}">
						<c:choose>
								<c:when test="${list.cnt > 0}">
								<span style="position: relative;">
									<a idx="${list.pic_num}" href="javascript:" class="heart-click heart_icons${list.pic_num} btn-heart" style="color:rgb(255, 64, 96); z-index: 1; position: absolute;">
										<img alt="" src="/resources/asset/images/her2.png" width="25px" height="25px" class="bi bi-suit-heart-fill" style="z-index: 2; right: 35px; top:10px; position: absolute;">
	                                </a>
								</span>
								
							</c:when>
							<c:otherwise>
								<!-- 빈 하트일때 -->
								<span> 
									<!-- idx에 해당 그림(게시글)번호 세팅 -->
									<a idx="${list.pic_num}" href="javascript:" class="heart-click heart_icons${list.pic_num} btn-out" style="color: color:rgb(0, 0, 0); z-index: 1;  position: absolute; ">
										<img alt="" src="/resources/asset/images/her1.png" width="25px" height="25px" class="bi bi-suit-heart"  style="z-index: 2; right: 35px; top:10px; position: absolute; ">
	                               	</a>
								</span>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<span> 
							<a href="javascript:" class="heart-notlogin"> 
								<svg class="heart3" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
	                         		<path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
	                        	</svg>
							</a>
						</span>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${page.next}">
				<li style="margin-top: 41px;">
					<a href="picDetail?board_id=<%=boardId%>&num=${page.endPageNum + 1}">
						<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 30 30">
							  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
						</svg>
					</a>
				</li>
			</c:if> 
		</ul>
	</div>	
	
	<div>
		<div id="reply_play" style="margin-left: 8%; color: purple;" >
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
				  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
				  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
			</svg>
				댓글보기
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
				  	<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
			</svg>			
		</div>
		
		<div id="reply_play_out" style="margin-left: 8%; color: purple; display: none;"  >
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
				  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
				  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
			</svg>
				댓글 감추기
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
			 	 <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
			</svg>	
		</div>
	</div>
	<!-- 뎃글  -->
	<br />
	<div class="collapse" id="reply_card<%=boardId%>">
        <div class="card card-body">
            <!-- 댓글 목록 -->
            <div class="reply-list reply-list<%=boardId%>">
                <!-- 댓글이 목록이 들어가는 곳 -->
            </div>
              
            <!-- 댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
            <c:if test="${not empty sessionScope.user.user_id}">
                <div class="row reply_write">
                    <div class="col-1">
                        <a href="../userPage?user_id=${sessionScope.userId}">
			                <c:choose>
								<c:when test="${userImp.profile_img eq ''}">
									<img class="btn_menus" src="/imgProfileUpload/default.jpg" alt="IMage" style="all: none; margin-right: 20px;">
								</c:when>
								<c:otherwise>
									<img class="btn_menus" src="/${sessionScope.user.profile_img} "  alt="IMage" style="all: none;">
								</c:otherwise>
							</c:choose>
                        </a>
                    </div>
                    <div class="col-8" class="input_reply_div">
                        <input class="w-100 form-control" id="input_reply<%=boardId%>" type="text" placeholder="댓글입력..." style="color: black;">
                    </div>
                    <div class="col-3 ">
                        <button type="button" idx="<%=boardId%>" class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button>
                    </div>
                </div>
          	</c:if>
        </div>
	</div>
</body>
</html>