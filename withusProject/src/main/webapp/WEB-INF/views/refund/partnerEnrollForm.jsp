<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
     @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    .wrap{
        width: 1000px; height: 800px; margin: auto;
        text-align: center;
        /* margin-left: auto;
        margin-right: auto; */
    }
    .text1{
        font-size: 20px;
        font-weight: bold;
    }
    .text2{
        font-weight: bold;
    }
    .textBox1 input{
        width: 250px;
    }
    .textBox1 p{
        font-size: 11px;
        color: rgb(52, 152, 219);
    }
    .text3{
        font-weight: bold;
    }

    #content_1_1{width: 100%;  margin-top: 30px;}
    #content2>p{
        font-size: 11px;
        color: rgb(52, 152, 219);
    }
    #content2 .partnerUp{
        width: 250px;
        height: 150px;
    }
    #content5 button{
        background-color: rgb(52, 152, 219);
        color: white;
        width: 250px;
        height: 30px;
        border: 0;
        outline: 0;
        border-radius: 5px;
    }
    .line{
        width: 290px;
    }
</style>
</head>
<body>
	
	<!-- header -->
    <jsp:include page="../common/header.jsp"/>
    
    <div class="wrap">

        <!-- 파트너명 -->
        <div id="partner">
            <div id="content">

                <!-- 파트너 등록 -->
                <div class="text1">파트너 등록</div> <br>
                <div class="text2">파트너명</div>
                <div class="textBox1">
                    <input type="text" placeholder="파트너명 입력" class="partnerName">
                    <p>프로젝트에 사용될 이름을 입력해주세요</p>
                </div>
                <br>
                <div class="text3">파트너 소개</div>
            </div>

            <div id="content2">
                <!-- 파트너 프로필 -->
                <div id="content_1_1">
                    <img src="city1.PNG" width="100" height="100" class="rounded-circle" >
                   <br> <a href="">편집</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="">취소</a>
                    
                </div>
                <p>파트너 프로필사진을 등록해주세요</p>
                <input type="text" placeholder="파트너 소개 등록(0/50)" class="partnerUp" maxlength="50">
                <p>펀딩 프로젝트에 등록될 소개글을 입력해주세요!</p>
                <hr class="line">
            </div>

            <!-- 약관동의 -->
            <div id="content3">
                <input type="checkbox"> 정보수집 동의
                <hr class="line">

            </div>


            <!-- 헬프센터 -->
            <div id="content4">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                </svg>
                <a href="">펀딩프로젝트 헬프센터</a>
            </div>

            <!-- 시작버튼 -->
            <br>
            <div id="content5">
                <button>프로젝트 시작하기</button>
            </div>
        </div>

    </div>
    
    
    
    
    
    
    
    <!-- footer -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>