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

        #enrollForm>table {
            width: 100%;
        }

        #enrollForm>table * {
            margin: 5px;
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
                        <li><a href="commu.free">자유</a></li>
                        <li><a href="commu.ask">질문</a></li>
                        <li><a href="commu.tool">공구모집</a></li>
                    </ul>
                </div>
            </article>
        </section>
        <section class="page-wraper__table">
            <div class="content">
                <br><br>
                <div class="innerOuter">
                    <h4 style="display: flex; justify-content: center;">새글쓰기</h4>
                    <br>

                    <form id="enrollForm" method="post" action="insert.co" enctype="multipart/form-data">
                        <table align="center">
                            
                            <tr>
                                <div class="select">
                                    <select class="custom-select" name="commuCate" id="commuCate">
                                        <option selected>카테고리 선택</option>
                                        <option value="자유" id="free">자유</option>
                                        <option value="질문" id="ask">질문</option>
                                        <option value="공구모집" id="tool">공구모집</option>
                                    </select>
                                </div>
                            </tr>
                            <tr>
                                <th><label for="commuTitle">제목</label></th>
                                <td><input type="text" id="commuTitle" class="form-control" name="commuTitle" required></td>
                            </tr>
                            <tr>
                                <th><label for="commuWriter">작성자</label></th>
                                <td><input type="text" id="commuWriter" class="form-control" value="${ loginUser.memberNo }" name="commuWriter" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="upfile">첨부파일</label></th>
                                <td><input type="file" id="upfile" class="form-control-file border" name="upfile"></td>
                            </tr>
                            <tr>
                                <th colspan="2"><label for="commuContent">내용</label></th>
                            </tr>
                            <tr>
                                <th colspan="2"><textarea class="form-control" required name="commuContent" id="commuContent" rows="10"
                                        style="resize:none;"></textarea></th>
                            </tr>
                        </table>
                        <br>

                        <div align="center">
                            <button type="submit" class="btn btn-primary" form="enrollForm">등록하기</button>
                            <button type="reset" class="btn btn-danger">취소하기</button>
                        </div>
                    </form>
                </div>
                <br><br>
            </div>
        </section>
    </div>
    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp" />

</body>

</html>