<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    
        .mainOuter{
            width: 1200px; 
            height: 1000px;
            margin: auto;  
            padding-left: 10px;
            margin-top: -20px;
        }
        .visualSlide{
            width: 100%;
            height: 503px;
            background-color: rgba(224, 224, 224, 0.52);
            margin-top: 20px;
        }
        #slideImg{
            width: 830px;
            height: 100%;
            float: left;
            margin-right: 20px;
        }
        .nextBtn{
            width: 50px;
            float: left;
            margin: 15px;
        }
        .mainBody p{
            display: table-cell;
        }
        .mainBody{ width:1200px; height: 550px;}
        
        .mainTitle{
            font-size: 27px; 
            font-weight: 900; 
            float: left; 
            margin-top: 70px; 
            margin-left: 65px;
        } 
        .mainItems{
            text-align: left;
            margin: 30px;
        }  
        .mainItems img{
            width: 315px; 
            height: 210px;
        }
        .mainInfos p{
            float: right; 
            margin-right: 10px;
        }

    </style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	
    <div class="mainOuter" align="center">
        
        <!-- 슬라이드 -->
        <div class="visualSlide">
            <img src="resources/images/slide1.JPG" id="slideImg">
            <div id="slideLetter">
                <br><br><br><br><br><br><br>
                <p align="left" style="font-size: 30px; font-weight: 900;">
                    순천 명인 발효 홍차로 <br>
                    지구를 지켜요
                </p>
                <p align="left" style="font-size: 16px; font-weight: 500;">
                    환경을 살릴 수 있는 차시간의 전통차 샘플러
                </p>
            </div>
            
            <br><br><br><br>
            <div id="slicePaging">
                <img src="resources/images/slideLeft.PNG" class="nextBtn">
                <img src="resources/images/slideRight.PNG" class="nextBtn">
                <img src="resources/images/slideNext_Temp.PNG" style="width: 95px; margin-top: 23px; margin-right: 20px;">
            </div>
        </div>

        <!-- 이 프로젝트 어때요? -->
        <div id="mainRecom" class="mainBody" style="width: 100%; height: 90%;">
            <p class="mainTitle"> 이 프로젝트 어때요?</p> 
            <br><br><br><br><br><br>
            <table>
                <tr>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                </tr>
                <tr>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                </tr>
            </table>

        </div>
            
        <!-- 실시간 top3 -->
        <div id="mainTop3" class="mainBody" style="background-color:rgba(224, 224, 224, 0.52);">
            <p class="mainTitle"> 실시간 TOP 3</p> 
            <br><br><br><br><br><br>
            <table>
                <tr>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                </tr>
            </table>
        </div>

        <!-- 오픈 예정 프로젝트 -->
        <div id="mainComing" class="mainBody">
            <p class="mainTitle"> 오픈 예정 프로젝트</p>
            <br><br><br><br><br><br>
            <table>
                <tr>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                </tr>
            </table> 
        </div>

        <!-- 성공 임박 프로젝트 -->
        <div id="mainSuccess" class="mainBody">
            <p class="mainTitle"> 성공 임박 프로젝트</p> 
            <br><br><br><br><br><br>
            <table>
                <tr>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                    <th>
                        <div class="mainItems">
                            <img src="resources/images/project1.JPG">
                            <p>봄날에 어울리는 포근한 샴푸향 향수</p><br>
                            <span>
                                <p>401,240원 펀딩</p>
                            </span>
                            <span class="mainInfos">
                                <p>D-4</p>
                                <p>401%</p> 
                            </span>
                        </div>
                    </th>
                </tr>
            </table>
        </div>
        
	<jsp:include page="common/footer.jsp"/>
	
    </div>
    
</body>
</html>