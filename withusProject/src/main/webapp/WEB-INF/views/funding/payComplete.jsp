<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
    div{box-sizing: border-box;}

	/* 타이틀 */
    .titleArea{height: 50px; background-color: rgb(220, 170, 128); margin-top: -17px;}
    .titleArea div{float:left;}
	.back{height: 100%; width: 15%; padding: 13px 0 0 10px;}
    .back a{text-decoration: none; font-size: 15px; color: white !important;}
    .title{width: 70%; height: 100%; font-size: 20px; font-weight: bold; color: white; padding-top: 10px;}
	.empty{width: 15%; height: 100%;}
    
    /* 버튼 */
    .buttonArea{text-align: center !important;}
	.btn-primary {width: 150px; margin-top: 35px;}

    /* 컨텐츠 */
	.innerOuter{width: 1000px; margin: auto; padding: 50px 50px;}

    /* 1구역 */
    .content1{margin: 0px 0 50px 0;}
    #table1 {margin-bottom: 0;}
    #table1 tr, #table2 tr {height: 60px;}
    #table1 th, #table1 td, #table2 th, #table2 td {font-size: larger;} 
    #table1 td, #table2 td {text-align: right;}
    #table2{background-color: rgb(242, 242, 242); padding: 40px 0 0 40px !important;}

    /* 2구역 */
    .content2 h3{font-weight: 700; margin-bottom: 15px;}
    #table3, #table4 {width: 440px; padding: 20px 20px 20px 20px;}
    #table3 {background-color: rgb(238, 238, 238); margin-right: 20px;}
    #table4 {background-color: rgb(224, 224, 224);}

    /* 약관동의 */
    .content3 {margin-top: 50px;}
    .content3 h3 {font-weight: 700; margin-bottom: 15px;}
    #table5 th {padding-left: 35px !important; height: 50px;}
    
	.orderFinish {width: 900px; height: 300px; padding-top: 100px;}
	.orderFinish h1 {
		width: 500px; height: 100px; margin: auto; padding-top: 25px; text-align: center; 
		border-radius: 0.2em; background-color: rgb(94, 94, 94); color: white;} 
</style>
<body>

	<jsp:include page="../common/header.jsp"/>
	<hr>
	
    <div class="titleArea">
        <div class="back" align="left"><a href=""> < 스토리로 돌아가기</a></div>
        <div class="title" align="center">
        	<span>${ o.projectName }</span>
        </div>
        <div class="empty"></div>
    </div>
	
	<c:if test="${ !empty loginUser }">
	
	    <form action="pay.fun" id="sss">
	    
	        <div class="innerOuter">

				<div class="orderFinish">
					<h1>결제가 완료되었습니다.</h1>
				</div>

	            <div class="content1">
	                <table id="table1" class="table table-borderless">
	                    <tr style="border-top: 1px solid darkgray;">
	                        <th colspan="2" style="color: rgb(52, 152, 219); font-size: 22px; font-weight: 800;">
	                            ${ o.rewardTitle }
	                        </th>
	                    </tr>
	                    <tr>
	                        <td colspan="2" style="text-align: left !important;">${ o.rewardContent }</td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">수량 : ${ o.orderCount }개</td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">옵션 : ${ o.orderOption }</td>
	                    </tr>
	                    <tr style="border-top: 1px solid darkgray;">
	                        <th>추가 후원금</th>
	                        <td>${ o.orderPlus }원</td>
	                    </tr>
	                    <tr style="border-top: 1px solid darkgray; border-bottom: 1px solid darkgray;">
	                        <th>배송비</th>
	                        <td>0원</td>
	                    </tr>
	                </table>
	                <table id="table2" class="table table-borderless">
	                    <tr>
	                        <th>펀딩금액</th>
	                        <td>${ fd.rewardPrice * o.orderCount }원</td>
	                    </tr>
	                    <tr>
	                        <th>추가 후원금</th>
	                        <td>${ o.orderPlus }원</td>
	                    </tr>
	                    <tr>
	                        <th>배송비</th>
	                        <td>0원</td>
	                    </tr>
	                    <tr>
	                        <th style="color: rgb(52, 152, 219);">최종 결제금액</th>
	                        <td class="totalPrice" style="color: rgb(52, 152, 219);">
	                        	<span>${ fd.rewardPrice * o.orderCount + o.orderPlus}</span>원
	                        </td>
	                    </tr>
	                </table>

					<div class="buttonArea">
						<a class="btn btn-primary btn-lg" href="${ pageContext.request.contextPath }">홈으로</a>
					</div>
				</div>
	        </div>
		</form>
	</c:if>
</body>
</html>