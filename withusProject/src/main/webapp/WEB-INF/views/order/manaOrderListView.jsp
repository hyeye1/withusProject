<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin With Us</title>
<style>

    /* searchBox */
     .search_box{
         height: 130px; 
         background-color: #f4f4f4; 
         padding: 20px; 
     }
     #orderKeyword{
         height: 36px; 
         float: left; 
         margin-right: 10px; 
         border: 1px solid #ced4da;
         border-radius: .25rem;
     }
     .form-control.order{width: 400px;}
     .orderAllStatus{width: 80%; float: left;}
     .orderRadios {font-size: 13px; float: left; margin: 4px 15px;}
     .searchBtns{width: 20%; float: right;}
     .searchBtns button{margin: 0 7px;} 
     .btn.btn-withus{background-color: #3498db; color: white;}
     .btn.btn-withus:hover{cursor: pointer; background-color: #2c83be;  color: white;}

     table *{text-align: center; font-size: 15px;}
     tbody>tr:hover{cursor: pointer;}
     table.table-bordered td, table.table-bordered th  {padding: .35rem; vertical-align: inherit;}
     .tableHead{background-color: #eaeaea;}
        
	/* pagination */
	.paging_wrap{width:fit-content;margin:auto; margin-top: 50px;}
	.pagination a {
	    color: black;
	    float: left;
	    padding: 8px 16px;
	    text-decoration: none;
	    transition: background-color .3s;
	}        
</style>
</head>
<body>

	<!-- header -->
    <jsp:include page="../common/manaHeader.jsp"/>

    <div class="content_wrap">
        <div class="title" align="left">
            <label>주문내역 조회</label>
        </div>

        <div class="container">

            <div class="search_box">
                <form action="orderSearch.mana">
                    <div class="searchForm">
                        <select name="orderKeyword" id="orderKeyword">
                            <option value="orderAll">전체</option>
                            <option value="member_name">서포터</option>
                            <option value="order_no">주문번호</option>
                        </select>
                        <input type="text" class="form-control order" name="keyword" value="${keyword}" placeholder="검색어를 입력하세요">
                    </div>
                    <br>
                    <div class="orderAllStatus">
                        <label for="" style="float: left;"><b>펀딩상태</b></label> &nbsp;&nbsp;
                        <div class="orderRadios">
                            <input type="radio" name="orderStatus" value=""> 결제예약
                            <input type="radio" name="orderStatus" value=""> 결제완료
                            <input type="radio" name="orderStatus" value=""> 결제취소
                            <input type="radio" name="orderStatus" value=""> 리워드 준비중
                            <input type="radio" name="orderStatus" value=""> 리워드 배송중
                            <input type="radio" name="orderStatus" value=""> 리워드 배송 완료
                            <input type="radio" name="orderStatus" value=""> 리워드 미발송
                        </div>
                    </div>
                    <div class="searchBtns" align="right">
                        <button type="reset" class="btn btn-secondary btn-sm">초기화</button>
                        <button type="submit" class="btn btn-withus btn-sm">검색</button>
                    </div>
                </form>
            </div>
			<c:if test="${ !empty orderKeyword }">
	        	<script>
	        		$(function(){
	        			$("#orderKeyword option[value=${orderKeyword}]").attr("selected", true);
	        		})
	        	</script>
       		 </c:if>
            <br>

            <table class="table table-bordered" id="orderTable">
                <thead class="tableHead">
                    <tr>
                        <th>주문번호</th>
                        <th>펀딩 서포터명</th>
                        <th width="420">펀딩 정보</th>
                        <th>수량</th>
                        <th>주문 날짜</th>
                        <th>결제 상태</th>
                        <th>배송 상태</th>
                    </tr>
                </thead>
                <tbody>
                 	 <c:forEach var="o" items="${ olist }">
	                    <tr>
	                        <td class="ono">${ o.orderNo }</td>
	                        <td>${ o.supporterName }</td>
	                        <td>
	                        	${ o.projectTitle }<br>
	                        	${ o.rewardTitle }
		                        	<c:if test="${ not empty o.orderOption }">
	                        		  /${ o.orderOption }
		                        	</c:if>
                        	</td>
	                        <td>${ o.orderCount }</td>
	                        <td>${ o.orderDate }</td>
                        	<c:choose>
                        		<c:when test="${ o.orderStatus == 1 }">
                        			<td>결제완료</td>
                        		</c:when>
                        		<c:when test="${ o.orderStatus == 2 }">
                        			<td>취소요청</td>
                        		</c:when>
                        		<c:when test="${ o.orderStatus == 3 }">
                        			<td>취소완료</td>
                        		</c:when>
                        	</c:choose>
                        	<c:choose>
                        		<c:when test="${ o.shippingStatus == 1 }">
                        			<td>배송준비중</td>
                        		</c:when>
                        		<c:when test="${ o.shippingStatus == 2 }">
                        			<td>배송시작</td>
                        		</c:when>
                        		<c:when test="${ o.shippingStatus == 3 }">
                        			<td>배송완료</td>
                        		</c:when>
                        	</c:choose>
                    	</tr>
                   	</c:forEach>
                </tbody>
            </table>
            
           <!-- 주문상세 정보 -->
           <script type="text/javascript">
           $(function(){
        	   $("#orderTable tbody tr").click(function(){
        		   location.href="orderDetail.mana?ono="+$(this).children(".ono").text();
        	   });
           });
           </script>  
                       
        </div>
        
        <br clear="both"><br>

        <!-- 페이징 -->
        <div class="paging_wrap">
            <ul class="pagination">
                <c:choose>
	        		<c:when test="${ pi.currentPage eq 1 }">
		           		<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
		            </c:when>
		            <c:otherwise>
		            	<li class="page-item"><a class="page-link" href="${ pi.currentPage -1 }">이전</a></li>
		            </c:otherwise>
		    	</c:choose>        
		            
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	            	<li class="page-item"><a class="page-link" href="memberListView.mana?currentPage=${p}">${ p }</a></li>
				</c:forEach>		            
		            
		        <c:choose> 
		        	<c:when test="${ pi.currentPage eq pi.maxPage }">
		           	 	<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
		           	</c:when>
		           	<c:otherwise>
		           		<li class="page-item"><a class="page-link" href="${ pi.currentPage+1 }">다음</a></li>
		           	</c:otherwise> 	
	        	</c:choose>
            </ul>
        </div>

    </div>

</body>
</html>