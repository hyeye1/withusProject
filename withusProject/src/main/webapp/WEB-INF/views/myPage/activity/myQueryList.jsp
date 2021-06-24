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
        #content{width: 100%; margin-left:150px;}

        
        /* query content */
        #query_1{height: 60%; margin-top: 50px; width: 85%;}
        #query_2{height: 30%; width: 80%;}
        
        
        
        /*큰제목*/
        #mainTitle{font-size: 23px; font-weight: bolder;}

        
        /* 문의내역 테이블 */
        #replyCat{width: 12%;}
        #replyTitle{width: 60%;}
        #replyDate{width: 10%}
        #replyStatus{width: 10%}
        
        


        /* 페이징 */
        #pagingArea{width:fit-content; margin:auto;}


    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 나의 문의내역  -->
        <div id="mypage">
            <div id="content">
                <p id="mainTitle">나의 문의</p>
                <div id="underLine"></div>
                
                
                <!-- 나의 문의 목록-->
                
                <div id="query_1">
                	<c:choose>
                		<c:when test="${ empty list }">
                			1:1 문의 내역이 없습니다
                		</c:when>
                		<c:otherwise>
                			<table class="table table-hover">
		                        <thead class="thead-light">
		                          <tr>
                                    <th id="replyCat">분류</th>
		                            <th id="replyTitle">문의 제목</th>
		                            <th id="replyDate">문의일</th>
		                            <th id="replyStatus">상태</th>
		                          </tr>
		                        </receiverthead>
                				<c:forEach var="list" items="${ list }">
                				<tbody>
		                          <tr>
		                            <td id="otoNo" style="display:none;">${ list.otoNo }</td>
		                            <td>${ list.otoCat }</td>
		                            <td><label>${ list.otoTitle }</label></td>
		                            <td>${ list.otoDate }</td>
		                            <td>
		                            	<c:choose>
		                            		<c:when test="${list.otoReReply eq 'N'}">
		                            			처리중
		                            		</c:when>
		                            		<c:otherwise>
		                            			답변완료
		                            		</c:otherwise>
		                            	</c:choose>
		                            
		                            
		                            </td>
		                          </tr>
		                        </tbody>
                				</c:forEach>
                			</table>
                		</c:otherwise>
                	</c:choose>
                </div>
                
                <!-- 문의내역 상세보기페이지로 -->
                <script>
	            	$(function(){
	            		$(".table>tbody td label").click(function(){
	            			location.href="myQueryDetail.me?otoNo=" + $(this).parents().siblings("#otoNo").text();
	            		})
	            	})
	            </script>
                
                
                <!-- 페이징 -->
                <div id="query_2">
                    <div id="pagingArea">
                        <ul class="pagination">
                            <!-- list가 있을때만 페이지버튼 -->
                        	<c:if test="${ !empty list }">
	                        	<c:choose>
	                        		<c:when test="${ pi.currentPage eq 1 }">
	                        			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                        		</c:when>
		                            <c:otherwise>
		                            	<li class="page-item"><a class="page-link" href="myQuery.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                            </c:otherwise>
		                        </c:choose>
		                        
		                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                    	<li class="page-item"><a class="page-link" href="myQuery.me?currentPage=${ p }">${ p }</a></li>
			                    </c:forEach>
		                       
		                        <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				                    </c:when>
				                    <c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="followlist.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
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