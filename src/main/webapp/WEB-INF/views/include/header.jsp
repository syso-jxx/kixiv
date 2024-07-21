<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.profile_icon{
	    width: 35px;
	    height: 35px;
	    border-radius: 50%;
 	    background-size: cover; 
	}
	.btn-primary{
	    color: #f6f9fe;
    	background-color: #4232c2;
   		border-color: #4232c2;
	}
	
	.btn-primary:hover {
	    color: #f6f9fe;
    	background-color: #4232c2;
   		border-color: #4232c2;
	}
	
	.btn-outline-primary:hover{
	    color: #fff;
	    background-color: #4232c2;
	    border-color: #4232c2;
	}
	
	
</style>

   <!-- Header -->
    <nav id="main_nav" class="navbar navbar-expand-lg navbar-light bg-white shadow">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand h1" href="/">
                <i class='bx bx-buildings bx-sm text-dark'></i>
                <span class="text-dark h4">Kixiv</span> <span class="text-primary h4" style="color:#4232c2!important;">Community</span>
            </a>
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-toggler-success" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="navbar-toggler-success">
                <div class="flex-fill mx-xl-5 mb-2">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-xl-5 text-center text-dark">
                        <li class="nav-item">
                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="/galleryRentEvent">Gallery</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="/funding">Funding</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="/notice/notice">Notice</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                	<c:choose>
						<c:when test="${user.user_id != null}">
		                    <a style="padding : 0 10px; text-decoration:none; color:black;" href="/mypage">
								<button class="profile_icon" style="background-image: url(/${sessionScope.user.profile_img});border:0;outline:0"></button>
			                    <span style="vertical-align: text-bottom;line-height:35px;">${sessionScope.user.user_id}님 환영합니다.</span>&nbsp;&nbsp;
		                    </a>
							<button type="button" class="btn btn-primary" onclick="javascript:location.href='/logout'">로그아웃</button>
		                    
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-primary" onclick="javascript:location.href='/login'">로그인</button>
						</c:otherwise>                	
                	</c:choose>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Header -->