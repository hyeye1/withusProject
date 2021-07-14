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
    #termImage {width:750px; margin:auto;}
    
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
	
	            <div class="content1">
	                <table id="table1" class="table table-borderless">
	                    <tr style="border-top: 1px solid darkgray;">
	                        <th colspan="2" style="color: rgb(52, 152, 219); font-size: 22px; font-weight: 800;">
	                            ${ fd.rewardTitle }
	                            <input type="hidden" name="projectNo" value="${ o.projectNo }">
	                            <input type="hidden" id="hiddenTitle" name="projectName" value="${ o.projectName }">
	                            <input type="hidden" name="rewardNo" value="${ o.rewardNo }">
	                            <input type="hidden" name="rewardTitle" value="${ fd.rewardTitle }">
	                        </th>
	                    </tr>
	                    <tr>
	                        <td colspan="2" style="text-align: left !important;">${ fd.rewardContent }<input type="hidden" name="rewardContent" value="${ fd.rewardContent }"></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">수량 : ${ o.orderCount }개<input type="hidden" name="orderCount" value="${ o.orderCount }"></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">옵션 : ${ o.orderOption }<input type="hidden" name="orderOption" value="${ o.orderOption }"></td>
	                    </tr>
	                    <tr style="border-top: 1px solid darkgray;">
	                        <th>추가 후원금</th>
	                        <td>${ o.orderPlus }원<input type="hidden" name="orderPlus" value="${ o.orderPlus }"></td>
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
	                        	<input type="hidden" name="totalPrice" value="${ fd.rewardPrice * o.orderCount + o.orderPlus}">
	                        </td>
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
	                            <td><input type="hidden" name="memberNo" value="${ loginUser.memberNo}"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">이메일 <button class="btn btn-primary" style="margin-left: 10px;">인증번호 발송</button></td>
	                        </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" name="purEmail"></td>
	                            <td></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">이메일 인증번호</td>
	                        </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" placeholder="인증번호"></td>
	                            <td><button class="btn btn-primary" style="width: 126.39px;">인증</button></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">환급받을 계좌정보 입력</td>
	                        </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" name="bankName" placeholder="ex) 국민은행" required></td>
	                            <td></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control" name="bankAccount" placeholder="계좌번호를 입력해주세요"></td>
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
	                            <td colspan="2"><input type="text" name="receiverName" class="form-control"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">휴대폰 번호</td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" name="receiverPhone" class="form-control"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">주소</td>
	                        </tr>
	                        <tr>
	                            <td><input type="text" class="form-control" id="postcode" name="addressNo" placeholder="우편번호"></td>
	                            <td><input type="button" class="btn btn-primary" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control" id="address" name="address"  placeholder="도로명주소"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control" id="detailAddress" name="addressDetail" placeholder="상세주소"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control" id="extraAddress" placeholder="너는뭐냐"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">배송시 요청사항(선택)</td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"><input type="text" class="form-control" name="shippingReq" placeholder="ex) 부재시 경비실에 보관해주세요"></td>
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
	                                <input type="checkbox" class="form-check-input" id="allAgree" name="optradio">전체 동의하기
	                            </label>
	                        </th>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <th>
	                            <label class="form-check-label">
	                                <input type="checkbox" class="form-check-input" id="agree1" name="optradio">제 3자에 대한 개인정보 제공 동의
	                            </label>
	                        </th>
	                        <td><a data-toggle="modal" data-target="#myModal1">보기</a></td>
	                    </tr>
	                    <tr>
	                        <th>
	                            <label class="form-check-label">
	                                <input type="checkbox" class="form-check-input" id="agree1" name="optradio">책임 규정에 대한 동의
	                            </label>
	                        </th>
	                        <td><a data-toggle="modal" data-target="#myModal2">보기</a></td>
	                    </tr>
	
	                </table>
	            </div>
	
	        </div> 
	
	        <div class="buttonArea">
	            <button type="button" id="pay" class="btn btn-primary" align="center" disabled="disabled">다음 단계로></button>
	        </div>
	        
	    </form>   
		
    </c:if>
    
    <!-- The Modal -->
	<div class="modal" id="myModal1">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">제 3자에 대한 개인정보 제공 동의</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <img id="termImage" src="resources/images/agree1.png" >
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<c:if test="${ !empty condition }">
		<script>
			$(function(){
				$("#search-area option[value=${ condition }]").attr("selected", true);
			})
		</script>
	</c:if>
	
	<!-- The Modal -->
	<div class="modal" id="myModal2">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">책임 규정에 대한 동의</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <img id="termImage" src="resources/images/agree2.png">
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    	
        function execDaumPostcode() {
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
                        document.getElementById("extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("extraAddress").value = '';
                    }
   
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
        
        /*
        var $allAgree = $('#allAgree');
        $allAgree.change(function () {
          var $this = $(this);
          var checked = $this.prop('checked');
          $('input[name="optradio"]').prop('checked', checked);

        });

        var boxes = $('input[name="optradio"]');
        boxes.change(function () {

          var boxLength = boxes.length;
          // 체크된 체크박스 갯수를 확인하기 위해 :checked 필터를 사용하여 체크박스만 선택한 후 length 프로퍼티를 확인
          var checkedLength = $('input[name="optradio"]:checked').length;
          var selectAll = (boxLength == checkedLength);

          $al.prop('checked', selectAll);

        });
        */
        $(document).ready(function(){

        	//전체 체크 클릭 시, 나머지 체크 
        	$("#allAgree").click(function(){
        	var allAgree=$('input[name="optradio"]').prop("checked");

        	    if(allAgree){
        	        $('input[name="optradio"]').prop("checked",true);
        	        $("#pay").prop("disabled",false);
        	    }
        	    else{
        	        $('input[name="optradio"]').prop("checked",false);
        	        $("#pay").prop("disabled",true);
        	    }
        	});

        	// 모든 체크박스를 클릭하면 버튼 활성화시키기
        	$('input[name="optradio"]').click(function(){
        	    var tmpp = $(this).prop('checked'); 
        	    //자식 체크 전체 체크시, 부모 체크박스 체크 됨
        	    var tt = $('input[name="optradio"]').length;
        	    var ss = $('input[name="optradio"]:checked').length;
        	    
        	    //선택한 체크박스 값이 true 이거나 체크박스 1개 이상 체크시 버튼 활성화시키기
        	    if(tmpp==true){
        	    $("#pay").prop("disabled",false);
        	    }
        	    else{
        	    $("#pay").prop("disabled",true);
        	    }
        	    
        	    
        	    // 체크박스가 모두 선택되었을 때 상위 체크박스 선택되도록 설정
        	    if(tt == ss){
        	    	$("#allAgree").prop("checked",true);
        	    }else{
        	    	$("#allAgree").prop("checked",false);
        	    }
        	    
        		});
        	  
        	});
    </script>
	
    <br><br><br>
    
    <script>
        $("#pay").click(function () {
            var IMP = window.IMP;
            IMP.init('imp92038952');
            IMP.request_pay({
                pg: 'inicis',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: $(".titleArea .title").children("span").text(),
                amount: $(".content1 #table2").find("input").val(),
                buyer_email: '',
                buyer_name: $("#table3").find("input").val(),
                buyer_tel: '',
                buyer_addr: '',
                buyer_postcode: '',
                m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            }, function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
                $("#sss").submit();
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            });
        });
        </script>
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>