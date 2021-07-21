<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Load icon library(검색) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    
<style>
  @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
  *{box-sizing: border-box;} 
  .wrap{width: 1150px; position: relative;}
  .wrap>div{width: 100%;}

  /* 메뉴 아래 선 */
  #underLine{
    background-color: rgb(192, 189, 189);
    height: 1.5px;
    width: 80%;
  }
  #mypage{height: 100%; position: relative; top: 7%; left: 6%;}
  
  /* mypage안의 세부영역 */
  #content{width: 100%;}

  /*큰제목*/
  .mainTitle{font-size: 23px; font-weight: bolder;}
  
  /* fundingList content */
  .list #content_1{height: 80%; margin-top: 50px; width: 80%;}

  /* 페이징*/
  #pagingArea{width:fit-content; margin:auto; margin-top: 70px; margin-top: 100px; margin-bottom: 180px;} 



  /* 내꺼 */
  .statusBox{border: 1px solid lightgray; padding: 20px;}

  .dTable { width: 100%;text-align: left;}

  .mentBox{background: #f4f4f4; border-radius: 2px; margin: 20px 0; padding: 20px;}

  .searchForm{margin: 10px 0; }
  .searchForm select{height: 38px; border-color: lightgray; outline: none; float: left; margin-right: 5px; font-size: 13px;}
  .keyword_1 { float: left;} 
  .keyword_2 { width: 40%;float: left;}  
  .keyword_3 {width: 40%; float: right;} 
  .input-group.search {width: 70%;}
  .btn.searchBtn{background-color: #3498db;}
  .fa.fa-search{color: white;}

  #orderList{text-align: center; margin: auto; margin-top: 70px;}
  #orderList th{font-size: 12px;}
  #orderList td{font-size: 13px;}
  #orderList td, #orderList th{ padding: 0.7rem .20rem; vertical-align: middle;}
  .rew {text-align:left;}

  
  button.btn.btn-sm {font-size: 10px; text-align: justify; padding: 5px; }
  .btn.btn-withus{background-color: #3498db; color: white;}
  .btn.btn-withus:hover{cursor: pointer; background-color: #2c83be; color: white;}

  /* modla css */
  /* 공통 */
  .modal-header.none, .modal-footer.none{border: none;}
  .modal-body div{float: none;}

  /*sendInfoModal*/
  .partnerOrder, .trackingInfo{ padding:0 6px;}
  .partnerOrder table, .trackingInfo *{ font-size: 14px; width: 90%;}
  .partnerOrder table *{padding: 3px 0;}
  .partnerOrder>table>th {color: grey; font-weight: 500;}
  .trackingInfo select{margin-bottom: 15px; height: 30px;} 
  .trackingInfo label{font-size: 15px; font-weight: 550;}
  .partnerOrder th {width: 95px}
  .partnerOrder td {width: 235px}
  

  /*refundInfo*/
  .partnerRefund {color: #3b3e41; padding: 10px 10px 30px; border-bottom: 1px solid gainsboro; }
  .partnerRefundInfo th, .refundTb th {width:145px; height:31px;}
  .redetail{width: 235px}
  .partnerRefundInfo {padding: 5px 10px;}
  .refundTb {padding: 5px 10px; border-top: 1px dashed gainsboro; color: black;}
  .detailTb {width:447px; border-radius: 3px;}
  .subTable{width: 465px;}
  .detailTb, .subTable{background-color: #f4f4f4; border:16px solid #f4f4f4;}
  .subTable *{font-size: 14px;}
  .suTable td{width:130px}
  .st1{height: 30px;}

  button.btn.btn-withus.approvalBtn{ width: 48%; float: left;}
  button.btn.btn-danger.oppositionBtn{ width: 48%;}
  
  .cancle{color: red;}
  .wh{width: 200px; hight: 130px;}


</style>
</head>
<body>
   
	<div class="wrap">   
    	 
	    <!--  -->
	    <div id="mypage">
	        <div id="content" class="list">
	            <p class="mainTitle">펀딩 · 발송 관리</p>
	            <div id="underLine"></div>


				<!-- -->
				<div id="content_1">
					<label>서포터 관리</label>
					<div class="statusBox">
						<table class="dTable">
	                  <tr>
	                    <th rowspan="2">펀딩·배송 상태</th>
	                    <th style="color: rgb(52, 152, 219);">미발송</th> 
	                    <th>배송 준비 중</th>
	                    <th>배송 중</th>
	                    <th>배송 완료</th>
	                    <th>환불</th>
	                  </tr>
	                  <tr>
	                    <td>${ sc.noneShipping } 건</td>
	                    <td>${ sc.readyShipping } 건</td>
	                    <td>${ sc.shipping } 건</td>
	                    <td>${ sc.doneShipping }건</td>
	                    <td>${ sc.refundShipping }건</td>
	                  </tr>
	                  <tr>
	                    <th rowspan="2">펀딩금 반환 상태</th>
	                    <th>신청</th> 
	                    <!-- <th>신청 취소</th> -->
	                    <th>완료</th>
	                    <th>거절</th>
	                  </tr>
	                  <tr>
	                    <td>${ sc.refund } 건</td>
	                    <%-- <td>${ sc.dropRefund } 건</td> --%>
	                    <td>${ sc.comRefund } 건</td>
	                    <td>${ sc.refRefund } 건</td>
	                  </tr>
	                </table>
					</div>

					<div class="mentBox">
						<label>발송처리를 반드시 진행하세요. 모든 서포터의 발송처리를 진행하지 않을 경우 다음과 같이 처리
							됩니다.</label>
						<ul>
							<li>정산이 진행되지 않습니다.</li>
							<li>서포터가 펀딩금 반환을 신청할 수 있습니다.(미발송 상태로 방솔예정일이 지난 시점부터)</li>
							<li>종료일 +11개월까지 발송처리가 진행되지 않은 펀딩 내역은 자동 펀딩금 반환 처리(결제 취소)가
								진행됩니다.</li>
						</ul>
					</div>

					<div class="oList">
						<label>목록</label>
						<input type="hidden" name="currentPage" value="1">

						<form action="orderNDeliverySearch.part" name=searchPart>
							<div class="searchForm">
								<div class="keyword_1">
									<select name="shStatus" class="shStatus">
										<option value="0">발송 배송 : 전체</option>
										<option value="1">배송 준비 중</option>
										<option value="2">배송 중</option>
										<option value="3">배송 완료</option>
									</select> 
								</div>
								<div class="keyword_2">	
									<select name="orStatus" class="orStatus">
										<option value="0">결제 상태 : 전체</option>
										<option value="1">결제 완료</option>
										<option value="2">취소 요청</option>
										<option value="3">취소 완료</option>
									</select>
								</div>

								<div class="keyword_3">
									<select name="condition" class="condition">
										<option value="all">전체</option>
										<option value="order_no">펀딩번호</option>
										<option value="shipping_no">발송번호</option>
										<option value="member_name">서포터</option>
									</select>
									<div class="input-group search">
										<input type="text" class="form-control" name="keyword"
										       value="${ keyword }" placeholder="검색어를 입력하세요">
										<div class="input-group-append">
											<button class="btn searchBtn" type="submit">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
						</form>
						<c:if test="${ !empty shStatus or !empty orStatus or !empty condition }">
							<script>
								$(function(){
									$(".shStatus option[value=${shStatus}]").attr("selected", true);
									$(".orStatus option[value=${orStatus}]").attr("selected", true);
									$(".condition option[value=${condition}]").attr("selected", true);
									
								});
							</script>
						</c:if>


						<table class="table table-border" id="orderList">
							<thead>
								<tr height="50">
									<th width="40">펀딩<br>번호</th>
									<th width="60">서포터<br>정보</th>
									<th width="60">결제<br>상태</th>
									<th width="70">결제<br>금액</th>
									<th width="220" colspan="2">리워드</th>
									<th width="85">발송정보</th>
									<th width="80">발송<br>예정일</th>
									<th width="70">발송·배송</th>
									<th width="65">발송<br>번호</th>
									<th width="80">펀딩금<br>반환</th>
								</tr>
							</thead>
							<c:choose>
				           	 	<c:when test="${ empty polist }">
				       	 			<tr style="height: 100px;"><td colspan="10"><b>내용이 존재하지 않습니다 :(</b></td></tr>
				           	 	</c:when>
				           	 	<c:otherwise>
									<tbody>
										<c:forEach var="p" items="${ polist }">
				                    	<tr>
					                      <td class="ono">${ p.orderNo }</td>
					                      <td>${ p.supporterName }</td>
					                      <c:choose>
			                        		<c:when test="${ p.orderStatus eq 1 }">
			                        			<td>결제완료</td>
			                        		</c:when>
			                        		<c:when test="${ p.orderStatus eq 2 }">
			                        			<td>취소요청</td>
			                        		</c:when>
			                        		<c:when test="${ p.orderStatus eq 3 }">
			                        			<td class="cancle">취소완료</td>
			                        		</c:when>
			                        		<c:when test="${ p.orderStatus eq 4 }">
			                        			<td class="cancle">환불반려</td>
			                        		</c:when>
			                        	  </c:choose>
					                      <td>${ p.totalPrice } 원 </td>
					                      <td><img src="${ p.projectThum }" width="50" height="40"></td>
					                      <td class="rew">
												<c:choose>
						                      		<c:when test="${p.rewardTitle ne  ' ' }">
							                      		${ p.rewardTitle } 
						                      		</c:when>
						                      		<c:otherwise>
						                      			${ p.rewardContent }
						                      		</c:otherwise>
												</c:choose>					                      		
					                      		<br>
					                      		<c:if test="${ !empty p.orderOption }">옵션: ${ p.orderOption } /</c:if> 
				                      			<!-- 펀딩밀어주기도 수량인 있는거? -->
					                      		 수량: ${ p.orderCount }개
			                      		 </td>
					                      <td><button type="button" class="btn btn-withus btn-sm" data-toggle="modal" data-target="#sendInfoModal" onclick="ajaxSendInfo();">
					                      		발송정보입력
					                      	</button></td>
					                      <td>${ p.deliveryDate }</td>
					                      <!-- 운송장 번호가 비어 있을 경우 배송준비 중, 배송완료 조건은 뭘로 해야되나? -->
					                      <c:choose>
			                        		<c:when test="${ empty p.shippingCom or p.shippingStatus eq 1}">
			                        			<td>배송준비중</td>
			                        		</c:when>
			                        		<c:when test="${ p.shippingStatus eq 2 }">
			                        			<td>배송중</td>
			                        		</c:when>
			                        		<c:when test="${ p.shippingStatus eq 3 }">
			                        			<td>배송완료</td>
			                        		</c:when>
			                        		<c:when test="${ p.shippingStatus eq 4 }">
			                        			<td class="cancle">환불</td>
			                        		</c:when>
					                      </c:choose>
					                      <td>${ p.shippingCom } <br> ${ p.shippingNo }</td>
					                      <td style="font-size:10px;">
					                        <!-- 환불 신청자만 버튼이 노출 -->
					                        <c:choose>
						                        <c:when test="${ p.refundStatus eq 'S' }">
							                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#refundInfo" onclick="ajaxRefundInfo();">
							                        	확인하기
						                        	</button>
						                        </c:when>
					                        	<c:when test="${ p.refundStatus eq 'Y' or p.refundStatus eq 'N'}">
							                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#refundInfo_done" onclick="ajaxRefundInfo();">
							                        	처리완료
						                        	</button>
					                        	</c:when>
					                        </c:choose>
					                      </td>
					                    </tr>
			                    		</c:forEach>
			                    		</tbody>
		                    		</c:otherwise>
            					</c:choose>   	
							</table>
						</div>
					
					<script>
					
                  	// 발송모달:주문내역
	              	function ajaxSendInfo(){
	              		//var $orderNo = $(".ono").val();  // 실패1
	              		// 이벤트적 타켓 -> js로 하려면 $()로 감싸주기
	              		var $orderNo = $(event.target).parent().siblings(".ono").text();
	              		//console.log($orderNo);
                  		
	              		$.ajax({
	              			
	            			url:"send.info",
	            			data:{ono:$orderNo},
	            			dataType: "json",
	              		   success:function(oi){
	              			   //console.log(oi);
	              			   
	              			   /*처리할 조건 
	              			   1. rewardTitle == null -> rewardContent 반환 / rewardTitle
	              			   2. orderOption == null -> "펀딩밀어주기" 반환  / orderOption 반환
	              			   */
	              		
	              				 var resultSend = "<table>"
           			   				+ "<tr>" 
           			   				+ "<th>펀딩번호</th>"
           			   				+ "<td>" + oi.orderNo + "</td>" 
           			   				+ "</tr>"
	              			   			+ "<tr>" 
           			   				+ "<th>서포터명</th>"
           			   				+ "<td>" + oi.supporterName + "</td>" 
           			   				+ "</tr>"
	              			   		+ "<tr>" 
           			   				+ "<th>펀딩내역</th>"
           			 		
           			   			if(oi.rewardTitle == ' ') {
           			   		   		resultSend += "<td>" + oi.rewardContent +"</td>"
	           			   						+ "</tr>"
	        	              			   		+ "<tr>" 
	                   			   				+ "<th>옵션</th>"
                   			   				
                   			   		if(oi.orderOption == null){
                   			   			resultSend +=  "<td>"  + oi.orderCount + " 개</td>" 
               			   							
                   			   		}else{
	                   			   		resultSend +=  "<td>" + oi.orderOption + " / " + oi.orderCount + " 개</td>" 
				   							
                   			   			
                   			   		}		
                   			   				
           			   			}else{
         			   				resultSend += "<td>" + oi.rewardTitle +"</td>"
			   			   						+ "</tr>"
				              			   		+ "<tr>" 
			           			   				+ "<th>옵션</th>"
		           			   				
	           			   			if(oi.orderOption == null){
	               			   			resultSend +=  "<td>"  + oi.orderCount + " 개</td>" 
	           			   							
	               			   		}else{
	                   			   		resultSend +=  "<td>" + oi.orderOption + " / " + oi.orderCount + " 개</td>" 
				   						
	           			   			}
           			   			}	
           			   			+ "</tr>"	
			   						+ "<th>총 결제 금액</th>"
       			   				+ "<td>" + oi.totalPrice + " 원</td>" 
       			   				+ "</tr>"
       			   				+ "</table>"
			                    	
			             
 	              			   
	              			  
           			   			$(".partnerOrder").html(resultSend);		
   	              			
		   				
		   					// 발송정보 update시 필요한 값
	              			 var ono = oi.orderNo;			// 주문번호
							 var company = oi.shippingCom;	// 택배사
							 var sno = oi.shippingNo;		// 운송장번호
							 
							 //console.log(ono);							 
							 //console.log(company);
							 //console.log(sno);
	              			 
							 // 값 넘겨주기
	              			 $(".ono").val(ono);
							 $(".company").val(company);
							 $(".sno").val(sno);
							 
	              		  	 
	              		},error:function(){
	    					console.log("발송ajax 조회실패");
	              		}
	    				});
	              	}
                  
	              	// 환불모달:펀딩내역+환불신청내역
	              	function ajaxRefundInfo(){
	              		var $orderNo = $(event.target).parent().siblings(".ono").text(); 
	              		//console.log($orderNo);
	              		
	              		$.ajax({
	              			url:"refund.info",
	              			data:{ono:$orderNo},
	              			success:function(ri){
	              				//console.log(ri);
	              				var ono = ri.orderNo;
	              				
	              				var resultOrder = "<table>"
				          			   				+ "<tr>" 
				          			   				+ "<td width='140'>펀딩번호</td>"
				          			   				+ "<td>" + ri.orderNo + "</td>" 
				          			   				+ "</tr>"
				              			   			+ "<tr>" 
				          			   				+ "<td>서포터명</td>"
				          			   				+ "<td>" + ri.supporterName + "</td>" 
				          			   				+ "</tr>"
				              			   			+ "<tr>" 
				          			   				+ "<td>펀딩내역</td>"
				          			   				
					          			   			if(ri.rewardTitle != ' ') {
					          			   				resultOrder += "<td width='300'>" + ri.rewardTitle + "</td>" 
								          			   				+ "</tr>"
								          			   				+ "<tr>" 
								          			   				+ "<td>옵션</td>"
						           			   						
					                   			   		if(ri.orderOption != null){
					                   			   			resultOrder += "<td>" + ri.orderOption + " / " + ri.orderCount + " 개</td>" 
					               			   							
					                   			   		}else{
					                   			   			resultOrder += "<td>" + ri.orderCount + " 개</td>" 
					                   			   			
					                   			   		}		
					                   			   				
					           			   			}else{
					           			   				resultOrder += "<td>" + ri.rewardContent +"</td>"
								   			   						+ "</tr>"
									              			   		+ "<tr>" 
								           			   				+ "<td>옵션</td>"
								           			   				
						           			   			if(ri.orderOption != null){
					                   			   			resultOrder += "<td>" + ri.orderOption + " / " + ri.orderCount + " 개</td>" 
					               			   							
					                   			   		}else{
					                   			   			resultOrder += "<td>" + ri.orderCount + " 개</td>" 
					                   			   			
					                   			   		}		
						           			   				
					           			   			}
					          			   			
				          			   				+ "</tr>"	
				              			   			+ "<td>총 결제 금액</td>"
				          			   				+ "<td>" + ri.totalPrice + " 원</td>" 
				          			   				+ "</tr>"
				          			   				+ "</table>"
				          			   				
   	              				var resultRefund = "<p>펀딩금 반환 신청 사유</p>"
   	              									+ "<table>"
				          			   				+ "<tr>" 
				          			   				+ "<th>환불신청번호</th>"
				          			   				+ "<td class=" + "'rno'" + ">" + ri.refundNo + "</td>" 
				          			   				+ "</tr>"
				              			   			+ "<tr>" 
				          			   				+ "<th>상세사유</th>"
				          			   				+ "<td>" + ri.reReason + "</td>" 
				          			   				+ "</tr>"
				              			   			+ "<tr>" 
				          			   				+ "<th>증빙자료</th>"
				          			   				+ "<td>"
				          			   				if(ri.reChangeName != null){
				          			   					resultRefund += /* "<image class='wh'" + "src="+ "'${"+ ri.reChangeName + "}'" + ">" */
			          			   				 						"<a href=" +"'${" + r.reChangeName "}'" +" download=" 
			          			   				 						+ "' ${" + r.reChangeName "}'" + ">환불 신청 증빙 자료</a>"
				          			   				}else{
				          			   					resultRefund += "자료없음"
				          			   				}
				          			   				
				          			   				+"</td>"
				          			   				+ "</tr>"
				          			   				+ "</table>"
				          			   				
          			   			var resultTable = "<tr>"
					            					+ "<th class=" + "'st1'" + ">반환 금액</th>"
											        + "</tr>"
											        + "<tr>"
											        + "<th>반환 신청 금액</th>"
											        + "<td>" + ri.totalPrice + "원</td>"
											        + "</tr>"
											        + "<tr>"
											        + "<td colspan=" + "2><b>상세금액</b>"
											        + "<table class=" + "'detailTb'" + ">" 
											        + "<tr>"
											        + "<td>리워드 금액</td>"
											        + "<td>"+ ri.totalPrice + " 원 </td>"
											        + "</tr>" 
											        + "<tr>"
											        + "<td>추가 후원금</td>"
											        + "<td>" + ri.orderPlus + " 원 </td>"
											        + "</tr>"
											        + "</table>"
											        + "</td>"
											        + "</tr>"   				

								$(".ono").val(ono);			        	
	   	              			$(".partnerRefund").html(resultOrder);
	              				$(".partnerRefundInfo").html(resultRefund);
	              				$(".refundTb").html(resultTable);
	              				
	              			},error:function(){
	              				console.log("환불 ajax 조회실패");
	              			}
	              			});
		              	}
	              	
					</script>

					<!-- 발송정보 입력창  -->
					<!-- The Modal -->
					<form action="insertShippingInfo" method="post">
					<div class="modal" id="sendInfoModal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content" style="width: 400px;">

								<!-- Modal Header -->
								<div class="modal-header none">
									<h5 class="modal-title">발송정보 입력</h5>
									<button type="button" class="close" data-dismiss="modal">×</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">

									<div class="partnerOrder">
										
									</div>

									<hr style="width: 95%;">

									<input type="hidden" class="ono" name="ono" value="">
									<div class="trackingInfo">
										<label>택배사</label> 
										<select id="company" name="company" required>
				                          	<option value="대한통운">대한통운</option>
				                            <option value="우체국">우체국 택배</option>
				                            <option value="로젠">로젠 택배</option>
				                            <option value="한진">한진 택배</option>
										</select> 
										<label>송장번호</label> 
										<input type="text" placeholder="숫자만 입력하세요" class="sno" name="sno" value="" required>
										<p>특수문자(-)없이 숫자만 입력해주세요</p>
									</div>
									
									<c:if test="${ !empty company }">
										<script>
										$(function(){
							        		$(".company option[value=${company}]").attr("selected", true);
							        	});
										</script>
									</c:if>
										
								</div>

								<!-- Modal footer -->
								<div class="modal-footer none">
									<button type="submit" onclick="form.submit();" class="btn btn-withus btn-block" data-dismiss="modal">완료</button>
								</div>

							</div>
						</div>
					</div>
                    </form>

					<!-- 환불신청내역 조회  / 임시 -->
					<!-- The Modal -->
					<div class="modal" id="refundInfo">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header none">
									<h5 class="modal-title">펀딩금 반환처리</h5>
									<button type="button" class="close" data-dismiss="modal">×</button>
								</div>

								<!-- Modal body -->
		                        <div class="modal-body">
		                          <label style="font-size:14px;">서포터가 펀딩금반환 요청한 내역을 확인하고 승인 또는 거절 처리하세요.</label>
		                          	<form name="refundResult">
		                          	<input type="hidden" class="ono" name="ono" value="">
		                            <div class="partnerRefund">
                                
		                           </div>
		                           <br>
		                           <div class="partnerRefundInfo">
		                            
		                           </div>
		           
		                           <table>
		                               <div class="refundTb">
								        
								       </div>
		                               <tr>
		                                   <td colspan="2" style="padding: 20px 0 0;">
		                                        [펀딩금 반환 신청 처리]
		                                   <table class="subTable">
		                                       <tr>
		                                           <td><b>승인</b></td>
		                                       </tr>
		                                       <tr>
		                                           <td class="ment">신청 사유가 반환 정책에 해당된다면, 승인처리하세요. 승인처리시, 결제 취소가 진행됩니다.</td>
		                                       </tr>
		                                       <tr>
		                                           <td><b>거절</b></td>
		                                       </tr>
		                                       <tr>
		                                           <td class="ment">신청 사유가 반환 정책에 해당하지 않은 경우, 거절 처리하세요. 결제취소가 진행되지 않습니다.</td>
		                                       </tr>
		                                   </table>
		                                   </td>
		                               </tr>
		                           	</table>
		                       	</div>
		
								<c:if test="${ refundStatus eq 'S' }">
								</c:if>		
		
								<!-- Modal footer -->
								<div class="modal-footer none">
									<button type="button" name="rstatus" value="Y"
											class="btn btn-withus approvalBtn" data-dismiss="modal">승인</button>
									<button type="button" name="rstatus" value="N"
											class="btn btn-danger oppositionBtn" data-dismiss="modal">거절</button>
								</div>
								<script>
									$(function() {
									    $("button[name=rstatus]").on('click', function() {
									        var rstatus = $(event.target).val();    
									        console.log(rstatus);
									        $("form[name=refundResult]")
							                .attr({ action:"refundable.part?rstatus="+rstatus, method:"post" })
							                .submit();
									    });
									});
								</script>
	                          	</form>
							
		
							</div>
						</div>
					</div>
					
					<!-- 버튼 조건처리해서 모달 하나로 통일 할꺼임 -->
					<!-- The Modal -->
					<div class="modal" id="refundInfo_done">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header none">
									<h5 class="modal-title">펀딩금 반환처리</h5>
									<button type="button" class="close" data-dismiss="modal">×</button>
								</div>

								<!-- Modal body -->
		                        <div class="modal-body">
		                          <label style="font-size:14px;">서포터가 펀딩금반환 요청한 내역을 확인하고 승인 또는 거절 처리하세요.</label>
		                          	<input type="hidden" class="ono" name="ono" value="">
		                            <div class="partnerRefund">
                                
		                           </div>
		                           <br>
		                           <div class="partnerRefundInfo">
		                            
		                           </div>
		           
		                           <table>
		                               <div class="refundTb">
								        
								       </div>
		                               <tr>
		                                   <td colspan="2" style="padding: 20px 0 0;">
		                                        [펀딩금 반환 신청 처리]
		                                   <table class="subTable">
		                                       <tr>
		                                           <td><b>승인</b></td>
		                                       </tr>
		                                       <tr>
		                                           <td class="ment">신청 사유가 반환 정책에 해당된다면, 승인처리하세요. 승인처리시, 결제 취소가 진행됩니다.</td>
		                                       </tr>
		                                       <tr>
		                                           <td><b>거절</b></td>
		                                       </tr>
		                                       <tr>
		                                           <td class="ment">신청 사유가 반환 정책에 해당하지 않은 경우, 거절 처리하세요. 결제취소가 진행되지 않습니다.</td>
		                                       </tr>
		                                   </table>
		                                   </td>
		                               </tr>
		                           </table>
		                       </div>
		
							
		
							</div>
						</div>
					</div>
					
				

		           	<!-- 페이징 -->
		            <div id="pagingArea">
						<ul class="pagination">
						
							<c:choose>
				        		<c:when test="${ pi.currentPage eq 1 }">
					           		<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					            </c:when>
					            <c:otherwise>
					            	<c:choose>
					            		<c:when test="${ empty shStatus and empty orStatus and empty condition and empty keyword }">
							            	<li class="page-item"><a class="page-link" href="orderNDeliveryList.part?currentPage=${ pi.currentPage - 1 }">이전</a></li>
							            </c:when>
							            <c:otherwise>
							            	<li class="page-item"><a class="page-link" href="orderNDeliverySearch.part?currentPage=${pi.currentPage - 1}&shStatus=${shStatus}&orStatus=${orStatus}&condition=${condition}&keyword=${keyword}">이전</a></li>
					            		</c:otherwise>
					            	</c:choose>
					            </c:otherwise>
					    	</c:choose>     
					    	   
					    	   
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:choose>
									<c:when test="${ empty shStatus and empty orStatus and empty condition and empty keyword }">
						            	<li class="page-item"><a class="page-link" href="orderNDeliveryList.part?currentPage=${p}">${ p }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="orderNDeliverySearch.part?currentPage=${p}&shStatus=${shStatus}&orStatus=${orStatus}&condition=${condition}&keyword=${keyword}">${ p }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>		            
					            
					            
					        <c:choose> 
					        	<c:when test="${ pi.currentPage eq pi.maxPage }">
					           	 	<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
					           	</c:when>
					           	<c:otherwise>
					           		<c:choose>
					            		<c:when test="${ empty shStatus and empty orStatus and empty condition and empty keyword }">
							           		<li class="page-item"><a class="page-link" href="orderNDeliveryList.part?currentPage=${ pi.currentPage + 1 }">다음</a></li>
							            </c:when>
							            <c:otherwise>
							            	<li class="page-item"><a class="page-link" href="orderNDeliverySearch.part?currentPage=${pi.currentPage + 1}&shStatus=${shStatus}&orStatus=${orStatus}&condition=${condition}&keyword=${keyword}">다음</a></li>
					            		</c:otherwise>
					            	</c:choose>
					           	</c:otherwise> 	
				        	</c:choose>
					
						</ul>
		            </div>
				</div>

			</div>
        
  		</div>  

	</div>
	
</body>
</html>