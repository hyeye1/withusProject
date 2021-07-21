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
         height: 158px; 
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
     .oStatus, .dStatus {float: left; margin: 0 26px 0 0;}
     .searchBtns{width: 20%; float: right; margin: 30px 0 0 0;}
     .searchBtns button{margin: 0 7px;} 
     .btn.btn-withus{background-color: #3498db; color: white;}
     .btn.btn-withus:hover{cursor: pointer; background-color: #2c83be;  color: white;}
     input[type=radio]{ margin: 0 0 0 12px;}

	/* table */
    .none{margin: 100px 0;}
    
    table *{text-align: center; font-size: 15px;}
    tbody>tr:hover{cursor: pointer;}
    table.table-bordered td, table.table-bordered th  {padding: .35rem; vertical-align: inherit;}
    .tableHead{background-color: #eaeaea;}
    .none{margin: 100px 0;}
     
        
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
                <input type="hidden" name="currentPage" value="1">
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
                        <div class="oStatus">
                        	<label for="" style="float: left;"><b>결제 상태</b></label> &nbsp;&nbsp;
                            <input type="radio" name="odStatus" value="1"> 결제완료
                            <input type="radio" name="odStatus" value="2"> 취소요청
                            <input type="radio" name="odStatus" value="3"> 취소완료
                        </div>
                        <div class="dStatus">
                        	<label for="" style="float: left;"><b>배송 상태</b></label> &nbsp;&nbsp;
                            <input type="radio" name="shStatus" value="1"> 배송 준비중
                            <input type="radio" name="shStatus" value="2"> 배송 중
                            <input type="radio" name="shStatus" value="3"> 배송 완료
                        </div>
                    </div>
                    <div class="searchBtns" align="right">
                        <button type="reset" id="resetBtn" class="btn btn-secondary btn-sm">초기화</button>
                        <button type="submit" class="btn btn-withus btn-sm">검색</button>
                    </div>
                </form>
            </div>
            <!-- 검색 조건이 선택되어 있을 경우 -->
			<c:if test="${ !empty orderKeyword or !empty odStatus or !empty shStatus}">
	        	<script>
	        		$(function(){
	        			/* 선택된 값에 체크하기 */
	        			$("#orderKeyword option[value=${orderKeyword}]").attr("selected", true);
	        			$(".oStatus :input[value=${odStatus}]").attr("checked", true);
	        			$(".dStatus :input[value=${shStatus}]").attr("checked", true);

	        		});
	        		
	        		/* 초기화 버튼 클릭시 기재된 검색 조건 전부제거 */
	        		$("#resetBtn").click(function(){
	        			$("#orderKeyword option[value=${orderKeyword}").removeAttr("selected");	// 옵션 기본값으로 초기화
	        			$('input[name="keyword"]').empty();								// 키워드 박스 초기화
	        			$("input:radio").removeAttr("checked");				// 라디오버튼 해제
	        		});
	        		
	        	</script>
       		 </c:if>
       		 <script>
       		
       		 </script>
       		  
             
            <br>

            <table class="table table-bordered" id="orderTable">
            <c:choose>
           	 	<c:when test="${ empty olist }">
       	 			<div class="none"><h4 align="center">검색어와 일치하는 내용이 존재하지 않습니다:(</h4></div>
           	 	</c:when>
           	 	<c:otherwise>
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
	                        			<td style="color:red;">취소완료</td>
	                        		</c:when>
	                        	</c:choose>
	                        	<c:choose>
	                        		<c:when test="${ o.shippingStatus == 1 }">
	                        			<td>배송준비중</td>
	                        		</c:when>
	                        		<c:when test="${ o.shippingStatus == 2 }">
	                        			<td>배송 중</td>
	                        		</c:when>
	                        		<c:when test="${ o.shippingStatus == 3 }">
	                        			<td>배송완료</td>
	                        		</c:when>
	                        	</c:choose>
	                    	</tr>
	                   	</c:forEach>
	                </tbody>
                </c:otherwise>
            </c:choose>    
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
        <c:if test="${ !empty olist }">
	        <div class="paging_wrap">
	            <ul class="pagination">
	            
	                <c:choose>
		        		<c:when test="${ pi.currentPage eq 1 }">
			           		<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
			            </c:when>
			            <c:otherwise>
			            	<c:choose>
			            		<c:when test="${ empty orderKeyword and empty keyword and empty odStatus and empty shStatus }">
					            	<li class="page-item"><a class="page-link" href="${ pi.currentPage -1 }">이전</a></li>
					            </c:when>
					            <c:otherwise>
					            	<li class="page-item"><a class="page-link" href="orderSearch.mana?currentPage=${pi.currentPage - 1}&orderKeyword=${orderKeyword}&keyword=${keyword}&odStatus=${odStatus}&shStatus=${shStatus}">이전</a></li>
			           			</c:otherwise>
			           		</c:choose>
			            	
			            </c:otherwise>
			    	</c:choose>        
			            
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:choose>
							<c:when test="${ empty orderKeyword and empty keyword and empty odStatus and empty shStatus }">
		            			<li class="page-item"><a class="page-link" href="orderListView.mana?currentPage=${p}">${ p }</a></li>
	            			</c:when>
	            			<c:otherwise>
	            				<li class="page-item"><a class="page-link" href="orderSearch.mana?currentPage=${p}&orderKeyword=${orderKeyword}&keyword=${keyword}&odStatus=${odStatus}&shStatus=${shStatus}">${ p }</a></li>
	            			</c:otherwise>
            			</c:choose>
	            			
					</c:forEach>		            
			            
			            
			        <c:choose> 
			        	<c:when test="${ pi.currentPage eq pi.maxPage }">
			           	 	<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
			           	</c:when>
			           	<c:otherwise>
		           			<c:choose>
			            		<c:when test="${ empty orderKeyword and empty keyword and empty odStatus and empty shStatus }">
					           		<li class="page-item"><a class="page-link" href="${ pi.currentPage + 1 }">다음</a></li>
					            </c:when>
					            <c:otherwise>
					            	<li class="page-item"><a class="page-link" href="orderSearch.mana?currentPage=${pi.currentPage + 1}&orderKeyword=${orderKeyword}&keyword=${keyword}&odStatus=${odStatus}&shStatus=${shStatus}">다음</a></li>
			           			</c:otherwise>
			           		</c:choose>	
		           		</c:otherwise>
		        	</c:choose>
		        	
	            </ul>
	        </div>
        </c:if>

    </div>

</body>
</html>