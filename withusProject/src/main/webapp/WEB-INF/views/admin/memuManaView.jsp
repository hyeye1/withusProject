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
	
	<!-- 6/9 윤경 생성, 수정 예정 (틀만 잡아놈) -->
	<!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>


	<div class="container">
	    <div class="outer">
	        <br><br>
	
	        <h2>메뉴 관리</h2>
	        <hr>
	
	        <h3>카테고리 정렬</h3>
	        <input type="radio" id="cateSelect1"><label for="cateSelect1">3개</label>
	        <input type="radio" id="cateSelect2"><label for="cateSelect2">5개</label>
	        <input type="radio" id="cateSelect3"><label for="cateSelect3">7개</label>
	        <input type="radio" id="cateSelect4"><label for="cateSelect4">10개</label>
	
	        <h3>태그 정렬</h3>
	        <input type="radio" id="tagSelect3"><label for="tagSelect3">1개</label>
	        <input type="radio" id="tagSelect1"><label for="tagSelect1">3개</label>
	        <input type="radio" id="tagSelect2"><label for="tagSelect2">5개</label>
	        <input type="radio" id="tagSelect4"><label for="tagSelect4">10개</label>
	        <hr>
	
	        <h3>카테고리 관리 / 설정</h3>
	
	
	
	
	    </div>
    
    </div>

</body>
</html>