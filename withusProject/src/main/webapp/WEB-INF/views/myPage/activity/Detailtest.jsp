<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
	<style>
        
        /*div{border: 1px solid red; box-sizing: border-box;}*/
        .wrap{width: 1000px; height: 800px; margin: auto;}

        .wrap>div{width: 100%;}

        /* 메뉴 아래 선 */
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 80%;
            
        }

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%; margin-left: 150px;}

        /*큰제목*/
        p{font-size: 23px; font-weight: bolder;}

        
        /* fundingDetail content */
        .fundingDetail #content_1{height: 20%; margin-top: 50px;}
        .fundingDetail #content_2{height: 30%; margin-top: 150px;}
        .fundingDetail #content_3{height: 30%; margin-top: 80px;}

        
        /* 각각 테이블 */
        .fundingDetail table{margin-left: 20px; width: 80%; border: black solid 1px;}
        #orderBasic th{width: 150px; height: 40px;}
        #orderBasic td{width: 150px; height: 30px;}

        #orderDetail th{width: 150px; height: 40px;}
        #orderDetail td{height: 50px;}

        #delivery th{width: 150px; height: 40px; }
        #delivery td{height: 40px;}

        
        #payInfo td{width: 200px; height: 40px; text-align: center;}
        #payInfo th{width: 200px; height: 100px; text-align: center;}
        
        
        
        

        /* .fundingDetail 버튼 부분 */
        .fundingDetail .buttonArea{height: 150px; text-align: center;}

        .fundingDetail #btn1{background-color: rgb(52, 152, 219); color: honeydew;}
        .fundingDetail button{width: 200px;}

    </style>
    
</head>
<body>
    <div class="wrap">
        
        <!-- 펀딩내역 상세 -->
        <div id="mypage">
            <div id="content" class="fundingDetail">
              
              <p>펀딩내역</p>
              <div id="underLine"></div>
                
              <table id="orderBasic">
                <tr>
                  <th>펀딩날짜 : ${funding[0].orderDate }</th>
                  <td></td>
                  <th>주문번호 : </th>
                  <td>${funding[0].orderNo }</td>
                </tr>
              </table>
              
                
                <!-- 펀딩상품-->
                <div id="content_1">
                
                  <p>펀딩상품</p>

                  <table id="orderDetail">
                    <tr>
                      <th style="width: 60%;">상품명</th>
                      <th style="width: 15%;">리워드금액</th>
                      <th style="width: 8%;">수량</th>
                      <th style="width: 10%;">진행현황</th>
                    </tr>
                    <tr>
                      <td>
                        <div>${funding[0].projectTitle }</div>
                        <div>${funding[0].rewardTitle }</div>
                        <div>${funding[0].rewardContent }</div>
                        <!-- 조건문 -->
                        <c:forEach var="f" items="${funding}">
						<div>${ f.optionContent }</div>
                        </c:forEach>
                      </td>
                      <td>${funding[0].rewardPrice }</td>
                      <td>${funding[0].count }</td>
                      <td>
						<c:choose>
			            	<c:when test="${funding[0].orderStatus eq '1'}">
			                                          결제완료
			                </c:when>
			                <c:when test="${funding[0].orderStatus eq '2'}">
			                     	취소요청
			                </c:when>
			                <c:otherwise>
			                     	취소완료
			                </c:otherwise>
			            </c:choose>                      
                      </td>
                    </tr>

                  </table>
                  
                </div>

                
                <!-- 배송지 정보 / 배송지가 필요한 리워드인경우에만 보여짐-->
                <c:choose>
                	<c:when test="${funding[0].rewardShip eq 'Y' }">
                		<div id="content_2">
		                  <p>배송지 정보</p>
		                  <table id="delivery">
		                    <tr>
		                      <th>받는사람</th>
		                      <td style="width: 600px;">${funding[0].receiverName }</td>
		                    </tr>
		                    <tr>
		                      <th>휴대폰번호</th>
		                      <td>${funding[0].receiverPhone }</td>
		                    </tr>
		                    <tr>
		                      <th>주소</th>
		                      <td>(${funding[0].addressNo}) ${funding[0].address }${funding[0].addressDetail }</td>
		                    </tr>
		                    <tr>
		                      <th>배송시 요청사항</th>
		                      <td>
		                      <textarea name="" id="" cols="53" rows="3" style="resize: none;">
		                      	<c:choose>
					            	<c:when test="${!empty funding[0].shippingReq}">
					                	${funding[0].shippingReq }
					                </c:when>
					                <c:otherwise>
					                     	없음
					                </c:otherwise>
					            </c:choose>
					          </textarea>     
		                      </td>
		                    </tr>
		                    <tr>
		                      <th>배송상황</th>
		                      <td>
		                          <div>
			                          <c:choose>
						            	<c:when test="${funding[0].shippingStatus eq '1'}">
						                                          배송준비중
						                </c:when>
						                <c:when test="${funding[0].shippingStatus eq '2'}">
						                     	배송중
						                </c:when>
						                <c:otherwise>
						                     	배송완료
						                </c:otherwise>
						              </c:choose>      
		                          </div>
		                          <div>${funding[0].shippingCom }  ${funding[0].shippingNo }</div>
		                          <!--시간되면 택배조회 api-->
		                      </td>
		                    </tr>
		                    <tr>
		                      <td colspan="2" class="buttonArea">
		                        <button>배송지수정</button>
		                      </td>
		                    </tr>
		                  </table>
		                </div>
                	</c:when>
                	<c:otherwise>
                	</c:otherwise>
                </c:choose>
                

                
                
                <!-- 결제정보-->
                <div id="content_3">
                
                  <p>결제정보</p>

                  <table id="payInfo">
                    <tr>
                      <td>리워드금액</td>
                      <td>추가후원금</td>
                      <td>배송비</td>
                    </tr>
                    <tr>
                      <td>${ totalReward } 원</td>
                      <td>
	                      <c:choose>
				          	<c:when test="${!empty funding[0].orderPlus }">
				                	${ funding[0].orderPlus} 원
				            </c:when>
				            <c:otherwise>
				                     	0 원  
				            </c:otherwise>
				          </c:choose>     
                      </td>
                      <td>0원</td>
                      <!-- 배송비 -->
                    </tr>
                    <tr>
                      <th style="text-align: right;" colspan="2" id="finalPrice">최종 결제 금액</th>
                      <th style="text-align: right;" id="finalPrice">${ totalPrice } 원</th>
                    </tr>
                    
                    
                  </table>
                </div>
            
                
                <div class="buttonArea">
                  <button>목록</button>
                  <button>펀딩 반환 신청</button>
                </div>
                

            </div>
            
        </div>
        

    </div>
    
    
</body>
</html>