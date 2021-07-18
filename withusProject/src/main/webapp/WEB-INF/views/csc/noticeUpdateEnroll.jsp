<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #updatelForm>table{width:100%;}
        #updateForm>table *{ margin:5px;}
</style>
</head>
<body>

    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/header.jsp"/>


    <!-- 관리자만 보여지는 페이지 -->
    <c:if test="${ loginUser.memberStatus eq 'A' }">
	    <div class="container">
	        <div class="content">
	            <br><br>
	            <div class="innerOuter">
	                <h2>게시글 수정하기</h2>
	                <br>
	
	                <form id="updateForm" method="post" action="update.no" enctype="multipart/form-data">
	                	<input type="hidden" id="noticeNo" name="noticeNo" value="${ n.noticeNo }">
	                    <table class="table table-bordered" align="center">
	                        <tr>
	                            <th><label for="title">제목</label></th>
	                            <td><input type="text" id="noticeTitle" class="form-control" name="noticeTitle" value="${ n.noticeTitle }" required></td>
	                        </tr>
	                    
	                        <tr>
	                            <th><label>첨부파일</label></th>
	                            <td><input type="file" id="cscReUpfile" class="form-control-file border" name="cscReUpfile"></td>
	                            <c:if test="${ !empty n.noticeOriginname }">
                            		현재 업로드된 파일 : <a href="${ n.noticeChangename }" download="${ n.noticeOriginname }">${ n.noticeOriginname }</a> 
                            		<input type="hidden" name="noticeOriginname" value="${ n.noticeOriginname }">
                            		<input type="hidden" name="noticeChangename" value="${ n.noticeChangename }">
                            		
                            	</c:if>
                            		
	                        </tr>
	                        <tr>
	                            <td colspan="2">
	                            	<textarea class="form-control" required name="noticeContent" id="noticeContent" value="${ n.noticeContent }" style="height:500px; resize:none;"></textarea>
	                            </td>
	                        </tr>
	                    </table>
	                    <br>
	
	                    <div align="center">
	                        <button type="submit" class="btn btn-primary">수정하기</button>
	                        <button type="reset" class="btn btn-danger">취소하기</button>
	                    </div>
	                </form>
	            </div>
	            <br><br>
	        </div>
	    </div>
	    
	    <!-- 푸터바 포함 -->
    	<jsp:include page="../common/footer.jsp"/>
	    
	</c:if>
	
	

</body>
</html>