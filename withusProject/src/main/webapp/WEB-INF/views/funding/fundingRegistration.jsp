<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                .regiOuter {
                    width: 1200px;
                    height: 100%;
                    margin: auto;
                    cursor: default;
                    position: relative;
                }
            </style>
        </head>

        <body>
            <div class="regiOuter">

                <!-- 타이틀과 미리보기/임시저장/승인요청하기 -->
                <div class="regiHeader">
                    <p>기본정보</p>
                    <button>미리보기</button>
                    <button>임시저장</button>
                    <button>승인요청하기</button>
                </div>

                <!-- 왼쪽 메뉴바 -->
                <div class="regiMenubar">
                    <p><b>프로젝트 만들기</b></p>
                    <ol>
                        <!-- 호버줘서 클릭된건 파랑색보여지게 -->
                        <li>기본정보</li>
                        <li>스토리</li>
                        <li>리워드</li>
                        <li>안내사항</li>
                        <li>제작자/부가 정보</li>
                    </ol>
                </div>
                <!-- 메뉴바 스토리선택됨 표시바 -->
                <div class="regiMenuSelected" style="margin-left: 112px; display: none;">&nbsp;</div>
                <div class="regiMenuSelected" style="margin-left: 218px; display: none;">&nbsp;</div>
                <div class="regiMenuSelected" style="margin-left: 339px; display: none;">&nbsp;</div>


                <!-- 바디 -->
                <div class="regiBody">

                </div>

            </div>
        </body>

        </html>