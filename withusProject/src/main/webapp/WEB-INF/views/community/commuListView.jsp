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
              
              <div>
                <ul class="filter-btn-list">
                  <li>
                    <button>조회순</button>
                    <button>최신순</button>
                  </li>
                  <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
                 <c:if test="${ !empty loginUser }">
                  <li>
                    <a class="btn btn-secondary" style="float:right; background-color: rgb(60, 145, 224); border: none;"
                      href="commu.enroll">새글쓰기</a>
                  </li>
                 </c:if>
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
                <c:forEach var="c" items="${ list }">
	                    <tr>
	                        <td class="cno">${ c.commuNo }</td>
	                        <td>${ c.commuCate }</td>
	                        <td>${ c.commuTitle }</td>
	                        <td>${ m.memberNo }</td>
	                        <td>${ c.count }</td>
	                         <td>${ c.commuCreate }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
              </table>
              
              <script>
            	$(function(){
            		$("#communityList tbody tr").click(function(){
            			location.href="commu.detail?cno=" + $(this).children(".cno").text();
            		})
            	})
            </script>
            <br>

              <div id="pagingArea">
            
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="community.main?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="community.main?currentPage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="community.main?currentPage=${ pi.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
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