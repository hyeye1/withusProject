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
<title>With Us</title>
</head>
<body>

	<!-- 6/12 윤경 생성-->

    <!-- 해더바 포함 -->
    <jsp:include page=""/>

    <h2>공지사항</h2>
    <hr><br>

	<div class="container">

		<br>
	    <!-- 표 N행 6열 -->
		<table class="table table-bordered">
			<thead>
			  <tr align="center" style="height: 10px; background-color: rgb(224, 224, 224); font-size:smaller ;">
				<th width="50" height="30"><input type="checkbox"></th>
	            <th width="60">글번호</th>
	            <th width="700">공지사항 제목</th>
	            <th width="100">날짜</th>
	            <th width="60">글상태<br>(Y/N)</th>
			  </tr>
			</thead>
			<tbody>
				<tr align="center">
					<td><input type="checkbox"></td>
					<td>30</td>
					<td><a href="">공지사항 제목입니다.</a></td>
					<td>2021-06-09</td>
					<td>Y</td>
				</tr>
				<tr align="center">
					<td><input type="checkbox"></td>
					<td>30</td>
					<td><a href="">공지사항 제목입니다.</a></td>
					<td>2021-06-09</td>
					<td>Y</td>
				</tr>
				<tr align="center">
					<td><input type="checkbox"></td>
					<td>30</td>
					<td><a href="">공지사항 제목입니다.</a></td>
					<td>2021-06-09</td>
					<td>Y</td>
				</tr>
			</tbody>
		</table>
	    <br>

	    <!-- 페이징 바 추가예정 -->
		
    </div>

    <br><br>

    <!-- 푸터바 포함 -->
    <jsp:include page=""/>

</body>
</html>