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
    .pTitle{
		height:80px;
		font-weight: 600;
		font-size: 18px;
		margin-top: 5px;
	}
	.leftp{color: grey;}
	#dday{float:right;}
	 
	/* .outer div {outline:1px solid purple;} */
	.outer {margin:auto; margin-bottom:50px; width:1050px;}
	.inner {display:flex;}
   	.cateTable {margin-right:26px; text-align:center;}
	.cateTable:hover {cursor:pointer; opacity:0.5;}
 	.cateImage {width:80px; height:80px; border-radius:70%; overflow:hidden;}
	.cateImage:hover {}
   	.cateFile {width:100%; height:100%;}
	.cateText:hover {}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	<hr>

	<div class="innerOuter">

		<div class="fundingList" id="fundingList">
			<c:choose>
		        <c:when test="${ menu eq 'famous' }">
					<span class="title"><h3>인기 추천 프로젝트</h3></span>
		        </c:when>
		        <c:when test="${ menu eq 'eve' }">
					<span class="title"><h3>성공 임박 프로젝트</h3></span>
		        </c:when>
		        <c:when test="${ menu eq 'new' }">
					<span class="title"><h3>신규 추천 프로젝트</h3></span>
		        </c:when>
		        <c:otherwise>
		        	<span class="title"><h3>공개예정 프로젝트</h3></span>
		        </c:otherwise>
		    </c:choose>
				
				
			<hr>
			<c:forEach var="p" items="${ list }">
		        <div class="thumbnail" id="thumbnail" align="center">
		            <input type="hidden" class="pno" value="${ p.projectNo }">
					<input type="hidden" value="${ p.projectGprice }">
					<input type="hidden" value="">
		            	
		            <img src="${ p.projectThum }" width="270" height="230">

					<div class="pTitle" align="left">
						${ p.projectTitle } <br>
					</div>
		            <p class="leftp" align="left">
		                ${ p.catName } | ${ p.partnerName }<br>
		                <c:choose>
		                	<c:when test="${ p.dday >= 0 }">
								<span id="percent">${ p.percentage }%</span>&nbsp;&nbsp;&nbsp;<span id="totalPrice">${ p.totalPrice }</span>원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="dday">D-${ p.dday }</span>
		            		</c:when>
		            		<c:otherwise>
		            			<span id="percent">${ p.percentage }%</span>&nbsp;&nbsp;&nbsp;<span id="totalPrice">${ p.totalPrice }</span>원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>펀딩종료</span>
		            		</c:otherwise>
		            	</c:choose>
		            </p>
		        </div>
	        </c:forEach>
		</div>	
	</div>
	
	<script>
			
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