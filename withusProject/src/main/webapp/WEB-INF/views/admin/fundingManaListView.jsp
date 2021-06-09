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
	
</style>
</head>
<body>

	
    <!-- 6/9 윤경 생성, 수정 예정 -->
    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

    <h2>펀딩 관리</h2>
    <hr><br>

	<div class="container">
	    <div class="selectOption" style="display:inline-flex;">
			<form action="test1">
				<select>
					<option value="ing">진행중인 펀딩</option>
					<option value="end">종료된 펀딩</option>
				</select>
			</form>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<form action="test2">
				<select>
					<option value="best">인기순</option>
					<option value="deadline">마감임박순</option>
					<option value="newest">최신순</option>
				</select>
			</form>
		</div>
	    <br><br>
	
	
	    <!-- 11행 9열 표만들기 (한 페이지 당 10개 조회) -->
	    <table border="1" id="listView">
	        <tr style="background-color: rgb(224, 224, 224);">
	            <th width="50" height="30">글번호</th>
	            <th width="110">카테고리</th>
	            <th width="500">제목</th>
	            <th width="100">파트너명</th>
	            <th width="60">달성률</th>
	            <th width="100">마감일</th>
	            <th width="70">좋아요<br>갯수</th>
	            <th width="60">펀딩상태<br>(Y/N)</th>
	            <th width="60">승인상태<br>(Y/N)</th>
	        </tr>
	        <tr>
	            <td>1123</td>
	            <td>테크/가전</td>
	            <td>펀딩 제목 입니다. 펀딩 제목 입니다.</td>
	            <td>가파트너</td>
	            <td>0%</td>
	            <td>2021-09-02</td>
	            <td>0</td>
	            <td>N</td>
	            <td>N</td>
	        </tr>
		</table>

		<br><br>

		<table class="table table-bordered">
			<thead>
			  <tr align="center" style="height: 10px; background-color: rgb(224, 224, 224);">
				<th width="80">글번호</th>
	            <th width="150">카테고리</th>
	            <th width="400">제목</th>
	            <th width="100">파트너명</th>
	            <th width="80">달성률</th>
	            <th width="120">마감일</th>
	            <th width="80">좋아요<br>갯수</th>
	            <th width="60">펀딩상태<br>(Y/N)</th>
	            <th width="60">승인상태<br>(Y/N)</th>
			  </tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>1123</td>
					<td>테크/가전</td>
					<td>펀딩 제목 입니다. 펀딩 제목 입니다.</td>
					<td>가파트너</td>
					<td>0%</td>
					<td>2021-09-02</td>
					<td>0</td>
					<td>N</td>
					<td>N</td>
				</tr>
				<tr align="center">
					<td>1123</td>
					<td>스포츠/모빌리티</td>
					<td>펀딩 제목 입니다. 펀딩 제목 입니다.</td>
					<td>가파트너</td>
					<td>0%</td>
					<td>2021-09-02</td>
					<td>0</td>
					<td>N</td>
					<td>N</td>
				</tr>
			</tbody>
		</table>


	
	    <!-- 페이징바 추가할 것 -->
	    
    </div>

	

</body>
</html>