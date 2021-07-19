<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../../../common/manaHeader.jsp"/>

    <div class="container">
    	<br>
	    <h3><b>문의하기 상세보기</b></h3>
	    <hr>
    	<br>
        <table class="table table-bordered" border="1">
	            <tr>
	                <th width="200" height="35">제목</th>
	                <td width="800">${ o.otoTitle }</td>
	            </tr>
	            <tr>
	            	<th>문의 유형</th>
	            	<td>${ o.otoCat }</td>
	            <tr>
	                <th height="35">작성일</th>
	                <td>${ o.otoDate }</td>
	            </tr>
	            <tr>
	                <th height="35">첨부파일</th>
	                <td>
	                	<c:choose>
	                    	<c:when test="${ empty o.otoOriginname }">
	                    		첨부파일이 없습니다.
	                    	</c:when>
	                    	<c:otherwise>
	                        	<a href="${ o.otoChangename }" download="${ o.otoOriginname }">${ o.otoOriginname }</a>
							</c:otherwise>                        
                        </c:choose>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" height="500px">${ o.otoContent }</td>
	            </tr>
		</table>
		
		<br>
		
		<div id="listBtn" align="center">
			<a href="otoList.mana" class="btn btn-secondary">목록</a>
		</div>
		<br>
	</div>
        
        
   
    

</body>
</html>