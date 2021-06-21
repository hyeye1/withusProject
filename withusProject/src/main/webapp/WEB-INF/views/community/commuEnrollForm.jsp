<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

            <style>
                @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

                /* 메뉴바 */
                body {
                    margin: 0;
                    padding: 0;

                }

                div,
                p,
                a {
                    box-sizing: border-box;
                    font-family: 'Noto Sans KR', sans-serif;
                    font-size: 14.5px;
                    color: rgb(90, 86, 86);
                }

                a {
                    text-decoration: none;
                }

                #menubar {
                    height: 100%;
                    background-color: rgb(240, 244, 245);
                }

                #menubar li:hover {
                    background-color: rgb(71, 189, 250);
                }

                #menubar a {
                    display: block;
                }

                #menubar a:hover {
                    color: white;
                }

                #menubar>ul {
                    list-style-type: none;
                    padding: 0;
                    padding-top: 1rem;
                    text-align: center;
                    width: 100%;
                    height: 100vh;
                }

                .menubar_admin p {
                    font-weight: 600;
                    font-weight: 900;
                }

                .menubar_admin a {
                    margin: 10px;
                    color: rgb(71, 189, 250);
                    font-weight: 500;
                }

                /* 시작 */
                #page_main {
                    display: flex;
                    height: 1000px;
                }

                #page_main .page-wraper__side {
                    flex: 2;
                }

                #page_main .page-wraper__table {
                    flex: 8;
                    padding: 1rem;
                    position: relative;

                }
                .page-wraper__table .table-content {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    padding-left: 50px;
                    padding-right: 50px;
                    width: 100%;
                    
                }
                main {
                    margin: auto;
                    width: 1200px;
                }

                #body_content {
                    display: flex;
                    justify-content: space-between;
                }


                #nav1 {
                    border: 1px solid;
                    background-color: rgb(247, 245, 245);
                    border: none;
                    height: 600px;
                    width: 800px;
                }

                #nav1 .ray1 {
                    display: flex;
                }

                .ray1_category select {
                    width: 600px;
                    height: 30px;
                }

                .ray1_category {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .ray1_title {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    padding-top: 15px;
                }

                .ray1_title input {
                    width: 600px;
                    height: 30px;

                }

                .ray1_content {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    padding-top: 15px;
                }

                .ray1_btn {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    padding-top: 130px;
                }

                .ray1_btn button {
                    width: 90px;
                    height: 40px;
                    border-radius: 5px;
                    border: none;
                }

                .ray1_btn .btn_cancel {
                    background-color: rgb(226, 220, 220);
                    margin-right: 30px;
                }

                .ray1_btn .btn_upload {
                    background-color: rgb(60, 145, 224);
                    color: white;
                }
               
            </style>

        </head>

        <body>

            <main>
                <!-- header -->
                <section>
                    <jsp:include page="../common/header.jsp" />
                </section>
                <!-- 사이드메뉴바 -->
                <div id="page_main">
                    <section  class="page-wraper__side">
                        <article>
                            <div id="menubar">
                                <ul id="menubar_member" class="menubar_admin">
                                    <p>커뮤니티</p>
                                    <li><a href="">자유</a></li>
                                    <li><a href="">질문</a></li>
                                    <li><a href="">공구모집</a></li>
                                </ul>
                            </div>
                        </article>
                    </section>
                    <!-- 새글쓰기 -->
                    <section class="page-wraper__table">
                        <div class="table-content">
                            <section class="content_header">
                                <div>
                                    <b>새 글 쓰기</b>
                                </div>

                            </section>
                            <!-- 상세 -->
                            <section id="body_content">
                                <!-- 프로필부분 -->
                                <article>
                                    <div id="nav1">
                                        <div class="ray1">
                                            <div id="nav1_1">
                                                <img src="${ pageContext.request.contextPath }/resources/images/memberIcon.PNG"
                                                    width="50" height="50" class="rounded-circle">
                                            </div>
                                            <div id="nav1_2">
                                                <b class="name">김미미</b>
                                                <div class="date">
                                                    2021-04-12 12:25:19
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="ray1_category">
                                            <form action="">
                                                <select>
                                                    <option selected>카테고리 선택</option>
                                                    <option value="">자유</option>
                                                    <option value="">질문</option>
                                                    <option value="">공구모집</option>
                                                </select>
                                            </form>
                                        </div>
                                        <div class="ray1_title">
                                            <input type="text" placeholder="제목을 입력해주세요">
                                        </div>
                                        <div class="ray1_content">
                                            <textarea name="" id="" cols="80" rows="10"
                                                placeholder="내용을 입력해주세요"></textarea>

                                        </div>
                                        <div class="ray1_btn">
                                            <br><br>
                                            <button class="btn_cancel">취소</button>
                                            <button class="btn_upload">등록</button>
                                        </div>
                                    </div>

                                </article>


                            </section>
                        </div>
                    </section>
                </div>
                <!-- footer -->
                <section>
                    <jsp:include page="../common/footer.jsp" />
                </section>
            </main>
        </body>

        </html>