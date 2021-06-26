<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	div{box-sizing: border-box;}
	.innerOuter{
     	display:"flex";
	    border:3px solid blue;
	    width:1200px;
	    margin:auto;
	}
	.category{
		border: 3px solid red;
		margin: auto;
		width: 80%;
		height: 100px;
	}
	.fundingList{
		border: 3px solid red;
		margin: auto;
		width: 80%;
	}
	.thumbnail{
        display: inline-block;
		border: 3px solid pink;
		width: 30%;
        margin:14px;
        margin-top:px;
	}
	.thumbnail:hover{
        cursor:pointer;
        opacity:0.5;
    }
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	<hr>

	<div class="innerOuter">

		<div class="category">
			
		</div>

		<div class="fundingList">
			<h3>전체보기</h3>
			<hr>
			<c:forEach var="p" items="${ list }">
		        <div class="thumbnail" align="center">
		            <input type="hidden" value="${ p.projectNo }">
					<input type="hidden" value="">
					<input type="hidden" value="">
		            	
		            <img src="${ p.projectThum }" width="270" height="230">
		            <p align="left">
		                ${ p.projectTitle } <br>
		                ${ p.catNo } | ${ p.memberNo }<br>
						7193%&nbsp;&nbsp;&nbsp;${ p.totalPrice }원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2일 남음
		            </p>
		        </div>
	        </c:forEach>
		</div>	
	</div>

	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>