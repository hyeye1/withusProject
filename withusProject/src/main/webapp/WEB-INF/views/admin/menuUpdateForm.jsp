<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #menuUpdateForm>table{width:100%;}
        #menuUpdateForm>table *{ margin:5px;}
        .h3{ padding : 20%;}
</style>
</head>
<body>

	<!-- 해더바 -->
	<jsp:include page="../common/manaHeader.jsp"/>
	
	<br>
	<h3><b>카테고리 수정</b></h3>
	<hr><br>
	
	<div class="container">
	
		<form id="menuUpdateForm" method="post" action="update.cate" enctype="multipart/form-data">
			<input type="hidden" id="catNo" name="catNo" value="${ ct.catNo }">
			<table class="table table-bordered">
				<tr>
					<th align="center"><label for="name">카테고리명</label></th>
					<td><input type="text" id="catName" class="form-control" name="catName" value="${ ct.catName }" required></td>
				</tr>
				<tr>
					<th align="center"><label for="tag">태그</label></th>
					<td><input type="text" id="catTag" class="form-control" name="catTag" value="${ ct.catTag }"></td>
				</tr>
			</table>
			<br>
			
			<div align="center">
		        <button type="submit" class="btn btn-primary">수정하기</button>
		        <button type="reset" class="btn btn-danger">취소하기</button>
	        </div>
		</form>
	
	</div>

</body>
</html>