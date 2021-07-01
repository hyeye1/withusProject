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
    .titleArea{
        outline: 1px solid red;
        background-color: rgb(220, 170, 128);
		height: 50px;
    }
    .titleArea div{
        /* outline: 1px solid yellow; */
		float:left;
    }
	.back{height: 100%; width: 15%; padding: 13px 0 0 10px;}
    .back a{text-decoration: none; font-size: 15px; color: white !important;}
    .title{width: 70%; height: 100%; font-size: 20px; font-weight: bold; color: white; padding-top: 10px;}
	.empty{width: 15%; height: 100%;}


	/* 컨텐츠 */
	.innerOuter{
	    /* outline:1px solid blue; */
	    width: 1000px;
	    margin: auto;
		padding: 50px 50px;
	}

	.rewardSelect {width: 900px; padding: 15px 0 15px 0; margin-bottom: 15px; background-color: rgb(234, 234, 234); }
	.rewardContent tr{height: 33px;}
	.rewardContent td{padding-left: 10px;}
	.rewardContent th{padding-left: 10px; font-size: x-large;}
	#rewardNo{margin-left: 32px;}

	.optionContent {margin: 7px 0 0 110px;}
	

	.moneyArea {outline: 1px solid black;}
	.moneyArea {width: 900px;}
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
								<th width="50">수량 :</th>
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
			

<br><br><br>


			<div class="moneyArea">
				<div class="plusArea" style="display: table;">
					<div style="display: table-cell;"><h3>후원금 더하기 (선택)</h3></div>
					<div>후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</div>
				</div>

				
				<div class="total" align="center">
					<div><input type="number" name="orderPlus" value="0"> 원을 추가로 후원합니다.</div>
					<div><p>${ drList[0].projectTitle }에 <span id="allTotalPrice"></span>원을 펀딩합니다.</p></div>
				</div>
			</div>
			<br>
	
			<button type="submit" id="next">다음 단계로 ></button>
		
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