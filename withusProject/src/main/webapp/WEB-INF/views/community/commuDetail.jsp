<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
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
                    height: 2000px;
                }

                .page-wraper__side {
                    flex: 2;

                }

                .page-wraper__table {
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

                button {
                    background-color: rgb(60, 145, 224);
                    border-radius: 5px;
                    border: none;
                    color: white;
                }

                #nav1 {
                    border: 1px solid;
                    background-color: rgb(247, 245, 245);
                    border: none;
                    height: 800px;
                    width: 800px;
                }

                #nav1 .ray1 {
                    display: flex;
                }

                .badge-primary {
                    display: inline-block;
                    padding: 0.25rem;
                    border-radius: 5px;
                    width: 80px;
                    text-align: center;
                }

                main {
                    margin: auto;
                    width: 1200px;
                }

                #body_content {
                    display: flex;
                    justify-content: space-between;
                    /* width: 100%; */
                }

                /* 댓글부분 */
                #comment-content {
                    border: 1px solid;
                    background-color: rgb(247, 245, 245);
                    border: none;
                    height: 600px;
                    width: 800px;
                }

                .comment-profile {
                    display: flex;

                }

                ul {
                    list-style: none;
                }

                .comment-profile #comment-upload {
                    display: flex;
                }

                #comment-input .comment-write {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .comment-write button {
                    width: 70px;
                    height: 50px;
                }
            </style>
        </head>

        <body>



            <main>
                <!-- header -->
                <section>
                    <jsp:include page="../common/header.jsp" />
                </section>
                <div id="page_main">
                    <!-- side -->
                    <section class="page-wraper__side">
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
                    <!-- 상세 -->
                    <section class="page-wraper__table">
                        <!-- 새글쓰기 버튼 -->
                        <div class="table-content">
                            <article>
                                <button>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                        <path
                                            d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
                                    </svg> 새글쓰기
                                </button>
                            </article>
                            <!-- 본문내용 -->
                            <article id="body_content">
                                <!-- 프로필 부분 -->
                                <div id="nav1">
                                    <div class="ray1">
                                        <div id="nav1_1">
                                            <img src="${ pageContext.request.contextPath }/resources/images/memberIcon.PNG"
                                                width="50" height="50" class="rounded-circle">
                                        </div>
                                        <div id="nav1_2">
                                            <b class="name">냥냥2</b>
                                            <div class="date">
                                                2021-04-12 12:25:19
                                            </div>
                                        </div>
                                        <div id="nav1_3">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
                                                <path
                                                    d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
                                            </svg> 4
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                                                <path
                                                    d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
                                            </svg> 17
                                        </div>
                                    </div>
                                    <hr>
                                    <!-- 제목 -->
                                    <div class="ray2">
                                        <div class="badge-primary">공구모집</div>
                                        <p>유기농 이거 뭘까요??</p>
                                        <hr>
                                    </div>
                                    <!-- 내용 -->
                                    <div>제가 이번에 탁상용 캘린더를 구매했는데, <br>
                                        너무 아기자기하니 인테리어 용으로 딱인듯 해요~^^ <br>
                                        추천합니다 여러분~
                                    </div>
                                    <br>
                                    <!-- 이미지 -->
                                    <div>
                                        <img src="${ pageContext.request.contextPath }/resources/images/project1.JPG">
                                    </div>
                                </div>


                            </article>
                            <br><br>
                            <!-- 댓글 -->
                            <article id="comment-content">
                                <!-- 댓글수 -->
                                <div>
                                    <b>댓글 4</b>
                                    <hr>
                                </div>
                                <!-- 댓글목록 -->
                                <ul>
                                    <!-- 댓글아이템 -->
                                    <li>
                                        <!-- 프로필부분 -->
                                        <div class="comment-profile">
                                            <div>
                                                <img src="${ pageContext.request.contextPath }/resources/images/memberIcon.PNG"
                                                    width="40" height="40" class="rounded-circle">

                                            </div>
                                            <div>
                                                <b>랄랄</b>
                                                <div>2021-04-12 13:25:28</div>

                                            </div>
                                            <div>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path
                                                        d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                    <path
                                                        d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z" />
                                                </svg>
                                            </div>
                                        </div>
                                        <!-- 댓글내용 -->
                                        <div>
                                            <p>저도 이거 구매 했는데 넘 이쁜 것 같아요~^^~</p>
                                            <hr>
                                        </div>

                                    </li>
                                </ul>
                                <!-- 댓글입력창 -->
                                <div id="comment-input">
                                    <!-- 프로필 부분 -->
                                    <div class="comment-profile">
                                        <ul id="comment-upload">
                                            <li>
                                                <div>
                                                    <img src="${ pageContext.request.contextPath }/resources/images/memberIcon.PNG"
                                                        width="40" height="40" class="rounded-circle">
                                                </div>
                                            </li>
                                            <li>
                                                <div>
                                                    <b>김미미</b>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- 댓글입력창 -->
                                    <div class="comment-write">
                                        <textarea name="" id="" cols="87" rows="2" placeholder="댓글 쓰기"></textarea>
                                        <button onclick="alert('등록되었습니다.')">등록</button>
                                    </div>
                                </div>
                            </article>
                        </div>
                </div>

                </section>
                <!-- 푸터 -->
                <section>
                    <jsp:include page="../common/footer.jsp" />
                </section>
            </main>


        </body>

        </html>