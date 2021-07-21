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
    <jsp:include page="../../../common/manaHeader.jsp"/>


	<div class="container">
	    <div class="content">
	    <br><br>
	        <div class="innerOuter">
	            <h3><b>공지사항 수정하기</b></h3>
	            <br>
	
	            <form id="updateForm" method="post" action="manaUpdate.no" enctype="multipart/form-data">
	                <input type="hidden" id="noticeNoM" name="noticeNoM" value="${ nM.noticeNo }">
	                <table align="center">
	                    <tr>
	                        <th><label for="title">제목</label></th>
	                        <td><input type="text" id="noticeTitle" class="form-control" name="noticeTitle" value="${ nM.noticeTitle }" required></td>
	                    </tr>
	                    <tr>
	                        <th><label>첨부파일</label></th>
	                        <td><input type="file" id="cscReUpfileM" class="form-control-file border" name="cscReUpfileM"></td>
	                        <c:if test="${ !empty nM.noticeOriginname }">
                            		현재 업로드된 파일 : <a href="${ nM.noticeChangename }" download="${ nM.noticeOriginname }">${ nM.noticeOriginname }</a> 
                            	<input type="hidden" name="noticeOriginname" value="${ nM.noticeOriginname }">
                            	<input type="hidden" name="noticeChangename" value="${ nM.noticeChangename }">
                            		
                            </c:if>
                            		
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <textarea class="form-control" required name="noticeContent" id="noticeContent" value="${ nM.noticeContent }" style="height:500px; resize:none;">${ nM.noticeContent }</textarea>
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
	    
	

</body>
</html>