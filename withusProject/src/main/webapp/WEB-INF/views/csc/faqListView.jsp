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

	.according_list>li{
		list-style: none;
	}
	
    .title{
        width:600px;
        height:50px;
        text-align:center;
        line-height:30px;
        border:1px solid lightgray;
        border-radius:5px;
        cursor:pointer;
        font-weight:150%;
    }
    
    .content{
    	width:600px;
    	height:150px;
    	border:1px solid rgb(178, 185, 223);
    	background: rgb(178, 185, 223);
    	border-radius:5px;
    }
    
    .btn{
    	height
    }
    
</style>
</head>
<body>
	
	<!-- 6/12 윤경 생성-->
    <!-- 해더바 포함 -->
    <jsp:include page="../common/header.jsp"/>

    <h3><b>FAQ</b></h3>
    <hr><br>

	<div class="container" align="center">
        <div class="btn" align="center">
            <a class="btn btn-outline-secondary" style="height: 50px; width: 150px;" value="1">전체보기</a> &nbsp;&nbsp;
            <a class="btn btn-outline-secondary" style="height: 50px; width: 150px;" value="2">펀딩상품관련</a> &nbsp;&nbsp;
            <a class="btn btn-outline-secondary" style="height: 50px; width: 150px;" value="3">배송관련</a> &nbsp;&nbsp;
            <a class="btn btn-outline-secondary" style="height: 50px; width: 150px;" value="4">교환/반품관련</a> &nbsp;&nbsp;
            <a class="btn btn-outline-secondary" style="height: 50px; width: 150px;" value="5">기타관련</a>
        </div>
        <br><br><br>

		<c:if test="${ loginUser.memberStatus eq 'A' }">
			<div>
				<a href="enrollForm.faq" class="btn btn-secondary">등록</a>
			</div>
		</c:if><br>
		
		<c:choose>
			<c:when test="${ empty list }">
		        <!-- 게시글 없을 시 -->
		        <div class="faqN" align="center">
		            <p>FAQ가 없습니다.</p>
		        </div>
        	</c:when>
			<c:otherwise>
		        <!-- 게시글 있을 시-->
			    <div class="faqY" align="center">
			        <c:forEach var="f" items="${ list }">
			            <div class="faqCon">
			                <ul class="accodrding_list">
			                    <li>
			                        <div class="title">
			                        	<input type="hidden" value="${ f.faqCat }">
			                            <span id="faqTitle" name="faqTitle">${ f.faqTitle } </span>
			                        </div>
			                        <div class="content">
			                            <p id="faqContent" name="faqContent" align="left" style="padding-left: 5%;">
			                                <br>${ f.faqContent }<br>
			                                
			                                <c:if test="${ loginUser.memberStatus eq 'A' }">
				                                <div align="right" style="padding-right: 30px;">
													<a href="update.faq?faqNo=${ f.faqNo }" class="btn btn-warning btn-sm">수정</a>
													<a href="delete.faq?fno=${ f.faqNo }" class="btn btn-danger btn-sm" style="color:white;">삭제</a>
												</div>
											</c:if>
			                            </p>
			                        </div>
			                    </li>
			                </ul>
			            </div>
		            </c:forEach>
		        </div>
        	</c:otherwise>
        </c:choose>
	</div>
	
	<script>
		$(function(){
			$(".title").click(function(){
				// slideDown or slideUp
				var $box = $(this).next();
				
				if($box.css("display") == "none"){
					$(this).siblings("box").slideUp();
					$box.slideDown();
				} else{
					$box.slideUp();
				}
			})
		})
	</script>

    <br><br>

    <!-- 푸터바 포함 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>