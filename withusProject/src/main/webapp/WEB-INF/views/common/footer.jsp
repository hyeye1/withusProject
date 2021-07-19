<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    
        .footerOuter{
            width: 1200px; 
            height: 540px;
            margin: auto;  
            color: rgb(94, 94, 94);
            background-color: rgba(224, 224, 224, 0.52);
        }
        .footerHead{
            float: left;
            height: 150px;
            padding-top: 75px;
            padding-left: 100px;
        }
        .footerOuter span{
            font-size: 14px;
            float: right;
            margin-top: 11px;
            margin-left: 20px;
        }
        .footerBody{
            float: left;
            padding-left: 45.5px;
            font-size: 15px;
        }
        #footerInfos{
            font-size: 13.5px; 
        }
        .footerRight{
            float: right;
            padding-right: 80px;
            padding-top: 50px;
        }
        .footerRight ul{
            display: table-cell;
            font-size: 16px;
            list-style: none;
        }
        .footerRight a{
            font-size: 14px; 
            color:rgb(127, 127, 127);
            font-weight: 550;
        }
    </style>
</head>
<body>
    <div class="footerOuter" align="left">

        <img src="${ pageContext.request.contextPath }/resources/images/footerLogo.PNG" width="100%">

        <div class="footerHead">
            <a href="enrollForm.oto">
            	<img src="${ pageContext.request.contextPath }/resources/images/qButton.PNG" width="262px" height="63px">
            </a>

            <span>
                <p><b style="font-size: 14.4px;">가치가자 고객센터 : 1588-1234</b> <br> 상담가능시간 : 평일 9:00 ~ 18:00</p>
            </span>
        </div>

        <div class="footerRight">
            <ul>
                <b>ABOUT 가치가자</b>
                <li>&nbsp;</li>
                <li><a href="">가치가자란?</a></li>
                <li><a href="">새소식</a></li>
                <li><a href="">파트너 소개</a></li>
                <li><a href="">채용</a></li>
            </ul>
            <ul>
                <b>고객센터</b>
                <li>&nbsp;</li>
                <li><a href="list.no">공지사항</a></li>
                <li><a href="list.faq">FAQ</a></li>
                <li><a href="">이용약관</a></li>
                <li><a href="">개인정보 처리방침</a></li>
                <li><a href="">창작자 가이드</a></li>
                <li><a href="">서비스 개선사항</a></li>
                <li><a href="">수수료 정책</a></li>
            </ul>
        </div>
        
        <div class="footerBody" style="padding-top: 65px;">
            <p><b>
                가치가자는 플랫폼 제공자로서 프로젝트의 당사자가 아니며, 직접적인 통신판매를 진행하지 않습니다.
            </b></p>
        </div>
        
        <div class="footerBody">
            <p id="footerInfos">
                가치가자(주) | 대표 삼삼하조 | 서울 강남구 강남대로 1231-1 | 사업자 등록번호 : 123-11-12345 <br>
                통신판매업 신고번호 : 제 2021-서울서울-0101호 | 개인정보 관리 책임자 : 정혜  | Email : gachigagga@gmail.com  |  전화번호 : 1588-1234
            </p>
        </div>
    </div>
    
</body>
</html>