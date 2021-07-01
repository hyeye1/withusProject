<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{box-sizing: border-box;}
	.innerOuter{
     	display:"flex";
	    border:3px solid blue;
	    width:800px;
	    margin:auto;
	}
    .titleArea{
        border: 3px solid red;
        background-color: rgb(220, 170, 128);
    }
    .back a{
        text-decoration: none;
        font-size: 12px;
        color: white;
    }
    .title{
        font-size: 20px;
        font-weight: bold;
        color: white;
        margin: auto;
    }
</style>
<body>

	<jsp:include page="../common/header.jsp"/>
	<hr>
	
	<div class="innerOuter">

        <div class="titleArea">
            <div class="back" style="width: 15%; background-color: plum;" align="left"><a href=""> < 스토리로 돌아기기</a></div>
            <div class="title" style="width: 70%; background-color: plum;" align="center">펀딩 제목</div>
            <div style="width: 14%;"></div>
        </div>

        <div class="checkReward">
            <table>
                <tr>
                    <td colspan="2">펀딩 제목</td>
                </tr>
                <tr>
                    <td colspan="2">펀딩 내용</td>
                </tr>
                <tr>
                    <td>옵션</td>
                    <td>수량</td>
                </tr>
                <tr>
                    <td colspan="2">펀딩가격 * 수량</td>
                </tr>
                <tr>
                    <td>추가 후원금</td>
                    <td>10000원</td>
                </tr>
            </table>
        </div>

        <div class="checkMoney">

            <table>
                <tr>
                    <td>펀딩 금액</td>
                    <td>2232323232</td>
                </tr>
                <tr>
                    <td>추가 후원금</td>
                    <td>2323232323232</td>
                </tr>
                <tr>
                    <td>최종 결제금액</td>
                    <td>323232323232323232323232</td>
                </tr>
            </table>

        </div>
        
	</div>        
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>