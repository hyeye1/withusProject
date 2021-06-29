<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin With Us</title>
<style>

	.container table tr th{background-color: rgb(238, 238, 238);}
    .data1{margin: 60px 0;}
    .tableName{float: left; font-size: 18px; font-weight: 550;}
    .table.table-bordered th{background-color: #eaeaea;}
    table *{text-align: center; font-size: 16px;}
    table td{text-align: left;}
    .table th {padding: .55rem; vertical-align: inherit;}

    .btn-sm{ border: none;outline: none;background-color: rgb(44, 62, 80);color: white;}
    .btn-sm:hover{outline: none; border: none;}
    
    .button_area{float: right; margin: 150px 60px;}
    .button_area button{margin: 0 10px;}
    .btn.btn-withus{background-color: #3498db; color: white;}
    .btn.btn-withus:hover{cursor: pointer; background-color: #2c83be; color: white;}

    /* modal */
    .modal-header.none, .modal-footer.none{border: none;}
    .modal-footer button.btn.btn-secondary{ width: 47%; float: left;}
    .modal-footer button.btn.btn-withus{ width: 47%;}

</style>
</head>
<body>
	<!-- header -->
    <jsp:include page="../common/manaHeader.jsp"/>

     <div class="content_wrap" align="center">
        <div class="title" align="left">
            <label>주문내역 상세정보</label>
        </div>
        <div class="container">
            <div class="data1">
                <label class="tableName">펀딩 내역</label>
                <table class="table table-bordered">
	                <tr>
	                    <th>펀딩번호</th>
	                    <td>${ o.orderNo }</td>
	                    <th>펀딩 금액</th>
	                    <td>${o.rewardPrice} 원</td>
	                </tr>
	                <tr>
		                <th>펀딩 주문날짜</th>
		                <td>${ o.orderDate }</td>
		                <th>추가 후원금</th>
		                <td>${ o.orderPlus } 원</td>
	                </tr>
	                <tr>
	                    <th>펀딩 서포터</th>
	                    <td>${ o.supporterName }</td>
	                    <th>총 결제금액</th>
	                    <td>${ o.totalPrice } 원</td>
	                </tr>
	                <tr>
	                    <th>펀딩 마감일</th>
	                    <td>${ o.projectEndDt }</td>
	                    <th>결제 방법</th>
	                    <td>신용(체크) 카드</td>
	                </tr>
	                <tr>
		                <th>펀딩 상태</th>
		                <td>
		                	<c:choose>
                        		<c:when test="${ o.orderStatus == 1 }">
                        			<td>결제완료</td>
                        		</c:when>
                        		<c:when test="${ o.orderStatus == 2 }">
                        			<td>취소요청</td>
                        		</c:when>
                        		<c:when test="${ o.orderStatus == 3 }">
                        			<td>취소완료</td>
                        		</c:when>
                        	</c:choose>
		                    <!--  -->
		                                                       결제 완료 &nbsp;&nbsp;&nbsp;&nbsp;
		                    <!-- 펀딩마감일 +00일 이후 결제 취소버튼 노출 -->
		                      
		                    <button type="button" class="btn-sm" data-toggle="modal" data-target="#cancelPayModal">결제 취소</button>
		                    
		                </td>
	                    <th>카드 번호</th>
	                    <td>${ o.cardNo }</td>
	                </tr>
	                <tr>
                        <th class="text_st2">주문정보</th>
	                    <td colspan="3">
                            <span class="text_st1" style="font-weight: 600;">${ o.partnerName }</span> <br>
                            <span>${ o.projectTitle }</span>
                            <span>${ o.rewardTitle }</span> <br>
                            <span class="text_st1">${ o.orderOption } / ${ o.orderCount }</span>
	                    </td>
                    </tr> 
                    <tr>
                    </tr>              
           		</table>
            </div>
            <div class="data1">
                <label class="tableName">배송지 정보</label>
                <table class="table table-bordered">
                    <tr>
                        <th>수취인</th>
                        <td>${ o.receiverName }</td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>${ o.receiverPhone }</td>
                    </tr>
                    <tr>
                        <th>배송지 </th>
                        <td>[${ o.addressNo }] ${ o.addressDetail }, ${ o.address }</td>
                    </tr>
                    <tr>
                        <th>배송시 요청사항</th>
                        <td>${ o.shippingReq }</td>
                    </tr>
                    <tr>
                        <th>배송 상태</th>
                        <c:choose>
                       		<c:when test="${ o.shippingStatus == 1 }">
                       			<td>배송준비중</td>
                       		</c:when>
                       		<c:when test="${ o.shippingStatus == 2 }">
                       			<td>배송시작</td>
                       		</c:when>
                       		<c:when test="${ o.shippingStatus == 3 }">
                       			<td>배송완료</td>
                       		</c:when>
                       	</c:choose>
                    </tr>
                    <tr>
                        <th rowspan="2">운송장 번호</th>
                        <td>
							${ o.shippingCom } : ${ o.shippingNo }
                        </td>
                        
                    </tr>      
                </table> 
            </div> 
        </div>
        


        <div class="button_area">
            <button type="button" class="btn btn-withus">수 정</button>
            <button type="button" class="btn btn-secondary" onclick="history.back()">목록으로</button>
        </div>

        <!-- 탈퇴 클릭 시 모달  -->
        <!-- The Modal -->
        <div class="modal fade" id="cancelPayModal">
            <div class="modal-dialog modal-dialog-centered" style="width: 380px;">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header none" style="height: 5px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body">
                    <h6>결제 취소를 진행하시겠습니까?</h6>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer none">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-withus" data-dismiss="modal">확인</button>
                </div>
                
            </div>
            </div>
        </div>

    </div>
</body>
</html>