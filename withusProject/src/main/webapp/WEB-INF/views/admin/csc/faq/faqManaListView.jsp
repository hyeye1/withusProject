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

    .title{
        width:600px;
        height:50px;
        text-align:center;
        line-height:30px;
        border:1px solid rgb(178, 185, 223);
        background: rgb(178, 185, 223);
        border-radius:5px;
        cursor:pointer;
        font-weight:150%;
    }
    
    .hide{
    	width:600px;
    	height:150px;
    	border:1px solid lightgray;
    	border-radius:5px;
    	display:none;
    }
    
    
    
    
</style>
</head>
<body>
	
    <!-- 해더바 포함 -->
    <jsp:include page="../../../common/manaHeader.jsp"/>

    

	<div class="container">
		<br>
		<h3><b>FAQ</b></h3>
    	<hr><br>
        <div class="selectbtn" align="center">
            <a class="btn btn-outline-secondary" style="height: 50px; width: 150px;" href="faqList.mana">전체보기</a> &nbsp;&nbsp;
            <a class="btn btn-outline-secondary" style="height: 50px; width: 150px;" href="manaFunding.faq">펀딩상품관련</a> &nbsp;&nbsp;
            <a class="btn btn-outline-secondary" style="height: 50px; width: 150px;" href="manaDelivery.faq">배송관련</a> &nbsp;&nbsp;
            <a class="btn btn-outline-secondary" style="height: 50px; width: 150px;" href="manaExchange.faq">교환/반품관련</a> &nbsp;&nbsp;
            <a class="btn btn-outline-secondary" style="height: 50px; width: 150px;" href="manaEtc.faq">기타관련</a>
        </div>
        <br><br><br>

			<div>
				<a href="manaEnrollForm.faq" class="btn btn-secondary">등록</a>
			</div> <br>
		
		<div class="faqTable">
			<c:choose>
				<c:when test="${ empty listM }">
			        <!-- 게시글 없을 시 -->
			        <div class="faqN" align="center">
			            <p>FAQ가 없습니다.</p>
			        </div>
	        	</c:when>
				<c:otherwise>
			        <!-- 게시글 있을 시-->
				    <div class="faqY" align="center">
				        <c:forEach var="fM" items="${ listM }">
				            <div class="faqCon">
				            	<table class="table table-bordered">
				            	<input type="hidden" name="faqNoM" value="${ fM.faqNo }" >
				            		<tr class="title">
				            			<th width="5%">Q</th>
				            			<th width="15%">${ fM.faqCat }</th>
				            			<th>${ fM.faqTitle }</th>
				            		</tr>
				            		<tr class="hide">
				            			<td colspan="3">
				            				<br>
				            				<div align="right">
				            					<b>글상태 : ${ fM.faqStatus }</b>
				            				</div> <br><br>
				            				${ fM.faqContent }
				            				<br>
					                        <div align="right" style="padding-right: 30px;">
												<a href="updateForm.faq?faqNo=${ fM.faqNo }" class="btn btn-warning btn-sm">수정</a>
												<a href="delete.faq?fno=${ fM.faqNo }" class="btn btn-danger btn-sm" style="color:white;">삭제</a>
											</div>
				            			</td>
				            		</tr>
				            	</table>
				            </div>
			            </c:forEach>
			        </div>
	        	</c:otherwise>
	        </c:choose>
		</div>
	</div>
	
	<script>
		$(function(){
			$(".title").click(function(){
				// slideDown or slideUp
				var table = $(this).next("tr");
				
				if(table.is(":visible")){
					table.slideUp();
				} else{
					table.slideDown();
				}
			})
		})
	</script>

    <br><br>

</body>
</html>