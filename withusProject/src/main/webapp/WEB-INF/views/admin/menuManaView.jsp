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
	
	<!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

	<div class="container">
	    <div class="outer" id="categoryListView">
	        <br><br>
	
	        <h2 class="contnent-title">
				<span class="blind">메뉴 관리 </span>
			</h2>
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
										<a class="btn btn-primary" href="updateForm.cate?catNo=${ ct.catNo }">수정</a>
										<a class="btn btn-danger" href="delete.cate?cno= ${ct.catNo}">삭제</a>
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