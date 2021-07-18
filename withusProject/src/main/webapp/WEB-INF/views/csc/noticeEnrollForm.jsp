<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #enrollForm>table{width:100%;}
        #enrollForm>table *{ margin:5px;}
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
	                <h3><b>공지사항 작성하기</b></h3>
	                <hr><br>
	
	                <form id="enrollForm" method="post" action="insert.no" enctype="multipart/form-data">
	                    <table class="table table-bordered" align="center" border="1px">
	                        <tr>
	                            <th><label for="title">제목</label></th>
	                            <td><input type="text" id="noticeTitle" class="form-control" name="noticeTitle" required></td>
	                        </tr>
	                    
	                        <tr>
	                            <th><label>첨부파일</label></th>
	                            <td><input type="file" id="cscUpfile" class="form-control-file border" name="cscUpfile"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2">
	                            	<textarea class="form-control" required name="noticeContent" id="noticeContent" style="height:500px; resize:none;"></textarea>
	                            </td>
	                        </tr>
	                    </table>
	                    <br>
	
	                    <div align="center">
	                        <button type="submit" class="btn btn-primary">등록하기</button>
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