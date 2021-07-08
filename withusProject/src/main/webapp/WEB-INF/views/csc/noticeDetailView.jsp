<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Us</title>
<style>
	.noticeDetail{
		border:1px solid black;
	}
</style>
</head>
<body>

	<!-- 6/12 윤경 생성-->

    <!-- 해더바 포함 -->
    <jsp:include page="../common/header.jsp"/>

    <h2>공지사항 상세보기</h2>
    <hr><br>

	<div class="container">
	    <table class="noticeDetail">
	        <tr>
	            <th width="200" height="35">제목</th>
	            <td width="800" style="padding-left: 10px;">${ n.noticeTitle }</td>
	        </tr>
	        <tr>
	            <th height="35">작성일</th>
	            <td style="padding-left: 10px;">${ n.createDate }</td>
	        </tr>
	        <tr>
            	<th>첨부파일</th>
                    <td colspan="2">
                    	
                    	<c:choose>
	                    	<c:when test="${ empty n.noticeOriginname }">
	                    		첨부파일이 없습니다.
	                    	</c:when>
	                    	<c:otherwise>
	                        	<a href="${ n.noticeOriginname }" download="${ n.noticeOriginname }">${ n.noticeOriginname }</a>
							</c:otherwise>                        
                        </c:choose>
                    </td>
                </tr>
	        <tr>
	            <td colspan="2" style="width:500px;">${ n.noticeContent }</td>
	        </tr>
	    </table>
	    <br>
	    <br><br>
	    
	    <c:if test="${ loginUser.memberStatus eq 'A' }">
		    <div align="right">
		    	<a class="btn btn-success" href="updateForm.no">수정</a> &nbsp;
		    	<a class="btn btn-warning" href="delete.no">삭제</a>
	    	</div>
	    </c:if>

		<div class="list" align="center">
			<button><a class="btn btn-secondary" href="list.no">목록</a></button>
		</div>
    </div>

    <!-- 푸터바 포함 -->
    <jsp:include page="../common/footer.jsp"/>
	

</body>
</html>