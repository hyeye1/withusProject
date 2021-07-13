<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
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
                    background-color: rgb(52, 152, 219);
                    color: white;
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
                    cursor: pointer;
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

                .liOne {
                    color: rgb(41, 128, 185);
                }

                .regiSubmitBtn,
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

                #projectSummary,
                #projectGprice {
                    width: 675px;
                    height: 40px;
                    margin-right: 10px;
                }

                #projectGprice::placeholder {
                    padding-left: 655px;
                }

                #projectDday {
                    width: 168px;
                    height: 40px;
                    margin-right: 10px;
                }

                #projectDday::placeholder {
                    text-align: right;
                }

                #projectPeriod,
                #deliveryDate {
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
                    color: rgb(51, 51, 51);
                }

                .regiReward th {
                    width: 200px;
                    height: 80px;
                }

                .regiReward input,
                textarea {
                    width: 467px;
                    margin-right: 16px;
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
                    float: right;
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
                    height: 370px;
                    width: 213px;
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
                    width: 78px;
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

                .regiOuter .registeredTable td {
                    padding: 7px;
                }

                .regiOuter #partnersPolicy {
                    height: 150px !important;
                    resize: none;
                }

                .defaultInfo,
                #partnersPolicy {
                    width: 776px;
                    height: 274px;
                    background-color: rgb(255, 255, 255);
                    color: rgb(94, 94, 94);
                    border: rgb(204, 204, 204) 1px solid;
                    padding: 20px;
                }

                .regiOuter #showPhone {
                    width: 20px;
                    margin-left: 30px;
                }

                .regiReward label {
                    color: rgb(41, 128, 185);
                }

                .blue {
                    color: rgb(34, 12, 224);
                }

                .pink {
                    color: rgb(245, 40, 153);
                }

                .delOpt{
                    float: right;
                    cursor: pointer;
                    margin-right: 20px;
                }

                .cateLeft a {font-size: 16px !important; margin-bottom: 0.35rem !important;}
                
				.cateCenter {font-size: 16px !important;}
				#cateContent{margin-left: -40px !important;}

            </style>
        </head>

        <body>

            <jsp:include page="../common/header.jsp" />

            <form action="success.fd">
                <div class="regiOuter">
    
                    <!-- 타이틀과 미리보기/임시저장/승인요청하기 -->
                    <div class="regiHeader">
                        <p>
                            <b class="regi regiOne">기본정보</b>
                            <b class="regi regiTwo" style="display: none;">스토리</b>
                            <b class="regi regiThree" style="display: none;">리워드</b>
                            <b class="regi regiFour" style="display: none;">안내사항</b>
                            <b class="regi regiFive" style="display: none;">제작자/부가 정보</b>
                        </p>
                        <button type="submit" class="registerBtn">승인요청하기</button>
                        <button type="button">임시저장</button>
                        <button type="button">미리보기</button>
                    </div>
    
                    <!-- 바디 -->
                    <div class="regiBody">
                        <!-- 1. 기본정보 -->
                        <div class="regiOne regi">
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

                            
                        <script>
                            $(function(){
                                $('input').on('keydown', function (e) {
                                    if (e.which == 13) {
                                        e.preventDefault();
                                    }
                                });
                            })
                        </script>                            
                        
    
                            <!-- 카테고리+제목 -->
                            <div>
                                <b class="regiTitle">프로젝트의 제목과 카테고리를 설정해주세요.</b> <br>
                                <select class="catOption" name="catNo">
                                    <option value="1">카테고리</option>
                                    <option value="2">패션/잡화</option>
                                    <option value="3">뷰티</option>
                                    <option value="4">푸드</option>
                                    <option value="5">홈리빙</option>
                                    <option value="6">디자인소품</option>
                                    <option value="7">여행/레저</option>
                                    <option value="8">스포츠/모빌리티</option>
                                    <option value="9">반려동물</option>
                                    <option value="10">테크/가전</option>
                                </select>
                                <input type="text" id="projectTitle" name="projectTitle" placeholder="제목을 입력해주세요">
                            </div><br>
    
                            <!-- 프로젝트 요약 -->
                            <div>
                                <b class="regiTitle">프로젝트 요약</b> <br>
                                <input type="text" id="projectSummary" name="projectSummary"
                                    placeholder="프로젝트를 간단히 설명해주세요">
                            </div><br>
    
                            <!-- 목표 금액 -->
                            <div>
                                <b class="regiTitle">목표 금액을 적어주세요</b> <br>
                                <input type="text" id="projectGprice" name="projectGprice" placeholder="0">원
                            </div><br>
    
                            <div>
                                <b class="regiTitle">프로젝트의 진행 기간을 적어주세요</b>
                                <p>최소 7일부터 최대 60일까지 가능합니다.</p>
                                <input type="text" id="projectDday" placeholder="0" disabled>일 남음 
                                <input type="date" name="projectEndDT" id="projectPeriod">
    
                                <script>
                                    // 디데이 계산
                                   $(function(){
                                    $("#projectPeriod").change(function(){
                                        var today = new Date();
                                        var dueDay = $("#projectPeriod").val();   
                                        var gap = today.getTime() - new Date(dueDay).getTime();
                                        var result = Math.floor(gap / (1000 * 60 * 60 * 24)) * -1;
                                        //console.log(result);
    
                                        $("#projectDday").attr('placeholder', result);
                                    })
                                   })
                                </script>
                            </div><br>
                            
    
                            <div>
                                <b class="regiTitle">프로젝트의 예상 배송일을 적어주세요</b>
                                <p>배송지 필요가 없는 프로젝트는 필요없음을 선택해주세요. <br>
                                    또한 배송지 필요가 없는 리워드가 따로 있다면 리워드 페이지에서 다시 선택이 가능합니다.
                                </p>
    
                                <!-- 체크박스 선택시 데이트 인풋 사라지게 -->
                                <label for="projectShipment">
                                    <input type="checkbox" name="projectShipment" id="projectShipment" onclick="deliverYN();"> 배송지 필요없어요
                                </label>
    
                                <input type="date" name="deliveryDate" id="deliveryDate">
    
                                <script>
                                    var shipDate = $('input[name=deliveryDate]');
                                   
                                    $('input[name=projectShipment]').change(function(){
                                        if($(this).prop("checked")){
                                            shipDate.hide();
                                            $('#deliveryDate').val('');
                                        }else{
                                            shipDate.show();
                                        }
                                    });
                                </script>
                            </div><br>
    
                            <div>
                                <b class="regiTitle">프로젝트의 대표 이미지를 등록해주세요</b>
                                <p>홈페이지와 외부 공유를 했을 때 보여집니다. 프로젝트를 한 눈에 나타낼 수 있는 이미지를 등록해주세요.</p>
                                <button type="button"
                                    style="width: 449px; height: 311px; border: 1px solid rgb(127, 127, 127); border-radius: 5px; background-color: white;">
                                    최적 사이즈 740*492 px
                                </button><br><br>
                                <input type="file" name="upfile"> <!-- html 이미지 미리보기 -->
                            </div><br>
    
                            <div>
                                <b class="regiTitle">프로젝트 키워드를 적어주세요</b><br>
                                <p style="font-size: 26px;">
                                    # <input type="text" name="projectKeyword" id="projectKeyword"
                                        placeholder=" 키워드를 입력해주세요"> <button type="button" id="keywordBtn" onclick="addHash()">해시태그 등록</button>
                                </p>
                                <div id="keywordBox">
                                    <input type="hidden" name="hashtag" value="">
                                </div>
    
                                <script>
                                    var hashs = ""; // input type hidden에 들어가있는 값
                                    $(function(){
                                        $('#projectKeyword').on('keydown', function(e) {
                                            if (e.which == 13) {
                                                e.preventDefault();
                                                addHash();
                                            }
                                        });
                                    })

                                    function addHash(){
                                        var hashtagi = $('input[id=projectKeyword]').val();
                                        if(hashtagi == ""){
                                            alert("입력창을 입력해주세요.");
                                        }else{
                                            $('#keywordBox').last().append('<span> #' + hashtagi + '</span>');
                                            $('input[name=hashtag]').val(hashs);
                                            $('input[id=projectKeyword]').val('');
                                            hashs += '#'+ hashtagi + " ";
                                        }
                                    }
                                </script>
                            </div>
                            
                            <!-- 등록/초기화 버튼 -->
                            <div class="regiBtn">
                                <button type="button" class="regiSubmitBtn oneSubmit" onclick="regiShow('Two')">등록</button>
                                <button type="button" class="regiResetBtn oneReset">초기화</button>
                            </div>
                        </div>
    
    
                        <!-- 2. 스토리 -->
                        <div class="regiTwo regi" style="display: none;">
    
                            <!-- 
                            <div>
                                <b class="regiTitle">프로젝트 소개 영상과 이미지를 등록해주세요</b>
                                <p>
                                    영상과 이미지를 함께 등록할 경우, 영상이 먼저 보여집니다.
                                </p>
                            </div>
                            <br>
    
        
                                 이미지
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
    
                             -->
                            
    
                            <!-- 에디터 -->
                            <div>
                                <b class="regiTitle">프로젝트 스토리를 적어주세요</b>
                                <p>
                                    프로젝트를 시작하기 위해 필요한 내용이 없다면 승인이 되지 않습니다. <br><br>
    
                                    Enter(↵) : 문단 나눔, Shift + Enter : 줄바꿈입니다! <br>
                                    적절한 문단/줄 바꿈만으로 멋진 프로젝트를 완성 할 수 있습니다! <br>
                                    이미지와 영상은 꼭 버튼을 이용하여 첨부해주세요. <br>
                                </p>
                                <textarea  id="summernote"   name="projectContent"
                                    style="width: 770px; height: 592px; border: 1px solid rgb(127, 127, 127); border-radius: 5px; background-color: white; resize: none;">
                                </textarea>
                                <!-- include libraries(jQuery, bootstrap) -->
                                <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
                                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
                                <!-- include summernote css/js -->
                                <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
                                <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
                                <script>
                                    // 썸머노트
                                    $(document).ready(function() {
                                        
                                        
                                        $('#summernote').summernote({
                                            height: 592,                    // 에디터 높이
                                            width: 770,                     // 에디터 가로 넓이
                                            minHeight: null,                // 최소 높이
                                            maxHeight: 700,                // 최대 높이
                                            focus: true,                    // 에디터 로딩후 포커스를 맞출지 여부
                                            lang: "ko-KR"                  // 한글 설정         
                                        });
       
                                    });           
                                </script>
    
                            </div>
                                
                            <!-- 등록/초기화 버튼 -->
                            <div class="regiBtn">
                                <button type="button" class="regiSubmitBtn twoSubmit" onclick="regiShow('Three')">등록</button>
                                <button type="button" class="regiResetBtn twoReset">초기화</button>
                            </div>
    
                        </div>
    
                        <!-- 3. 리워드 -->
                        <div class="regiThree regi" style="display: none;">
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
                                            <input type="text" placeholder="1,000원 이상 입력해 주세요." class="rePrice">
                                        </td>
                                        <td>원</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <b class="regiTitle" style="line-height: 1;">리워드 제공<br>가능 수 </b>
                                        </th>
                                        <td class="rewardLimitNum">
                                            <!-- 예쁜 버튼 
                                                <button type="button" class="btn2 limitBtn1 limit" onclick="limitBtn(1); limitBtn1();">무제한</button>
                                                <button type="button" class="btn1 limitBtn2 limit" onclick="limitBtn(2); limitBtn2();">제한</button>
                                            -->
                                            <label for="limited" style="width:130px;">
                                                <input type="radio" class="limit" name="limit" id="limited" value="limited" style="width: 30px;" onclick="limitBtn(2); limitBtn2();" checked> 제한
                                            </label>
                                            <label for="unlimited">
                                                <input type="radio" class="limit" name="limit" id="unlimited" value="unlimited" style="width: 30px;"  onclick="limitBtn(1); limitBtn1();"> 무제한
                                            </label>
                                            <input type="number" name="limitNum" id="limitNum" class="limitNum">
                                        </td>
                                        <td class="limitNum">개</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <b class="regiTitle">리워드 제목</b>
                                        </th>
                                        <td>
                                            <input type="text" name="reTitle" id="reTitle" class="reTitle">
                                        </td>
                                        <td>0/30</td>
                                    </tr>
                                    <tr class="regiRewardContent">
                                        <th>
                                            <b class="regiTitle">리워드 내용</b>
                                        </th>
                                        <td>
                                            <textarea name="reContent" id="reContent" placeholder="준비된 리워드와 설명을 적어주세요"
                                                style="resize: none;"></textarea>
                                        </td>
                                        <td>0/70</td>
                                    </tr>
                                    <tr class="addOptionTr">
                                        <th>
                                            <b class="regiTitle">리워드 옵션</b>
                                        </th>
                                        <td>
                                            <button type="button" id="addOptionBtn" onclick="addOption();">리워드 옵션 추가하기</button>
                                            <input type="hidden" name="optionYn" value="N">
                                        </td>
                                    </tr>
                                    <tr class="optionOnTr" style="display: none;">
                                        <th>
                                            <b class="regiTitle">리워드 옵션</b>
                                        </th>
                                        <td>
                                            <p id="regiOption">옵션설명 <b class="pink delOpt" onclick="delOpt();">옵션취소</b></p>
                                            <input class="optionInput" name="option" type="text" placeholder="ex) 사이즈를 입력하세요">
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
                                            <label for="yesShip" style="width:180px">
                                                <input type="radio" name="ship" id="yesShip" value="Y" style="width: 30px; " checked> 배송지 필요
                                            </label>
                                            <label for="noShip">
                                                <input type="radio" name="ship" id="noShip" value="N" style="width: 30px;"> 배송지 필요없음
                                            </label>
    
                                            <!-- 
                                                <button class="btn1">배송지 필요</button>
                                                <button class="btn2">배송지 필요없음</button>
                                                -->
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            
                            <!-- 등록/초기화 버튼 -->
                            <div class="regiBtn">
                                <button type="button" class="regiSubmitBtn threeSubmit" onclick="addedReward();">확인</button>
                                <button type="button" class="regiResetBtn threeReset">초기화</button>
                            </div>
                                <!-- 등록된 리워드  -->
                            <div class="rewardOn" style="display: none;">
                                <table class="registeredTable">
                                    <hr><br>
                                    
                                    <tr>
                                        <th colspan="4">
                                            <b class="regiTitle" style="line-height: 1;"> &nbsp; 등록된 리워드 미리보기 <br>&nbsp;</b>
                                        </th>
                                    </tr>
                                </table>

                                <script>
                                    var count = 0;
                
                                    function addedReward(){
                                        var price = $('input[class=rePrice]').val();
                                        var limit = $('input[class=limitNum]').val();
                                        var limited = $('input:radio[name=limit]:checked').val();
                                        var title = $('input[class=reTitle').val();
                                        var content = $('textarea[name=reContent]').val();
                                        var option = $('input[name=option]').val();
                                        var ship = $('input[name=ship]:checked').val();
                                        var optionYn = $('input[name=optionYn]').val();;
                                        var all = $('.regiReward input, textarea');
                                        
                                        console.log(limited);

                                        // limited가 선택되어있는데, limit이 비어있을 경우 => 안된다
                                        // unlimited가 선택되어있으면 , limit비어있든 말든 상관없음
                                        if ( limited == "limited" && limit == ""){
                                            alert("입력창을 입력해주세요.");
                                        }else{
                                            if( price == "" || title == "" || content == "" ){
                                                
                                                alert("입력창을 입력해주세요.");
                                                //console.log('안된다');
                                                
                                            }else{
                                                
                                                var aa = '<td class="td">'+
                                                            '<div class="registered registered1">'+
                                                                '<div style="height: 290px;">'+
                                                                    '<div>'+
                                                                        '<p><b id="registeredName">' + price + '원 펀딩</b></p>'+
                                                                        '<span id="registeredSpan1">' + limit + '개 남음</span><br>'+
                                                                    '</div><br>'+
                                                                    '<div><p id="registeredTC">리워드명 <br> <b>' + title + " </b> <br> " + content + '</p></div>';
                                                    
                                                if(option != ""){
                                                    aa += '<p id="optionP"><input placeholder='+ option + ' disabled></p>';
                                                    optionYn = 'Y';
                                                }
                
                                                    aa +=   '</div>'+
                                                                '<div class="editDel">'+
                                                                    '<img id="editBtn" src="${ pageContext.request.contextPath }/resources/images/editBtn.PNG" onclick="">'+
                                                                    '<img id="deleteBtn"src="${ pageContext.request.contextPath }/resources/images/deleteBtn.PNG" onclick="">'+
                                                                '</div>'+
                                                            '</div>'+
                                                        '</td>';
        
                                                    aa += '<input type="hidden" name="rewardList[' + count + '].rewardPrice" value="' + price +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardStatus" value="' + limited +'">'+ //무제한: 'unlimited' 제한: 'limited' 
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardStock" value="' + limit +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardShip" value="' + ship +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardTitle" value="' + title +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardContent" value="' + content +'">';
                                                          '<input type="hidden" name="rewardList[' + count + '].optionYn" value="' + optionYn +'">'+
                                                          '<input type="hidden" name="rewardList[' + count + '].rewardOption" value="' + option +'">';
                                                    
                                                if(count % 4 == 0) {
                                                    $('.registeredTable').append('<tr></tr>');
                                                }
                                                
                                                $('.registeredTable tr').last().append(aa);
                                                $(".rewardOn").show();
                                                
                                                count++;
                                                console.log(optionYn);      
                                                
                                            }
                                            $(all).val('');
                                        }
                                    }
                                </script>

                                <div class="regiBtn">
                                    <button type="button" class="regiSubmitBtn threeSubmit" onclick="regiShow('Four');">등록</button>
                                </div>
                            </div>
                        </div>
    
                        <!-- 4. 안내사항 -->
                        <div class="regiFour regi" style="display: none;">
                            <div>
                                <b class="regiTitle">환불 및 교환 정책을 적어주세요</b>
                                <p>
                                    리워드 안내에 노출됩니다.
                                </p>
                            </div><br>
    
                            <div class="regiReward">
                                <div>
                                    <b class="regiTitle">진행자의 환불 및 교환 정책</b>
                                    <span class="pink">(필수사항)</span>
                                    <textarea name="projectRefcon" id="partnersPolicy"
                                        placeholder="가치가자 환불 및 교환 정책외에 추가사항이 있으시면 적어주세요."></textarea>
                                </div><br>
                                <div>
                                    <b class="regiTitle">문의 가능한 번호</b>
                                    <p>
                                        번호 공개 여부를 선택해주세요.
                                    </p>
                                    <div>
                                        <input type="text" name="partnerPhone" id="partnerPhone" placeholder="번호를 적어주세요 (예. 010-1234-5678)">
                                        <label><input type="checkbox" id="showPhone"><input type="hidden" class="phoneHidden" value="N" name="phoneYN"  >
                                            번호공개</label>
                                        <script>
                                            $(function(){
                                                $('#showPhone').change(function(){
                                                    if($(this).prop("checked")){
                                                        $('.phoneHidden').val('Y');
                                                    }else{
                                                        $('.phoneHidden').val('N');
                                                    }
                                                    // console.log($('#showPhone').val());
                                                })
                                            })
                                        </script>
                                    </div>
                                </div><br>
                                <div>
                                    <b class="regiTitle">문의 이메일</b>
                                    <p>
                                        반드시 적어주세요.
                                    </p>
                                    <input type="text" id="partnerEmail" name="partnerEmail" placeholder="abcd1234@withus.com">
                                </div><br>
    
                                <div class="defaultInfo">
                                    <p>
                                    <p class="blue">가치가자의 환불 및 교환정책 기본사항</p>
    
                                    1. 프로젝트 기간 중에는 자유롭게 마이 페이지에서 펀딩 취소가 가능합니다. <br>
                                    2. 펀딩을 받아야만 생산을 시작할 수 있는 크라우드 펀딩 특성상, 프로젝트 종료 이후에는 단순 변심으로 인한 교환이나 환불이 불가하니 이점 양해
                                    부탁드립니다. <br>
                                    3. 리워드 배송일이 예상보다 지연되는 경우, 새소식과 후원자 분들의 이메일을 통해 안내해드리겠습니다. <br>
                                    이에 관한 문의는 이메일 "<span class="pink pinkEmail">abcd1234@gogo.com
                                        <!--파트너 이메일-->
                                    </span>" , 연락처 "<span class="pink pinkPhone">010-1234-5678
                                        <!--파트너 연락처-->
                                    </span>" 로 연락바랍니다.
                                    </p>
                                </div><br>

                                <script>
                                    $(function(){
                                        
                                        $("#partnerPhone").change(function(){
                                            var phone = $("input[name=partnerPhone]").val();
                                            
                                            if( phone != null || phone != ""){
                                                $('.pinkPhone').empty().append(phone);
                                            }  
                                        })
                                        $("#partnerEmail").change(function(){
                                            var email = $("#partnerEmail").val();

                                            if( email != null || email != ""){
                                                $('.pinkEmail').empty().append(email);
                                            }  
                                        })
                                    })
                                </script>
    
                                <b>* 프로젝트 종료일 이후에 리워드와 관련된 환불 및 교환은 프로젝트 제작자가 약속하는 것에 따르며 가치가자는
                                    이에 책임지지 않습니다.</b>
                            </div>
                                
                            <!-- 등록/초기화 버튼 -->
                            <div class="regiBtn">
                                <button type="button" class="regiSubmitBtn fourSubmit" onclick="regiShow('Five');">등록</button>
                                <button type="button" class="regiResetBtn fourReset">초기화</button>
                            </div>
                        </div>
    
                        <!-- 5. 제작자/부가정보 -->
                        <div class="regiFive regi" style="display: none;">
                            <div>
                                <b class="regiTitle">계좌 정보를 입력해주세요</b><br>
                                <p>
                                    프로젝트 종료 후 입금받으실 계좌를 입력해주세요.
                                </p>
                            </div>
    
                            <!-- 은행/계좌번호 -->
                            <div>
                                <b class="regiTitle">계좌 번호를 적어주세요</b><br>
                                <select class="bankOption" name="partnerBank">
                                    <option value="selectBank">거래은행</option>
                                    <option value="국민은행">국민은행</option>
                                    <option value="우리은행">우리</option>
                                    <option value="하나은행">하나</option>
                                    <option value="신한은행">신한</option>
                                    <option value="농협">농협</option>
                                    <option value="카카오뱅크">카카오뱅크</option>
                                </select>
                                <input type="text" id="bankAccount" name="partnerAccount" placeholder="계좌번호">
                            </div><br>
    
                            <!-- 예금주명 -->
                            <div>
                                <b class="regiTitle">예금주명을 입력해주세요</b><br>
                                <input type="text" name="partnerAcholer" id="accountHolder" placeholder="예금주명">
                            </div><br>
    
                            <!-- sns -->
                            <div>
                                <div>
                                    <b class="regiTitle">홈페이지와 SNS 주소를 적어주세요</b>
                                    <p>현재 운영 중인 곳의 주소를 적어주세요. 진행자 정보에 노출됩니다.</p>
                                    <table>
                                        <tr>
                                            <td align="center" width="70px" height="65px">
                                                <img src="${ pageContext.request.contextPath }/resources/images/webIcon.PNG"
                                                    style="height: 33px;">
                                            </td>
                                            <td>
                                                <input type="text" name="partnerWeb" id="partnerWeb" class="partnerWebSns">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <img src="${ pageContext.request.contextPath }/resources/images/snsIcon.PNG"
                                                    style="height: 33px;">
                                            </td>
                                            <td>
                                                <input type="text" name="partnerSNS" id="partnerSns" class="partnerWebSns">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                                
                            <!-- 등록/초기화 버튼 -->
                            <div class="regiBtn">
                                <button type="submit" class="regiSubmitBtn fiveSubmit">승인요청</button>
                                <button type="button" class="regiResetBtn fiveReset">초기화</button>
                            </div>
                        </div>
    
                        
                    </div>
    
    
                    <!-- 왼쪽 메뉴바 -->
                    <div class="regiMenubar">
                        <p><b>프로젝트 만들기</b></p>
                        <ol>
                            <!-- 호버줘서 클릭된건 파랑색보여지게 -->
                            <li class="regiMenu liOne" onclick="regiShow('One');">기본정보</li>
                            <li class="regiMenu liTwo" onclick="regiShow('Two');">스토리</li>
                            <li class="regiMenu liThree" onclick="regiShow('Three');">리워드</li>
                            <li class="regiMenu liFour" onclick="regiShow('Four');">안내사항</li>
                            <li class="regiMenu liFive" onclick="regiShow('Five');">제작자/부가 정보</li>
                        </ol>
                    </div>
                    <!-- 메뉴바 스토리선택됨 표시바 -->
                    <div class="regiMenuSelected regi regiOne" style="margin-top: -247px; ">&nbsp;</div>
                    <div class="regiMenuSelected regi regiTwo" style="margin-top: -206px; display: none;">&nbsp;</div>
                    <div class="regiMenuSelected regi regiThree" style="margin-top: -166px; display: none;">&nbsp;</div>
                    <div class="regiMenuSelected regi regiFour" style="margin-top: -125px; display: none;">&nbsp;</div>
                    <div class="regiMenuSelected regi regiFive" style="margin-top: -86px;  display: none;">&nbsp;</div>
    
                    <script>
                        function regiShow(className) {
                            $(".regi").hide();
                            $(".regi" + className).show();
                            $(".regiMenu").css('color', 'black');
                            $(".li" + className).css('color', 'rgb(41, 128, 185)');
                            $(window).scrollTop(0);
                        }
    
                        function addOption() {
                            $('.addOptionTr').hide();
                            $('.optionOnTr').show();
                            
                        }
    
                        function delOpt(){
                            $('.optionOnTr').hide();
                            $('.optionInput').val('');
                            $('.addOptionTr').show();
                        }
    
                        function limitBtn(className) {
                            $(".limit").css('background-color', 'rgb(224, 224, 224)');
                            $(".limit").css('color', 'black');
                            $(".limitBtn" + className).css('background-color', 'rgb(52, 152, 219)');
                            $(".limitBtn" + className).css('color', 'white');
                        }
    
                        function limitBtn2(){
                            $(".limitNum").show();
                        }
    
                        function limitBtn1(){
                            $(".limitNum").hide();
                        }


                    </script>
                </div> <!-- outer /div -->
            </form>

        </body>

        </html>