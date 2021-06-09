<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin With Us</title>
</head>
<body>

	<!-- 6/9 윤경 생성-->
    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

    <h2>공지사항</h2>
    <hr><br>

	<div class="container">
	    <!-- 표 N행 6열 -->
	    <table border="1" id="listView">
	        <tr style="background-color: rgb(224, 224, 224);">
	            <th width="50" height="30"><input type="checkbox"></th>
	            <th width="60">글번호</th>
	            <th width="700">공지사항 제목</th>
	            <th width="100">날짜</th>
	            <th width="60">글상태<br>(Y/N)</th>
	        </tr>
	        <tr>
	            <td><input type="checkbox"></td>
	            <td>30</td>
	            <td>공지사항 제목입니다.</td>
	            <td>2021-06-09</td>
	            <td>Y</td>
	        </tr>
	        <tr>
	            <td><input type="checkbox"></td>
	            <td>29</td>
	            <td>공지사항 제목입니다.</td>
	            <td>2021-06-09</td>
	            <td>Y</td>
	        </tr>
	        <tr>
	            <td><input type="checkbox"></td>
	            <td>28</td>
	            <td>공지사항 제목입니다.</td>
	            <td>2021-06-09</td>
	            <td>Y</td>
	        </tr>
	    </table>
	    <br>
	
	    <button>수정</button> <button>삭제</button>
	
	    <!-- 페이징 바 추가예정 -->
    </div>

</body>
</html>