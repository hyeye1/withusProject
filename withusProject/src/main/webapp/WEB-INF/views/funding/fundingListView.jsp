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
	    width:1200px;
	    margin:auto;
	}
	.category1{
		margin: auto;
		width: 80%;
		height: 100px;
	}
	.fundingList{
		margin: auto;
		width: 80%;
	}
	.thumbnail{
        display: inline-block;
		width: 30%;
        margin:14px;
        margin-top:10px;
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

		<div class="category1">
			

			
		</div>

		<div class="fundingList" id="fundingList">
			<h3>전체보기</h3>
			<hr>
			<c:forEach var="p" items="${ list }">
		        <div class="thumbnail" id="thumbnail" align="center">
		            <input type="hidden" class="pno" value="${ p.projectNo }">
					<input type="hidden" value="${ p.projectGprice }" id="gPrice">
					<input type="hidden" value="">
		            	
		            <img src="${ p.projectThum }" width="270" height="230">
		            <p align="left">
		                ${ p.projectTitle } <br>
		                ${ p.catNo } | ${ p.memberNo }<br>
						<span id="percent"></span>&nbsp;&nbsp;&nbsp;<span id="totalPrice">${ p.totalPrice }</span>원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="dDay">2일 남음</span>
		            </p>
		        </div>
	        </c:forEach>
		</div>	
	</div>
	
	<script>
		
	 	var percent = 0;
	 	var totalPrice = 0;
	 	var gPrice = 0;
	 	
	 	totalPrice = parseInt($("#totalPrice").text());
	 	gPrice = parseInt(document.getElementById("gPrice").value);
	 	
	 	percent = totalPrice / gPrice * 100;
	 	
	 	console.log(totalPrice);
	 	console.log(gPrice);
	 	
		document.getElementById("percent").innerHTML = percent;
		
		$(function(){
    		$("#fundingList #thumbnail").click(function(){
    			location.href="detail.fd?pno=" + $(this).children(".pno").val();
    		})
    	})
	</script>

	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>