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
                    <h4 style="display: flex; justify-content: center;">게시글 수정하기</h4>
                    <br>

                    <form id="enrollForm" method="post" action="update.co" enctype="multipart/form-data">
                        <table align="center">
                            
                            <tr>
                                <div class="select">
                                    <select class="custom-select" name="condition">
                                        <option selected>카테고리 선택</option>
                                        <option value="title">자유</option>
                                        <option value="content">질문</option>
                                        <option value="content">공구모집</option>
                                    </select>
                                </div>
                            </tr>
                            <tr>
                                <th><label for="title">제목</label></th>
                                <td><input type="text" id="title" class="form-control" name="commuTitle" value="${ c.commuTitle }" required></td>
                            </tr>
                            <tr>
                                <th><label for="writer">작성자</label></th>
                                <td><input type="text" id="writer" class="form-control" value="${ loginUser.memberId }" name="" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="upfile">첨부파일</label></th>
                                <td>
                                	<input type="file" id="upfile" class="form-control-file border" name="upfile">
                                	
                                	<c:if test="${ !empty c.commuOrigin }">
		                            	현재 업로드된 파일 : <a href="${ c.commuChange }" download="${ c.commuOrigin }">${ c.commuOrigin }</a>
		                            	<input type="hidden" name="commuOrigin" value="${ c.commuOrigin }">
		                            	<input type="hidden" name="commuChange" value="${ c.commuChange }">
                          		    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><label for="content">내용</label></th>
                            </tr>
                            <tr>
                                <th colspan="2"><textarea class="form-control" required name="commuContent" id="content" rows="10"
                                        style="resize:none;">${ c.commuContent }</textarea></th>
                            </tr>
                        </table>
                        <br>

                        <div align="center">
                            <button type="submit" class="btn btn-primary">수정하기</button>
                            <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
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