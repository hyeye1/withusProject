<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>With Us</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	#btn1{ padding:20%; }
</style>
</head>

<body>

    <!-- 메뉴바 포함 -->
    <jsp:include page="../../../common/manaHeader.jsp"/>

    <div class="container">
    	<br>
    	<h3><b>문의하기</b></h3>
    	<hr><br>
    	
		<div class="otoList">           
			<table class="table table-bordered">
				 <thead>
				    <tr align="center">
				      <th id="otoNo" width="10%">글번호</th>
				      <th id="otoCat" width="15%">문의유형</th>
				      <th id="otoTitle" >제목</th>
				      <th id="otoDate" width="15%">작성일</th>
				      <th id="otoStatus" width="10%">글상태</th>
				    </tr>
				 </thead>
				 <tbody>
				    <c:forEach  var="o" items="${ list }">
						<tr align="center">
					    	<td>${ o.otoNo }</td>
					    	<td>${ o.otoCat }</td>
					        <td><a href="detail.oto?ono=${ o.otoNo }">${ o.otoTitle }</a></td>
					        <td>${ o.otoDate }</td>
					        <td>${ o.otoStatus }</td>
					    </tr>
				    </c:forEach>
				</tbody>
			</table>
		</div>
		    
		<script>
			$(function(){
		    	$("#otoList tbody tr").click(function(){
		    		location.href="detail.oto?ono=" + $(this).children(".ono").text()
		    	})
		    })
		</script>
		        
		
		
		<!-- 페이징 처리 -->
		<div id="pagingArea" align="center">
			<ul class="pagination">
			    <c:choose>
			    	<c:when test="${ pi.currentPage eq 1 }">
				    	<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
				    </c:when>
				    <c:otherwise>
				    	<li class="page-item"><a class="page-link" href="otoList.mana?currentPage=${ pi.currentPage -1 }">이전</a></li>
			    	</c:otherwise>
			    	</c:choose>
			    		
			    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			    		<li class="page-item"><a class="page-link" href="otoList.mana?currentPage=${ p }">${ p }</a></li>
			    	</c:forEach>
			    	
			    	<c:choose>
			    		<c:when test="${ pi.currentPage eq pi.maxPage }">
			    			<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
			    		</c:when>
			    		<c:otherwise>
			    			<li class="page-item"><a class="page-link" href="otoList.mana?currentPage=${ pi.currentPage+1 }">다음</a></li>
			    		</c:otherwise>
			    	</c:choose>
			</ul>
			    
		</div>

      </div>
   



</body>