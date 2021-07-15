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
        .wrap{width: 1000px; height: 800px; margin: auto;}

        .wrap>div{width: 100%;}

        /* 메뉴 아래 선 */
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 85%;
            
        }

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%; margin-left:110px;}

        /*큰제목*/
        #mainTitle{font-size: 23px; font-weight: bolder;}


        /* content */
        .like #content_1{height: 80%;}
        .like #content_2{height: 10%; width: 80%;}
        
        
        /* 좋아요 목록 */
        .like #content_1{margin-top: 50px;}
        .like #content_1>div{float: left; padding: 10px;}
        #content_1>#likeList:hover {cursor:pointer; opacity:0.5;}
        
        #content_1>#likeList{width:280px;}
        #percent{width : 30%;}
        #totalprice{width : 35%;}
        #dday{width : 30%;}
        


        /* 페이징 */
        #pagingArea{width:fit-content; margin:auto;}


    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 회원 정보수정 -->
        <div id="mypage">
            <div id="content" class="like">
                <p id="mainTitle">좋아요</p>
                <div id="underLine"></div>
                
                
                <!-- 좋아요 목록-->
                
                <div id="content_1">
                    <c:choose>
                    	<c:when test="${ empty likeList }">
                    		<div>
                    			좋아요 목록이 없습니다
                    		</div>
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="list" items="${ likeList }">
	                    		<div id="likeList">
	                    		<input type="hidden" class="pno" value="${ list.projectNo }">
			                        <table>
			                            <tr>
			                                <td colspan="3">
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
                
                <script>
                $(function(){
            		$("#content_1 #fundingList").click(function(){
            			location.href="detail.fd?pno=" + $(this).children(".pno").val();
            		})
            	})
                
                
                </script>
                
                
                
                
                
                <!-- 페이징 -->
                <div id="content_2">
                    <div id="pagingArea">
                        <ul class="pagination">
                            <!-- list가 있을때만 페이지버튼 -->
                        	<c:if test="${ !empty likeList }">
	                        	<c:choose>
	                        		<c:when test="${ pi.currentPage eq 1 }">
	                        			<li class="page-item disabled" ><a class="page-link" href="#">Previous</a></li>
	                        		</c:when>
		                            <c:otherwise>
		                            	<li class="page-item"><a class="page-link" href="like.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                            </c:otherwise>
		                        </c:choose>
		                        
		                        
		                        
		                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                    	<li class="page-item"><a class="page-link" href="like.me?currentPage=${ p }">${ p }</a></li>
			                    </c:forEach>
		                       
		                        <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				                    </c:when>
				                    <c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="like.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
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