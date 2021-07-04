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

	/* 타이틀 */
	.titleArea{outline: 1px solid red;}
    .titleArea{height: 50px; background-color: rgb(220, 170, 128);}
    .titleArea div{float:left;}
	.back{height: 100%; width: 15%; padding: 13px 0 0 10px;}
    .back a{text-decoration: none; font-size: 15px; color: white !important;}
    .title{width: 70%; height: 100%; font-size: 20px; font-weight: bold; color: white; padding-top: 10px;}
	.empty{width: 15%; height: 100%;}
    
    /* 버튼 */
    .btn-primary {color: white !important;}
    .buttonArea{text-align: center !important;}
    .buttonArea button {width: 200px;}

    /* 컨텐츠 */
    /* .innerOuter div {outline: 1px solid peru;} */
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

    /* input {height: 60x !important;} */

    /* 약관동의 */
    .content3 {margin-top: 50px;}
    .content3 h3 {font-weight: 700; margin-bottom: 15px;}
    #table5 th {padding-left: 35px !important; height: 50px;}
    
</style>
<body>

	<jsp:include page="../common/header.jsp"/>
	<hr>
	
    <div class="titleArea">
        <div class="back" align="left"><a href=""> < 스토리로 돌아가기</a></div>
        <div class="title" align="center">${ o.projectName }</div>
        <div class="empty"></div>
    </div>
	
	<c:if test="${ !empty loginUser }">
	    <form action="">
	        <div class="innerOuter">
	
	            <div class="content1">
	                <table id="table1" class="table table-borderless">
	                    <tr style="border-top: 1px solid darkgray;">
	                        <th colspan="2" style="color: rgb(52, 152, 219); font-size: 22px; font-weight: 800;">
	                            ${ fd.rewardTitle }
	                        </th>
	                    </tr>
	                    <tr>
	                        <td colspan="2" style="text-align: left !important;">${ fd.rewardContent }</td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">수량 : ${ o.orderCount }개</td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">옵션 : ${ o.orderOption } </td>
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
	                        <td style="color: rgb(52, 152, 219);">${ fd.rewardPrice * o.orderCount + o.orderPlus}원</td>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="content2" style="display: table;">
	                <div class="fundingSuppoter" style="display: table-cell;">
	                    <h3>펀딩 서포터</h3>
	                    <table id="table3" class="table table-borderless">
	                        <tr>
	                            <td colspan="2">이름</td>
	                        </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" value="${ loginUser.memberName }" readonly></td>
	                            <td></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">이메일 <button class="btn btn-primary" style="margin-left: 10px;">인증번호 발송</button></td>
	                        </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" value="jihwan@gmail.com" readonly></td>
	                            <td></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">이메일 인증번호</td>
	                        </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" placeholder="이메일을 입력해주세요"></td>
	                            <td><button class="btn btn-primary" style="width: 126.39px;">인증</button></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">환급받을 계좌정보 입력</td>
	                        </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" placeholder="ex) 국민은행"></td>
	                            <td></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control" placeholder="계좌번호를 입력해주세요"></td>
	                        </tr>
	                    </table>
	                </div>
	                <div class="rewardShippingAddress">
	                    <h3>리워드 배송지</h3>
	                    <table id="table4" class="table table-borderless">
	                        <tr>
	                            <td colspan="2">이름</td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">휴대폰 번호</td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">주소</td>
	                        </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" placeholder="우편번호"></td>
	                            <td><button class="btn btn-primary">우편번호 검색</button></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control" placeholder="도로명주소"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control" placeholder="상세주소"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control" placeholder="너는뭐냐"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">배송시 요청사항(선택)</td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control" placeholder="ex) 부재시 경비실에 보관해주세요"></td>
	                        </tr>
	                    </table>
	                </div>
	            </div>
	
	            <div class="content3">
	                <h3>약관 동의</h3>
	                <table id="table5" class="table">
	                    <tr>
	                        <th width="800">
	                            <label class="form-check-label">
	                                <input type="radio" class="form-check-input" name="optradio">전체 동의하기
	                            </label>
	                        </th>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <th>
	                            <label class="form-check-label">
	                                <input type="radio" class="form-check-input" name="optradio">제 3자에 대한 개인정보 제공 동의
	                            </label>
	                        </th>
	                        <td><a href="">보기</a></td>
	                    </tr>
	                    <tr>
	                        <th>
	                            <label class="form-check-label">
	                                <input type="radio" class="form-check-input" name="optradio">책임 규정에 대한 동의
	                            </label>
	                        </th>
	                        <td><a href="">보기</a></td>
	                    </tr>
	
	                </table>
	            </div>
	
	        </div> 
	
	        <div class="buttonArea">
	            <button type="submit" id="next" class="btn btn-primary" align="center">다음 단계로></button>
	        </div>
	        
	    </form>   

    </c:if>

    <br><br><br>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>