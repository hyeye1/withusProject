<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin With Us</title>
<style>
	#blind{ padding:20% }
</style>
</head>
<body>
	
	<!-- 6/9 윤경 생성, 수정 예정 (틀만 잡아놈) -->
	<!-- 6/10 윤경 라디오버튼 수정 -->
	<!-- 6/22 윤경 전체적 div 수정-->
	<!-- 6/28 윤경 전체적 ui 변경 -->
	<!-- 7/6 윤경 ui 변경 -->

	<!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

	<div class="container">
	    <div class="outer" id="categoryListView">
	        <br><br>
	
	        <h2 class="contnent-title">
				<span class="blind">메뉴 관리 </span>
			</h2>
	        <hr>
	
			<!-- 테이블로 묶어서 섹션 만든 후 라디오 그룹 만들기 -->
			<div class="cateList" style="display:inline-flex">
				<table cellspacing="0" class="table1">
					<colgroup>
					<col class="coll">
					<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">카테고리 정렬</th>
							<td>
								<input type="radio" name="cateRadio" class="inputRadioCate3" onclick="$('frmPageSize').value=this.value;" value="3"> <label for="cate_01" class="mgr2">3개</label>
								<input type="radio" name="cateRadio" class="inputRadioCate5" onclick="$('frmPageSize').value=this.value;" checked="checked" value="5"> <label for="cate_02" class="mgr2">5개</label>
								<input type="radio" name="cateRadio" class="inputRadioCate7" onclick="$('frmPageSize').value=this.value;" value="7"> <label for="cate_03" class="mgr2">7개</label>
								<input type="radio" name="cateRadio" class="inputRadioCate10" onclick="$('frmPageSize').value=this.value;" value="10"> <label for="cate_04" class="mgr2">10개</label>
							</td>
						</tr>
					</tbody>
				</table>
				<br>				
			</div>
			<br><br>
			<div class="tagList" style="display: inline-flex;">
				<table cellspacing="0" class="table2">
					<colgroup>
					<col class="coll">
					<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">태그 정렬</th>
							<td>
								<input type="radio" name="tagRadio" class="inputRadioTag1" onclick="$('frmPageSize').value=this.value;" value="1"> <label for="tag_01" class="mgr3">3개</label>
								<input type="radio" name="tagRadio" class="inputRadioTag3" onclick="$('frmPageSize').value=this.value;" checked="checked" value="3"> <label for="tag_02" class="mgr3">5개</label>
								<input type="radio" name="tagRadio" class="inputRadioTag5" onclick="$('frmPageSize').value=this.value;" value="5"> <label for="tag_03" class="mgr3">7개</label>
								<input type="radio" name="tagRadio" class="inputRadioTag10" onclick="$('frmPageSize').value=this.value;" value="10"> <label for="tag_04" class="mgr3">10개</label>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
			</div>

			<hr>
			<br>
			<div class="btn" align="right">
				<a class="btn btn-primary" href="enrollForm.cate">추가</a>
			</div>
			<br><br>

			<table class="table table-bordered" >
				<c:choose>
					<c:when test="${ empty list }">
						<div class="none">카테고리가 존재하지 않습니다.</div>
					</c:when>
					
					<c:otherwise>
						<thead>
						  <tr align="center" style="height: 10px; background-color: rgb(224, 224, 224); font-size:smaller ;">
							<th width="100" height="30">카테고리<br>번호</th>
							<th width="300">카테고리명</th>
							<th width="300">해시태그</th>
							<th width="200">수정/삭제</th>
						  </tr>
						</thead>
		
						<!-- 반복문으로 조회 -->
						<tbody>
							<c:forEach var="ct" items="${ list }">
								<tr align="center">
									<td>${ ct.catNo }</td>
									<td>${ ct.catName }</td>
									<td>${ ct.catTag }</td>
									<td>
										<a class="btn btn-primary" herf="updateForm.cate">수정</a>
										<a class="btn btn-danger" herf="delete.cate">삭제</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:otherwise>
				</c:choose>
			</table>
			
    </div>

</body>
</html>