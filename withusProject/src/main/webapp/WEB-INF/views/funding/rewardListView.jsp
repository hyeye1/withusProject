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
	.innerOuter{
     	display:"flex";
	    border:3px solid blue;
	    width:1200px;
	    margin:auto;
	}
    .titleArea{
        border: 3px solid red;
        background-color: rgb(220, 170, 128);
    }
    .titleArea div{
        display: inline-block;
        border: 3px solid pink;
    }
    .back a{
        text-decoration: none;
        font-size: 12px;
        color: white;
    }
    .title{
        font-size: 20px;
        font-weight: bold;
        color: white;
    }
    .rewardArea{
        border: 3px solid red;
        margin: auto;
        width: 80%;
    }
    .rewardList{
        border: 3px solid pink;
        background-color: lightcyan;
    }
    .rewardList div{
        display: inline-block;
        margin: auto;
        border: 1px solid black;
    }
    .plusArea{
        border: 3px solid red;
        margin: auto;
        width: 80%;
    }
    .plus{
        margin: auto;
        border: 1px solid black;
    }
    #next{
        margin-left: 45%;
    }
    .total{
        border: 3px solid red;
        margin: auto;
        width: 80%;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	<hr>

    <div class="innerOuter">

        <div class="titleArea">
            <div class="back" style="width: 15%;" align="left"><a href=""> < 스토리로 돌아기기</a></div>
            <div class="title" style="width: 70%;" align="center">세련되고 시크한 당신을 위한, 투명 시계</div>
            <div style="width: 14%;"></div>
        </div>

        <form name="purchaseForm" class="rewardArea" method="POST">
            <h3>리워드 선택</h3>

            <div class="rewardList">
                <div class="rewardCheck" style="width: 10%;" align="center"><input type="checkbox"></div>
                <div class="rewardContent" style="width: 89%;">
                    <p>
                        17900원 펀딩합니다. <br>
                        [얼리버드] 투명 시계 3개 (10개 남음) <br>
                        배송비 없음|리워드 제공 예상일 2021년 06월 초 예정
                    </p>
                </div>
            </div>

            <br>

            <div class="rewardList">
                <div class="rewardCheck" style="width: 10%;" align="center"><input type="checkbox"></div>
                <div class="rewardContent" style="width: 89%;">
                    <p>
                        17900원 펀딩합니다. <br>
                        [얼리버드] 투명 시계 3개 (10개 남음) <br>
                        배송비 없음|리워드 제공 예상일 2021년 06월 초 예정
                    </p>
                </div>
            </div>

            <br>
            
            <div class="rewardList">
                <div class="rewardCheck" style="width: 10%;" align="center"><input type="checkbox"></div>
                <div class="rewardContent" style="width: 89%;">
                    <p>
                        17900원 펀딩합니다. <br>
                        [얼리버드] 투명 시계 3개 (10개 남음) <br>
                        배송비 없음|리워드 제공 예상일 2021년 06월 초 예정
                    </p>
                </div>
            </div>

            <br>
            
            <div class="rewardList">
                <div class="rewardCheck" style="width: 10%;" align="center"><input type="checkbox"></div>
                <div class="rewardContent" style="width: 89%;">
                    <p>
                        17900원 펀딩합니다. <br>
                        [얼리버드] 투명 시계 3개 (10개 남음) <br>
                        배송비 없음|리워드 제공 예상일 2021년 06월 초 예정
                    </p>
                </div>
            </div>
        </form>

        <div class="plusArea">
            <h3>후원금 더하기 (선택)</h3>
            <div class="plus">
                <input type="text"> 원을 추가로 후원합니다.
            </div>
        </div>

        <div class="total">
            <p>세련되고 시크한 당신을 위한, 투명 시계에 435,700원을 펀딩합니다.</p>
        </div>
    </div>
    <br>

    <button id="next" align="center">다음 단계로 ></button>
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>