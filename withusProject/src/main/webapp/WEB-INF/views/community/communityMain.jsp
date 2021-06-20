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
        .filter-btn-list{
          list-style: none;
          width: 100%;
          display: flex;
          justify-content: space-between;
        }
        .filter-btn-list li{
          float: left;
        }
        .page-wraper {
          display: flex;
        }

        .page-wraper__side {
          flex: 1.5;
        }

        .page-wraper__table {
          flex: 8.5;
          padding: 1rem;
          position: relative;
        }


        .table__title p {
          font-size: 23px;
          font-weight: bolder;
        }

        #replyTitle {
          width: 60%;
        }

        #replyDate {
          width: 20%
        }

        #replyStatus {
          width: 20%
        }

        .table-content {
          display: flex;
          flex-direction: column;
          align-items: center;
          padding-left: 50px;
          padding-right: 50px;
        }

        .table-content__title{
          width: 100%;
          max-width: 800px;
        }

        .table-content__body {
          display: flex;
          justify-content: center;
          width: 100%;
          max-width: 800px;
        }

        #query_1 table {
          max-width: 800px;
        }

        #query_1 table .badge-primary {
          display: inline-block;
          padding: 0.25rem;
          border-radius: 5px;
          width: 80px;
          text-align: center;
        }

        #query_1 table tr td:first-child {
          display: flex;
          justify-content: center;
        }

        #query_2 {
          width: 100%;
          position: absolute;
          bottom: 0;
          margin-bottom: 3rem;
          display: flex;
          justify-content: center;
        }

        main {
          margin: auto;
          width: 1200px;
        }
        .filter-btn-list__btn button{
          background-color: rgb(60, 145, 224);
          border-radius: 5px;
          border: none;
          color: white;
        }
      </style>
    </head>

    <body>
      <main>
        <section>
          <!-- header -->
          <jsp:include page="../common/header.jsp" />
        </section>
        <section class="page-wraper">
          <!-- side -->
          <article class="page-wraper__side">
            <div id="menubar">
              <ul id="menubar_member" class="menubar_admin">
                <p>커뮤니티</p>
                <li><a href="">자유</a></li>
                <li><a href="">질문</a></li>
                <li><a href="">공구모집</a></li>
              </ul>
            </div>
          </article>

          <!-- table  -->
          <article id="query_1" class="page-wraper__table">

            <div class="table-content">
              <div class="table-content__title">
                <ul class="filter-btn-list">
                  <li class="filter-btn-list__filter">
                    <button>조회순</button> 
                    <button>최신순</button>
                  </li>
                  <li class="filter-btn-list__btn">
                    <button>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                      </svg> 새글쓰기
                    </button>
                  </li>
                </ul>
               
              </div>
              <div class="table-content__body">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                      <td>
                        <div class="badge-primary">공구모집</div>
                      </td>
                      <td>서울 강남 사시는분~!</td>
                      <td>
                        <div>
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-chat" viewBox="0 0 16 16">
                            <path
                              d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
                          </svg> 21
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-eye-fill" viewBox="0 0 16 16">
                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                            <path
                              d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
                          </svg> 65
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="badge-primary">자유</div>
                      </td>
                      <td>이거 완전 별로</td>
                      <td>
                        <div>
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-chat" viewBox="0 0 16 16">
                            <path
                              d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
                          </svg> 13
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-eye-fill" viewBox="0 0 16 16">
                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                            <path
                              d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
                          </svg> 45
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="badge-primary">질문</div>
                      </td>
                      <td>유기농 이거 뭘까요?</td>
                      <td>
                        <div>
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-chat" viewBox="0 0 16 16">
                            <path
                              d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
                          </svg> 1
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-eye-fill" viewBox="0 0 16 16">
                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                            <path
                              d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
                          </svg> 4
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <div id="query_2">
                  <div id="pagingArea">
                    <ul class="pagination">
                      <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                  </div>
                </div>
              </div> 
            </div>
          </article>
        </section>
        <section>
          <!-- footer -->
          <jsp:include page="../common/footer.jsp" />
        </section>
      </main>

    </body>
</html>