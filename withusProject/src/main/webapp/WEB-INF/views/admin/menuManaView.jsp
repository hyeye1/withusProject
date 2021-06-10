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
	
	<!-- 6/9 윤경 생성, 수정 예정 (틀만 잡아놈) -->
	<!-- 6/10 윤경 라디오버튼 수정 -->

	<!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>


	<div class="container">
	    <div class="outer">
	        <br><br>
	
	        <h2>메뉴 관리</h2>
	        <hr>
	
			<div class="cateList" style="display:inline-flex">
				<h3>카테고리 정렬</h3> &nbsp;&nbsp;&nbsp;
				<div class="cateRadio" style="padding-top: 15px;">
					<input type="radio" name="cateRadio" id="cateSelect1"><label for="cateSelect1">3개</label>
					<input type="radio" name="cateRadio" id="cateSelect2"><label for="cateSelect2">5개</label>
					<input type="radio" name="cateRadio" id="cateSelect3"><label for="cateSelect3">7개</label>
					<input type="radio" name="cateRadio" id="cateSelect4"><label for="cateSelect4">10개</label>
				</div>
			</div>
			<br>
			<div class="tagList" style="display: inline-flex;">
				<h3>태그 정렬</h3> &nbsp;&nbsp;&nbsp;
				<div class="tagRadio" style="padding-top: 15px;">
					<input type="radio" name="tagRadio" id="tagSelect3"><label for="tagSelect3">1개</label>
					<input type="radio" name="tagRadio" id="tagSelect1"><label for="tagSelect1">3개</label>
					<input type="radio" name="tagRadio" id="tagSelect2"><label for="tagSelect2">5개</label>
					<input type="radio" name="tagRadio" id="tagSelect4"><label for="tagSelect4">10개</label>
				</div>
			</div>

			<hr>
	
	        <h3>카테고리 관리 / 설정</h3>
			<div>
				<button> + 카테고리 추가</button> &nbsp; <button class="deleteBtn"> - 삭제</button>
				<br><br>
				<textarea style="width: 400px; height: 500px;"> <!-- 이거 뭐야 왜 이래-->
					<pre>
						<p>전체보기</p>
					</pre>
				</textarea>
			</div>
	
	
	
	    </div>
    
    </div>

</body>
</html>