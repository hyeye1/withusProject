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
                .regiOuter {
                    width: 1200px;
                    height: 100%;
                    margin: auto;
                    cursor: default;
                    position: relative;
                }

                .regiHeader {
                    height: 200px;
                    padding: 75px;
                    background-color: rgba(224, 224, 224, 0.45);
                }

                .regiHeader b {
                    float: left;
                    font-size: 34px;
                    margin-top: ;
                }

                .regiHeader button {
                    float: right;
                    margin-left: 30px;
                    width: 100px;
                    height: 40px;
                    background-color: rgb(224, 224, 224);
                    color: rgb(94, 94, 94);
                    border: none;
                    border-radius: 5px;
                    font-weight: 500;
                }

                .registerBtn {
                    width: 170px !important;
                    background-color: rgb(52, 152, 219) !important;
                    color: white !important;
                }

                .regiMenubar {
                    width: 260px;
                    height: 100%;
                    padding: 30px;
                    padding-top: 43px;
                }

                .regiMenubar b {
                    font-size: 22px;
                }

                .regiMenubar li {
                    margin-left: -20px;
                    line-height: 2.4;
                    font-size: 17px;
                }

                .regiMenubar a {
                    text-decoration: none;
                    color: black;
                }

                .regiMenuSelected {
                    width: 5px;
                    height: 40px;
                    background-color: rgb(52, 152, 219);
                    margin-left: 255px;
                }

                .regiBody {
                    float: right;
                    width: 940px;
                    height: 100%;
                    border-left: 2px solid rgba(224, 224, 224, 0.45);
                    padding: 30px;
                    padding-left: 50px;
                    font-size: 15px;
                    line-height: 2;
                }

                .regiBtn button {
                    width: 130px;
                    height: 40px;
                    margin-top: 60px;
                    margin-bottom: 60px;
                    margin-left: 10px;
                    border: none;
                    border-radius: 5px;
                }

                #regiSubmitBtn,
                .btn1 {
                    background-color: rgb(52, 152, 219);
                    color: white;
                }

                #regiResetBtn,
                .btn2 {
                    background-color: rgb(224, 224, 224);
                }

                .regiTitle {
                    font-size: 20px;
                    line-height: 3;
                }

                .catOption {
                    width: 113px;
                    height: 40px;
                }

                #projectTitle {
                    width: 548px;
                    height: 40px;
                    margin-left: 10px;
                }

                #projectSubtitle,
                #projectPrice {
                    width: 675px;
                    height: 40px;
                    margin-right: 10px;
                }

                #projectPrice::placeholder {
                    padding-left: 655px;
                }

                #projectDday {
                    width: 168px;
                    height: 40px;
                    margin-right: 10px;
                }

                #projectDday::placeholder {
                    padding-left: 145px;
                }

                #projectPeriod,
                #projectShipDate {
                    width: 189px;
                    height: 40px;
                    margin-left: 30px;
                    color: rgb(94, 94, 94);
                }

                #projectShipment {
                    margin-right: 10px;
                }

                #pUrl {
                    color: rgb(94, 94, 94);
                    font-size: 19px;
                }

                #projectUrl {
                    width: 240px;
                    height: 40px;
                    margin-left: 60px;
                    font-size: 15px !important;
                }

                #projectUrl::placeholder {
                    padding: 10px;
                }

                #projectKeyword {
                    height: 40px;
                    width: 388px;
                    font-size: 14px !important;
                    border-radius: 5px;
                    border: 1.4px solid rgb(224, 224, 224);
                }

                #keywordBtn {
                    width: 121px;
                    height: 40px;
                    font-size: 15px !important;
                    border: none;
                    border-radius: 5px;
                    background-color: rgb(224, 224, 224);
                }

                #keywordBox {
                    width: 675px;
                    height: 225px;
                    padding: 40px;
                    background-color: rgba(41, 128, 185, 0.16);
                    border-radius: 50px;
                    font-size: 20px;
                }

                #keywordBox span {
                    margin: 10px;
                }

                .bankOption {
                    width: 113px;
                    height: 40px;
                }

                #bankAccount {
                    width: 548px;
                    height: 40px;
                }

                #accountHolder {
                    width: 675px;
                    height: 40px;
                }

                .partnerWebSns {
                    width: 616px;
                    height: 40px;
                }

                .regiReward {
                    background-color: rgba(224, 224, 224, 0.45);
                    width: 95%;
                    padding: 40px;
                    padding-left: 20px !important;
                }

                .regiReward th {
                    width: 200px;
                    height: 80px;
                }

                .regiReward input,
                textarea {
                    width: 467px;
                }

                .regiReward textarea {
                    height: 241px;
                }

                .regiReward button {
                    width: 130px;
                    height: 40px;
                    border: none;
                    border-radius: 5px;
                    margin-right: 10px;
                }

                #addOptionBtn {
                    width: 471px;
                    border: 2px solid rgb(41, 128, 185);
                    color: rgb(41, 128, 185);
                }

                #limitNum {
                    width: 178px;
                }

                .regiRewardContent {
                    vertical-align: top;
                }

                .regiRewardContent td {
                    padding-top: 15px;
                }

                #regiOption {
                    font-size: 13px;
                    margin-bottom: 0px;
                }

                .registered {
                    padding: 20px;
                    border-radius: 5px;
                    border: rgb(94, 94, 94) 1px solid;
                }

                .registered span {
                    border: 2px solid rgba(235, 22, 103, 0.87);
                    color: rgba(235, 22, 103, 0.87);
                    padding: 5px;
                    border-radius: 5px;
                    font-size: 12px;
                }

                #registeredSpan1 {
                    color: white;
                    background-color: rgba(235, 22, 103, 0.87);
                }

                #editBtn {
                    width: 80px;
                    margin: 5px;
                }

                #deleteBtn {
                    width: 71px;
                    margin: 5px;
                }

                .registeredTable th {
                    width: 160px;
                    vertical-align: top;
                    padding-top: 13px;
                }

                #registeredName {
                    font-size: 20px !important;
                    color: rgb(64, 64, 64);
                }

                .registered p {
                    font-size: 13px;
                    color: rgb(127, 127, 127);
                }

                .registered b {
                    font-size: 16px;
                    color: rgb(64, 64, 64);
                }

                .registeredTable td {
                    padding: 7px;
                }
            </style>
        </head>

        <body>

            <jsp:include page="../common/header.jsp" />

            <div class="regiOuter">

                <!-- 타이틀과 미리보기/임시저장/승인요청하기 -->
                <div class="regiHeader">
                    <p><b>기본정보</b></p>
                    <button class="registerBtn">승인요청하기</button>
                    <button>임시저장</button>
                    <button>미리보기</button>
                </div>

                <!-- 바디 -->
                <div class="regiBody">
                    <!-- 1. 기본정보 -->
                    <div class="regiOne" style="display: none;">
                        <div class="regiInfo">
                            <b class="regiTitle">프로젝트 성공 조건 & 수수료 안내</b>
                            <p>
                                프로젝트 종료일 기준 모금액이 목표금액의 100% 이상인 경우에만 프로젝트가 성공하게 됩니다.
                                <br>
                                프로젝트가 성공한 경우, 가치가자는 모금액에서 수수료를 제한 금액을 정산해드립니다.
                                <br>
                                * 수수료 (vat 별도) 가치가자 수수료 5% + 결제 수수료 3%
                            </p>
                        </div><br>

                        <!-- 카테고리+제목 -->
                        <div>
                            <b class="regiTitle">프로젝트의 제목과 카테고리를 설정해주세요.</b> <br>
                            <select class="catOption" name="catOption">
                                <option value="category">카테고리</option>
                                <option value="tech">테크/가전</option>
                                <option value="fashion">패션/잡화</option>
                                <option value="beauty">뷰티</option>
                                <option value="food">푸드</option>
                                <option value="living">홈리빙</option>
                                <option value="design">디자인소품</option>
                                <option value="travel">여행/레저</option>
                                <option value="sports">스포츠/모빌리티</option>
                                <option value="pet">반려동물</option>
                            </select>
                            <input type="text" id="projectTitle" name="projectTitle" placeholder="제목을 입력해주세요">
                        </div><br>

                        <!-- 프로젝트 요약 -->
                        <div>
                            <b class="regiTitle">프로젝트 요약</b> <br>
                            <input type="text" id="projectSubtitle" name="projectSubtitle"
                                placeholder="프로젝트를 간단히 설명해주세요">
                        </div><br>

                        <!-- 목표 금액 -->
                        <div>
                            <b class="regiTitle">목표 금액을 적어주세요</b> <br>
                            <input type="text" id="projectPrice" name="projectPrice" placeholder="0">원
                        </div><br>

                        <div>
                            <b class="regiTitle">프로젝트의 진행 기간을 적어주세요</b>
                            <p>최소 7일부터 최대 60일까지 가능합니다.</p>
                            <input type="text" id="projectDday" placeholder="0">일 남음 <input type="date"
                                name="projectPeriod" id="projectPeriod">
                        </div><br>

                        <div>
                            <b class="regiTitle">프로젝트의 예상 배송일을 적어주세요</b>
                            <p>배송지 필요가 없는 프로젝트는 필요없음을 선택해주세요. <br>
                                또한 배송지 필요가 없는 리워드가 따로 있다면 리워드 페이지에서 다시 선택이 가능합니다.
                            </p>

                            <!-- 체크박스 선택시 데이트 인풋 사라지게 -->
                            <input type="checkbox" name="projectShipment" id="projectShipment"> 배송지 필요없어요
                            <input type="date" name="projectShipDate" id="projectShipDate">
                        </div><br>

                        <div>
                            <b class="regiTitle">프로젝트의 고유 주소를 적어주세요</b>
                            <p>프로젝트와 관련된 키워드를 짧은 영어로 적어주세요. 특수문자와 띄어쓰기는 불가능합니다.</p>
                            <p id="pUrl">https://localhost:8888/withus/project?fund= <input type="text"
                                    placeholder="프로젝트명" id="projectUrl"></p>
                        </div><br>

                        <div>
                            <b class="regiTitle">프로젝트의 대표 이미지를 등록해주세요</b>
                            <p>홈페이지와 외부 공유를 했을 때 보여집니다. 프로젝트를 한 눈에 나타낼 수 있는 이미지를 등록해주세요.</p>
                            <button
                                style="width: 449px; height: 311px; border: 1px solid rgb(127, 127, 127); border-radius: 5px; background-color: white;">
                                최적 사이즈 740*492 px
                            </button><br><br>
                            <input type="file" name="" id=""> <!-- html 이미지 미리보기 -->
                        </div><br>

                        <div>
                            <b class="regiTitle">프로젝트 키워드를 적어주세요</b><br>
                            <p style="font-size: 26px;">
                                # <input type="text" name="projectKeyword" id="projectKeyword"
                                    placeholder=" 키워드를 입력해주세요"> <button id="keywordBtn">해시태그 등록</button>
                            </p>
                            <div id="keywordBox">
                                <span>#인테리어</span>
                                <span>#디자인</span>
                                <span>#어항</span>
                            </div>
                        </div>

                    </div>

                    <!-- 2. 스토리 -->
                    <div class="regiTwo" style="display: none;">

                        <div>
                            <b class="regiTitle">프로젝트 소개 영상과 이미지를 등록해주세요</b>
                            <p>
                                영상과 이미지를 함께 등록할 경우, 영상이 먼저 보여집니다.
                            </p>
                        </div>
                        <br>

                        <!-- 동영상 주소 -->
                        <div>
                            <b class="regiTitle">동영상 주소를 적어주세요</b><br>
                            <input type="text" name="regiVideo" id="regiVideo">
                            <input type="file" name="" id=""><!-- +버튼으로 고치기 -->
                        </div>
                        <br>

                        <!-- 이미지 -->
                        <div>
                            <b class="regiTitle">이미지를 등록해주세요</b><br>
                            <button
                                style="width: 255px; height: 185px; border: 1px solid rgb(127, 127, 127); border-radius: 5px; background-color: white;">
                                최적 사이즈 740*417 px
                            </button>
                            <button
                                style="width: 255px; height: 185px; border: 1px solid rgb(127, 127, 127); border-radius: 5px; background-color: white;">
                                +
                            </button>
                        </div>
                        <br>

                        <!-- 에디터 -->
                        <div>
                            <b class="regiTitle">프로젝트 스토리를 적어주세요</b>
                            <p>
                                프로젝트를 시작하기 위해 필요한 내용이 없다면 승인이 되지 않습니다. <br><br>

                                Enter(↵) : 문단 나눔, Shift + Enter : 줄바꿈입니다! <br>
                                적절한 문단/줄 바꿈만으로 멋진 프로젝트를 완성 할 수 있습니다! <br>
                                이미지와 영상은 꼭 버튼을 이용하여 첨부해주세요. <br>
                            </p>
                            <button
                                style="width: 770px; height: 592px; border: 1px solid rgb(127, 127, 127); border-radius: 5px; background-color: white;">
                                에디터자리
                            </button>

                        </div>


                    </div>

                    <!-- 3. 리워드 -->
                    <div class="regiThree" style="">
                        <div>
                            <b class="regiTitle">프로젝트 리워드를 구성해주세요</b>
                            <p>
                                프로젝트 시작을 위해서는 최소 1개 이상의 리워드가 있어야 합니다. <br>

                                배송이 필요한 리워드는 배송비가 포함된 가격을 적어주세요.
                            </p>
                        </div>

                        <div class="regiReward">
                            <table>
                                <tr>
                                    <th>
                                        <b class="regiTitle">리워드 금액</b>
                                    </th>
                                    <td>
                                        <input type="text" placeholder="1,000원 이상 입력해 주세요.">
                                    </td>
                                    <td>원</td>
                                </tr>
                                <tr>
                                    <th>
                                        <b class="regiTitle" style="line-height: 1;">리워드 제공<br>가능 수 </b>
                                    </th>
                                    <td class="rewardLimitNum">
                                        <button class="btn1">무제한</button>
                                        <button class="btn2">제한</button>
                                        <input type="number" name="limitNum" id="limitNum">
                                    </td>
                                    <td>개</td>
                                </tr>
                                <tr>
                                    <th>
                                        <b class="regiTitle">리워드 제목</b>
                                    </th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                    <td>0/30</td>
                                </tr>
                                <tr class="regiRewardContent">
                                    <th>
                                        <b class="regiTitle">리워드 내용</b>
                                    </th>
                                    <td>
                                        <textarea name="" id="" placeholder="준비된 리워드와 설명을 적어주세요"
                                            style="resize: none;"></textarea>
                                    </td>
                                    <td>0/70</td>
                                </tr>
                                <tr>
                                    <th>
                                        <b class="regiTitle">리워드 옵션</b>
                                    </th>
                                    <td>
                                        <button id="addOptionBtn">리워드 옵션 추가하기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <b class="regiTitle">리워드 옵션</b>
                                    </th>
                                    <td>
                                        <p id="regiOption">옵션선택</p>
                                        <input type="text" placeholder="ex) S 사이즈">
                                    </td>
                                    <td>
                                        <p></p>0/20
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <b class="regiTitle">배송지필요여부</b>
                                    </th>
                                    <td>
                                        <button class="btn1">배송지 필요</button>
                                        <button class="btn2">배송지 필요없음</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- 4. 안내사항 -->
                    <div class="regiFour" style="display: none;"></div>

                    <!-- 5. 제작자/부가정보 -->
                    <div class="regiFive" style="display: none;">
                        <div>
                            <b class="regiTitle">계좌 정보를 입력해주세요</b><br>
                            <p>
                                프로젝트 종료 후 입금받으실 계좌를 입력해주세요.
                            </p>
                        </div>

                        <!-- 은행/계좌번호 -->
                        <div>
                            <b class="regiTitle">계좌 번호를 적어주세요</b><br>
                            <select class="bankOption" name="bankOption">
                                <option value="selectBank">거래은행</option>
                                <option value="kb">국민은행</option>
                                <option value="woori">우리</option>
                                <option value="hana">하나</option>
                                <option value="shinhan">신한</option>
                                <option value="nh">농협</option>
                                <option value="kakao">카카오뱅크</option>
                            </select>
                            <input type="text" id="bankAccount" name="bankAccount" placeholder="계좌번호">
                        </div><br>

                        <!-- 예금주명 -->
                        <div>
                            <b class="regiTitle">예금주명을 입력해주세요</b><br>
                            <input type="text" name="accountHolder" id="accountHolder" placeholder="예금주명">
                        </div><br>

                        <!-- sns -->
                        <div>
                            <div>
                                <b class="regiTitle">홈페이지와 SNS 주소를 적어주세요</b>
                                <p>현재 운영 중인 곳의 주소를 적어주세요. 진행자 정보에 노출됩니다.</p>
                                <table>
                                    <tr>
                                        <td align="center" width="70px" height="65px">
                                            <img src="../../../resources/images/webIcon.PNG" style="height: 33px;">
                                        </td>
                                        <td>
                                            <input type="text" name="partnerWeb" id="partnerWeb" class="partnerWebSns">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <img src="../../../resources/images/snsIcon.PNG" style="height: 33px;">
                                        </td>
                                        <td>
                                            <input type="text" name="partnerSns" id="partnerSns" class="partnerWebSns">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- 등록/초기화 버튼 -->
                    <div class="regiBtn">
                        <button type="submit" id="regiSubmitBtn">등록</button>
                        <button type="reset" id="regiResetBtn">초기화</button>
                    </div>

                    <!-- 등록된 리워드  -->
                    <div class="optionOn" style="display: none;">
                        <table class="registeredTable">
                            <hr><br>
                            <tr>
                                <th>
                                    <b class="regiTitle" style="line-height: 1;">등록된 리워드 <br> 미리보기</b>
                                </th>
                                <td>
                                    <div class="registered">
                                        <div>
                                            <p><b id="registeredName">999,999,999원 펀딩</b></p>
                                            <span id="registeredSpan1">9999개 남음</span>
                                            <span>0개 펀딩</span> <br>
                                        </div><br>
                                        <div>
                                            <p>
                                                리워드명 <br>
                                                <b>투명탁상시계</b> <br>
                                                시계와 캘린더
                                            </p>
                                        </div>
                                        <div>
                                            <p>예상배송일<br><b>2021-06-08</b></p>
                                        </div>
                                        <div class="optionOn" style="display: ;">
                                            <input type="text" placeholder="옵션을 선택하세요" disabled>
                                        </div><br>

                                        <div>
                                            <img id="editBtn"
                                                src="${ pageContext.request.contextPath }/resources/images/editBtn.PNG"
                                                onclick="">
                                            <img id="deleteBtn"
                                                src="${ pageContext.request.contextPath }/resources/images/deleteBtn.PNG"
                                                onclick="">
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="registered">
                                        <div>
                                            <p><b id="registeredName">999,999,999원 펀딩</b></p>
                                            <span id="registeredSpan1">9999개 남음</span>
                                            <span>0개 펀딩</span> <br>
                                        </div><br>
                                        <div>
                                            <p>
                                                리워드명 <br>
                                                <b>투명탁상시계</b> <br>
                                                시계와 캘린더
                                            </p>
                                        </div>
                                        <div>
                                            <p>예상배송일<br><b>2021-06-08</b></p>
                                        </div>
                                        <div class="optionOn" style="display: ;">
                                            <input type="text" placeholder="옵션을 선택하세요" disabled>
                                        </div><br>

                                        <div>
                                            <img id="editBtn"
                                                src="${ pageContext.request.contextPath }/resources/images/editBtn.PNG"
                                                onclick="">
                                            <img id="deleteBtn"
                                                src="${ pageContext.request.contextPath }/resources/images/deleteBtn.PNG"
                                                onclick="">
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="registered">
                                        <div>
                                            <p><b id="registeredName">999,999,999원 펀딩</b></p>
                                            <span id="registeredSpan1">9999개 남음</span>
                                            <span>0개 펀딩</span> <br>
                                        </div><br>
                                        <div>
                                            <p>
                                                리워드명 <br>
                                                <b>투명탁상시계</b> <br>
                                                시계와 캘린더
                                            </p>
                                        </div>
                                        <div>
                                            <p>예상배송일<br><b>2021-06-08</b></p>
                                        </div>
                                        <div class="optionOn" style="display: ;">
                                            <input type="text" placeholder="옵션을 선택하세요" disabled>
                                        </div><br>

                                        <div>
                                            <img id="editBtn"
                                                src="${ pageContext.request.contextPath }/resources/images/editBtn.PNG"
                                                onclick="">
                                            <img id="deleteBtn"
                                                src="${ pageContext.request.contextPath }/resources/images/deleteBtn.PNG"
                                                onclick="">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="registered">
                                        <div>
                                            <p><b id="registeredName">999,999,999원 펀딩</b></p>
                                            <span id="registeredSpan1">9999개 남음</span>
                                            <span>0개 펀딩</span> <br>
                                        </div><br>
                                        <div>
                                            <p>
                                                리워드명 <br>
                                                <b>투명탁상시계</b> <br>
                                                시계와 캘린더
                                            </p>
                                        </div>
                                        <div>
                                            <p>예상배송일<br><b>2021-06-08</b></p>
                                        </div>
                                        <div class="optionOn" style="display: ;">
                                            <input type="text" placeholder="옵션을 선택하세요" disabled>
                                        </div><br>

                                        <div>
                                            <img id="editBtn"
                                                src="${ pageContext.request.contextPath }/resources/images/editBtn.PNG"
                                                onclick="">
                                            <img id="deleteBtn"
                                                src="${ pageContext.request.contextPath }/resources/images/deleteBtn.PNG"
                                                onclick="">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
                <!-- 왼쪽 메뉴바 -->
                <div class="regiMenubar">
                    <p><b>프로젝트 만들기</b></p>
                    <ol>
                        <!-- 호버줘서 클릭된건 파랑색보여지게 -->
                        <li><a href="">기본정보</a></li>
                        <li><a href="">스토리</a></li>
                        <li><a href="">리워드</a></li>
                        <li><a href="">안내사항</a></li>
                        <li><a href="">제작자/부가 정보</a></li>
                    </ol>
                </div>
                <!-- 메뉴바 스토리선택됨 표시바 -->
                <div class="regiMenuSelected" style="margin-top: -247px; ">&nbsp;</div>
                <div class="regiMenuSelected" style="margin-top: -206px; display: none;">&nbsp;</div>
                <div class="regiMenuSelected" style="margin-top: -166px; display: none;">&nbsp;</div>
                <div class="regiMenuSelected" style="margin-top: -125px; display: none;">&nbsp;</div>
                <div class="regiMenuSelected" style="margin-top: -86px;  display: none;">&nbsp;</div>

            </div> <!-- outer div -->


        </body>

        </html>