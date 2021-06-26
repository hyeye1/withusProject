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
  .wrap{width: 1000px; height: 1800px; position: relative;}
  .wrap>div{width: 100%;}

  /* 메뉴 아래 선 */
  #underLine{
    background-color: rgb(192, 189, 189);
    height: 1.5px;
    width: 80%;
  }
  #mypage{height: 100%; position: absolute; top: 3%; left: 7%;}
  
  /* mypage안의 세부영역 */
  #mypage>div{height: 100%;}
  #content{width: 100%;}

  /*큰제목*/
  .mainTitle{font-size: 23px; font-weight: bolder;}
  
  /* fundingList content */
  .list #content_1{height: 80%; margin-top: 50px; width: 80%;}

  /* 페이징*/
  #pagingArea{width:fit-content; margin:auto; margin-top: 50px;} 



  /* 내꺼 */
  .statusBox{border: 1px solid lightgray; padding: 20px;}

  .dTable { width: 100%;text-align: left;}

  .mentBox{background: #f4f4f4; border-radius: 2px; margin: 20px 0; padding: 20px;}

  .searchForm{margin: 10px 0; }
  .searchForm select{height: 38px; border-color: lightgray; outline: none; float: left; margin-right: 5px; font-size: 13px;}
  .keyword_1 { width: 60%;float: left;} 
  .keyword_2 {width: 40%; float: right;} 
  .input-group.search {width: 70%;}
  .btn.searchBtn{background-color: #3498db;}
  .fa.fa-search{color: white;}

  #orderList{text-align: center; margin: auto; margin-top: 70px;}
  #orderList th{font-size: 12px;}
  #orderList td{font-size: 13px;}
  #orderList td, #orderList th{padding: .20rem; vertical-align: inherit;}

  
  button.btn.btn-sm {font-size: 10px; text-align: justify; padding: 5px; }
  .btn.btn-withus{background-color: #3498db; color: white;}
  .btn.btn-withus:hover{cursor: pointer; background-color: #2c83be; color: white;}

  /* modla css */
  /* 공통 */
  .modal-header.none, .modal-footer.none{border: none;}

  /*sendInfoModal*/
  .partnerOrder, .trackingInfo{ padding:0 20px;}
  .partnerOrder table, .trackingInfo *{ font-size: 14px; width: 90%;}
  .partnerOrder table *{padding: 3px 0;}
  .modal-body th {color: grey; font-weight: 500;}
  .trackingInfo select{margin-bottom: 15px; height: 30px;} 
  .trackingInfo label{font-size: 15px; font-weight: 550;}

  /*refundInfo*/
  .subTable{width: 100%; background-color: #f4f4f4;}
  .subTable *{font-size: 14px;}
  .subTable{border:16px solid #f4f4f4;}

  button.btn.btn-withus.approvalBtn{ width: 48%; float: left;}
  button.btn.btn-danger.oppositionBtn{ width: 48%;}


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
								<th>발송 준비 중</th>
								<th>배송 중</th>
								<th>배송 완료</th>
							</tr>
							<tr>
								<td>3 건</td>
								<td>0 건</td>
								<td>0 건</td>
								<td>0 건</td>
							</tr>
							<tr>
								<th rowspan="2">펀딩금 반환 상태</th>
								<th>신청</th>
								<th>신청 취소</th>
								<th>완료</th>
								<th>거절</th>
							</tr>
							<tr>
								<td>3 건</td>
								<td>0 건</td>
								<td>0 건</td>
								<td>0 건</td>
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

						<form action="">
							<div class="searchForm">
								<div class="keyword_1">
									<select name="" id="">
										<option value="">발송 배송 : 전체</option>
										<option value="">미발송</option>
										<option value="">발송준비중</option>
										<option value="">배송 중</option>
										<option value="">배송완료</option>
									</select> <select name="" id="">
										<option value="">결제 상태 : 전체</option>
										<option value="">결제완료</option>
										<option value="">취소요청</option>
										<option value="">취소완료</option>
									</select>
								</div>

								<div class="keyword_2">
									<select name="" id="">
										<option value="">펀딩번호</option>
										<option value="">발송번호</option>
										<option value="">서포터</option>
									</select>
									<div class="input-group search">
										<input type="text" class="form-control"
											placeholder="검색어를 입력하세요">
										<div class="input-group-append">
											<button class="btn searchBtn" type="submit">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
						</form>


						<table class="table table-border" id="orderList">
							<thead>
								<tr>
									<th width="80">펀딩번호</th>
									<th width="60">서포터 정보</th>
									<th width="60">결제</th>
									<th width="80">결제금액</th>
									<th width="200">리워드</th>
									<th width="110">발송정보</th>
									<th width="80">발송 예정일</th>
									<th width="80">발송·배송</th>
									<th width="80">발송번호</th>
									<th width="80">펀딩금 반환</th>
								</tr>
								<tr>
									<td>10491</td>
									<td>박상이</td>
									<td>완료</td>
									<td>35,000원</td>
									<td>[얼리버드]가치가자 세트X1개</td>
									<td><button type="button" class="btn btn-withus btn-sm"
											data-toggle="modal" data-target="#sendInfoModal">발송정보
											입력</button></td>
									<td>2021-05-말</td>
									<td>미발송</td>
									<td>대한통운 <br> 10659
									</td>
									<td style="font-size: 10px;">
										<!-- 조건처리 해야 되는데...--> <!-- 리워드 기간 --> 지연반환 신청기간 <br>
										2021-05-11 ~ 2021-00-00<br> <!-- 리워드 종료일 이후 --> 신청 <br>
										<button type="button" class="btn btn-danger btn-sm"
											data-toggle="modal" data-target="#refundInfo">확인하기</button>
									</td>
								</tr>
							</thead>
						</table>

					</div>

					<!-- 발송정보 입력창  -->
					<!-- The Modal -->
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
										<table>
											<tr>
												<th>펀딩번호</th>
												<td>10491</td>
											</tr>
											<tr>
												<th>서포트명</th>
												<td>박상이</td>
											</tr>
											<tr rowspan="2">
												<td><h6>[얼리버드]가치가자 세트X1개</h6></td>
											</tr>
											<tr>
												<th>옵션정보..?</th>
												<td>10658</td>
											</tr>
											<tr>
												<th>총 결제 금액</th>
												<td>35,000원</td>
											</tr>
										</table>
									</div>

									<hr style="width: 95%;">

									<div class="trackingInfo">
										<label>택배사</label> <select>
											<option value="">대한통운</option>
											<option value="">우체국 택배</option>
											<option value="">로젠 택배</option>
											<option value="">000택배</option>
										</select> <label>송장번호</label> <input type="text"
											placeholder="숫자만 입력하세요">
										<p>특수문자(-)없이 숫자만 입력해주세요</p>

									</div>

								</div>

								<!-- Modal footer -->
								<div class="modal-footer none">
									<button type="button" class="btn btn-withus btn-block" data-dismiss="modal">완료</button>
								</div>

							</div>
						</div>
					</div>

					<!-- 환불신청내역 조회  -->
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
									<label style="font-size: 14px;">서포터가 펀딩금반환 요청한 내역을 확인하고
										승인 또는 거절 처리하세요.</label>
									<div class="partnerOrder">
										<table class="">
											<tr>
												<th>펀딩번호</th>
												<td>10491</td>
											</tr>
											<tr>
												<th>서포트명</th>
												<td>박상이</td>
											</tr>
											<tr rowspan="2">
												<td><h6>[얼리버드]가치가자 세트X1개</h6></td>
											</tr>
											<tr>
												<th>옵션정보..?</th>
												<td>10658</td>
											</tr>
											<tr>
												<th>총 결제 금액</th>
												<td>35,000원</td>
											</tr>
										</table>
									</div>
									<br>
									<p>펀딩금 반환 신청 사유</p>
									<table style="width: 100%">
										<tr>
											<th>사유</th>
											<td>제품불량</td>
										</tr>
										<tr>
											<th>상세사유</th>
											<td>불량</td>
										</tr>
										<tr>
											<th>증빙자료</th>
											<td>파일첨부파일 : 원본명.jpg</td>
										</tr>
									</table>

									<hr style="width: 100%;">
									<table>
										<tr>
											<td colspan="2">반환 금액</td>
										</tr>
										<tr>
											<td>반환 신청 금액</td>
											<td>35,000원</td>
										</tr>
										<tr>
											<td colspan="2">상세금액
												<table class="subTable">
													<tr>
														<td>리워드 금액</td>
														<td>35,000원</td>
													</tr>
													<tr>
														<td>배송비</td>
														<td>0원</td>
													</tr>
													<tr>
														<td>추가 후원금</td>
														<td>0원</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td colspan="2">펀딩금 반환 신청 처리
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

								<!-- Modal footer -->
								<div class="modal-footer none">
									<button type="button" class="btn btn-withus approvalBtn" data-dismiss="modal">승인</button>
									<button type="button" class="btn btn-danger oppositionBtn" data-dismiss="modal">거절</button>
								</div>

							</div>
						</div>
					</div>

		           	<!-- 페이징 -->
		            <div id="pagingArea">
						<ul class="pagination">
		                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		                    <li class="page-item"><a class="page-link" href="#">1</a></li>
		                    <li class="page-item"><a class="page-link" href="#">2</a></li>
		                    <li class="page-item"><a class="page-link" href="#">3</a></li>
		                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
		            </div>
				</div>

			</div>
        
  		</div>  

	</div>
	
</body>
</html>