<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
     @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    .content2 #nav1{
        
        border: 1px solid;
        background-color: rgb(247, 245, 245);
        border: none;
        height: 400px;
    }
    #nav1 .ray1{
        display: flex;
    }
    #nav1 .ray2 button{
        background-color: rgb(60, 145, 224);
        border-radius: 5px;
        border: none;
        color: white;
     
    }
</style>
</head>
<body>

     <!-- header -->
     <jsp:include page="../common/header.jsp"/>

     <!-- commuMenubar -->
     <jsp:include page="../common/commuMenubar.jsp"/>
    <div id="wrap">
        <div class="content1">

        </div>
        <div class="content2">
            <div id="nav1">
                <div class="ray1">
                    <div id="nav1_1">
                        <img src="/withus/resources/images/memberIcon.PNG" width="100" height="100" class="rounded-circle" >
                    </div>
                    <div id="nav1_2">
                        <b class="name">냥냥2</b>
                        <div class="date">
                            2021-04-12  12:25:19
                        </div>
                    </div>
                    <div id="nav1_3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
                            <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                        </svg> 4
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                            <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                        </svg> 17
                    </div>
                </div>
                <hr>
                <div class="ray2">
                    <button>질문</button>
                    <p>유기농 이거 뭘까요??</p>
                    <hr>
                    <div>제가 이번에 탁상용 캘린더를 구매했는데, <br>
                        너무 아기자기하니 인테리어 용으로 딱인듯 해요~^^ <br>
                        추천합니다 여러분~ 
                    </div>
                    <br>
                    <div>
                        <img src="withus/resources/images/project1.JPG">
                    </div>
                </div>
            </div>
           



        </div>
        <div class="content3">

        </div>
        <div class="contnet4">

        </div>
       

    </div>


     <!-- footer -->
     <jsp:include page="../common/footer.jsp"/>
</body>
</html>