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
        p{font-size: 23px; font-weight: bolder;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%; margin-left: 110px;}

        /*------공통---------*/

        
        /* main content */
        #main_1{height: 30%; margin-top: 50px;}
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
        #main_1>.fundingList{float: left; padding: 10px;}
        .fundingList>table{width: 90%;}

        /* 버튼 */
        #openBtnArea{margin-left: 250px; margin-bottom: 50px; margin-top: 150px;}
        #openBtn{width: 300px; margin-top: 30px; background-color: rgb(52, 152, 219); color: honeydew;}
        
        
        

        /* 메뉴들 */
        #main_2>table{width: 90%;}
        #mmenu{width: 70%; height: 60px;}
       
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
                  <p><a href="">오픈프로젝트</a></p>
                  <div id="underLine"></div>

                  <div style="margin-top: 10px; font-size: 20px;">나의펀딩 ${ fundingCount }</div>
                  


                  <c:choose>
                    	<c:when test="${ empty fundingList }">
                    		<div class="fundingList">
                    			목록이 없습니다
                    		</div>
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="fundingList" items="${ fundingList }" end="2">
			                     <div class="fundingList">
                  					<table>
			                            <tr>
			                                <td colspan="2">
			                                	<c:choose>
			                                		<c:when test="${ empty fundingList.projectThum }">
			                                			<img src="resources/project_thumbnail/no_image.jpg"  width="250" height="200">
			                                		</c:when>
			                                		<c:otherwise>
			                                			<img src="${ fundingList.projectThum }"  width="250" height="200">
			                                		</c:otherwise>
			                                	</c:choose>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td colspan="2" style="width:10px;">${ fundingList.projectTitle }</td>
			                            </tr>
			                            <tr>
			                                <td>${ fundingList.projectGPrice }</td>
			                                <td>~ ${ fundingList.projectEndDt }</td>
			                            </tr>
			                        </table>
			                       </div>
			                 </c:forEach>
                    	</c:otherwise>
                    </c:choose>
                  
                  
				</div>

                  
                
                <div id="openBtnArea"><button id="openBtn" class="btn btn-sm">펀딩오픈하기</button></div>
                

                
                <!--펀딩관리  프로젝트안내-->
                <div id="main_2">
                  
                  <div id="main_2_1">
                    <p><a href="">펀딩관리</a></p>
                    <div id="underLine"></div>

                    <table>
                      <tr>
                        <td id="mmenu">펀딩발송관리 </td>
                      </tr>
                      <tr>
                        <td id="mmenu">파트너 정보관리 </td>
                      </tr>
                      
                    </table>  



                  </div>    
                  
                  
                  <div id="main_2_2">
                    <p><a href="">프로젝트안내</a></p>
                    <div id="underLine"></div>

                    <!--3개-->
                    <table>
                      <tr>
                        <td id="mmenu">펀딩프로젝트 헬프센터</td>
                      </tr>
                      <tr>
                        <td id="mmenu">펀딩 수수료안내</td>
                      </tr>

                    </table>





                  </div>
                  
                
                
                
                
                
                </div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>