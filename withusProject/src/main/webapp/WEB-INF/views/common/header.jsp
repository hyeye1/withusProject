<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 부트스트랩에서 제공하고 있는 스타일 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
        
		.headerOuter{
            width: 1200px; 
            margin: auto; 
            height: 117px; 
            padding: 10px;
        }
		.headerOuter div{display: table-cell;}
		.headerOuter a{
			text-decoration: none;
            color: rgb(64, 64, 64);
            font-weight: 600;
            font-size: 17px;
            margin-right: 10px;
		}
        .headerLeft{
            float: left;
            margin-top: 33px;
            margin-left: 30px;
        }
        .headerCenter{
            float: left;
            margin-left: 158px;
        }
        #searchIcon{
            margin-top: 28px;
            width: 31px;    
            margin-right: -170px;
        }
        .headerRight{
            float: right;
            margin-right: 50px;
            margin-top: 33px;
        }

    </style>
</head>
<body>
	<div class="headerOuter" align="center" >
	
		<div class="headerLeft">
			<img src="../../../resources/images/catIcon.PNG" width="25px" style="margin-top: -6px;">
			<a href="" style="color: rgb(52, 152, 219);"> 프로젝트 둘러보기 </a>
			<a href=""> 프로젝트 올리기</a>
		</div>
		
		<div class="headerCenter" >
			<img src="../../../resources/images/logo.png" width="165px" id="logoImg">
		</div>
        
        <input type="image" src="../../../resources/images/searchIcon.PNG" id="searchIcon">
		
		<!-- 로그인전 -->
		<div class="headerRight">
			<a href="">로그인</a>
			<a href=""> 회원가입</a>
			<img src="../../../resources/images/memberIcon.PNG" width="30px" style="margin-left: -3px; margin-top: -6px;">
		</div>
		
		<!-- 로그인후 -->
		<div class="headerRight" style="display:none">
			<a href="">로그아웃</a>
			<a href=""> 마이페이지</a>
			<img src="../../../resources/images/memberIcon.PNG" width="30px" style="margin-left: -3px; margin-top: -6px;">
		</div>

		<!-- 관리자 -->
		<div class="headerRight" style="display:none">
			<a href="">로그아웃</a>
			<a href=""> 관리자</a>
			<img src="../../../resources/images/memberIcon.PNG" width="30px" style="margin-left: -3px; margin-top: -6px;">
		</div>
	</div>

</body>
</html>