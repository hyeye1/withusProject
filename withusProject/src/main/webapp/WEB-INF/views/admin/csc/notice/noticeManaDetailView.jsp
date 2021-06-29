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
<title>Admin With Us</title>
<style>
	.noticeDetail>tr>th{
		align-content: center;
	}
</style>
</head>
<body>

	
    <!-- 6/9 윤경 생성-->
	<!-- 6/12 윤경 수정-->
	<!-- 6/17 윤경 수정 -->

    <!-- 메뉴바 포함 -->
    <jsp:include page="../../../common/manaHeader.jsp"/>

    <h2>공지사항 상세보기</h2>
    <hr><br>

	<div class="container">

		<table class="table table-bordered noticeDetail">
			<thead>
			  <tr>
				<th style="width: 300px;">제목</th>
	            <td>공지사항 입니다.</td>
			  </tr>
			</thead>
			<tbody>
				<tr>
					<th>작성자</th>
					<td>관리자1</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>2021-06-09</td>
				</tr>
				<tr>
					<td colspan="2"><textarea required style="width:1000px; height: auto;">ddd</textarea></td>
				</tr>
			</tbody>
		</table>

	    <br>

		<!-- 관리자 로그인시에만 보이는 버튼 -->
		<div class="edit" align="right" style="padding-right: 200px;">
			<button>수정</button> <button>삭제</button>
		</div>

	    <br><br>

		<div class="list" align="center">
			<button>목록</button>
		</div>
    </div>
	

</body>
</html>