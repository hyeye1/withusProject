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
    <jsp:include page="../common/header.jsp"/>

	
    <h2>문의하기</h2>
    <hr><br>
    
    <!-- 로그인 시에만 보여지는 페이지  -->
    <c:if test="${ !empty loginUser } "> 
    
		<a id="btn1" class="btn btn-secondary" style="float:right;" href="enrollForm.oto">등록</a>
		<br><br>
	</c:if>
		<!-- 작성글이 없을 시 보여지는 페이지 -->
		<c:if test="${ !empty o.otoTitle }">
			게시글이 없습니다.
			<c:otherwise>
			    <div class="container">            
			        <table class="table">
			          <thead>
			            <tr align="center">
			              <th width="100">글번호</th>
			              <th width="200">펀딩상품정보</th>
			              <th width="500">제목</th>
			              <th width="100">작성자</th>
			              <th width="250">작성일</th>
			            </tr>
			          </thead>
			          <tbody>
			          	<c:forEach  var="o" items="${ list }">
				            <tr align="center">
				              <td>${ o.otoNo }</td>
				              <td><a href="">펀딩상품조회</a></td>
				              <td><a href="detail.oto?ono=${ o.otoNo }">${ o.otoTitle }</a></td>
				              <td>${ o.memberNo }</td>
				              <td>${ o.createDate }</td>
				            </tr>
			            </c:forEach>
			          </tbody>
			        </table>
			    </div>
		    </c:otherwise>
		</c:if>
	        
	        <script>
	        $(function(){
	    		$("#otoList tbody tr").click(function(){
	    			location.href="detail.oto?ono=" + $(this).children(".ono").text()
	    		})
	    	})
	        </script>
	        
	
	
	        <!-- 페이징바 추가할 것 -->
	        <div id="pagingArea" align="center">
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
      
    <!-- 푸터바 포함 -->
    <jsp:include page="../common/footer.jsp"/>



</body>