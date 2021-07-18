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
    <jsp:include page="../../../common/manaHeader.jsp"/>

	<br>
    <!-- 관리자만 보여지는 페이지 -->
    <div class="container">
	    <div class="content">
	        <br><br>
	        <div class="innerOuter">
	            <h3>공지사항 작성하기</h3>
	            <br>
	
	            <form id="enrollForm" method="post" action="manaInsert.no" enctype="multipart/form-data">
	                <table class="table table-bordered" align="center" border="1px">
	                    <tr>
	                        <th><label for="title">제목</label></th>
	                        <td><input type="text" id="noticeTitle" class="form-control" name="noticeTitle" required></td>
	                    </tr>
	                    <tr>
	                        <th><label>첨부파일</label></th>
	                        <td><input type="file" id="cscUpfileM" class="form-control-file border" name="cscUpfileM"></td>
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
	    

</body>
</html>