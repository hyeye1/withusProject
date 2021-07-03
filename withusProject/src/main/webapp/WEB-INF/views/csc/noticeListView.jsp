<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>With Us</title>
</head>
<body>

	<!-- 6/12 윤경 생성-->
	<!-- 6/25 윤경 수정 : 해더,푸터바 포함, js 작성 -->

    <!-- 해더바 포함 -->
    <jsp:include page="../common/header.jsp"/>

    <h2>공지사항</h2>
    <hr><br>

	<div class="container">

		<br>
	    <!-- 표 N행 6열 -->
		<table class="table table-bordered">
			<thead>
			  <tr align="center" style="height: 10px; background-color: rgb(224, 224, 224); font-size:smaller ;">
	            <th width="60">글번호</th>
	            <th width="700">공지사항 제목</th>
	            <th width="100">날짜</th>
	            <th width="60">조회수</th>
			  </tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${ list }">
					<tr align="center">
						<td>${ n.noticeNo }</td>
						<td><a href="">${ n.noticeTitle }</a></td>
						<td>${ n.createDate }</td>
						<td>${ n.count }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	    <br>

	    <!-- 페이징 바 추가예정 -->
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

    <br><br>

    <!-- 푸터바 포함 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>