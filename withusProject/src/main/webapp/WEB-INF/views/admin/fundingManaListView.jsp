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
  <!-- Load icon library(검색) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
<title>Admin With Us</title>
<style>

	*{box-sizing: border-box;} 
	
	/* search 
	select[name=condition], select[name=sort]{
		height: 36px; 
		border-color: lightgray; 
		outline: none;
		margin: auto;
	}
	.input-group.search { position: relative; top: -50%; right: -279%;}
	.btn.searchBtn{background-color: #3498db;}
	.fa.fa-search{color: white;}
	*/
	.search_area {height: 60px;} 
	.search_area select{height: 36px; border-color: lightgray; outline: none;}
	
	.searchKey_1{width: 14%; position: relative; float: left;}
	.searchKey_2{width: 20%; float: left;}
	
	.input-group.search {width: 45%; float: right}
	.btn.searchBtn{background-color: #3498db;}
	.fa.fa-search{color: white;}
	
	
	tbody>tr:hover{cursor: pointer;}
	table *{text-align: center; font-size: 15px;}
	table.table-bordered td, table.table-bordered th {padding: .35rem;}
	.tableHead{background-color: #eaeaea;}
	.none{margin: 100px 0;}
	#fdTable td {vertical-align: middle;}
	
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
				
			<div class="search_area">
				<form action="searchFunding.mana" name="">
	        	<input type="hidden" name="currentPage" value="1">
	             <div class="searchKey_1">
	                 <select name="condition" class="condition">
						<option value="all">모든 펀딩</option>
						<option value="ing">진행중인 펀딩</option> <!-- 펀딩상태 'Y' -->
						<option value="end">종료된 펀딩</option> <!-- 펀딩상태 'N' -->
					</select>
	             </div>
	             <div class="searchKey_2">
	                <select name="sort" class="sort">
						<option value="newest">최신순</option>
						<option value="best">인기순</option> <!-- 좋아요갯수 많은 순으로 정렬-->
						<option value="deadline">마감임박순</option>
					</select>
	            </div>
	
                <div class="input-group search">
                    <input type="text" name="keyword" value="${ keyword }" class="form-control" placeholder="검색어를 입력하세요">
                    <div class="input-group-append">
                        <button class="btn searchBtn" type="submit"><i class="fa fa-search"></i></button>
                    </div>
                </div>
				</form>
	        </div>
		
			 <c:if test="${ !empty condition or !empty sort }">
	        	<script>
	        	$(function(){
	        		$(".condition option[value=${condition}]").attr("selected", true);
	        		$(".sort option[value=${sort}]").attr("selected", true);
	        		
	        	});
	        	</script>
	        </c:if>
                
			
		
		    <table class="table table-bordered" id="fdTable">
		    <c:choose>
           	 	<c:when test="${ empty fdList }">
       	 			<div class="none"><h4 align="center">검색어와 일치하는 내용이 존재하지 않습니다:(</h4></div>
           	 	</c:when>
           	 	<c:otherwise>
				<thead>
				  <tr align="center" style="height: 10px; background-color: rgb(224, 224, 224); font-size:smaller ;">
					<th width="70">글번호</th>
		            <th width="130">카테고리</th>
		            <th width="350">제목</th>
		            <th width="100">파트너명</th>
		            <th width="80">달성률</th>
		            <th width="120">마감일</th>
		            <th width="80">좋아요</th>
		            <th width="90">펀딩상태</th>
		            <th width="90">승인상태</th>
				  </tr>
				</thead>
				<tbody>
					<c:forEach var="fd" items="${ fdList }">
						<tr align="center">
							<td class="pno">${ fd.projectNo }</td>
							<td>${ fd.catName }</td>
							<td>${ fd.projectTitle }</td>
							<td>${ fd.partnerName }</td>
							<td>${ fd.percentage } %</td>
							<td>${ fd.projectEndDT }</td>
							<td>${ fd.likeCount }</td>
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
        </table>
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
			            	 <c:choose>
			            		<c:when test="${ empty condition and empty sort }">
					            	<li class="page-item"><a class="page-link" href="${ pi.currentPage - 1 }">이전</a></li>
					            </c:when>
					            <c:otherwise>
					            	<li class="page-item"><a class="page-link" href="searchFunding.mana?currentPage=${pi.currentPage - 1}&condition=${condition}&sort=${sort}&keyword=${keyword}">이전</a></li>
			            		</c:otherwise>
			            	</c:choose> 
			            </c:otherwise>
			    	</c:choose>     
			    	   
			    	   
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						 <c:choose>
							<c:when test="${ empty condition and empty sort }">
				            	<li class="page-item"><a class="page-link" href="fundingListView.mana?currentPage=${p}">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="searchFunding.mana?currentPage=${p}&condition=${condition}&sort=${sort}&keyword=${keyword}">${ p }</a></li>
							</c:otherwise>
						</c:choose> 
					</c:forEach>		            
			            
			            
			        <c:choose> 
			        	<c:when test="${ pi.currentPage eq pi.maxPage }">
			           	 	<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
			           	</c:when>
			           	<c:otherwise>
			           		 <c:choose>
			            		<c:when test="${ empty condition and empty sort }">
					           		<li class="page-item"><a class="page-link" href="${ pi.currentPage + 1 }">다음</a></li>
					            </c:when>
					            <c:otherwise>
					            	<li class="page-item"><a class="page-link" href="searchFunding.mana?currentPage=${pi.currentPage + 1}&condition=${condition}&sort=${sort}&keyword=${keyword}">다음</a></li>
			            		</c:otherwise>
			            	</c:choose> 
			           	</c:otherwise> 	
		        	</c:choose>
		        	
		        </ul>
		    </div>
		</c:if>

	</div>
	</div>

</body>
</html>