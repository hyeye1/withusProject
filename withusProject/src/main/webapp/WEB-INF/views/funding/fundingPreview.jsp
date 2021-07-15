<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <!-- jQuery 라이브러리 -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <!-- 부트스트랩에서 제공하고 있는 스타일 -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
            <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

            <!-- css 
            <link rel="stylesheet" type="text/css" href="resources/css/funding/fundingDetails.css">
			-->
			
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	
	.detailOuter {
	    width: 1200px;
	    height: 100%;
	    margin: auto;
	    cursor: default;
	    position: relative;
	}
	
	.detailOuter button {
	    cursor: pointer;
	}
	
	.detailHeader {
	    height: 800px;
	    padding: 45px;
	    padding-left: 55px;
	}
	
	.detailCat button {
	    font-size: 13px;
	    width: 86px;
	    height: 30px;
	    padding: 0;
	    border-radius: 3px;
	    border: 1px solid rgb(94, 94, 94);
	    margin-bottom: 20px;
	    background-color: white;
	    color: rgb(94, 94, 94);
	}
	
	.partner img {
	    width: 30px;
	    margin-right: 10px;
	}
	
	.detailTitle {
	    font-size: 35px;
	}
	
	.detailThumb {
	    float: left;
	}
	
	.detailAside {
	    height: 450px;
	    float: left;
	    padding-left: 10px;
	    padding-top: 10px;
	    font-size: 25px;
	    line-height: 2;
	    margin-left: 21px;
	}
	
	.infoTitle {
	    font-size: 20px;
	    width: 120px;
	}
	
	.infoSmall {
	    font-size: 21px;
	}
	
	.infoPs {
	    font-size: 15px;
	}
	
	.infoPs p {
	    height: 80px;
	    width: 410px;
	    background-color: rgba(107, 148, 175, 0.16);
	    line-height: 2;
	    padding-top: 11px;
	    padding-left: 15px;
	    border-radius: 10px;
	}
	
	.infoBtn button {
	    width: 249px;
	    height: 49px;
	    font-size: 18px;
	    vertical-align: 8px;
	    margin-right: 28px;
	    background-color: rgb(52, 152, 219);
	    border: none;
	    color: white;
	    border-radius: 10px;
	}
	
	.goalPrice {
	    font-size: 29px;
	    line-height: 1.3;
	}
	
	.detailMenubar {
	    width: 100%;
	    padding: 23px;
	    border-top: 1.5px solid rgb(94, 94, 94);
	    border-bottom: 1.5px solid rgb(94, 94, 94);
	    padding-left: 100px;
	}
	
	.detailMenubar b{
	    color: rgb(64, 64, 64);
	    font-size: 18px;
		margin: 20px;
		cursor: pointer !important;
	}

	
	.menuSelected {
	    background-color: rgb(52, 152, 219);
	    width: 70px;
	    height: 5px;
	    float: left;
	    margin-top: -6px;
	}
	
	.detailBody {
	    width: 100%;
	    background-color: rgba(224, 224, 224, 0.45);
	    position: absolute;
	}
	
	.detailRight {
	    width: 400px;
	    float: right;
	    padding: 35px;
	}
	
	.detailPartner {
	    background-color: white;
	    padding: 20px;
	    padding-top: 30px;
	    padding-bottom: 30px;
	    font-size: 19px;
	}
	
	.rightPartner {
	    display: table;
	    margin-top: 25px;
	    width: 100%;
	}
	
	.rightPartner img {
	    width: 40px;
	    float: left;
	    margin-left: 10px;
	    margin-right: 0px;
	}
	
	.rightPartner p {
	    display: table-cell;
	    line-height: 2px;
	    vertical-align: middle;
	}
	
	.rightPartner button {
	    float: right;
	    background-color: rgb(94, 94, 94);
	    border: none;
	    border-radius: 5px;
	    color: white;
	    font-size: 12px;
	    margin-bottom: 10px;
	    margin-right: 9px;
	}
	
	#partnerWho {
	    font-size: 15px;
	    line-height: 2;
	    margin-top: 30px;
	}
	
	.partnerBtn button {
	    width: 100%;
	    height: 40px;
	    margin-top: 30px;
	    border: none;
	    border-radius: 5px;
	    background-color: rgb(224, 224, 224);
	    padding-bottom: 5px;
	    padding-left: 10px;
	}
	
	.partnerBtn span {
	    float: right;
	    margin-top: 6px;
	    margin-right: 50px;
	    margin-left: -40px;
	    font-size: 15px;
	    color: rgb(94, 94, 94);
	}
	
	.detailReward,
	.hashtag {
	    margin-top: 20px;
	    padding: 20px;
	    padding-top: 35px;
	    padding-bottom: 35px;
	    font-size: 19px;
	    background-color: white;
	}
	
	.chooseReward {
	    border: 1px solid rgb(94, 94, 94);
	    border-radius: 5px;
	    padding: 20px;
	}
	
	.rePrice {
	    font-size: 20px;
	    font-weight: 600;
	    cursor: pointer;
	}
	
	.reNumber {
	    border: 1px solid rgb(44, 62, 80);
	    background-color: rgba(26, 188, 156, 0.2);
	    border-radius: 5px;
	    font-size: 12px;
	    padding: 3px;
	    float: right;
	}
	
	.reTitle {
	    font-size: 15px;
	    margin-top: 20px;
	    margin-bottom: 0px;
	}
	
	.chooseReward li {
	    font-size: 14px;
	    margin-left: -20px;
	}
	
	.supportReward {
	    font-size: 14px;
	    margin-top: 25px;
	    display: none;
	    /* 클릭시 생성 */
	}
	
	.rewardOption {
	    width: 243px;
	    height: 35px;
	    border-radius: 5px;
	    cursor: pointer;
	}
	
	.supportPlus {
	    margin-top: 20px;
	    color: rgb(127, 127, 127);
	}
	
	.supportPlus input {
	    width: 243px;
	    height: 30px;
	    margin-top: 10px;
	    border: 1px solid rgb(127, 127, 127);
	    border-radius: 5px;
	}
	
	.supportPlus p {
	    font-size: 12.5px;
	    margin-top: 8px;
	    margin-bottom: 25px;
	}
	
	.supportReward button {
	    width: 250px;
	    height: 35px;
	    border-radius: 5px;
	    border: none;
	    background-color: rgb(52, 152, 219);
	    color: white;
	    margin-bottom: 10px;
	    cursor: pointer;
	}
	
	.hashtag a {
	    margin: 7px;
	    width: 80px;
	    height: 40px;
	    font-size: 18px;
	    border-radius: 40px;
	    line-height: 2.2;
	    display: block;
	    text-decoration: none;
	    color: white;
	    background-color: rgb(190, 190, 190);
	    text-align: center;
	}
	
	.detailStory {
	    background-color: white;
	    float: left;
	    margin: 35px;
	    padding: 50px;
	    width: 63%;
	    margin-right: 0px;
	    line-height: 2.5;
	    /* 스토리 아닐 때
	    display: none; */
	}
	
	.detailStory h1,
	h2,
	h3,
	h4,
	h5,
	h6,
	strong {
	    line-height: 2;
	}
	
	.detailStory img {
	    width: 90%;
	}
	
	.detailCommunity {
	    background-color: white;
	    float: left;
	    margin: 35px;
	    padding: 50px;
	    padding-right: 115px;
	    width: 63%;
	    margin-right: 0px;
	    line-height: 2.5;
	    /* 커뮤니티 아닐 때*/
	    display: none; 
	}
	
	.detailCommunity p {
	    font-size: 17px;
	}
	
	#plzLogin,
	#yesLogin {
	    width: 100%;
	    height: 150px;
	    border: 1px solid rgb(127, 127, 127);
	    border-radius: 5px;
	    padding: 20px;
	    margin: 35px;
	    line-height: 1.6;
	    font-size: 15px;
	    color: rgb(94, 94, 94);
	}
	
	.loginOn button {
	    float: right;
	    width: 100px;
	    height: 40px;
	    border: none;
	    background-color: rgb(52, 152, 219);
	    color: white;
	    border-radius: 5px;
	    margin-top: -25px;
	    margin-right: -35px;
	}
	
	#comTitle {
	    margin: 30px;
	    margin-right: -25px;
	    margin-top: 70px;
	    margin-bottom: 60px;
	}
	
	.comReply {
	    width: 100%;
	    border: 1px solid rgb(127, 127, 127);
	    border-radius: 5px;
	    padding: 25px;
	    margin: 35px;
	    margin-right: 135px;
	    margin-bottom: 50px;
	    line-height: 1.6;
	    font-size: 13px;
	    color: rgb(94, 94, 94);
	    display: table;
	}
	
	.replyWriter {
	    box-sizing: border-box;
	}
	
	.replyWriter b {
	    color: black;
	    float: left;
	}
	
	.replyWriter img {
	    float: left;
	    height: 42px;
	    margin-top: 5px;
	    margin-right: 12px;
	}
	
	.partnerMarks {
	    background-color: rgb(52, 152, 219);
	    color: white;
	    font-size: 11px;
	    width: 48px;
	    border-radius: 10px;
	    font-weight: 600;
	    margin-right: 330px;
	    margin-top: 6px;
	    float: right;
	}
	
	.replyContent {
	    margin-left: 50px;
	    margin-top: 25px;
	    margin-bottom: 25px;
	}
	
	.reReply hr {
	    margin-top: 50px;
	    margin-bottom: 30px;
	}
	
	.detailGuide {
	    background-color: white;
	    float: left;
	    margin: 35px;
	    padding: 60px;
	    width: 63%;
	    margin-right: 0px;
	    line-height: 2.5;
	    /* 안내 아닐 때 */
	    display: none;
	}
	
	.guideTitle {
	    margin-top: 20px;
	    margin-bottom: 60px;
	}
	
	.guideDates {
	    width: 637px;
	    height: 250px;
	    font-size: 18px;
	    border: 1px solid darkgray;
	    border-radius: 4px;
	    padding: 55px;
	    margin-top: 50px;
	    margin-bottom: 40px;
	}
	
	.projectReport button {
	    border: none;
	    background-color: rgb(224, 224, 224);
	    color: rgb(64, 64, 64);
	    font-size: 16px;
	    width: 100px;
	    border-radius: 5px;
	    margin-top: 30px;
	}
	
	.adminShown {
	    display: none;
	}
		
		</style>
        </head>

        <body>

            <jsp:include page="../common/header.jsp" />
            <hr color="darkgray">

            <!-- 전체 -->
            <div class="detailOuter">

                <!-- 맨위 -->
                <div class="detailHeader" align="center">
                    <div class="detailCat">
                        <button>${ p.catName }</button>
                    </div>

                    <div class="detailTitle">
                        <p><b>${ p.projectTitle }</b></p>
                    </div>

                    <div class="partner">
                        <img src="${ pageContext.request.contextPath }/${ p.memberProfile }">
                        <b>${ p.partnerName }</b> <br><br><br>
                    </div>

                    <div class="detailHeaderBody">

                    </div>

                    <div class="detailThumb">
                        <img src="${ p.projectThum }"
                             height="480px">
                    </div>

                    <div class="detailAside" align="left">

                        <div class="detailInfo1">
                            <table>
                                <tr>
                                    <td colspan="2" class="goalPrice">펀딩 금액</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <span class="goalPrice"><b>0</b></span>
                                        <span class="infoSmall">원</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 9px;"><br></td>
                                </tr>
                                <tr>
                                    <td class="infoTitle">달성률</td>
                                    <td>
                                        <span><b>0</b></span>
                                        <span class="infoSmall">%</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="infoPs" style="line-height: 0;">목표금액 ${ p.projectGprice } 원</td>
                                </tr>
                                <tr>
                                    <td class="infoTitle" style="line-height: 3.5;">남은 기간</td>
                                    <td>
                                        <span><b>${ p.dday }</b></span>
                                        <span class="infoSmall">일</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoTitle">서포터</td>
                                    <td>
                                        <span><b>${ p.supporter }</b></span>
                                        <span class="infoSmall">명</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 7px;"><br></td>
                                </tr>
                            </table>
                        </div>

                        <div class="detailInfo2">
                            <div class="infoPs">
                                <p>
                                    목표 금액 ${ p.projectGprice }원이 모여야만 결제가 진행됩니다. <br>
                                    목표 금액을 달성한 경우, 결제 예정일은 ${ p.payDate } 입니다.
                                </p>
                            </div>
                            <div class="infoBtn" align="center">
                                <button onclick="location.href='list.rew?pno=${p.projectNo}'">펀딩하기</button>
                                <img src="${ pageContext.request.contextPath }/resources/images/likey.PNG" width="36px"
                                    style="margin-right: 10px; cursor: pointer;">
                                <img src="${ pageContext.request.contextPath }/resources/images/share.PNG" width="32px"
                                    style="cursor: pointer;">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 메뉴바 -->
                <div class="detailMenubar">
                    <span class="detailSto" onclick="detailShow('Sto')"><b>스토리</b></span>
                    <span class="detailCommu" onclick="detailShow('Commu')"><b>커뮤니티</b></span>
                    <span class="detailNoti" onclick="detailShow('Noti')"><b>펀딩 안내</b></span>
                </div>
                <!-- 메뉴바 스토리선택됨 표시바 -->
                <div class="menuSelected detail detailSto" style="margin-left: 109px; ">&nbsp;</div>
                <div class="menuSelected detail detailCommu" style="margin-left: 218px; display: none;">&nbsp;
                </div>
                <div class="menuSelected detail detailNoti" style="margin-left: 338px; display: none;">&nbsp;
                </div>


                <!-- 바디 -->
                <div class="detailBody">

                    <!-- 창작자소개/리워드선택바 -->
                    <div class="detailRight">
                        <div class="detailPartner">

                            <div><b>창작자 소개</b></div>
                            <div class="rightPartner">
                                <img src="${ pageContext.request.contextPath }/${ p.memberProfile }">
                                <p><b>${ p.partnerName }</b> <br><br><br></p>
                                <button>+ 팔로우</button>
                            </div>
                            <p id="partnerWho">
                                ${ p.partnerIntro }
                            </p>
                            <div class="partnerBtn">
                                <button><img src="${ pageContext.request.contextPath }/resources/images/send.PNG"
                                        width="23px"><span> 창작자에게 문의하기</span></button>
                            </div>

                        </div>

                        <div class="detailReward">

                            <div><b>리워드 선택</b></div>
                            <br>
                            <c:forEach var="r" items="${ rList }" >
	                            <div class="chooseReward" onclick="location.href='list.rew?pno=${p.projectNo}&rno=${ r.rewardNo }'">
	                                <div>
	                                <input type="hidden" value="${ r.rewardNo }">
	                                    <span class="rePrice">${ r.rewardPrice }원 펀딩</span>
	                                    <span class="reNumber">${ r.rewardStock }개 남음</span>
	                                </div>
	                                <p class="reTitle">${ r.rewardTitle }</p>
	                                <ul>
	                                    <li>${ r.rewardContent }</li>
	                                </ul>
	                            </div>
                            	<br>
                            </c:forEach>
                            </div>
                            <br>
                           
	                        <!-- 해시태그 -->
	                        <div class="hashtag">
	                            <b>해시태그</b>
	                            <br><br>
	                            <table>
	                                <tr>
	                                    <th><a href="">#시계</a></th>
	                                    <th><a href="">#모던</a></th>
	                                    <th><a href="">#감성</a></th>
	                                </tr>
	                                <tr>
	                                    <th><a href="">#디자인</a></th>
	                                    <th><a href="">#소품</a></th>
	                                </tr>
	                            </table>
	                            <br>
	                        </div>
                        </div>


                    <!-- 스토리 -->
                    <div class="detailStory detail detailSto">
                        <div class="storyContent">
                            ${ p.projectContent }
                        </div>
                    </div>

                    <!-- 커뮤니티 -->
                    <div class="detailCommunity detail detailCommu">
                        <p id="plzLogin" style="display: none;">
                            로그인 후 글 작성이 가능합니다. <br>
                            펀딩과 관련 없는 내용, 광고, 욕설, 비방, 도배 글은 관리자 검토 후 삭제됩니다.
                        </p>

                        <div class="loginOn">
                            <textarea id="yesLogin" placeholder="펀딩과 관련 없는 내용, 광고, 욕설, 비방, 도배 글은 관리자 검토 후 삭제됩니다."
                                style="resize: none;"></textarea>
                            <button>등록</button>
                        </div>

                        <div id="comTitle">
                            <h3><b> 응원 · 의견 · 리뷰 </b></h3>
                            <hr>
                        </div>

                        <div class="comReply">
                            <div class="adminShown">
                                <button style="float: right;">삭제하기</button>
                            </div>
                            <div class="replyWriter">
                                <img src="${ pageContext.request.contextPath }/resources/images/partnerDefault.PNG">
                                <p>
                                    <b>김가가</b><br>
                                    2021-04-06
                                </p>
                            </div>
                            <p class="replyContent">프로젝트 기대하고 있습니다! </p>
                        </div>

                        <div class="comReply">
                            <div class="adminShown">
                                <button style="float: right;">삭제하기</button>
                            </div>
                            <div class="replyWriter">
                                <img src="${ pageContext.request.contextPath }/resources/images/partnerDefault.PNG">
                                <p>
                                    <b>박나다</b><br>
                                    2021-04-04
                                </p>
                            </div>
                            <p class="replyContent">펀딩 완료했어요!!! 기대됩니다!! </p>

                            <div class="reReply">
                                <div class="partnerShownEdit">
                                    <button style="float: right; display: none;">수정/삭제</button>
                                </div>
                                <div class="adminShown">
                                    <button style="float: right;">삭제하기</button>
                                </div>
                                <hr>
                                <div class="replyWriter">
                                    <img src="${ pageContext.request.contextPath }/resources/images/partnerDefault.PNG">
                                    <div class="partnerMarks" align="center">
                                        파트너
                                    </div>
                                    <p>
                                        <b>나브 Nav</b><br>
                                        2021-04-05
                                    </p>
                                </div>
                                <p class="replyContent">펀딩, 응원 감사드립니다 :)</p>
                            </div>
                        </div>
                    </div>

                    <!-- 상품 안내 -->
                    <div class="detailGuide detail detailNoti">
                        <div class="guideTitle">
                            <h3><b>펀딩 진행 관련 안내 사항입니다.</b></h3>
                        </div>

                        <div class="guideDates" align="center">
                            <table>
                                <tr>
                                    <th>펀딩종료일&nbsp;</th>
                                    <td>2021-07-15</td>
                                </tr>
                                <tr>
                                    <th>결제예정일</th>
                                    <td>2021-07-22</td>
                                </tr>
                                <tr>
                                    <th>예상배송일</th>
                                    <td>2021-08-02</td>
                                </tr>
                            </table>
                        </div>

                        <hr color="darkgrey">

                        <div class="guidePolicy">
                            <br>
                            <p><b>이 프로젝트의 환불 및 교환 정책</b></p>
                            <p>
                                - 프로젝트 마감일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.<br>
                                - 예상 전달일로부터 21일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 수수료를 제한 후원금을 환불해 드립니다.<br>
                                (플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 )<br>
                                - 선물 전달을 위한 배송지 정보는 2020.11.23일에 일괄 취합할 예정입니다.<br>
                                - 이후 배송지 변경을 원하실 때에는 '창작자에게 문의하기'로 개별 문의하셔야 합니다.<br>
                                - 파손 또는 불량품 수령 시 3일 이내로 교환이 가능합니다.<br>
                                - 교환 및 AS 문의는 '창작자에게 문의하기' 로 신청해 주세요.<br>
                                - 파손이나 불량품 교환시 발생하는 비용은 창작자가 부담합니다.<br> 선물 확인을 위한 포장 훼손 외에 아이템의 가치가 훼손된 경우에는 교환 및 환불이
                                불가합니다.<br>
                                - 후원자가 배송지를 잘못 기재하거나 창작자에게 사전 고지 없이 배송지를 수정하여 배송사고가 발생할 경우
                                창작자는 최대 1번까지 재발송 해 드립니다.<br> 배송비 부담은 후원자에게 있습니다
                            </p>
                            <br>
                            <p><b>가치가자 교환 및 환불 정책</b></p>
                            <p>
                                - 펀딩 취소는 프로젝트 종료 전까지만 마이페이지의 펀딩한 프로젝트에서 할 수 있으며, 가치가자의 특성상 프로젝트 종료 이후 단순 변심에 의한 펀딩 취소가
                                불가능합니다. <br>
                                - 프로젝트 종료 이후의 AS, 교환 및 환불에 관한 문의는 진행자의 교환 및 환불 정책을 따르거나 진행자의 연락처로 문의해야 합니다. <br>
                            </p>
                            <br>
                            <p><b>유의사항</b></p>
                            <p>
                                - 주소 변경은 프로젝트 종료 전까지만 마이페이지의 펀딩한 프로젝트에서 할 수 있습니다.<br>
                                - 결제수단 변경은 결제 전까지만 가능하며 결제완료 이후에는 불가능합니다.<br>
                                - 리워드 옵션 변경은 불가능하며, 기존 펀딩 내역을 취소하신 후 다시 펀딩하셔야 합니다.<br>
                            </p>


                        </div>

                        <br>
                        <hr color="darkgray">

                        <div class="projectReport">
                            <br>
                            <p><b>프로젝트 신고하기</b></p>

                            <p>
                                해당 프로젝트에 허위사실 및 지적재산권 침해, 기타 가치가자의 정책을 위반하는 내용이 있다면
                                신고해주세요.
                            </p>
                            <button>신고하기</button>
                        </div>
                    </div>
                </div>
            </div>

                    </div>
            <script>
                function detailShow(className) {
                    $(".detail").hide();
                    $(".detail" + className).show();
                }
            </script>

        </body>

        </html>