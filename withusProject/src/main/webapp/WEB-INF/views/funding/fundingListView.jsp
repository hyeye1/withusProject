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

		<div class="outer">
			<div class="inner">
			   <c:forEach var="c" items="${ cList }">
				  <table class="cateTable" align="center">
					 <tr>
						<td>
							<div class="cateImage"><img class="cateFile" src="${ c.catFile }">
									<input type="hidden" class="cno" value="${ c.catNo }">
							</div>
						</td>
					 </tr>
					 <tr>
						<td height="40" ><div class="cateText">${ c.catName }</div></td>
					 </tr>
				  </table>
			   </c:forEach>
			</div>
		 </div>

		<div class="fundingList" id="fundingList">
			<c:choose>
		        <c:when test="${ catNo eq 1 }">
					<span class="title"><h3>전체보기</h3></span>
		        </c:when>
		        <c:when test="${ catNo eq 2 }">
					<span class="title"><h3>패션·잡화</h3></span>
		        </c:when>
		        <c:when test="${ catNo eq 3 }">
					<span class="title"><h3>뷰티</h3></span>
		        </c:when>
		        <c:when test="${ catNo eq 4 }">
					<span class="title"><h3>푸드</h3></span>
		        </c:when>
		        <c:when test="${ catNo eq 5 }">
					<span class="title"><h3>홈리빙</h3></span>
		        </c:when>
		        <c:when test="${ catNo eq 6 }">
					<span class="title"><h3>디자인소품</h3></span>
		        </c:when>
		        <c:when test="${ catNo eq 7 }">
					<span class="title"><h3>여행·레저</h3></span>
		        </c:when>
		        <c:when test="${ catNo eq 8 }">
					<span class="title"><h3>스포츠</h3></span>
		        </c:when>
		        <c:when test="${ catNo eq 9 }">
					<span class="title"><h3>반려동물</h3></span>
		        </c:when>
		        <c:when test="${ catNo eq 10 }">
					<span class="title"><h3>테크·가전</h3></span>
		        </c:when>
		        <c:otherwise>
		        	<span class="title"><h3>검색결과</h3></span>
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
			$(".cateImage").click(function(){
				location.href="list.fun?catNo=" + $(this).children(".cno").val();
			   
			})
		})	
			
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