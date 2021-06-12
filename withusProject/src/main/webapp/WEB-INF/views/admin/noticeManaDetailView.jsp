<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin With Us</title>
<style>

</style>
</head>
<body>

	
    <!-- 6/9 윤경 생성-->
	<!-- 6/12 윤경 수정-->

    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

    <h2>공지사항 상세보기</h2>
    <hr><br>

	<div class="container">
	    <table class="noticeDetail" border="1px"> <!-- 솔리드 왜 안되죠,, -->
	        <tr>
	            <th width="200" height="35">제목</th>
	            <td width="800" style="padding-left: 10px;">공지사항입니다.</td>
	        </tr>
	        <tr>
	            <th height="35">작성자</th>
	            <td style="padding-left: 10px;"">관리자1</td>
	        </tr>
	        <tr>
	            <th height="35">작성일</th>
	            <td style="padding-left: 10px;"">2021-06-09</td>
	        </tr>
	        <tr>
	            <td colspan="2"><textarea required style="width: 1000px; height:auto;"></textarea></td>
	        </tr>
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