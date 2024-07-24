<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.profile_icon{
	    width: 35px;
	    height: 35px;
	    border-radius: 50%;
 	    background-size: cover; 
	}
	
	.fund-header {
		-webkit-box-pack: justify!important;
    	justify-content: space-between!important;
   	    align-self: center!important;
   	    -webkit-box-flex: 1!important;
    	flex: 1 1 auto!important;
    	-webkit-box-align: center;
     	align-items: center;
   	    width: 100%;
   	    display: flex!important;
	}
	
	.fund-container {
		flex-wrap: inherit;
		max-width:1320px;
		width: 100%;
		padding-right: var(--bs-gutter-x,.75rem);
		padding-left: var(--bs-gutter-x,.75rem);
		margin-right: auto;
		margin-left: auto;
	}
	
	.fund-btn {
		display: inline-block;
	    line-height: 1.5;
	    text-align: center;
	    text-decoration: none;
	    vertical-align: middle;
	    user-select: none;
	    border: 1px solid transparent;
	    padding: .375rem .75rem;
	    font-size: 1rem;
	    border-radius: .25rem;
	    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
		font-weight: 400;
		letter-spacing: normal;
		text-transform: none;
		cursor: pointer;
		color: #f6f9fe;
	}
	
	.fund-btn:hover {
		background-color: #382ba5;
	    border-color: #382ba5;
	}
	
</style>

   <!-- Header -->
    <nav id="main_nav" class="navbar navbar-expand-lg navbar-light bg-white shadow">
        <div class="d-flex justify-content-between align-items-center fund-container">
            <a class="navbar-brand h1" href="/">
                <i class='bx bx-buildings bx-sm text-dark'></i>
                <span class="text-dark h4">Kixiv</span> <span class="text-primary h4">Community</span>
            </a>
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-toggler-success" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="fund-header" id="navbar-toggler-success">
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
								<button class="profile_icon" style="background-image: url(/${user.profile_img});border:0;outline:0"></button>
			                    <span style="vertical-align: text-bottom;line-height:35px;">${user.user_id}님 환영합니다.</span>&nbsp;&nbsp;
		                    </a>
							<button type="button" class="fund-btn btn-primary" onclick="javascript:location.href='/logout'">로그아웃</button>
		                    
						</c:when>
						<c:otherwise>
							<button type="button" class="fund-btn btn-primary" onclick="javascript:location.href='/login'">로그인</button>
						</c:otherwise>                	
                	</c:choose>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Header -->