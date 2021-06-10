<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin With Us</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- alertify----------------------------- -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	*{box-sizing: border-box;} 
	
	 /* header */
	.head{        
	    width:1200px;
	    height: 160px;
	    padding-top: 20px;
	    margin:auto;
	}
	.head a{text-decoration: none; color: black;}
	
	/* header_web */
	.head_main>div{float: left; margin-bottom: 20px;}
	
	.logo_img{width: 30%; position: relative;}
	.head_center{width: 50%;}
	.login_area{width: 20%;}
	
	.logo_img>img{height:50px; margin: 0 20px;}
	.login_area{text-align: center; line-height:50px; font-size: 14px; text-indent: 35px;}
	.login_area>a{margin: 5px;}
	.login_area>a:hover{cursor: pointer;}
	
	/* navigator */
	.navi{
	    margin: 0;
	    padding: 0;
	    list-style-type: none;
	}
	.navi>li{
	    float: left;
	    width: 20%;
	    text-align: center;
	}
	.navi a{
	    text-decoration: none;
	    font-size: 18px;
	    color: white;
	    background: rgb(44, 62, 80);;
	    display: block;
	    line-height: 55px;
	}
	
	.navi>li>ul a{ font-size: 16px; font-weight: bold;}
	
	.navi a:hover{background-color:rgb(52, 152, 219); color:white;}
	
	.navi>li>ul{ 
	    list-style-type: none;
	    padding: 0;
	    display: none;
	    z-index: 1;
	    position:absolute;
	    width: 240px;
	}
	.navi>li>a:hover+ul{
	    display: block;
	}
	.navi>li>ul:hover{
	    display: block;
	}
	.navi_sub a{
	    background: lightgray;
	    color: rgb(19, 19, 19);
	}  
	.navi_sub a:hover{
	    background: rgb(196, 195, 195);
	    color: rgb(19, 19, 19);
	}      
	
	/* 세부 페이지마다 공통적으로 유지할 style */
	.content_wrap{
	    width: 1200px; 
	    margin: auto;
	    margin-top: 80px;
	    padding: 0 40px; 
	}
	.title{
	    border-bottom: 1px solid lightgray; 
	    margin: auto; 
	    margin-bottom: 100px;
	    padding: 0 10px;
	    font-size: 23px;
	    font-weight: 550;
	}
</style>        
</head>
<body>
	
    <c:if test="${ !empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
	<c:remove var="alertMsg" scope="session" />
	</c:if> 
    

    <div class="head">
        <div class="head_main">
            <div class="logo_img"><img src="../../../resources/images/logo.png" alt="로고"></div>
            <div class="head_center"></div>
            <div class="login_area">
                <!-- 로그인전 -->
                <a data-toggle="modal" data-target="#manaLogin">로그인</a>
            
                <!-- 로그인 후 -->
                <!-- 
                <span>관리자님</span> &nbsp;
                <a href="">로그아웃</a>
                -->
            </div>
        </div>

        <div class="gnb_wrap">
            <ul class="navi">
                <li><a href="">회원관리</a></li>

                <li><a href="">메뉴관리</a></li>

                <li><a>펀딩관리</a>
                    <ul class="navi_sub">
                        <li><a href="">펀딩조회</a></li>
                        <li><a href="">실시간랭킹</a></li>
                    </ul>
                </li>
                <li><a href="">결제관리</a> </li>

                <li><a href="">고객센터</a>
                    <ul class="navi_sub">
                        <li><a href="">공지사항</a></li>
                        <li><a href="">FAQ</a></li>
                        <li><a href="">문의하기</a></li>
                        <li><a href="">신고하기</a></li>
                        <li><a href="">실시간채팅</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

   
    <!-- 로그인 클릭시 뜨는 모달 -->
    <!-- The Modal -->
    <div class="modal fade" id="manaLogin">
        <div class="modal-dialog modal-sm">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">로그인</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                <label for="userId" class="mr-sm-2">ID :</label>
                <input type="text" name="userId" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId"> 
                <label for="userPwd" class="mr-sm-2">Password:</label>
                <input type="password" name="userPwd" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="userPwd">
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-info btn-block" data-dismiss="modal">로그인</button>
            </div>
            
        </div>
        </div>
    </div>                            
 

</body>
</html>