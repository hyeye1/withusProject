<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
								<td width="190"><input type="number" class="form-control" name="orderCount" required style="width: 150px;"></td>
								<c:if test="${ dr.optionYn == 'Y' }">
									<th width="50">옵션 : </th>
									<td width="270"><input type="text" class="form-control" name="orderOption" required style="width: 450px;"></td>
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
	
	$(function(){
		$("input[name=rewardNo]").change(function(){
			
			$(".optionContent").empty();
			
			if($(this).prop("checked")){
				var value='<th width="50">수량 :</th><td width="190"><input type="number" class="form-control" name="orderCount" required style="width: 150px;"></td>';
				
				if($(this).next().val() == 'Y'){
					value += '<th width="50">옵션 : </th><td width="270"><input type="text" class="form-control" name="orderOption" required style="width: 450px;"></td>';
				}	
					
				$(this).parents(".rewardSelect").children(".optionContent").html(value);
			}
		})
	})
	
</script>
</body>
</html>