<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #menuEnrollForm>table{width:100%;}
        #menuEnrollForm>table *{ margin:5px;}
        .h3{ padding : 20%;}
</style>
</head>
<body>

	<!-- 해더바 -->
	<jsp:include page="../common/manaHeader.jsp"/>
	
	<br>
	<h3><b>카테고리 등록</b></h3>
	<hr><br>
	
	<div class="container">
	
		<form id="menuEnrollForm" method="get" action="insert.cate" enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<th align="center"><label for="name">카테고리명</label></th>
					<td><input type="text" id="catName" class="form-control" name="catName" required></td>
				</tr>
				<tr>
					<th align="center"><label for="name">태그</label></th>
					<td><input type="text" id="catTag" class="form-control" name="catTag"></td>
				</tr>
			</table>
			<br>
			
			<div align="center">
		        <button type="submit" class="btn btn-primary">등록하기</button>
		        <button type="reset" class="btn btn-danger">취소하기</button>
	        </div>
		</form>
	
	</div>

</body>
</html>