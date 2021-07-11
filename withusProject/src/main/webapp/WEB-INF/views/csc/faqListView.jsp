<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>With Us</title>
<style>

    .enrollBtn{
        padding-right: 20%;
    }
    .according_list>li{
		list-style: none;
	}
	
</style>
</head>
<body>
	
	<!-- 6/12 윤경 생성-->
    <!-- 해더바 포함 -->
    <jsp:include page="../common/header.jsp"/>

    <h2>FAQ</h2>
    <hr><br>

	<div class="container">
        <div class="btn" align="center">
            <button type="button" class="btn btn-outline-secondary" style="height: 50px; width: 150px;">전체보기</button> &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-secondary" style="height: 50px; width: 150px;">펀딩상품관련</button> &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-secondary" style="height: 50px; width: 150px;">배송관련</button> &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-secondary" style="height: 50px; width: 150px;">교환/반품관련</button> &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-secondary" style="height: 50px; width: 150px;">기타관련</button>
        </div>
        <br><br><br>

		<c:choose>
			<c:when test="${ empty f.faqContent }">
		        <!-- 게시글 없을 시 -->
		        <div class="faqN" align="center">
		            <p>FAQ가 없습니다. 등록해주세요.</p>
		        </div>
        	</c:when>
			<c:otherwise>
		        <!-- 게시글 있을 시-->
		        <div class="faqY" align="center">
		            <div class="faqCon">
		                <ul class="accodrding_list">
		                    <li>
		                        <button type="button" class="btn btn-light titleBtn" data-toggle="collapse" data-target="#faqContent" style="width:80%;">
		                            <span id="faqCat" name="faqCat" style="width: 25%;">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ f.faqCat }</span> 
		                            <span id="faqTitle" name="faqTitle" style="width: 60%;">${ f.faqTitle } </span>
		                            <span style="width: 15%;">▼</span>
		                        </button>
		                        <div id="faqContent" name="faqContent" class="collapse" style="background-color: rgb(224,224,224); width:80%;">
		
		
		                            <p align="left" style="padding-left: 5%;">
		                                <br><textarea colspan=10>${ f.faqContent }</textarea><br><br>
		                            </p>
		                        </div>
		                    </li>
		                </ul>
		            </div>
		        </div>
        	</c:otherwise>
        </c:choose>
	</div>

    <br><br>

    <!-- 푸터바 포함 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>