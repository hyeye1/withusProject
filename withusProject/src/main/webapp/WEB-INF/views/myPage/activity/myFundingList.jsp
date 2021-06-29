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
            width: 80%;
            
        }

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%; margin-left:110px;}

        /*큰제목*/
        #mainTitle{font-size: 23px; font-weight: bolder;}


        
        /* fundingList content */
        .fundingList #content_1{height: 80%; margin-top: 50px; width: 80%;}
        .fundingList #content_2{height: 10%; width: 80%;}
        
        
         /* 주문내역 테이블 */
        .fundingList #orderNo{width: 12%;}
        .fundingList #product{width: 55%;}
        .fundingList #status{width: 15%; }
        .fundingList #orderDate{width: 20%; }
       
		th{text-align: center;}       

        /* 페이징 */
        #pagingArea{width:fit-content; margin:auto;}


    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 나의 펀딩 내역  -->
        <div id="mypage">
            <div id="content" class="fundingList">
                <p id="mainTitle">나의 펀딩 내역</p>
                <div id="underLine"></div>
                
                
                <!-- 나의 펀딩 목록-->
                
                <div id="content_1">
                	<c:choose>
	                	<c:when test="${ empty list }">
	                		펀딩 내역이 없습니다
	                	</c:when>
	                	<c:otherwise>
		                	<table class="table table-hover">
		                        <thead class="thead-light">
		                          <tr>
		                            <th id="orderNo"></th>
		                            <th id="product">펀딩 상품</th>
		                            <th id="status">상태</th>
		                            <th id="orderDate">구매일</th>
		                          </tr>
		                        </thead>
		                   	  <c:forEach var="list" items="${ list }">
		                   	  	<tbody>
		                          <tr>
		                            <td style="text-align: center;" id="orderNo"><img src="${ list.projectThum }" width="80" height="60"></td>
		                            <td><label>${ list.projectTitle }</label>
		                            	<input type="hidden" value="${ list.orderNo }" id="orderNo">
		                            </td>
		                            <td style="text-align: center;">
		                            	<c:choose>
			                            	<c:when test="${list.orderStatus eq '1'}">
			                            		결제완료
			                            	</c:when>
			                            	<c:when test="${list.orderStatus eq '2'}">
			                            		취소요청
			                            	</c:when>
			                            	<c:otherwise>
			                            		취소완료
			                            	</c:otherwise>
			                            </c:choose>
		                            
		                            </td>
		                            <td style="text-align: center;">${ list.orderDate }</td>
		                          </tr>
		                        </tbody>
		                      </c:forEach>
		                     </table>       
	                     </c:otherwise>
                    	</c:choose>
                	</div>
                	
                
                	
                <!-- 펀딩내역 상세보기페이지로 -->
                <script>
	            	$(function(){
	            		$(".table>tbody td label").click(function(){
	            			location.href="myFundingDetail.me?orderNo=" + $(this).siblings("#orderNo").val();
	            		})
	            	})
	            </script>
                
                
                <!-- 페이징 -->
                <div id="content_2">
                    <div id="pagingArea">
                        <ul class="pagination">
                           <!-- list가 있을때만 페이지버튼 -->
                        	<c:if test="${ !empty list }">
	                        	<c:choose>
	                        		<c:when test="${ pi.currentPage eq 1 }">
	                        			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                        		</c:when>
		                            <c:otherwise>
		                            	<li class="page-item"><a class="page-link" href="myFunding.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                            </c:otherwise>
		                        </c:choose>
		                        
		                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                    	<li class="page-item"><a class="page-link" href="myFunding.me?currentPage=${ p }">${ p }</a></li>
			                    </c:forEach>
		                       
		                        <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				                    </c:when>
				                    <c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="myFunding.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
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