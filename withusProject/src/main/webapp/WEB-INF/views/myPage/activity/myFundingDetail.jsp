<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
        .wrap{width: 1000px; height: auto; margin: auto;}

        .wrap>div{width: 100%;}

        /* 메뉴 아래 선
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 80%;
            
        } */

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #content{width: 100%; margin-left: 130px;}

        /*큰제목*/
        p{font-size: 23px; font-weight: bolder; margin-left: 18px;}

        
        /* fundingDetail content */
        .fundingDetail #content_1{height: 10%; margin-top: 50px;}
        .fundingDetail #content_2{height: 30%; margin-top: 70px;}
        .fundingDetail #content_3{height: 30%; margin-top: 70px;}

        
        /* 각각 테이블 */
        .fundingDetail table{margin-left: 20px; width: 80%; border-top:rgb(192, 189, 189) solid 0.2px;  }
        #orderBasic{border-bottom: rgb(192, 189, 189) solid 0.2px;}
        #orderBasic th{width: 150px; height: 50px;}
        

        /* 펀딩내역 */
        #orderDetail{border-bottom: rgb(192, 189, 189) solid 0.2px;}
        #orderDetail th{height: 30px;}
        #orderDetail td{height: 50px; }
        #orderDetail thead{font-weight: 900;}
        
        #thumb{width: 10%;}
        #orderName{width: 65%; text-align: center;}
        #rewardPrice{width: 15%; text-align: center;}
        #count{width: 8%; text-align: center;}

        #selectOption{width: 100px; text-align: center;}

		
		/* 배송지정보 */
        #delivery th{width: 150px; height: 45px; }
        #delivery td{height: 50px;}
        #delivery input{margin-top: 5px; height: 30px;}
        #post_btn{margin-bottom: 5px; height: 29px; width: 75px; background-color: rgb(52, 73, 94); color: honeydew;}
        .modifyArea{text-align: center; margin-top: 2000px; border-top:rgb(192, 189, 189) solid 0.2px;}
        #modify{width: 150px; margin-top: 30px; background-color: rgb(52, 152, 219); color: honeydew;}


        /* 결제정보 */
        #payInfo th{width: 200px; height: 80px; text-align: center;}
        #payInfo thead>tr>td{width: 200px; height: 60px; text-align: center;}
        #payInfo thead{font-size: 18px; font-weight: 900;}
        #payInfo tbody>tr>td{width: 200px; height: 10px; text-align: center;}
        #payInfo thead{font-size: 18px; font-weight: 900;}
        
        a{text-decoration: none; color:white; text-decoration-line: none;}

        /* 맨아래 목록 버튼 부분 */
        .bottom_btnarea{height: 300px; margin-top:30px; text-align: center; border-top:rgb(192, 189, 189) solid 0.2px;}
        #listBtn{width: 150px; background-color: rgb(52, 152, 219); color: honeydew; margin-top:30px; margin-bottom: 100px;}
        #refundBtn{width: 150px; background-color: rgb(52, 152, 219); color: honeydew; margin-top: 30px; margin-bottom: 100px;}
        
		
		/* 팝업*/
		#popup01{ display: none;}
		
		#popup01{
			width: 370px;
			height: 650px;
			position: absolute;
			top: 50%;
			left: 50%;
			margin: -250px 0 0 -250px;
			background-color: rgb(247, 247, 247);
			z-index: 2;
		 }
		 
		.backon{
		    content: "";
		    width: 100%;
		    height: 100%;
		    background: #00000054;
		    position: fixed;
		    top: 0;
		    left: 0;
		    z-index: 1;
		}
		
		
		.openPopup{
		  cursor:pointer;
		}
		
		
		#popup_content{margin-top: 20px; margin-left: 40px; margin-right: 20px;}
		
		/* 환불 테이블 */
		#popup01 table{width: 80%;}
		#BigTitle{font-size: 15px; font-weight: 700; height: 40px; border-top:rgba(41, 128, 185, 0.16) solid 0.1px;}
		#rTitle{width: 150px; height: 30px;}
		#blankBox{height: 20px;}

        #rReason{width: 100%; height: 100px;}
        .refundInfo{width: 100%;}

		
		/* 환불 버튼*/
		#refund_buttonArea{text-align: center; height: 80px; border-top: rgba(41, 128, 185, 0.16) solid 0.1px;}
		#popup01 button{background-color: rgba(52, 152, 219, 0.78); width:100px;}

    </style>
    
</head>
<body>
    <div class="wrap">
        
        <!-- 펀딩내역 상세 -->
        <div id="mypage">
            <div id="content" class="fundingDetail">
              
              
              <div id="underLine"></div>
               
              <p>주문정보</p>  
              <table id="orderBasic">
                <tr>
                  <th>펀딩날짜 : ${orderList.orderDate }</th>
                  <th>주문번호 : ${orderList.orderNo } </th>
                  <th> 상태 :
	                  <c:choose>
					    <c:when test="${orderList.orderStatus eq '1'}">
					                     결제완료
					    </c:when>
					    <c:when test="${orderList.orderStatus eq '2'}">
					          	취소요청
					    </c:when>
					    <c:otherwise>
					        	취소완료
					    </c:otherwise>
				     </c:choose>              	                
	              </th>
                </tr>
                <c:if test="${ orderList.orderStatus != '1'}">
                	<tr>
						<th colspan="3">환불 신청 정보 : ${ orderList.bankName } ${orderList.bankAccount}</th>
					</tr>
                </c:if>
              </table>
              
                
                <!-- 펀딩상품-->
                <div id="content_1">
                
                  <p>펀딩상품</p>

                  <table id="orderDetail">
                    <thead>
                        <tr>
                        
                        <td id="orderName">상품명</td>
                        <td id="thumb"></td>
                        <td id="rewardPrice">리워드금액</td>
                        <td id="count">수량</td>
                        
                        </tr>
                    </thead>
                    <tbody>
                    	<tr>
                    		
 							<td>
                     			<div style="margin-top: 10px; font-weight: 600;">${orderList.projectTitle }</div>
                     			<c:if test="${ !empty orderList.rewardTitle  }">
                                	<div><label style="font-weight: bold; margin-top: 20px;">* ${orderList.rewardTitle }</label></div>
                                </c:if>
                                <div style="font-size:14px">${orderList.rewardContent }</div>               
                            </td>
                            <td><img src="${ orderList.projectThum }" width="100" height="90" ></td>
                            <td style="text-align: center;">${ orderList.rewardPrice }</td>
                            <td style="text-align: center;">${ orderList.orderCount }</td>
                        </tr>
                        
                        <!-- 리워드에 옵션기입란 있을경우에만 보이게 -->
                        <c:if test="${ orderList.optionYn eq 'Y' }">
	                        <tr>
	 							<td id="orderOption">
	                            	<button id="selectOption" class="btn btn-outline-dark btn-sm">옵션보기<input type="hidden" value="${orderList.rewardNo }"></button>
	                            	<div id="optionPlace" style="margin-top: 20px; display:none;" >${ orderList.orderOption }</div>
	                            </td>
	                                                       
	                        </tr>
                        </c:if>                                   	
                    </tbody>
                    <tfoot>
                        <tr>
                            <th></th>
                        </tr>
                    </tfoot>
				  </table>
                  
                </div>
                <input type="hidden" name="orderNo" value="${ orderList.orderNo }">
                
                <script>
                	// 옵션값을 보여주고 버튼 사라짐
                  	$(function() {
						$('#orderDetail #selectOption').click( function() {
						   $(this).attr("style", "display:none");
						   $(this).siblings("#optionPlace").show(); 
						  
						   
						 })
	                	})
	            
	             </script>
                
               
                
                <!-- 배송지 정보 / 배송지가 필요한 리워드인경우에만 보여짐 -->
                <form action="updateOrder.me" method="post">
	                <c:choose>
	                	<c:when test="${orderList.rewardShip eq 'Y' }">
	                		<div id="content_2">
			                  <p>배송지 정보</p>
			                  <table id="delivery">
			                    <tr>
			                      <th>받는사람</th>
			                      <td style="width: 600px;"><input type="text" placeholder="이름" value="${ orderList.receiverName }" name="receiverName" readonly required style="margin-top: 20px;"></td>
			                    </tr>
			                    <tr>
			                      <th>휴대폰번호</th>
			                      <td><input type="text" placeholder="휴대폰번호" value="${ orderList.receiverPhone }" name="receiverPhone" id="receiverPhone" readonly required></td>
			                    </tr>
			                    <tr>
			                      <th>주소</th>
			                      <td>
			                        <input type="text" id="sample6_postcode" placeholder="우편번호" style="width: 100px;" value="${orderList.addressNo}" name="addressNo" readonly required>
			                        <button type="button" id="post_btn" onclick="sample6_execDaumPostcode()"disabled class="btn btn-sm">우편번호</button>
			                        <br>
			                        <input type="text" id="sample6_address" placeholder="주소" value="${orderList.address }" name="address" style="width: 300px;" readonly required>
			                        <input type="text" id="sample6_detailAddress" placeholder="상세주소" value="${orderList.addressDetail }" name="addressDetail" style="width: 300px;" readonly required>
			                        <input type="text" id="sample6_extraAddress" placeholder="참고항목" style="display:none;">
			                      </td>
			                    </tr>
			                    <tr>
			                      <th>배송상황</th>
			                      <td>
			                          <div style="margin-top: 15px;">
				                          <c:choose>
							            	<c:when test="${orderList.shippingStatus eq '1'}">
							                                        배송준비중
							                </c:when>
							                <c:when test="${orderList.shippingStatus eq '2'}">
							                     	배송중
							                </c:when>
							                <c:otherwise>
							                     	배송완료
							                </c:otherwise>
							              </c:choose>      
			                          </div>
			                          <div style="margin-bottom: 20px;">${orderList.shippingCom }  ${orderList.shippingNo }</div>
			                          <!--시간되면 택배조회 api-->
			                      </td>
			                    </tr>
			                    <tr>
			                      <td colspan="2" class="modifyArea">
			                      	<input type="hidden" value="${orderList.orderNo }" name="orderNo">
			                        <button type="submit" id="modify" class="btn btn-sm" disabled onclick="return delieveryM();">배송지수정</button>
			                      </td>
			                    </tr>
			                  </table>
			                </div>
	                	</c:when>
	                	
	                </c:choose>
                </form>
                <!-- 배송지 수정 컨펌 -->
				<script>
				
				function delieveryM(){
                	
                	var result = confirm("배송지정보를 수정 하시겠습니까?");
                	
                	if(result){
                		
                	} else {
                		alert("배송지정보 수정이 취소되었습니다");
                		return false;
                	}
                
                }				
				
				
				
				</script>
                
                
                <!-- 배송준비중&&결제완료 상태 input요소 readonly 제거, button에 disabled 제거 -->
                <input type="hidden" value="${orderList.shippingStatus}"  id="shippingStatus">
                <input type="hidden" value="${orderList.orderStatus}"  id="orderStatus">
                
                <script>
                    
                
			        $(document).ready(function(){
			        	var shippingStatus = $("#shippingStatus").val();
			        	var orderStatus = $("#orderStatus").val();
			        	
			        	console.log(shippingStatus);
			        	
			            if(shippingStatus =='1' && orderStatus=='1'){
			            	
			            	$("input").removeAttr("readonly");
			            	$("button").removeAttr("disabled");
			            }
			
			        });
			    </script>
			    
			    <!-- 핸드폰번호 -->
			    <script>
					$(function(){
	
					    $("#receiverPhone").on('keydown', function(e){
					    // 숫자만 입력받기
					    var trans_num = $(this).val().replace(/-/gi,'');
						var k = e.keyCode;
									
						if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
						{
					  	    e.preventDefault();
						}
					    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
					        if($(this).val() == '') return;
	
					        // 기존 번호에서 - 를 삭제합니다.
					        var trans_num = $(this).val().replace(/-/gi,'');
					      
					        // 입력값이 있을때만 실행합니다.
					        if(trans_num != null && trans_num != '')
					        {
					            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
					            if(trans_num.length==11 || trans_num.length==10) 
					            {   
					                // 유효성 체크
					                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
					                if(regExp_ctn.test(trans_num))
					                {
					                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
					                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
					                    $(this).val(trans_num);
					                }
					                else
					                {
					                    alert("유효하지 않은 전화번호 입니다.");
					                    $(this).val("");
					                    $(this).focus();
					                }
					            }
					            else 
					            {
					                alert("유효하지 않은 전화번호 입니다.");
					                $(this).val("");
					                $(this).focus();
					            }
					      }
					  });  
					});
				</script>
                
                
                <!-- 카카오 우편번호 api -->
                <script>
				    function sample6_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var addr = ''; // 주소 변수
				                var extraAddr = ''; // 참고항목 변수
				
				                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    addr = data.roadAddress;
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    addr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				                if(data.userSelectedType === 'R'){
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if(data.buildingName !== '' && data.apartment === 'Y'){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if(extraAddr !== ''){
				                        extraAddr = ' (' + extraAddr + ')';
				                    }
				                    // 조합된 참고항목을 해당 필드에 넣는다.
				                    document.getElementById("sample6_extraAddress").value = extraAddr;
				                
				                } else {
				                    document.getElementById("sample6_extraAddress").value = '';
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('sample6_postcode').value = data.zonecode;
				                document.getElementById("sample6_address").value = addr;
				                
				                // 커서를 상세주소 필드로 이동한다. 상세주소 null로 만들고,
				                document.getElementById("sample6_detailAddress").value='';
				                document.getElementById("sample6_detailAddress").focus();
				            }
				        }).open();
				    }
				</script>
                

                
                
                <!-- 결제정보-->
                <div id="content_3">
                
                  <p>결제정보</p>

                  <table id="payInfo">
                    <thead>
	                    <tr>
	                      <td>리워드금액</td>
	                      <td>추가후원금</td>
	                      <td>배송비</td>
	                    </tr>
                    </thead>
                    <tbody>
	                    <tr>
	                      <td>${ rewardTotal } 원</td>
	                      <td>
		                      <c:choose>
					          	<c:when test="${!empty orderList.orderPlus }">
					                	${ orderList.orderPlus} 원
					            </c:when>
					            <c:otherwise>
					                     	0 원  
					            </c:otherwise>
					          </c:choose>     
	                      </td>
	                      <td>0원</td>
                     </tbody>
                    <!-- 배송비 -->
                    </tr>
                    <tr>
                      <th style="text-align: right;" colspan="2" id="finalPrice">최종 결제 금액</th>
                      <th style="text-align: right;" id="finalPrice">${ totalPrice } 원</th>
                    </tr>
                    <tr>
                        <td colspan="3" class="bottom_btnarea">
                            <!-- 주문상태가 결제완료상태일때만 반환신청 버튼 보이게 -->
                            <button class="btn btn-sm" style="color:white;" id="listBtn"><a href="myFunding.me">목록</a></button>
                            <c:if test="${orderList.orderStatus eq '1'}">
                                <button class="openPopup btn btn-sm" id="refundBtn">펀딩 반환 신청</button>
                            </c:if>
                        </td>
                    </tr>
                    
                    
                  </table>
                </div>
            
                
                </div>
                
                <!-- 환불신청 팝업 -->
                <div id="popup01">
				
				<div id="popup_content">   
				    <form action="refundRequest.me" method="post" enctype="multipart/form-data" >
				        <div style="font-size:15px; font-weight: 700;"> 펀딩금 반환신청</div>
				          <table id="refundTable">
				            
				            <tr>
				              <td colspan="2" id="BigTitle">반환 사유 입력</td>
				            </tr>
				            <tr>
				              <td colspan="2">
				                    <textarea style="resize: none;" id="rReason" name="rReason" required></textarea>
				              </td>
				            </tr>
				            <tr>
				              <td colspan="2"><input type="file" name="file" accept="image/*"></td>
				              <!-- 이미지만 -->
				            </tr>
				            <tr>
				                <td colspan="2" id="blankBox"></td>
				            </tr>
				            
				            <tr>
				              <td colspan="2" id="BigTitle">반환예정 금액 상세</td>
				            </tr>
				            <tr>
				              <td id="rTitle">리워드 금액</td>
				              <td>${ rewardTotal } 원</td>
				            </tr>
				            <tr>
				              <td id="rTitle">추가후원금</td>
				              <td>${ orderList.orderPlus} 원</td>
				            </tr>
				            <tr>
				              <td id="rTitle">배송비</td>
				              <td>0원</td>
				            </tr>
				            <tr>
				              <td id="rTitle">반환 신청금액</td>
				              <td>${ totalPrice } 원</td>
                              <td style="height: 50px;"></td>
				            </tr>
                            <tr>
                                <td colspan="2" id="BigTitle">환불정보</td>
                              </tr>
                              <tr>
                                <td id="rTitle">은행명</td>
                                <td><input type="text" name="bankName" class="refundInfo" id="bankName" value="${ orderList.bankName }" required></td>
                              </tr>
                              <tr>
                                <td id="rTitle">계좌번호</td>
                                <td><input type="text" name="bankAccount" class="refundInfo" id="bankAccount" value="${ orderList.bankAccount}" required></td>
                                <td style="height: 50px;"></td>
                              </tr>

				            <tr>
				                <td colspan="2" id="refund_buttonArea">
				                    <input type="hidden" name="orderNo" value="${ orderList.orderNo }">
				                    <button type="submit" class="btn btn-sm" onclick="return validate();">신청</button>
				                    <button type="button" class="cancel btn btn-sm" >취소</button>
				                </td>
				            </tr>
				            
				          </table>
				          
				    </form>
			    </div> 
			</div>
				
				<!-- 환불신청 팝업 -->
				<script>
				  $(document).ready(function(){     
				    $(".openPopup").on("click", function(event) { 
				    $("#popup01").show();  
				    $("body").append('<div class="backon"></div>');
				    });
				    
				    $("body").on("click", function(event) { 
				        if(event.target.className == 'cancel btn btn-sm' || event.target.className == 'backon'){
				        	
				        	
				        	var result = confirm("환불신청을 취소하시겠습니까?");
		                	
		                	if(result){
		                		
		                		$("#popup01").hide();
					      	    $(".backon").hide();
		                	
		                	} else {
		                		alert("환불신청이 취소되었습니다");
		                		return false;
		                	}
				        	
				        }
				      });
				
				  });
				
				</script>
				
				<!-- 환불신청등록 유효성검사 -->
				<script>
				
				function validate(){
                	
                	var rReason = document.getElementById("rReason");
                	var bankName = document.getElementById("bankName");
                	var bankAccount = document.getElementById("bankAccount");
                	
                	var regExp = /[\S+$]/; 			// 공백을 제외한 모든 문자로 1글자이상 등록
                	var regKor = /^[가-힣]{2,}$/;    // 한글결합으로두글자이상
                	var regNum = /^[0-9]{5,}$/; 	//숫자로만 다섯글자이상
                	
                	
                	if(!regExp.test(rReason.value)){ 
                		alert("환불신청 사유를 입력해주세요");
                	
                		rReason.value="";
                		rReason.focus();
                		
                		return false;
                	}
                	
                	if(!regKor.test(bankName.value)){ 
                		alert("정확한 은행명을 입력해주세요");
                	
                		bankName.value="";
                		bankName.focus();
                		
                		return false;
                	}
                	
                	if(!regNum.test(bankAccount.value)){ 
                		alert("유효한 계좌번호를 입력해주세요");
                	
                		bankAccount.value="";
                		bankAccount.focus();
                		
                		return false;
                	}
                	
                	
                	
                	
                	
                	var result = confirm("환불신청을 하시겠습니까?");
                	
                	if(result){
                		
                	} else {
                		alert("환불신청이 취소되었습니다");
                		return false;
                	}
                
                }				
				
				
				
				</script>
				
                                    
                

            </div>
            
        </div>
        

    </div>
    
    
</body>
</html>