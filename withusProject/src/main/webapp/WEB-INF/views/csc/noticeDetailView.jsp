<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Us</title>
<style>

</style>
</head>
<body>

	<!-- 6/12 윤경 생성-->

    <!-- 해더바 포함 -->
    <jsp:include page=""/>

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
	    <br><br>

		<div class="list" align="center">
			<button>목록</button>
		</div>
    </div>

    <!-- 푸터바 포함 -->
    <jsp:include page=""/>
	

</body>
</html>