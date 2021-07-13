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
	#refundKey{
	    height: 36px; 
	    float: left; 
	    margin-right: 10px; 
	    border: 1px solid #ced4da;
	    border-radius: .25rem;
	}
	.form-control.refund{width: 400px;}
	.refundAllStatus{width: 80%; float: left;}
	.refundRadios {float: left; margin: 0 0 0 20px;}
	input[type=radio] {margin: 0 0 0 12px; }
	.searchBtns{width: 20%; float: right;}
	.searchBtns button{margin: 0 7px;} 
	.btn.btn-withus{background-color: #3498db; color: white;}
	.btn.btn-withus:hover{cursor: pointer; background-color: #2c83be;color: white;}
	
	table *{text-align: center; font-size: 15px;}
	tbody>tr:hover{cursor: pointer;}
	table.table-bordered td, table.table-bordered th {padding: .35rem; vertical-align: inherit;}
	.tableHead{background-color: #eaeaea;}
	.none{margin: 100px 0;}
	.cancle{color: red;}
	
	
	/* pagination */
	.paging_wrap{width:fit-content;margin:auto; margin-top: 100px;}
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
            <label>환불신청 내역</label>
        </div>

        <div class="container">

            <div class="search_box">
                <form action="searchRefund.mana">
                <input type="hidden" name="currentPage" value="1">
                    <div class="searchForm">
                        <select name="refundKey" id="refundKey">
                            <option value="refundAll">전체</option>
                            <option value="member_name">신청인</option>
                            <option value="refund_no">신청번호</option>
                        </select>
                        <input type="text" name="keyword" value="${keyword}" class="form-control refund" placeholder="검색어를 입력하세요">
                    </div>
                    <br>
                    <div class="refundAllStatus">
                        <label for="" style="float: left;"><b>환불상태</b></label> &nbsp;&nbsp;
                        <div class="refundRadios">
                            <input type="radio" name="rfStatus" value="S"> 대기
                            <input type="radio" name="rfStatus" value="Y"> 승인
                            <input type="radio" name="rfStatus" value="N"> 거절
                        </div>
                    </div>
                    <div class="searchBtns" align="right">
                        <button type="reset" id="resetBtn" class="btn btn-secondary btn-sm">초기화</button>
                        <button type="submit" class="btn btn-withus btn-sm">검색</button>
                    </div>
                </form>
            </div>
            
            <!-- 검색 조건이 선택되어 있을 경우 -->
            <c:if test="${ !empty refundKey or !empty rfStatus}">
            
            	<script>
            		$(function(){
            			$("#refundKey option[value=${refundKey}]").attr("selected", true);
            			$(".refundRadios :input[value=${rfStatus}]").attr("checked", true);
            		});
            		
            		/* 초기화 버튼 클릭시 기재된 검색 조건 전부 제거 */
            		$("#resetBtn").click(function(){
            			$("#refundKey option[value=${refundKey}]").removeAttr("selected");
            			$("input[name='keyword']").empty();
            			$(".refundRadios :input[value=${rfStatus}]").removeAttr("checked");
            		});
            	</script>
            </c:if>
            
            <br>


            <table class="table table-bordered" id="refundList">
                <thead class="tableHead">
                <c:choose>
           	 		<c:when test="${ empty rlist }">
       	 				<div class="none"><h4 align="center">검색어와 일치하는 내용이 존재하지 않습니다:(</h4></div>
           	 		</c:when>
           	 	<c:otherwise>
	                    <tr>
	                        <th>신청번호</th>
	                        <th>환불 신청인</th>
	                        <th width="460">펀딩 정보</th>
	                        <th width="180">환불 사유</th>
	                        <th>환불 상태</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:forEach var="r" items="${ rlist }">
		                    <tr>
		                        <td class="rno">${ r.refundNo }</td>
		                        <td>${ r.supporterName }</td>
		                        <td>${ r.projectTitle }<br>${ r.rewardTitle }/${ r.orderOption }</td>
		                        <td>${ r.reReason }</td>
		                        <c:choose>
		                       		<c:when test="${ r.refundStatus eq 'S'}">
		                       			<td>대기</td>
		                       		</c:when>
		                       		<c:when test="${ r.refundStatus eq 'Y' }">
		                       			<td>승인</td>
		                       		</c:when>
		                       		<c:when test="${ r.refundStatus eq 'N' }">
		                       			<td>거절</td>
		                       		</c:when>
		                      	</c:choose>
		                    </tr>
	                    </c:forEach>
	                </tbody>
	        	</c:otherwise>
            </c:choose>           
            </table>
            
            <script>
            $(function(){
            	$("#refundList tbody tr").click(function(){
            		location.href="refundDetail.mana?rno="+$(this).children(".rno").text();
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
		            	<c:choose>
		            		<c:when test="${ empty refundKey and empty keyword and empty rfStatus }">
				            	<li class="page-item"><a class="page-link" href="${ pi.currentPage - 1 }">이전</a></li>
				            </c:when>
				            <c:otherwise>
				            	<li class="page-item"><a class="page-link" href="searchRefund.mana?currentPage=${pi.currentPage - 1}&refundKey=${refundKey}&keyword=${keyword}&rfStatus=${rfStatus}">이전</a></li>
		            		</c:otherwise>
		            	</c:choose>
		            </c:otherwise>
		    	</c:choose>     
			    	   
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:choose>
						<c:when test="${ empty refundKey and empty keyword and empty rfStatus }">
               				<li class="page-item"><a class="page-link" href="refundListView.mana?currentPage=${ p }">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="searchRefund.mana?currentPage=${p}&refundKey=${refundKey}&keyword=${keyword}&rfStatus=${rfStatus}">${ p }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>		            
			            
		        <c:choose> 
		        	<c:when test="${ pi.currentPage eq pi.maxPage }">
		           	 	<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
		           	</c:when>
		           	<c:otherwise>
		           		<c:choose>
		            		<c:when test="${ empty refundKey and empty keyword and empty rfStatus }">
				           		<li class="page-item"><a class="page-link" href="${ pi.currentPage + 1 }">다음</a></li>
				            </c:when>
				            <c:otherwise>
				            	<li class="page-item"><a class="page-link" href="searchRefund.mana?currentPage=${pi.currentPage + 1}&refundKey=${refundKey}&keyword=${keyword}&rfStatus=${rfStatus}">다음</a></li>
		            		</c:otherwise>
		            	</c:choose>
		           	</c:otherwise> 	
	        	</c:choose>
            
            </ul>
        </div>

    </div>


</body>
</html>