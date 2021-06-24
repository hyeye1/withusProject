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
        .wrap{width: 1000px; height: 1200px; margin: auto;}

        .wrap>div{width: 100%;}

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%; margin-left: 50px;}

        
        /* content */
        #content_1{height: 15%;}
        #content_2{height: 60%;}
        #content_3{height: 20%;}

        /*프로필 부분*/
        
        #content_1>div{float: left; list-style-type: none; }
        #content_1_1{width: 10%;  margin-left: 100px; margin-top: 30px;}
        #content_1_2{width: 30%; margin-top: 40px; margin-left: 50px;}

        #content_1_2>div{float: left; margin-top: 20px; text-align: center; font-size: 12px;}

        /* 펀딩 목록 */
        #content_2{margin-top: 50px; margin-left: 100px; margin-right: 10px;}
        #content_2>div{float: left; padding: 10px;}


        /* 페이징 */
        #pagingArea{width:fit-content;margin:auto;}
        
        a{text-decoration: none; color:white; text-decoration-line: none;}
        
	</style>
</head>
<body>

	<div class="wrap">
        
        <!-- 유저 -->
        <div id="mypage">
            <div id="content">
                
                <!-- 유저 프로필 -->
                <div id="content_1">
                    
                    <!-- 이미지 등록했을때 안했을때  (기본이미지) -->
            		<c:choose>
		            	<c:when test="${ empty loginUser.memberProfile }">    
				            <div id="content_1_1">
				            	<img src="resources/profile/profile_basic.jpg" width="80" height="80"  class="rounded-circle" >
				           	</div>
			           	</c:when>
			           	<c:otherwise>
			           		<div id="content_1_1">
				            	 <img src="${ loginUser.memberProfile }" width="100" height="100" class="rounded-circle" >
				           	</div>
			           	</c:otherwise> 
		            </c:choose>
                    
                    <div id="content_1_2">
                        <li style="font-size: 20px;">
                            	${ loginUser.memberName }(${loginUser.partnerName })
                        </li>
                        <li style="font-size: 12px;">파트너</li>

                        <div>
                            <li style="color: rgb(52, 152, 219);">${ fundingCount }</li>
                            <li >만든펀딩</li>
                        </div>

                        <div style="margin-left: 25px;">
                            <li style="color: rgb(52, 152, 219);">${ followerCount }</li>
                            <li>팔로워</li>
                        </div>
                        
                        <div style="margin-left: 25px; margin-top: 25px;">
                            <button type="button" class="btn btn-dark btn-sm"><a href="partnerInfo.me">프로필 편집</a></button>
                        </div>
                        
                    </div>
                    
                    
                    
                </div>
                
                
                 <!-- 진행중인 펀딩 -->
                <div id="content_2">
                    <p style="font-size: 20px; font-weight: 1000;">
                        	만든 펀딩 
                    </p>
                    <c:choose>
                    	<c:when test="${ empty fundingList }">
                    		<div>
                    			펀딩 내역이 없습니다
                    		</div>
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="list" items="${ fundingList }">
	                    		<div>
			                        <table>
			                            <tr>
			                                <td colspan="2">
			                                	<c:choose>
			                                		<c:when test="${ empty list.projectThum }">
			                                			<img src="resources/project_thumbnail/no_image.jpg"  width="250" height="200">
			                                		</c:when>
			                                		<c:otherwise>
			                                			<img src="${ list.projectThum }"  width="250" height="200">
			                                		</c:otherwise>
			                                	</c:choose>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td colspan="2">${ list.projectTitle }</td>
			                            </tr>
			                            <tr>
			                                <td>${ list.projectGPrice }</td>
			                                <td>~ ${ list.projectEndDt }</td>
			                            </tr>
			                            <tr>
			                                <td>오픈 여부</td>
			                                <td>
			                                	<c:choose>
			                                		<c:when test="${ list.projectStatus eq '1' }">
			                                			수락요청
			                                		</c:when>
			                                		<c:when test="${ list.projectStatus eq '2' }">
			                                			블라인드
			                                		</c:when>
			                                		<c:when test="${ list.projectStatus eq '3' }">
			                                			게시중
			                                		</c:when>
			                                		<c:when test="${ list.projectStatus eq '4' }">
			                                		 	반려
			                                		</c:when>
			                                		<c:otherwise>
			                                			임시저장
			                                		</c:otherwise>
			                                		
			                                	</c:choose>
			                                
			                                
			                                </td>
			                            </tr>
			                        </table>
			                    </div>
                    		</c:forEach>
                    	</c:otherwise>
                    </c:choose>
                    

                </div>
                
                
                <!-- 페이징 -->
                <div id="content_3">
                    <div id="pagingArea">
                        <ul class="pagination">
                            <!-- list가 있을때만 페이지버튼 -->
                        	<c:if test="${ !empty fundingList }">
	                        	<c:choose>
	                        		<c:when test="${ pi.currentPage eq 1 }">
	                        			<li class="page-item disabled" ><a class="page-link" href="#">Previous</a></li>
	                        		</c:when>
		                            <c:otherwise>
		                            	<li class="page-item"><a class="page-link" href="partnerFunding.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                            </c:otherwise>
		                        </c:choose>
		                        
		                        
		                        
		                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                    	<li class="page-item"><a class="page-link" href="partnerFunding.me?currentPage=${ p }">${ p }</a></li>
			                    </c:forEach>
		                       
		                        <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				                    </c:when>
				                    <c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="partnerFunding.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:if>
                         </ul>
                    </div>
                </div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>