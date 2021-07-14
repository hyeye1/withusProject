<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">		

<style>
	div{box-sizing: border-box;}

	/* 타이틀 */
    .titleArea{height: 50px; background-color: rgb(220, 170, 128); margin-top: -17px;}
    .titleArea div{float:left;}
	.back{height: 100%; width: 15%; padding: 13px 0 0 10px;}
    .back a{text-decoration: none; font-size: 15px; color: white !important;}
    .title{width: 70%; height: 100%; font-size: 20px; font-weight: bold; color: white; padding-top: 10px;}
	.empty{width: 15%; height: 100%;}


	/* 컨텐츠 */
	.innerOuter{width: 1000px; margin: auto; padding: 50px 50px;}
	.rewardSelect {width: 900px; padding: 15px 0 15px 0; margin-bottom: 15px; background-color: rgb(234, 234, 234); }
	.rewardContent tr{height: 33px;}
	.rewardContent td{padding-left: 10px;}
	.rewardContent th{padding-left: 10px; font-size: x-large;}
	#rewardNo{margin-left: 32px;}
	.optionContent {margin: 7px 0 0 110px;}
	
	/* 후원금 */
	/* .donationArea {outline: 1px solid purple;} */
	.donationArea div {padding: 10px 0 10px 0; text-align: center !important;}

	.plusInfo1 h3 {font-weight: 1000 !important;}
	.inputSize {width: 250px !important;}
	.plusInfo3 {font-size: 20px; font-weight: 550;}
	.plusInfo3 span {color: rgb(52, 152, 219); font-size: 30px; font-weight: 700;}

	/* 버튼 */
	.button {text-align: center !important;}
	.btn-primary {color: white !important; width: 200px; height:50px;}
	
	/* 수량 */
	.optionContent {text-align:left; padding: 15px 25px 15px 25px;}
    .optionContent input {width: 75px; text-align: center; padding-left: 15px; margin-top: 5px;}
    .optionContent button {padding-top: 0 !important;}
    .optionContent button:focus {box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(255, 255, 255, 0) !important;}
    /*#count {float:left;}*/
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	<hr>

	<div class="titleArea">
        <div class="back" align="left"><a href=""> < 스토리로 돌아기기</a></div>
        <div class="title" align="center">${ drList[0].projectTitle }</div>
        <div class="empty"></div>
    </div>

    <div class="innerOuter">
		<form id="selectRewardForm" method="POST" action="check.fun">
			<h3>리워드 선택</h3><br>
			<input type="hidden" name="projectName" value="${ drList[0].projectTitle }">
			<input type="hidden" name="projectNo" value="${ pno }">
			
			<c:forEach var="dr" items="${ drList }">
				<div class="rewardSelect">
					<table class="rewardContent">
						<tr>
							<c:choose>
								<c:when test="${ rno == dr.rewardNo }">
									<th rowspan="5" width="100"><input type="radio" id="rewardNo" name="rewardNo" value="${ dr.rewardNo }" style="width: 20px;height:20px;border:1px;" checked><input type="hidden" value="${ dr.optionYn }"></th>
								</c:when>
								<c:otherwise>
									<th rowspan="5" width="100"><input type="radio" id="rewardNo" name="rewardNo" value="${ dr.rewardNo }"style="width: 20px;height:20px;border:1px;" ><input type="hidden" value="${ dr.optionYn }" ></th>
								</c:otherwise>
							</c:choose>
							<th width="800">${ dr.rewardPrice }원 펀딩합니다.</th>
						</tr>
						<tr>
							<td>${ dr.rewardTitle } (${ dr.rewardStock }개 남음)</td>
						</tr>
						<tr>
							<td>${ dr.rewardContent }</td>
						</tr>
						<tr>
							<td>리워드 제공 예상일 ${ dr.deliveryDate } 이후 발송 예정</td>
						</tr>
					</table>
					
					<table class="optionContent">
						<tr>
							<c:if test="${ rno == dr.rewardNo }">
								<th width="50">수량 : </th>
								<td width="200">
									<button type="button" class="btn" onclick="fnCalCount('m', this);"><i class="fas fa-minus-circle"></i></button>
                                    <input type="number" name="orderCount" id="count" value="1" readonly style="width:70px;"/>
                                    <button type ="button" class="btn" onclick="fnCalCount('p',this);"><i class="fas fa-plus-circle"></i></button>
								</td>
								<td class="maxQuantity" hidden>5</td>
								
								<c:if test="${ dr.optionYn == 'Y' }">
									<th width="50">옵션 : </th>
									<td width="270"><input type="text" name="orderOption" required style="width: 450px;"></td>
								</c:if>
							</c:if>
						</tr>
					</table>
				</div>
			</c:forEach>

			<br><br>

			<div class="donationArea" align="center">
				<div class="plusInfo1" style="display: table;">
					<div style="display: table-cell;"><h3>후원금 더하기 (선택)</h3></div>
					<div style="margin-left: 15px;">후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</div>
				</div>

				<div class="plusInfo2" style="display: table;">
					<div class="inputSize" style="display: table-cell;"><input type="number" name="orderPlus" value="0" class="form-control"></div>
					<div style="margin-left: 10px;">원을 추가로 후원합니다.</div>
				</div>

				<div class="plusInfo3">
					<div><p>${ drList[0].projectTitle }에 펀딩합니다.</p></div>
				</div>
			</div>
	
			<div class="button">
				<button type="submit" id="next" class="btn btn-primary" align="center">다음 단계로></button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

	<script>
	function fnCalCount(type, ths){
        var $input = $(ths).parents("td").find("input[name='orderCount']");
        var pCount = Number($input.val());
        
        if(type=='p'){
            if(pCount < 5 ){
                $input.val(Number(pCount)+1); 
            }else if(pCount = 6){ 
                Swal.fire({
                    icon: 'error',
                    text: '최대 주문수량은 5개 입니다.'
                });
            }
        }else{
            if(pCount > 1){
                $input.val(Number(pCount)-1);

            }else if(pCount = 1){
                Swal.fire({
                    icon: 'error',
                    text: '수량은 1개 이상 입력해 주십시오.'
                });
            }
        }
    }
	
	$(function(){
		$("input[name=rewardNo]").change(function(){
			
			$(".optionContent").empty();
			
			if($(this).prop("checked")){
				var value = '<th width="50">수량 : </th>'
					value += '<td width="200">'
					value += '<button type="button" class="btn" onclick="fnCalCount('
					value += "'m'"
					value += ', this);"><i class="fas fa-minus-circle"></i></button>'
					value += '<input type="number" name="orderCount" id="count" value="1" readonly style="width:70px;"/>'
				    value += '<button type ="button" class="btn" onclick="fnCalCount('
				    value += "'p'"
				    value += ',this);"><i class="fas fa-plus-circle"></i></button>'
				    value += '</td>'
				    value += '<td class="maxQuantity" hidden>5</td>'
				if($(this).next().val() == 'Y'){
					value += '<th width="50">옵션 : </th><td width="270"><input type="text" name="orderOption" required style="width: 450px;"></td>';
				}	
					
				$(this).parents(".rewardSelect").children(".optionContent").html(value);
			}
		})
	})

    
</script>
</body>
</html>