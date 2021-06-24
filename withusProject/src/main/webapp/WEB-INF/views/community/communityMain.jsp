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


        /* 테이블  */
        #page_main {
          display: flex;
        }

        .content {
          width: 100%;
          margin: auto;
        }

        .innerOuter {
          border: 1px solid lightgray;
          width: 80%;
          margin: auto;
          padding: 5% 15%;
          background: white;
        }

        #boardList {
          text-align: center;
        }

        #boardList>tbody>tr:hover {
          cursor: pointer;
        }

        #pagingArea {
          width: fit-content;
          margin: auto;
        }

        #searchForm {
          width: 80%;
          margin: auto;
        }

        #searchForm>* {
          float: left;
          margin: 5px;
        }

        .select {
          width: 20%;
        }

        .text {
          width: 53%;
        }

        .searchBtn {
          Width: 20%;
          background-color: rgb(60, 145, 224);
          border: none;
        }

        .badge-primary {
          display: inline-block;
          padding: 0.25rem;
          border-radius: 5px;
          width: 80px;
          text-align: center;
        }

        .filter-btn-list {
          list-style: none;
          width: 100%;
          display: flex;
          justify-content: space-between;
        }
        #page_main .page-wraper__side {
                    flex: 2;
                }

                #page_main .page-wraper__table {
                    flex: 8;
                    /* padding: 1rem; */
                    position: relative;

                }
      </style>
    </head>

    <body>

      <!-- 헤더 -->
      <jsp:include page="../common/header.jsp" />

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
            <div class="innerOuter" style="padding:5% 10%;">

              <br>
              <form id="searchForm" action="" method="Get" align="center">
                <div class="select">
                  <select class="custom-select" name="condition">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                  </select>
                </div>
                <div class="text">
                  <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
              </form>
              <br><br><br><br><br>
              <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
              <div>
                <ul class="filter-btn-list">
                  <li>
                    <button>조회순</button>
                    <button>최신순</button>
                  </li>
                  <li>
                    <a class="btn btn-secondary" style="float:right; background-color: rgb(60, 145, 224); border: none;"
                      href="">새글쓰기</a>
                  </li>
                </ul>
              </div>
              <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>댓글수</th>
                    <th>조회수</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>5</td>
                    <td>
                      <div class="badge-primary">공구모집</div>
                    </td>
                    <td>마지막 공지사항제목</td>
                    <td>3</td>
                    <td>10</td>
                    <td>2020-02-10</td>
                  </tr>
                  <tr>
                    <td>4</td>
                    <td>
                      <div class="badge-primary">자유</div>
                    </td>
                    <td>마지막 공지사항제목</td>
                    <td>6</td>
                    <td>10</td>
                    <td>2020-02-07</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>
                      <div class="badge-primary">질문</div>
                    </td>
                    <td>마지막 공지사항제목</td>
                    <td>8</td>
                    <td>10</td>
                    <td>2020-02-03</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>
                      <div class="badge-primary">자유</div>
                    </td>
                    <td>마지막 공지사항제목</td>
                    <td>2</td>
                    <td>100</td>
                    <td>2020-02-01</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>
                      <div class="badge-primary">질문</div>
                    </td>
                    <td>마지막 공지사항제목</td>
                    <td>10</td>
                    <td>45</td>
                    <td>2019-12-25</td>
                  </tr>
                </tbody>
              </table>
              <br>

              <div id="pagingArea">

                <ul class="pagination">

                  <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">Next</a></li>
                  
                </ul>

              </div>

              <br clear="both"><br>
              <br><br>
            </div>
            <br><br>
          </div>
        </section>
      </div>
      <!-- 이쪽에 푸터바 포함할꺼임 -->
      <jsp:include page="../common/footer.jsp" />

      <script>

      </script>

    </body>

    </html>