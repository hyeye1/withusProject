<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin With Us</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

    <!-- 6/9 윤경 생성-->
    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

    <h2>문의하기</h2>
    <hr><br>

    <div class="container">            
        <table class="table">
          <thead>
            <tr>
              <th width="100">글<br>번호</th>
              <th width="200">펀딩상품정보</th>
              <th width="500">제목</th>
              <th width="100">작성자</th>
              <th width="250">작성일</th>
              <th width="150">답변여부<br>(Y/N)</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>10</td>
              <td><a href="">펀딩상세보기</a></td>
              <td>문의내용 제목입니다.</td>
              <td>가회원</td>
              <td>2021-06-09</td>
              <td>N</td>
            </tr>
            <tr>
                <td>10</td>
                <td><a href="">펀딩상세보기</a></td>
                <td>문의내용 제목입니다.</td>
                <td>가회원</td>
                <td>2021-06-09</td>
                <td>N</td>
              </tr>
              <tr>
                <td>10</td>
                <td><a href="">펀딩상세보기</a></td>
                <td>문의내용 제목입니다.</td>
                <td>가회원</td>
                <td>2021-06-09</td>
                <td>N</td>
              </tr>
          </tbody>
        </table>

        <!-- 페이징바 추가할 것 -->



      </div>



</body>