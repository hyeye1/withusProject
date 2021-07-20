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
        .mainBody p{
            display: table-cell;
        }
        .mainBody{ width:1200px; height: 550px;}
        
        .mainTitle{
            font-size: 40px; 
            font-weight: 900; 
            float: left; 
            margin: 50px 0 20px 40px; 
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
        .thumbnail:hover{
        cursor:pointer;
        opacity:0.5;
    	}
        .pTitle{
		height:80px;
		font-weight: 600;
		font-size: 18px;
		margin-top: 5px;
		}
		.leftp{color: grey;}
		#dday{float:right;}

        .visualSlide * {margin:0;padding:0;}
        .section input[id*="slide"] {display:none;}
        .section .visualSlide {max-width:1200px;margin:0 auto; margin-top: 23px;}
        .section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative;}
        .section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
        .section .slidelist > li > a {display:block;position:relative;}
        
        /* 자동슬라이드 */
        .visualSlide .slidelist > li {animation: translate 10s infinite 10s; }
        /* .visualSlide .slidelist > li:hover{animation-play-state: paused;} */
        @keyframes translate {
            0%{
                transform: translateX(0%);
            }
            30%{
                transform: translateX(-100%);
            }
            60%{
                transform: translateX(-200%);
            }
            90%{
                transform: translateX(0%);
            }

        }
        /* .section .slidelist > li > a img {width:100%;} */
        .section .slidelist label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
        
        /* input에 체크되면 슬라이드 효과 */
        .section input[id="slide01"]:checked ~ .visualSlide .slidelist > li {transform:translateX(0%);}
        .section input[id="slide02"]:checked ~ .visualSlide .slidelist > li {transform:translateX(-100%);}
        .section input[id="slide03"]:checked ~ .visualSlide .slidelist > li {transform:translateX(-200%);}
        
        /* 좌,우 슬라이드 버튼 */
	    .slide-control > div {display:none;}    
        .section input[id="slide01"]:checked ~ .visualSlide .slide-control > div:nth-child(1) {display:block;}
        .section input[id="slide02"]:checked ~ .visualSlide .slide-control > div:nth-child(2) {display:block;}
        .section input[id="slide03"]:checked ~ .visualSlide .slide-control > div:nth-child(3) {display:block;}

        /* 페이징 */
        .slide-pagelist {text-align:center;padding:20px; margin-top: 100px;}
        .slide-pagelist > li {display:inline-block;vertical-align:middle;}
        .slide-pagelist > li > label {display:block;padding:8px 8px;border-radius:30px;background:#ccc;margin:20px 10px;cursor:pointer;}
        .section input[id="slide01"]:checked ~ .visualSlide .slide-pagelist > li:nth-child(1) > label {background:rgb(52, 152, 219);}
        .section input[id="slide02"]:checked ~ .visualSlide .slide-pagelist > li:nth-child(2) > label {background:rgb(52, 152, 219);}
        .section input[id="slide03"]:checked ~ .visualSlide .slide-pagelist > li:nth-child(3) > label {background:rgb(52, 152, 219);}


        .slidelist{float: left; width: 830px; }
        .slideSide{float: right; margin-right: -500px; margin-top: 180px;}
        .slide-control, .slide-pagelist{
            float: left !important;
        }
        .nextBtn{
            margin-top: 61px;
            cursor: pointer;
        }
        .right{margin-left: 5px;}
		.slidelist a {text-decoration: none; color: black;}
    </style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	
    <div class="mainOuter" align="center">
        
        <!-- 슬라이드 -->
        <div class="section">
            <input type="radio" name="slide" id="slide01" checked>
            <input type="radio" name="slide" id="slide02">
            <input type="radio" name="slide" id="slide03">
            <div class="visualSlide">
                <ul class="slidelist">
                    <!-- 슬라이드 영역 -->
                    <li class="slideitem">
                        <a href="detail.fd?pno=73"><img src="resources/project_thumbnail/20210720022542370073.PNG" class="slideImg" width="830px" height="503px"></a>
                    </li>
                    <li class="slideitem">
                        <a href="detail.fd?pno=74"><img src="resources/project_thumbnail/20210720023359253651.PNG" class="slideImg" width="830px" height="503px"></a>
                    </li>
                    <li class="slideitem">
                        <a href="detail.fd?pno=75"><img src="resources/project_thumbnail/20210720023914376777.PNG" class="slideImg" width="830px" height="503px"></a>
                    </li class="slideitem">
                </ul>
                
                <div class="slideSide">
                    <div id="slideLetter">
                        <ul class="slidelist">
                            <li class="slideitem">
                           	 	<a href="detail.fd?pno=73">
	                                <p align="left" style="font-size: 30px; font-weight: 900;">
	                                    한복을 가방으로 <br> 피워내다,
	                                </p>
	                                <p align="left" style="font-size: 16px; font-weight: 500;">
	                                    업사이클링 모던 '저고리백'
	                                </p>
                                </a>
                            </li>
                            <li class="slideitem">
                            	<a href="detail.fd?pno=74">
	                                <p align="left" style="font-size: 30px; font-weight: 900;">
	                                    조각 조각 리스본 꾸러미
	                                </p>
	                                <p align="left" style="font-size: 16px; font-weight: 500;">
	                                    뜨거운 햇빛 아래 빛나던 여행 속 꾸러미
	                                </p>
                            	</a>
                            </li>
                            <li class="slideitem">
                            	<a href="detail.fd?pno=75">
	                                <p align="left" style="font-size: 30px; font-weight: 900;">
	                                    가방과 뱃지 시리즈로 <br>
	                                    재미를 행복을!
	                                </p>
	                                <p align="left" style="font-size: 16px; font-weight: 500;">
	                                    재미를, 행복을 찾아서 '이상한 나라의 앨리스'
	                                </p>
                            	</a>
                            </li>
                        </ul>
                    </div>
                    
                    <div id="slicePaging">
                        <!-- <img src="resources/images/slideLeft.PNG" class="nextBtn">
                        <img src="resources/images/slideRight.PNG" class="nextBtn"> -->
                        
                            
                        <!-- 좌,우 슬라이드 버튼 -->
                        <div class="slide-control">
                            <div>
                                <label for="slide03" class="left nextBtn"><img src="resources/images/slideLeft.PNG" class="nextBtn"></label>
                                <label for="slide02" class="right nextBtn"><img src="resources/images/slideRight.PNG" class="nextBtn"></label>
                            </div>
                            <div>
                                <label for="slide01" class="left nextBtn"><img src="resources/images/slideLeft.PNG" class="nextBtn"></label>
                                <label for="slide03" class="right nextBtn"><img src="resources/images/slideRight.PNG" class="nextBtn"></label>
                            </div>
                            <div>
                                <label for="slide02" class="left nextBtn"><img src="resources/images/slideLeft.PNG" class="nextBtn"></label>
                                <label for="slide01" class="right nextBtn"><img src="resources/images/slideRight.PNG" class="nextBtn"></label>
                            </div>
                        </div>
    
                        <!-- 페이징 -->
                        <ul class="slide-pagelist">
                            <li><label for="slide01"></label></li>
                            <li><label for="slide02"></label></li>
                            <li><label for="slide03"></label></li>
                        </ul>
                        <!-- <img src="resources/images/slideNext_Temp.PNG" style="width: 95px; margin-top: 23px; margin-right: 20px;"> -->
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 이 프로젝트 어때요? -->
        <div id="mainRecom" class="mainBody">
            <p class="mainTitle"> 이 프로젝트 어때요?</p> 
            <br><br><br><br><br><br>
            <table id="newList">
                <tr style="margin-right:20px">
                </tr>
            </table>

        </div>
        <br><br>
        <!-- 실시간 top3 -->
        <div id="mainTop3" class="mainBody" style="background-color:rgba(224, 224, 224, 0.52);">
            <p class="mainTitle"> 실시간 TOP 3</p> 
            <br><br><br><br><br><br>
            <table id="famousList">
                <tr style="margin-right:20px">
                </tr>
            </table>
        </div>
		
		
        <!-- 오픈 예정 프로젝트 -->
        <div id="mainComing" class="mainBody">
            <p class="mainTitle"> 오픈 예정 프로젝트</p>
            <br><br><br><br><br><br>
            <table id="readyList">
                <tr style="margin-right:20px">
                </tr>
            </table> 
        </div>

        <!-- 성공 임박 프로젝트 -->
        <div id="mainSuccess" class="mainBody">
            <p class="mainTitle"> 성공 임박 프로젝트</p> 
            <br><br><br><br><br><br>
            <table id="eveList">
                <tr style="margin-right:20px">
                </tr>
            </table>
        </div>
        
        <script>
	    	$(function(){
	    		$.ajax({
	    			url:"menuList3.main",
	    			success:function(list){
	    				
	    				var value1="";
	    				var value2="";
	    				var value3="";
	    				var value4="";
	    				$.each(list.fList, function(i, p){
	    					value1 += '<th>' 
	    						   +	'<div class="thumbnail" id="thumbnail" style="margin: 0 20px 0 20px;">'
	    						   +		'<input type="hidden" class="pno" value=' + p.projectNo + '>'
	    						   +		'<input type="hidden" value=' + p.projectGprice + '>'
	    						   +		'<img width="350" src=' + p.projectThum + '>'
	    						   +		'<div class="pTitle" align="left">'
	    						   +			p.projectTitle + '<br>'
	    						   +		'</div>'
	    						   +		'<p class="leftp" align="left">'
	    						   +			p.catName + '|' + p.partnerName + '<br>'
	    						   +			'<span id="percent">' + p.percentage + '%</span>&nbsp;&nbsp;&nbsp;<span id="totalPrice">' + p.totalPrice + '</span>원<span id="dday" align="right">D-' + p.dday + '</span>'
	    						   +		'</p>'
	    						   +	'</div>'
	    						   + '<th>'
	    				})	
	    				
	    				$.each(list.eList, function(i, p){
	    					value2 += '<th>' 
	    						   +	'<div class="thumbnail" id="thumbnail" style="margin: 0 20px 0 20px;">'
	    						   +		'<input type="hidden" class="pno" value=' + p.projectNo + '>'
	    						   +		'<input type="hidden" value=' + p.projectGprice + '>'
	    						   +		'<img width="350" src=' + p.projectThum + '>'
	    						   +		'<div class="pTitle" align="left">'
	    						   +			p.projectTitle + '<br>'
	    						   +		'</div>'
	    						   +		'<p class="leftp" align="left">'
	    						   +			p.catName + '|' + p.partnerName + '<br>'
	    						   +			'<span id="percent">' + p.percentage + '%</span>&nbsp;&nbsp;&nbsp;<span id="totalPrice">' + p.totalPrice + '</span>원<span id="dday">D-' + p.dday + '</span>'
	    						   +		'</p>'
	    						   +	'</div>'
	    						   + '<th>'
	    				})
	    					    				
	    				$.each(list.rList, function(i, p){
	    					value3 += '<th>' 
	    						   +	'<div class="thumbnail" id="thumbnail" style="margin: 0 20px 0 20px;">'
	    						   +		'<input type="hidden" class="pno" value=' + p.projectNo + '>'
	    						   +		'<input type="hidden" value=' + p.projectGprice + '>'
	    						   +		'<img width="350" src=' + p.projectThum + '>'
	    						   +		'<div class="pTitle" align="left">'
	    						   +			p.projectTitle + '<br>'
	    						   +		'</div>'
	    						   +		'<p class="leftp" align="left">'
	    						   +			p.catName + '|' + p.partnerName + '<br>'
	    						   +			'<span id="percent">' + p.percentage + '%</span>&nbsp;&nbsp;&nbsp;<span id="totalPrice">' + p.totalPrice + '</span>원<span id="dday">D-' + p.dday + '</span>'
	    						   +		'</p>'
	    						   +	'</div>'
	    						   + '<th>'
	    				})
	    				
	    				$.each(list.nList, function(i, p){
	    					value4 += '<th>' 
	    						   +	'<div class="thumbnail" id="thumbnail" style="margin: 0 20px 0 20px;">'
	    						   +		'<input type="hidden" class="pno" value=' + p.projectNo + '>'
	    						   +		'<input type="hidden" value=' + p.projectGprice + '>'
	    						   +		'<img width="350" src=' + p.projectThum + '>'
	    						   +		'<div class="pTitle" align="left">'
	    						   +			p.projectTitle + '<br>'
	    						   +		'</div>'
	    						   +		'<p class="leftp" align="left">'
	    						   +			p.catName + '|' + p.partnerName + '<br>'
	    						   +			'<span id="percent">' + p.percentage + '%</span>&nbsp;&nbsp;&nbsp;<span id="totalPrice">' + p.totalPrice + '</span>원<span id="dday">D-' + p.dday + '</span>'
	    						   +		'</p>'
	    						   +	'</div>'
	    						   + '<th>'
	    				})
	    				
						$("#famousList tr").html(value1);
	    				$("#eveList tr").html(value2);
	    				$("#readyList tr").html(value3);
	    				$("#newList tr").html(value4);
	    				
	    	    		$(".thumbnail").click(function(){
	    					location.href="detail.fd?pno=" + $(this).children(".pno").val();
	    				})
	    				
	    				
	    			}, error:function(){
	    				console.log("리스트 조회용 ajax 통신 실패");
	    			}
	    		})
	    		
	    	})
    	</script>
    	
    	<script>
    		
    	</script>
        
		<jsp:include page="common/footer.jsp"/>
	
    </div>
    
</body>
</html>