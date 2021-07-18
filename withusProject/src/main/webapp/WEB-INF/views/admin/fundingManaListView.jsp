<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Admin With Us</title>
<style>

	*{box-sizing: border-box;} 
	
	tbody>tr:hover{cursor: pointer;}
	table *{text-align: center; font-size: 15px;}
	table.table-bordered td, table.table-bordered th {padding: .35rem;}
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

	
    <!-- 6/9 윤경 생성, 수정 예정 -->
    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

	<div class="content_wrap">
	    <div class="title" align="left">
	        <label>펀딩 관리</label>
	    </div>

		<input type="hidden" name="currentPage" value="1">

		<div class="container">
		    <div class="selectOption" style="display:inline-flex;">
				<form action="lineupFunding">
					<select name="condition" class="condition">
						<option value="all">모든 펀딩</option>
						<option value="ing">진행중인 펀딩</option> <!-- 펀딩상태 'Y' -->
						<option value="end">종료된 펀딩</option> <!-- 펀딩상태 'N' -->
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="sort" class="sort">
						<option value="best">인기순</option> <!-- 좋아요갯수 많은 순으로 정렬-->
						<option value="deadline">마감임박순</option>
						<option value="newest">최신순</option>
					</select>
				</form>
			</div>
		
		    <table class="table table-bordered" id="fdTable">
		    <c:choose>
           	 	<c:when test="${ empty fdList }">
       	 			<div class="none"><h4 align="center">검색어와 일치하는 내용이 존재하지 않습니다:(</h4></div>
           	 	</c:when>
           	 	<c:otherwise>
				<thead>
				  <tr align="center" style="height: 10px; background-color: rgb(224, 224, 224); font-size:smaller ;">
					<th width="70">글번호</th>
		            <th width="150">카테고리</th>
		            <th width="400">제목</th>
		            <th width="100">파트너명</th>
		            <th width="80">달성률</th>
		            <th width="120">마감일</th>
		            <th width="80">좋아요</th>
		            <th width="60">펀딩상태</th>
		            <th width="60">승인상태</th>
				  </tr>
				</thead>
				<tbody>
					<c:forEach var="fd" items="${ fdList }">
						<tr align="center">
							<td class="pno">${ fd.projectNo }</td>
							<td>${ fd.catName }</td>
							<td><a herf="">${ fd.projectTitle }</a></td>
							<td>${ fd.partnerName }</td>
							<td>아직 못함</td>
							<td>${ fd.projectEndDT }</td>
							<td>못했으</td>
							<td>
								<c:choose>
			                    	<c:when test="${ fd.dday >= 0}">
			                    		진행 중
			                    	</c:when>
			                    	<c:otherwise>
			                    		마감
			                    	</c:otherwise>
		                    	</c:choose>
	                    	</td>
	                    	<td>
								<c:choose>
			                    	<c:when test="${ fd.projectStatus eq 1 }">
			                    		수락요청
			                    	</c:when>
			                    	<c:when test="${ fd.projectStatus eq 2 }">
			                    		블라인드
			                    	</c:when>
			                    	<c:when test="${ fd.projectStatus eq 3 }">
			                    		게시 중
			                    	</c:when>
			                    	<c:when test="${ fd.projectStatus eq 4 }">
			                    		반려
			                    	</c:when>
			                    	<c:when test="${ fd.projectStatus eq 5 }">
			                    		임시저장
			                    	</c:when>
		                    	</c:choose>
	                    	</td>
						</tr>
	                </c:forEach> 
	            </tbody>
        	</c:otherwise>
        </c:choose>
	    </div>
	    
	    <!-- 주문상세 정보 -->
        <script type="text/javascript">
        $(function(){
     	   $("#fdTable tbody tr").click(function(){
     		   location.href="fundingConsiderPre.mana?pno="+$(this).children(".pno").text();
     	   });
        });
        </script> 
	    
	
		<br clear="both"><br>
	
	    <!-- 페이징 -->
	    <c:if test="${ !empty fdList }">
		    <div class="paging_wrap">
		        <ul class="pagination">	 
		                    
		        	<c:choose>
		        		<c:when test="${ pi.currentPage eq 1 }">
			           		<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
			            </c:when>
			            <c:otherwise>
					            	<li class="page-item"><a class="page-link" href="${ pi.currentPage - 1 }">이전</a></li>
			            	<%-- <c:choose>
			            		<c:when test="${ empty partnerJoin and empty memberStatus }">
					            </c:when>
					            <c:otherwise>
					            	<li class="page-item"><a class="page-link" href="searchMember.mana?currentPage=${pi.currentPage - 1}&partnerJoin=">이전</a></li>
			            		</c:otherwise>
			            	</c:choose> --%>
			            </c:otherwise>
			    	</c:choose>     
			    	   
			    	   
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				            	<li class="page-item"><a class="page-link" href="fundingListView.mana?currentPage=${p}">${ p }</a></li>
						<%-- <c:choose>
							<c:when test="${ empty partnerJoin and empty memberStatus }">
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="searchMember.mana?currentPage=${p}&partnerJoin=${partnerJoin}&memberStatus=${memberStatus}&memKey=${memKey}&keyword=${keyword}">${ p }</a></li>
							</c:otherwise>
						</c:choose> --%>
					</c:forEach>		            
			            
			            
			        <c:choose> 
			        	<c:when test="${ pi.currentPage eq pi.maxPage }">
			           	 	<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
			           	</c:when>
			           	<c:otherwise>
					           		<li class="page-item"><a class="page-link" href="${ pi.currentPage + 1 }">다음</a></li>
			           		<%-- <c:choose>
			            		<c:when test="${ empty partnerJoin and empty memberStatus }">
					            </c:when>
					            <c:otherwise>
					            	<li class="page-item"><a class="page-link" href="searchMember.mana?currentPage=${pi.currentPage + 1}&partnerJoin=${partnerJoin}&memberStatus=${memberStatus}&memKey=${memKey}&keyword=${keyword}">다음</a></li>
			            		</c:otherwise>
			            	</c:choose> --%>
			           	</c:otherwise> 	
		        	</c:choose>
		        	
		        </ul>
		    </div>
		</c:if>


	</div>
	

</body>
</html>