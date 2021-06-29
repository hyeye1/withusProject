<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <title>Document</title>
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

                .content {
                    /* background-color:rgb(247, 245, 245); */
                    width: 80%;
                    margin: auto;
                }

                .innerOuter {
                    border: 1px solid lightgray;
                    width: 80%;
                    margin: auto;
                    padding: 5% 15%;
                    background: white;
                }

                table * {
                    margin: 5px;
                }

                table {
                    width: 100%;
                }

                .ray1 {
                    display: flex;
                }
            </style>
        </head>

        <body>
            <!-- 헤더 -->
            <jsp:include page="../common/header.jsp" />
			<br><br><br>
            <!-- 사이드메뉴바 -->
            <div id="page_main">
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
                <section class="page-wraper__table">
                    <div class="content">
                        <br><br>
                        <div class="innerOuter">
                            <!-- <h2>게시글 상세보기</h2> -->

                            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
                            <a class="btn btn-secondary" style="float:right" href="community.main">목록으로</a>
                            <br><br>
                            <table id="contentArea" align="center" class="table">
                                <tr>
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
                                </tr>
                                <br>
                                <tr>
                                    <th width="100">제목</th>
                                    <td colspan="3">${ b.boardTitle }</td>
                                </tr>
                                <tr>
                                    <th>첨부파일</th>
                                    <td colspan="3">
                                        <a href="" download="">파일명.jpg</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <p style="height:150px">제가 이번에 탁상용 캘린더를 구매했는데, <br>
                                            너무 아기자기 하니 인테리어 용으로 딱인듯 해요~^^ <br>
                                            추천합니다 여러분~~</p>
                                    </td>
                                </tr>
                            </table>
                            <br>
						
                            <div align="center">
                                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
                                <a class="btn btn-primary" href="postFormSubmit(1);">수정하기</a>
                                <a class="btn btn-danger" href="postFormSubmit(2);">삭제하기</a>
                            </div><br><br>

                            <!-- 댓글 기능은 나중에 ajax 배우고 접목시킬예정! 우선은 화면구현만 해놓음 -->
                            <table id="replyArea" class="table" align="center">
                                <thead>
                                    <tr>
                                        <th colspan="2">
                                            <textarea class="form-control" name="" id="content" cols="55" rows="2"
                                                style="resize:none; width:100%"></textarea>
                                        </th>
                                        <th style="vertical-align: middle"><button
                                                class="btn btn-secondary">등록하기</button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td colspan="3">댓글 (<span id="rcount">4</span>) </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>user02</th>
                                        <td>댓글입니다.너무웃기다앙</td>
                                        <td>2020-04-10</td>
                                    </tr>
                                    <tr>
                                        <th>user01</th>
                                        <td>많이봐주세용</td>
                                        <td>2020-04-08</td>
                                    </tr>
                                    <tr>
                                        <th>admin</th>
                                        <td>댓글입니다ㅋㅋㅋ</td>
                                        <td>2020-04-02</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br><br>
                    </div>
                </section>
            </div>
            <!-- 푸터바  -->
            <jsp:include page="../common/footer.jsp" />

        </body>

        </html>