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

    <jsp:include page="../common/header.jsp"/>

    

	<div class="container">
	<h3><b>공지사항 상세보기</b></h3>
    <hr><br>
	    <table class="table table-bordered" id="noticeDetail">
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
	                        	<a href="${ n.noticeChangename }" download="${ n.noticeOriginname }">${ n.noticeOriginname }</a>
							</c:otherwise>                        
                        </c:choose>
                    </td>
                </tr>
	        <tr>
	            <td colspan="2" style="height:500px;">${ n.noticeContent }</td>
	        </tr>
	    </table>
	    <br>
	    <br><br>
	    
	    <c:if test="${ loginUser.memberStatus eq 'A' }">
		    <div align="right">
		    	<a class="btn btn-success" onclick="postFormSubmit(1)">수정</a> &nbsp;
		    	<a class="btn btn-warning" onclick="postFormSubmit(2)">삭제</a>
	    	</div>
	    </c:if>

		<form id="postForm" action="" method="post">
			<input type="hidden" name="nno" value="${ n.noticeNo }">
			<input type="hidden" name="filePath" value="${ n.noticeChangename }" >
		</form>

		<script>
			function postFormSubmit(num){
				if(num == 1){// 수정 클릭
					$("#postForm").attr("action", "updateForm.no").submit();
				} else { // 삭제 클릭
					$("#postForm").attr("action", "delete.no").submit();
				}
			}
		</script>

		<div class="list" align="center">
			<a class="btn btn-secondary" href="list.no">목록</a>
		</div>
		<br><br>
    </div>

    <!-- 푸터바 포함 -->
    <jsp:include page="../common/footer.jsp"/>
	

</body>
</html>