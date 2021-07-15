<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    
    <style>
        
        /*div{border: 1px solid red; box-sizing: border-box;}*/
        .wrap{width: 1000px; height: 700px; margin: auto;}

        .wrap>div{width: 100%;}

        /* 메뉴 아래 선 */
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 80%;
            
        }

        #mypage{height: 100%; margin-top: 50px;}

        /*큰제목*/
        p{font-size: 23px; font-weight: bolder;  width: 80%;}
        
        #rightIcon{width: 20px; height: 20px; float: right; margin-top: 15px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%; margin-left: 110px;}

        /*------공통---------*/

        
        /* main content */
        #main_1{height: 35%; margin-top: 50px;}
        #main_2{height: 40%; margin-top: 50px;}
        

        #main_2>div{float: left;}
        #main_2_1{width: 45%;}
        #main_2_2{width: 45%;}
        
        

        /* 펀딩내역 */
        #count{
          background-color: rgba(41, 128, 185, 0.16);
          width: 300px;
          margin-left: 300px;
          margin-top: 50px;
          font-size: 30px;
          border-radius: 40px;
          text-align: center;
        }

        /* 프로젝트 */
        #main_1>#fundingList{float: left; padding: 5px; width:280px;}
        #fundingList>table{width: 85%;  font-size: 14px;}
        
        #percent{width : 30%;}
        #totalprice{width : 35%;}
        #dday{width : 30%;}
        
        
        /* 프로젝트가 비어있을때 / 파트너 조인x일때 */
        #empty{width: 300px; height: 250px; margin-left: 250px;}
        #joinus{margin-left: 180px; margin-top: 10px;}
        

        /* 버튼 */
        #openBtnArea{margin-left: 250px; margin-bottom: 50px; margin-top: 170px; }
        #openBtn{width: 300px; margin-top: 30px; background-color: rgb(52, 152, 219); color: honeydew;}
        
        
        

        /* 메뉴들 */
        #main_2>table{width: 90%;}
        #mmenu{width: 70%; height: 60px; font-weight: bold;}
        #icon{width: 40px; height: 40px; margin-right: 10px;}
       
        a{text-decoration: none; color: black;}

    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 나의 펀딩 내역  -->
        <div id="mypage">
            <div id="content">
                
               <!--좋아요-->
                <div id="main_1">
                  <p><a href="partnerFunding.me">오픈프로젝트<img src="resources/images/myPage/right_arrow.png" id="rightIcon"></a></p>
                  <div id="underLine"></div>

                  <div style="margin-top: 10px; font-size: 20px; font-weight: bold;">나의펀딩 ${ fundingCount }</div>
                  


                  <c:choose>
                  		<c:when test="${ empty fundingList && loginUser.partnerJoin eq 'N' }"> 
                    		<div class="empty">
                    			<img src="resources/images/myPage/closed.png" id="empty">
			                    <div id="joinus">가치가자의 파트너가 되어 펀딩 프로젝트를 오픈해보세요! </div>
							</div>
                    	</c:when>
                    	
                    	
                    	<c:when test="${ empty fundingList && loginUser.partnerJoin eq 'Y'}">
                    		<div class="empty">
                    			<img src="resources/images/myPage/open.png" id="empty">
			                    <div id="joinus">${loginUser.partnerName} 파트너님! 가치가자와함께 프로젝트를 오픈해보세요 </div>
							</div>
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="list" items="${ fundingList }" end="2">
			                     <div id="fundingList">
	                    		 <input type="hidden" class="pno" value="${ list.projectNo }">
			                        <table>
			                            <tr>
			                                <td colspan="3">
			                                	<c:choose>
			                                		<c:when test="${ empty list.projectThum }">
			                                			<img src="resources/project_thumbnail/no_image.jpg"  width="230" height="200">
			                                		</c:when>
			                                		<c:otherwise>
			                                			<img src="${ list.projectThum }"  width="230" height="200">
			                                		</c:otherwise>
			                                	</c:choose>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td colspan="3" style="width:270px;">${ list.projectTitle }</td>
			                            </tr>
			                            <tr>
			                                <td colspan="3">${ list.catName } | ${ list.partnerName }</td>
			                            </tr>
			                            <tr>
				                           <c:choose>
							                	<c:when test="${ list.dday >= 0 }">
													<td id="percent">${ list.percentage }%</td>
													<td id="totalPrice">${ list.totalPrice }원</td>
													<td id="dday">D-${ list.dday }</td>
							            		</c:when>
							            		<c:otherwise>
							            			<td id="percent">${ list.percentage }%</td>
													<td id="totalPrice">${ list.totalPrice }원</td>
													<td id="dday">펀딩종료</td>
							            		</c:otherwise>
							            	</c:choose>
						            	</tr>
			                       </table>
			                    </div>
			                 </c:forEach>
                    	</c:otherwise>
                    </c:choose>
                  
                  
				</div>

                  
                
                <div id="openBtnArea">
                	<!-- 파트너인경우와 아닌경우 매핑값 다르게 -->
                	<!-- 파트너등록페이지 or 펀딩등록페이지 -->
                	<c:choose>
                		<c:when test="${ loginUser.partnerJoin eq 'N' }">
                			<button id="openBtn" class="btn btn-sm"><a href="partnerJoinForm.me">펀딩오픈하기</a></button>
                		</c:when>
                		<c:otherwise>
                			<button id="openBtn" class="btn btn-sm"><a href="">펀딩오픈하기</a></button>
                		</c:otherwise>
                	
                	</c:choose>
                	
                </div>
                

                
                <!--펀딩관리  프로젝트안내-->
                <div id="main_2">
                  
                  <div id="main_2_1">
                    <p><a href="">펀딩관리</a></p>
                    <div id="underLine"></div>

                    <table>
                      <tr>
                      	<!-- 현정:발송관리 링크추가 -->
                        <td id="mmenu"><a href="orderNDeliveryList.part"><img src="resources/images/myPage/package.png" id="icon">펀딩발송관리</a> </td>
                      </tr>
                      <tr>
                        <td id="mmenu"><a href="partnerInfo.me"><img src="resources/images/myPage/pages.png" id="icon">파트너 정보관리</a> </td>
                      </tr>
                      
                    </table>  



                  </div>    
                  
                  
                  <div id="main_2_2">
                    <p><a href="">프로젝트안내</a></p>
                    <div id="underLine"></div>

                    <!--3개-->
                    <table>
                      <tr>
                        <td id="mmenu"><a href=""><img src="resources/images/myPage/help.png" id="icon">펀딩프로젝트 헬프센터</a></td>
                      </tr>
                      <tr>
                        <td id="mmenu"><a href=""><img src="resources/images/myPage/money.png" id="icon" style="margin-top:8px;">펀딩 수수료안내</a></td>
                      </tr>

                    </table>
				 </div>
                  
                
                
                
                
                
                </div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>