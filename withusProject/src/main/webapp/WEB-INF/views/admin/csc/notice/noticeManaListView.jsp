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
</head>
<body>

    <jsp:include page="../../../common/manaHeader.jsp"/>

    
	<div class="container">
	<br>
		<h3><b>공지사항</b></h3>
    	<hr><br>
		
		<div class="topBtn" align="right">
			<a class="btn btn-secondary" style="float:right" href="manaEnrollForm.no">등록</a>
		</div>
		<br><br>
	    <!-- 표 N행 6열 -->
		<table id="noticeManaList" class="table table-bordered">
			<thead>
			  <tr align="center" style="height: 10px; background-color: rgb(224, 224, 224); font-size:smaller ;">
	            <th width="70px">글번호</th>
	            <th width="400px">공지사항 제목</th>
	            <th width="150px">날짜</th>
	            <th width="50px">글상태<br>(Y/N)</th>
			  </tr>
			</thead>
			<tbody>
				<c:forEach var="nM" items="${ mlist }">
					<tr align="center">
						<td>${ nM.noticeNo }</td>
						<td><a href="manaDetail.no?nnoM=${ nM.noticeNo }">${ nM.noticeTitle }</a></td>
						<td>${ nM.createDate }</td>
						<td>${ nM.noticeStatus }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>		
		
		<script>
            $(function(){
            	$("#noticeManaList tbody tr").click(function(){
            		location.href="manaDetail.no?nnoM=" + $(this).children(".nnoM").text()
            	})
            })
        </script>
		
		
	    <br><br>
		
	    <!-- 페이징 바 추가 -->
	    <div id="pagingArea">
	    	<ul class="pagination">
	    		
	    		<c:choose>
	    			<c:when test="${ pi.currentPage eq 1 }">
		    			<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
		    		</c:when>
		    		<c:otherwise>
		    			<li class="page-item"><a class="page-link" href="list.no?currentPage=${ pi.currentPage -1 }">이전</a></li>
	    			</c:otherwise>
	    		</c:choose>
	    		
	    		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	    			<li class="page-item"><a class="page-link" href="list.no?currentPage=${ p }">${ p }</a></li>
	    		</c:forEach>
	    	
	    		<c:choose>
	    			<c:when test="${ pi.currentPage eq pi.maxPage }">
	    				<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
	    			</c:when>
	    			<c:otherwise>
	    				<li class="page-item"><a class="page-link" href="list.no?currentPage=${ pi.currentPage+1 }">다음</a></li>
	    			</c:otherwise>
	    		</c:choose>
	    	</ul>
	    
	    </div>
	    
		
    </div>

</body>
</html>