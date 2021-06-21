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
                    height: 780px;
                    padding: 50px;
                }

                .detailCat button {
                    font-size: 12px;
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
                    float: left;
                    margin-left: 499px;
                }

                .partner p {
                    float: right;
                    margin-right: 499px;
                    margin-top: 5px;
                }

                .detailTitle {
                    font-size: 33px;
                }

                .detailThumb {
                    float: left;
                }

                .detailAside {
                    height: 450px;
                    float: left;
                    padding: 30px;
                    font-size: 22px;
                    line-height: 2;
                    margin-left: 21px;
                }

                .infoTitle {
                    font-size: 18px;
                    width: 120px;
                }

                .infoSmall {
                    font-size: 20px;
                }

                .infoPs {
                    font-size: 12.5px;
                }

                .infoPs p {
                    height: 65px;
                    width: 362px;
                    background-color: rgba(107, 148, 175, 0.16);
                    line-height: 2;
                    padding-top: 7px;
                    padding-left: 15px;
                    border-radius: 10px;
                }

                .infoBtn button {
                    width: 239px;
                    height: 49px;
                    font-size: 16px;
                    vertical-align: 8px;
                    margin-right: 28px;
                    background-color: rgb(52, 152, 219);
                    border: none;
                    color: white;
                    border-radius: 10px;
                }

                .goalPrice {
                    font-size: 28px;
                    line-height: 1.3;
                }

                .detailMenubar {
                    width: 100%;
                    padding: 23px;
                    border-top: 1.5px solid rgb(94, 94, 94);
                    border-bottom: 1.5px solid rgb(94, 94, 94);
                    padding-left: 100px;
                }

                .detailMenubar a {
                    text-decoration: none;
                    color: rgb(64, 64, 64);
                    font-size: 18px;
                }

                .detailMenubar span {
                    margin: 20px;
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
                    padding-top: 25px;
                    padding-bottom: 25px;
                    font-size: 17px;
                }

                .rightPartner {
                    display: table;
                    margin-top: 20px;
                    width: 100%;
                }

                .rightPartner img {
                    width: 40px;
                    float: left;
                    margin-left: 10px;
                    margin-right: -10px;
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
                    font-size: 14px;
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
                    margin-right: 60px;
                    margin-left: -45px;
                    font-size: 14px;
                    color: rgb(94, 94, 94);
                }

                .detailReward,
                .hashtag {
                    margin-top: 20px;
                    padding: 20px;
                    font-size: 17px;
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
                    font-size: 14px;
                    margin-top: 20px;
                    margin-bottom: 0px;
                }

                .chooseReward li {
                    font-size: 13.5px;
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
                    /* 스토리 아닐 때 */
                    display: none;
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
                    /*detailStory랑 같음 좀있다합치기*/
                    background-color: white;
                    float: left;
                    margin: 35px;
                    padding: 50px;
                    width: 63%;
                    margin-right: 0px;
                    line-height: 2.5;
                }

                #plzLogin {
                    width: 100%;
                    height: 150px;
                    border: 1px solid rgb(127, 127, 127);
                    border-radius: 5px;
                    padding: 20px;
                    line-height: 1.6;
                    font-size: 13px;
                    color: rgb(94, 94, 94);
                }

                .detailGuide {}
            </style>
        </head>

        <body>

            <jsp:include page="../common/header.jsp" />
            <hr>

            <!-- 전체 -->
            <div class="detailOuter">

                <!-- 맨위 -->
                <div class="detailHeader" align="center">
                    <div class="detailCat">
                        <button>디자인 소품</button>
                    </div>

                    <div class="detailTitle">
                        <p><b>세련되고 시크한 당신을 위한, 투명 시계</b></p>
                    </div>

                    <div class="partner">
                        <img src="${ pageContext.request.contextPath }/resources/images/partnerDefault.PNG">
                        <p><b>나브 Nav</b> <br><br><br></p>
                    </div>

                    <div class="detailHeaderBody">

                    </div>

                    <div class="detailThumb">
                        <img src="${ pageContext.request.contextPath }/resources/images/sample(Temporary)/watchThumb.PNG"
                            height="470px">
                    </div>

                    <div class="detailAside" align="left">

                        <div class="detailInfo1">
                            <table>
                                <tr style="line-height: 0.5;">
                                    <td colspan="2" class="goalPrice">펀딩 금액</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <span class="goalPrice"><b>22,562,500</b></span>
                                        <span class="infoSmall">원</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 9px;"><br></td>
                                </tr>
                                <tr>
                                    <td class="infoTitle">달성률</td>
                                    <td>
                                        <span><b>752</b></span>
                                        <span class="infoSmall">%</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="infoPs" style="line-height: 0;">목표금액 2,500,000 원</td>
                                </tr>
                                <tr>
                                    <td class="infoTitle" style="line-height: 3.5;">남은 기간</td>
                                    <td>
                                        <span><b>8</b></span>
                                        <span class="infoSmall">일</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoTitle">서포터</td>
                                    <td>
                                        <span><b>636</b></span>
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
                                    목표 금액 2,500,000원이 모여야만 결제가 진행됩니다. <br>
                                    목표 금액을 달성한 경우, 결제 예정일은 7월 22일 입니다.
                                </p>
                            </div>
                            <div class="infoBtn" align="center">
                                <button>펀딩하기</button>
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
                    <span id="detailStory"><a href="">스토리</a></span>
                    <span id="detailCommu"><a href="">커뮤니티</a></span>
                    <span id="detailNotice"><a href="">펀딩 안내</a></span>
                </div>
                <!-- 메뉴바 스토리선택됨 표시바 -->
                <div class="menuSelected" style="margin-left: 112px; display: none;">&nbsp;</div>
                <div class="menuSelected" style="margin-left: 218px; ">&nbsp;</div>
                <div class="menuSelected" style="margin-left: 337px; display: none;">&nbsp;</div>


                <!-- 바디 -->
                <div class="detailBody">

                    <!-- 창작자소개/리워드선택바 -->
                    <div class="detailRight">
                        <div class="detailPartner">

                            <div><b>창작자 소개</b></div>
                            <div class="rightPartner">
                                <img src="${ pageContext.request.contextPath }/resources/images/partnerDefault.PNG">
                                <p><b>나브 Nav</b> <br><br><br></p>
                                <button>+ 팔로우</button>
                            </div>
                            <p id="partnerWho">
                                '나만 아는'것들을 좋아하고, 유난히 '것'들에 까다로운 건축학도들이 결국 직접 디자인, 제작을 시작했습니다. 조금 다른 시선으로, 보통의 기능적 제품들에
                                작은 위트를 불어넣어 평범한 일상을 특별하게 향유하고자 합니다. 저희와 같은 취향의 분들, 환영합니다 :-D
                            </p>
                            <div class="partnerBtn">
                                <button><img src="${ pageContext.request.contextPath }/resources/images/send.PNG"
                                        width="23px"><span> 창작자에게 문의하기</span></button>
                            </div>

                        </div>

                        <div class="detailReward">

                            <div><b>리워드 선택</b></div>
                            <br>
                            <div class="chooseReward">
                                <div>
                                    <span class="rePrice">1,000원 펀딩</span>
                                    <span class="reNumber">9명 선택</span>
                                </div>
                                <p class="reTitle">선물을 선택하지 않고 밀어만 줍니다.</p>
                            </div>
                            <br>
                            <div class="chooseReward">
                                <div>
                                    <span class="rePrice">27,900원 펀딩</span>
                                    <span class="reNumber">9명 선택</span>
                                </div>
                                <p class="reTitle">얼리버드(배송비 포함)</p>
                                <ul>
                                    <li>나브 투명 탁상시계 (배송비 포함) x 1</li>
                                </ul>
                            </div>
                            <br>
                            <div class="chooseReward">
                                <div>
                                    <span class="rePrice">35,900원 펀딩</span>
                                    <span class="reNumber">9명 선택</span>
                                </div>
                                <p class="reTitle">얼리버드(배송비 포함)</p>
                                <ul>
                                    <li>나브 투명 탁상시계 (배송비 포함) x 1</li>
                                    <li>나브 캘린더 (가로형 거치대, 투명 내지, 보드마카, 자석 포함) x 1</li>
                                </ul>
                            </div>
                            <br>
                            <div class="chooseReward">
                                <div>
                                    <span class="rePrice">35,900원 펀딩</span>
                                    <span class="reNumber">9명 선택</span>
                                </div>
                                <p class="reTitle">얼리버드(배송비 포함)</p>
                                <ul>
                                    <li>나브 투명 탁상시계 (배송비 포함) x 1</li>
                                    <li>나브 캘린더 (가로형 거치대, 투명 내지, 보드마카, 자석 포함) x 1</li>
                                </ul>

                                <div class="supportReward">
                                    <select class="rewardOption" name="rewardOption">
                                        <option value="default">옵션을 선택해주세요.</option>
                                        <option value="option1">로즈골드</option>
                                        <option value="option2">실버</option>
                                    </select>

                                    <div class="supportPlus">
                                        추가 후원금(선택)
                                        <input type="text" placeholder=" 0">
                                        <p>더 후원해주시면 프로젝트가 앞당겨집니다.</p>
                                    </div>

                                    <button>35,900원 밀어주기</button>
                                </div>

                            </div>
                            <br>
                            <div class="chooseReward">
                                <div>
                                    <span class="rePrice">35,900원 펀딩</span>
                                    <span class="reNumber">9명 선택</span>
                                </div>
                                <p class="reTitle">얼리버드(배송비 포함)</p>
                                <ul>
                                    <li>나브 투명 탁상시계 (배송비 포함) x 1</li>
                                    <li>나브 캘린더 (가로형 거치대, 투명 내지, 보드마카, 자석 포함) x 1</li>
                                </ul>
                            </div>
                        </div>

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
                    <div class="detailStory">
                        <div class="storyContent">
                            <h2>별똥꽃<strong> meteor flower&nbsp;<br></strong><strong><strong>운석을</strong>
                                    <strong>담은</strong> <strong>꽃병과</strong> <strong>모빌</strong></strong></h2>
                            <p>별똥별을 본 적이 있나요?<br>어쩌면 별똥별은 밤하늘이 아니라<br>추억과 상상 속의 그 무엇일 가능성이 높습니다.<br>도시인들에겐 말이지요.</p>
                            <p>우리들 마음에 별똥별이 떨어지게 하자!<br>인공조명과 미세먼지로 가려져 버린 별똥별을 다시 불러들이자!<br>그렇게 &lt;별똥꽃&gt; 프로젝트가
                                시작되었습니다.</p>
                            <h2>당신의 창가와 테이블에 별똥별이 떨어집니다!</h2>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/275977bf-feaa-47c5-a45b-8cd052c72ae6.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=3429c5dfeab2c319cba183890698b16f">
                            </p>
                            <p><strong>디자인 스튜디오 m t o</strong>(엠티오)는 별똥별을 뜻하는 단어 <strong>meteor</strong>에서 이름을 따왔습니다.
                            </p>
                            <p>세운상가에서 <strong>‘세운메이드 프로젝트’</strong>에 참여하며, 주변의 인쇄 기술 장인들과 협업할 기회를 얻었고, 금박, 도무송, 형압, 목형 등
                                다양한 인쇄 기술을 배울 수 있었습니다.<br>그 과정에서 종이를 소재로 다양한 인쇄 기술을 접합하는 디자인 프로젝트를 구상하게 되었고, 운석을 담은 꽃병과
                                모빌이 되는 <strong>&lt;별똥꽃&gt;</strong> 프로젝트가 시작되었습니다.<br><br></p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/317c1067-13d4-44de-9237-437eeebf5b8f.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=cb7daa766975f3f336225a858a065c27">
                            </p>
                            <h2>프로젝트 소개</h2>
                            <p>별똥별이라는 아이디어에서 출발하여, <br>모빌과 꽃병의 구조와 형태를 잡아 갔습니다.&nbsp;<br>수집된 운석들에는 꽃과 식물의 이미지들이 보였어요.
                            </p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/69c06a81-d9cf-42fb-a132-cb3a3c29f0d1.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=417af85a7b83c5e0f80115569f40697a">
                            </p>
                            <p>형태를 구성한 후에는 다양한 색감, 질감 등을 테스트 하는 과정을 거쳤습니다.&nbsp;<br>종이의 질감, 프린트 방식 등을 바꿔보면서, 반짝이는 광물의
                                질감과 꽃의 이미지를 찾아 갔습니다.&nbsp;</p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/67dd8862-4b4a-4f13-866c-53fe851cfb7d.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=86e08f4881b6c73109a65fdee263fca8">
                            </p>
                            <p>&nbsp;</p>
                            <hr>
                            <h3><strong>창가에는 하늘을 나는 모빌</strong></h3>
                            <p>mto의 &lt;별똥꽃&gt;은 두 가지 형태로 조립할 수 있습니다.<br>밤하늘의 별똥별처럼 바람을 타고 움직이는 모빌로 만들 수 있습니다.</p>
                            <h4><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/29b2d734-ee2c-43f4-8a7f-12abdc9941db.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=66b524cf9a8a0d206b2903152d56d997">
                            </h4>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/ddd34f52-b0dc-433f-9eec-1ad1df17e48b.gif?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;gif-q=35&amp;s=f8a1da9d4a2d7c29c3fd3b71ec4c78db">
                            </p>
                            <h3><strong>테이블에는 땅에 떨어져 꽃이 된 꽃병</strong></h3>
                            <p>그 별똥별이 지구에 떨어져 꽃으로 피어난 듯한 꽃병으로도 만들 수 있습니다.<br>취향에 따라 바람결에 움직이는 별똥꽃과&nbsp; 한 자리에 멈춘 별똥꽃을
                                선택할 수 있습니다.</p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/45c218fa-ab89-4a99-8e92-e442455eaa5f.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=0af2166d125f3895604112d897593736">
                            </p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/d4eacec9-be1f-440c-a968-09c1cb843cec.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=65088ab0cb525271634fc83e7a9f0b79">
                            </p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/f8132695-ba1a-4f30-8f30-8ce4f6771dcb.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=356c763e73aecf743546ccd8de60025b">
                            </p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/35f2a00b-e500-4118-8e66-2b073824d431.gif?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;gif-q=35&amp;s=a084fe43bb60dca67beaa83856e8469a">
                            </p>
                            <h3><strong>종이 소재의 DIY&nbsp;</strong></h3>
                            <p>&lt;별똥꽃&gt;은 운석도, 꽃병도, 꽃대도, 모빌대도 모두 종이 소재로 만들어집니다.<br>만드는 과정은 매우 간단합니다.&nbsp;<br>접고, 붙이고,
                                세우고, 매달면 끝!.</p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/36db74ee-ef36-4829-a98c-d6b20f765eb8.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=3dba431b75fb262a1663b59a5c63bc54"><br>-
                                구성품: 운석 조각, 꽃병, 꽃대/모빌대, 양면테이프, 스티커, 낚시끈<br>&nbsp; (칼, 가위, 압정 등의 재료는 포함되어 있지 않습니다.)</p>
                            <h3>&nbsp;</h3>
                            <h3>반짝 반짝 빛나는 광물을 표현하는 <strong>홀로그램 박</strong></h3>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/fbb92dbd-4a64-44a8-8ecb-54725bfff541.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=b11aa33ac80425834c01fdea084ebb04"><br>홀로그램
                                박을 활용한 프린트는 운석의 느낌을 그대로 전합니다.&nbsp;</p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/9477322a-efe5-4274-8723-349872d9013d.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=75f9ed3b454b35f388db14aae644ea51">지구에
                                떨어진 운석의 실재 모습에서 디자인의 모티브를 얻었습니다.</p>
                            <h3>다른 느낌의 <strong>양면</strong> 프린트</h3>
                            <p>양쪽면의 프린트를 달리하여,&nbsp;<br>선택한 종이면에 따라 화사한 꽃병이 될 수도 있고,&nbsp;<br>단정한 느낌의 꽃병이 될 수도
                                있습니다.&nbsp;<br>모빌의 경우, 바람에 따라 화려한 부분과 단정한 부분이 돌아가며 보이게 됩니다.</p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/d68690aa-3ef2-4776-8c32-fcdb66738089.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=37366136904eb5cc8165ea6f10767d73">
                            </p>
                            <p>&nbsp;</p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/b3a81269-78a9-4712-abd2-2009e44a13ff.gif?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;gif-q=35&amp;s=e541220aa93e304da9c1ac33ca263f63">
                            </p>
                            <h3>&nbsp;</h3>
                            <h3><strong>+ 별똥별 스티커</strong></h3>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/d9a24c6b-fb16-492e-a782-e07447fab21c.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=58244e4ed64c60200e0dc00217ff284c">
                            </p>
                            <p>실제 모빌 사이즈와 동일한 스티커, 3pieces 1set</p>
                            <p>&nbsp;</p>
                            <hr>
                            <h3><strong><strong>크기</strong></strong></h3>
                            <p>꽃병&nbsp; &nbsp;가로 약 23cm X 세로 약 38cm<br>모빌&nbsp; &nbsp;가로 약 37cm X 세로 약 44cm<br>스티커&nbsp;
                                &nbsp;가로 약 12cm X 세로 약 8cm</p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/feaf9ba4-ba9b-454e-a94f-7345c807fb91.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=b6639ddd6fa82175df729f2168cbbb01">
                            </p>
                            <h3><strong>재질</strong></h3>
                            <p>- 두성종이 스노블 350g</p>
                            <h3><strong>조립 방법&nbsp;<br></strong><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/87f3f44e-74de-4b2e-8cb7-91c9337b2669.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=e7fa0b37675fcc1d34a1595170c6337f"><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/784b2d48-4887-49aa-a73b-a3299ce14e1c.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=5235c44de18ea35218ba25b41793fd40"><br>-
                                설명서는 구조 개선에 따라 추후에 업데이트 됩니다.<br>- 패키징 계획은 추후에 커뮤니티를 통해 업데이트 됩니다.&nbsp;</h3>
                            <p>&nbsp;</p>
                            <hr>
                            <h2>프로젝트 예산</h2>
                            <h3><strong>펀딩 목표 금액</strong></h3>
                            <p>2,200,000원</p>
                            <h3><strong>펀딩 예산 사용</strong></h3>
                            <p>후원금은 별똥꽃 제작을 위한&nbsp; 재료 구입, 프린트, 후가공, 패키지 제작비, 배송비 등으로 사용될 예정입니다.&nbsp;</p>
                            <ul>
                                <li>재료구입 (종이/줄/테이프 등)</li>
                                <li>프린트&nbsp;</li>
                                <li>패키지</li>
                                <li>배송비</li>
                            </ul>
                            <p>* 제품의 완성도와 시장성을 확인하기 위한 초기 트라이아웃으로, 대량이 아닌 소량 인쇄로 제작되며, 펀딩 성공이후 대량 생산 기반 마련을 계획
                                중입니다.&nbsp;</p>
                            <h3><strong>예상 제작일정</strong></h3>
                            <ul>
                                <li>텀블벅 펀딩 2021. 5.20 목 ~ 6.17 목</li>
                                <li>디자인 및 구조 세부 수정 2021. 5.20 목 ~ 6.27 일</li>
                                <li>제작 및 패키징 2021. 6.28 월 ~ 7.2 금</li>
                                <li>발송 2021. 7. 14 수</li>
                            </ul>
                            <p>&nbsp;</p>
                            <hr>
                            <h2><strong>후원자 안내</strong></h2>
                            <h3><strong>리워드 구성</strong></h3>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/31024c87-b2c4-40a2-bb63-d7a44e09eb8a.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=984015640359c867c49cea585fccac77">
                            </p>
                            <ul>
                                <li>별똥꽃 스티커 1매 / 5,000원</li>
                                <li><strong>(얼리버드)</strong> 별똥꽃 1세트 + 별똥꽃 스티커 1매 / <s>25,000원</s> -&gt; 17,500원 /
                                    <strong>20개 한정</strong>
                                </li>
                                <li><strong>(얼리버드)</strong> 별똥꽃 2세트 + 별똥꽃 스티커 2매 / <s>50,000원</s> -&gt; &nbsp;30,000원 /
                                    <strong>10개 한정</strong>
                                </li>
                                <li>별똥꽃 1세트 + 별똥꽃 스티커 1매 / <s>25,000원</s> -&gt;&nbsp;22,500원&nbsp;</li>
                                <li>별똥꽃 2세트 + 별똥꽃 스티커 2매 / <s>50,000원</s> -&gt;&nbsp;40,000원&nbsp;</li>
                            </ul>
                            <p><u>*** 꽃병 하나, 모빌 하나를 각각 만드실 수 있도록, [1+1] 구성을 추천 드립니다.&nbsp;</u></p>
                            <h3><strong>전달</strong></h3>
                            <p>펀딩 완료 및 제작 이후 일괄 우편 배송됩니다.&nbsp;</p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/fc89003b-30ec-4630-a828-cbcc93325a2c.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=de1a85e628380de3479573986b570805">
                            </p>
                            <p>&nbsp;</p>
                            <hr>
                            <h2><strong>m t o 와 함께 별똥별 수집가가 되어 주세요.&nbsp;</strong></h2>
                            <p>mto는 &lt;별똥꽃&gt; 프로젝트를 지속적으로 디자인하고 만들어 갈 예정입니다.<br>별똥별의 섬광, 광물적 질감이 살아있는 모빌, 화병, 스티커,
                                코스터, 마그네틱, 버튼 등<br>다양한 오브제를 제작하려 합니다.<br>이번 &lt;별똥꽃&gt; 프로젝트를 시작으로 별똥별 수집가가 되어 주세요!</p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/afedffbc-5dbe-41e1-bc62-6c1085283c74.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=d0411afca6bdc4bb7cdf7b2fdd6b6c68">
                            </p>
                            <p>&nbsp;</p>
                            <hr>
                            <h2><strong>m t o</strong></h2>
                            <p>디자인 스튜디오 m t o(엠티오)는<br>별똥별을 뜻하는 단어 meteor에서 이름을 따왔습니다.<br>별의 조각으로 다시 빛나는 별을 만들어내는 작업을 하고
                                있습니다.<br><br>website. <a
                                    href="http://www.mtospace.com/">www.mtospace.com</a><br>instagram. <a
                                    href="http://instagram.com/mtospace">@mtospace</a></p>
                            <p><img
                                    src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/646f3316-ac1e-4aa2-b54b-09efc26b14b6.jpg?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=06beb661795f408eefb49cbf19fe2c23">
                            </p>
                            <p>&nbsp;</p>
                            <p><a href="https://tumblbug.com/collections/sewoonmade" target="_blank" rel="noopener"><img
                                        src="https://tumblbug-psi.imgix.net/bcc5740643a75b7399f9d1452070eedc4788eca5/20c92cafb6409a4c03d73bf71f23a4d3c0e82a6e/952918e759f2f4ea4fc3058d116e5a12dd317e2b/9018fa33-4d25-4498-84ec-16f05d60fe7b.png?ixlib=rb-1.1.0&amp;w=1240&amp;auto=format%2C%20compress&amp;lossless=true&amp;ch=save-data&amp;s=965d406c33776a5b2489e751f797828a"></a>
                            </p>
                        </div>
                    </div>

                    <!-- 커뮤니티 -->
                    <div class="detailCommunity">
                        <p id="plzLogin">
                            로그인 후 글 작성이 가능합니다. <br>
                            펀딩과 관련 없는 내용, 광고, 욕설, 비방, 도배 글은 관리자 검토 후 삭제됩니다.
                        </p><br>
                        <h3><b> 응원 · 의견 · 리뷰 </b></h3>
                        <hr>
                    </div>

                    <!-- 상품 안내 -->
                    <div class="detailGuide">

                    </div>
                </div>
            </div>

        </body>

        </html>