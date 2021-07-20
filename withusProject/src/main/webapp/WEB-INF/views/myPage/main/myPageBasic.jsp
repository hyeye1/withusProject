<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    
    <style>
        
        /*div{border: 1px solid red; box-sizing: border-box;}*/
        .wrap{width: 1000px; height: 800px; margin: auto; }

        .wrap>div{width: 100%;}
        

        /* 메뉴 아래 선 */
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 80%;
            
        }

        #mypage{height: 100%; margin-top: 50px;}

        /*큰제목*/
        #mainTitle {font-size: 23px; font-weight: bolder; width: 80%;}
        #rightIcon{width: 20px; height: 20px; float: right; margin-top: 15px;}
        #menuIcon{width: 30px; height: 30px; margin-right: 10px; margin-bottom: 2px;}
        
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%; margin-left:110px;}

        /*------공통---------*/

        
        /* main content */
        #main_1{height: 15%; }
        #main_2{height: 40%; margin-top: 20px;}
        #main_3{height: 30%; margin-top: 150px;}
        

        #main_3>div{float: left;}
        #main_3_1{width: 45%;}
        #main_3_2{width: 45%;}
        
        

        /* 펀딩내역 */
        .mainTitle{float:right;}

        #count{
          background-color: rgba(41, 128, 185, 0.16);
          width: 300px;
          margin-left: 300px;
          margin-top: 20px;
          font-size: 30px;
          border-radius: 50px;
          text-align: center;
        }

        /* 좋아요 */
        #main_2>.like{float: left; padding: 5px;}
        #main_2>.like:hover {cursor:pointer; opacity:0.5;}
        .like>table{width: 90%;  font-size: 15px;}
        
        #main_2>.like{width:280px; margin-top:20px; margin-bottom:30px;}
        #percent{width : 30%;}
        #totalprice{width : 35%;}
        #dday{width : 30%;}
        


        /* 문의내역 */
        #qTable{width: 80%; font-weight: 600; font-size: 15px;}
        #qTitle{width: 50%; height: 70px;}
        #qDate{width: 20%;}
        #qTable td{cursor: pointer;}
        
        
        /* 팔로잉 테이블 */
        #main_3_2>table{width: 100%; font-weight: 500; margin-top:10px}
        #profile{width: 10%; height: 60px;}
        #user{width: 60%}
        #status{width: 20%}

        #id{font-size: 15px; font-weight: bold;}
        #idDetail{font-size: 13px;}
        #profile>img{cursor: pointer;}
        #user>#id:hover{cursor: pointer; color: rgb(128, 128, 128);}

       
        a{text-decoration: none; color: black;}

    </style>



</head>
<body>
	
	
    
    <div class="wrap myPageMenu">
        
        <!-- 나의 펀딩 내역  -->
        <div id="mypage">
            <div id="content">
                
                <!-- 나의 펀딩 목록-->
                <div id="main_1">
                  <p id="mainTitle"><a href="myFunding.me"><img src="resources/images/myPage/shopping.png" id="menuIcon">밀어준 펀딩 <label style="color: rgb(52, 152, 219); font-size:25px;">${fundingCount}</label> 회
                  <img src="resources/images/myPage/right_arrow.png" id="rightIcon"></a></p>
                  
                  <div id="underLine"></div>

                  


                </div>
                
                
                <!--좋아요-->
                <div id="main_2">
                  <p id="mainTitle"><a href="like.me"><img src="resources/images/myPage/like.png" id="menuIcon">좋아요<img src="resources/images/myPage/right_arrow.png" id="rightIcon"></a></p>
                  <div id="underLine"></div>

                 	<c:choose>
                    	<c:when test="${ empty mainLikeList }">
                    		<div class="like">
                    			좋아요 목록이 없습니다
                    		</div>
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="likeList" items="${ mainLikeList }" end="2">
			                     <div class="like">
			                     <input type="hidden" class="pno" value="${ likeList.projectNo }">
                  					<table>
			                            <tr>
			                                <td colspan="3">
			                                	<img src="${ likeList.projectThum }"  width="240" height="200">
			                                </td>
			                            </tr>
			                            <tr>
			                                <td colspan="3" style="width:270px;">${ likeList.projectTitle }</td>
			                            </tr>
			                            <tr>
			                                <td colspan="3">${ likeList.catName } | ${ likeList.partnerName }</td>
			                            </tr>
			                            <tr>
				                           <c:choose>
							                	<c:when test="${ likeList.dday >= 0 }">
													<td id="percent">${ likeList.percentage }%</td>
													<td id="totalPrice">${ likeList.totalPrice }원</td>
													<td id="dday">D-${ likeList.dday }</td>
							            		</c:when>
							            		<c:otherwise>
							            			<td id="percent">${ likeList.percentage }%</td>
													<td id="totalPrice">${ likeList.totalPrice }원</td>
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
               
               <script>
                $(function(){
            		$("#main_2 .like").click(function(){
            			location.href="detail.fd?pno=" + $(this).children(".pno").val();
            		})
            	})
                
                
                </script>
               
               

                
                <!--나의문의 & 팔로잉-->
                <div id="main_3">
                  
                  <div id="main_3_1">
                    <p id="mainTitle"><a href="myQuery.me"><img src="resources/images/myPage/qna.png" id="menuIcon">나의 문의<img src="resources/images/myPage/right_arrow.png" id="rightIcon"></a></p>
                    <div id="underLine"></div>

                    <!--3개-->
                    <c:choose>
                		<c:when test="${ empty mainQueryList }">
                			1:1 문의 내역이 없습니다
                		</c:when>
                		<c:otherwise>
                			<table id="qTable" class="table-hover">
		                        
                				<c:forEach var="queryList" items="${ mainQueryList }" end="2">
                				  <tr>
		                            <td id="qDate">${ queryList.otoDate }</td>
		                            <td id="qTitle">${ queryList.otoTitle }</td>
		                            <td id="otoNo" style="display:none;">${ queryList.otoNo }</td>
		                          </tr>
		                       </c:forEach>
                			</table>
                		</c:otherwise>
                	</c:choose>
				  </div>
				  
				  <!-- 문의내역 상세보기페이지로 -->
                 <script>
	            	$(function(){
	            		$("#qTable td").click(function(){
	            			location.href="myQueryDetail.me?otoNo=" + $(this).siblings("#otoNo").text();
	            		})
	            	})
	             </script>
				  
				  
				      
                  
                  
                  <div id="main_3_2">
                    <p id="mainTitle"><a href="followlist.me"><img src="resources/images/myPage/follow.png" id="menuIcon">팔로잉<img src="resources/images/myPage/right_arrow.png" id="rightIcon"></a></p>
                    <div id="underLine"></div>

                    <!--3개-->
                    <c:choose>
                    	<c:when test="${ empty mainFollowList }">
                    		팔로우 목록이 없습니다
                    	</c:when>
                    	<c:otherwise>
	                    	<c:forEach var="m" items="${ mainFollowList }" end="2">
	                    	   <table id="followTable">
		                      	<tr>
			                        <td id="profile">
			                        	<a href="partnerDetail.me?memberNo=${ m.memberNo }"><img src="${ m.memberProfile }" width="60" height="60" class="rounded-circle" value="${ m.memberNo }" ></a>
			                        </td>
			                        <th id="user">
			                          <div id="id">${ m.partnerName }</div>
			                          <div id="idDetail">파트너</div>
			                          <div id="followMemberNo" style="display: none;" >${ m.memberNo }</div>
			                        </th>
			                        <input type="hidden" value="${ m.memberNo }" name="followMemberNo" id="followMemberNo"> 
			                       
			                      </tr>
								</table>
							</c:forEach>	
                    	</c:otherwise>
                    </c:choose>
				  </div>
				  
				   <!-- 파트너 상세보기페이지로 -->
	                <script>
		            	$(function(){
		            		$("#followTable th").click(function(){
		            			location.href="partnerDetail.me?memberNo=" + $(this).children("#followMemberNo").text();
		            		})
		            	})
		            	
		            	
		            </script>
				  
				</div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>