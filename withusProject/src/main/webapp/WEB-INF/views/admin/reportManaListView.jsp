<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

    <!-- 6/9 윤경 생성-->
    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

    <h2>공지사항</h2>
    <hr><br>

    <div class="container">
        <!-- 표 N행 8열 -->
        <table border="1" id="listView">
            <tr style="background-color: rgb(224, 224, 224);">
                <th width="60" height="30">회원<br>번호</th>
                <th width="100">이름</th>
                <th width="600">신고 사유</th>
                <th width="100">신고날짜</th>
                <th width="80">누적횟수</th>
                <th width="80">회원상태<br>(Y/N)</th>
                <th width="130">상태수정</th>
                <th width="80">확인유무<br>(Y/N)</th>
            </tr>
            <tr>
                <td>10</td>
                <td>가회원</td>
                <td>도배</td>
                <td>2021-06-09</td>
                <td>2</td>
                <td>활동</td>
                <td>
                    <div class="form-group">
                        <select class="form-control" id="sel1">
                            <option>상태유지</option>
                            <option>강제탈퇴</option>
                          </select>
                    </div>
                </td>
                <td>Y</td>
            </tr>
            <tr>
                <td>10</td>
                <td>가회원</td>
                <td>도배</td>
                <td>2021-06-09</td>
                <td>2</td>
                <td>활동</td>
                <td>
                    <div class="form-group">
                        <select class="form-control" id="sel1">
                            <option>상태유지</option>
                            <option>강제탈퇴</option>
                          </select>
                    </div>
                </td>
                <td>Y</td>
            </tr>
            <tr>
                <td>10</td>
                <td>가회원</td>
                <td>도배</td>
                <td>2021-06-09</td>
                <td>2</td>
                <td>활동</td>
                <td>
                    <div class="form-group">
                        <select class="form-control" id="sel1">
                            <option>상태유지</option>
                            <option>강제탈퇴</option>
                          </select>
                    </div>
                </td>
                <td>Y</td>
            </tr>
            
            
        </table>
        <br>
        <!-- 이거 사이즈 왜 조정안되누;; -->
        <div class="form-group">
            <select class="form-control" id="sel1" width="100">
              <option>회원번호</option>
              <option>이름</option>
              <option>누적횟수</option>
            </select>
            <input type="text" class="form-control form-control-sm" placeholder="조회할 이름을 입력하세요.">
        </div>


    </div>
</body>
</html>