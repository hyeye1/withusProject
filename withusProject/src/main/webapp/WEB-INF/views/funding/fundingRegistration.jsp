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

                .regiHeader {
                    height: 200px;
                    padding: 75px;
                    background-color: rgba(224, 224, 224, 0.45);
                }

                .regiHeader b {
                    float: left;
                    font-size: 34px;
                    margin-top: ;
                }

                .regiHeader button {
                    float: right;
                    margin-left: 30px;
                    width: 100px;
                    height: 40px;
                    background-color: rgb(224, 224, 224);
                    color: rgb(94, 94, 94);
                    border: none;
                    border-radius: 5px;
                    font-weight: 500;
                }

                .registerBtn {
                    width: 170px !important;
                    background-color: rgb(52, 152, 219) !important;
                    color: white !important;
                }

                .regiMenubar {
                    width: 260px;
                    height: 100%;
                    background-color: wheat;
                    padding: 30px;
                }

                .regiMenubar b {
                    font-size: 22px;
                }

                .regiMenubar li {
                    margin-left: -20px;
                    line-height: 2.4;
                    font-size: 17px;
                }

                .regiBody {
                    float: right;
                    width: 940px;
                    height: 100%;
                    background-color: lightgoldenrodyellow;
                    border-left: 2px solid rgba(224, 224, 224, 0.45);
                }
            </style>
        </head>

        <body>
            <div class="regiOuter">

                <!-- 타이틀과 미리보기/임시저장/승인요청하기 -->
                <div class="regiHeader">
                    <p><b>기본정보</b></p>
                    <button class="registerBtn">승인요청하기</button>
                    <button>임시저장</button>
                    <button>미리보기</button>
                </div>

                <!-- 바디 -->
                <div class="regiBody">
                    <!-- 1. 기본정보 -->
                    <div class="regiOne">
                        <div>
                            df
                        </div>

                    </div>

                    <!-- 2. 스토리 -->
                    <div class="regiTwo" style="display: none;"></div>

                    <!-- 3. 리워드 -->
                    <div class="regiThree" style="display: none;"></div>

                    <!-- 4. 안내사항 -->
                    <div class="regiFour" style="display: none;"></div>

                    <!-- 5. 제작자/부가정보 -->
                    <div class="regiFive" style="display: none;"></div>
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
                <div class="regiMenuSelected" style="margin-top: 112px; display: none;">&nbsp;</div>
                <div class="regiMenuSelected" style="margin-top: 218px; display: none;">&nbsp;</div>
                <div class="regiMenuSelected" style="margin-top: 339px; display: none;">&nbsp;</div>
                <div class="regiMenuSelected" style="margin-top: 339px; display: none;">&nbsp;</div>
                <div class="regiMenuSelected" style="margin-top: 339px; display: none;">&nbsp;</div>

            </div> <!-- outer div -->

        </body>

        </html>