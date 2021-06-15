<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.innerOuter{
	        border:1px solid lightgray;
	        width:80%;
	        margin:auto;
	        padding:5% 10%;
	        background:white;
	    }
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	<hr>

	<div class="innerOuter" style="padding:5% 10%;">

		<div class="category">
		
		</div>

		<br><br>

		<div class="fundingList">
			<h3>전체보기</h3>
			<hr>
			<div class="listArea" align="center">
	            <div class="thumbnail" align="center">
	            	<input type="hidden" value="">
					<input type="hidden" value="">
					<input type="hidden" value="">
	            	
	                <img src="" width="300" height="300">
	                <p align="left">
	                    [1억앵콜] 양치 3번으로 치아를 깍지 않고 하얗게 쭉~ 유지하세요! <br>
	                    뷰티 | 팀스모어<br>
						7193%&nbsp;&nbsp;&nbsp;35,967,600원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2일 남음
	                </p>
	            </div>
		</div>

	</div>

	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>