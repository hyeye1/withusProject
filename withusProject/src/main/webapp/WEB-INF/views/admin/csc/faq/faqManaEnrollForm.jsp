<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Us</title>
<style>
	
</style>
</head>
<body>
	
    <!-- 메뉴바 포함 -->
    <jsp:include page="../../../common/manaHeader.jsp"/>

    

    <div class="container">
    
    	<br>
	    <h3><b>FAQ 등록</b></h3>
		<hr><br>

        <form id="faqEnrollForm" action="insert.faq" method="get" enctype="multipart/form-data">
	        <table class="table table-bordered">
	        
	        	<tr>
	            	<th style="width:200px;">카테고리 선택</th>
	                <td>
	                    <select class="form-control" id="faqCat" name="faqCat">
	                        <option value="펀딩상품 관련">펀딩상품 관련</option>
	                        <option value="배송 관련">배송 관련</option>
	                        <option value="교환/반품 관련">교환/반품 관련</option>
	                        <option value="기타 관련">기타 관련</option>
	                    </select>
	                </td>
	            </tr>
	            <tr>
	                <th><label for="title">제목</label></th>
	                <td><input type="text" class="form-control" id="faqTitle" name="faqTitle" required></td>
	            </tr>
	            <tr>
	                <th><label for="content">내용</label></th>
	                <td>
	                	<input type="text" class="form-control" id="faqContent" name="faqContent" style="height:300px" required>
	                </td>
	            </tr>
	         </table>
	         
	         <br><br>
				<div align="center">
					<button type="submit" class="btn btn-primary btn-sm">등록하기</button>
					<button type="reset" class="btn btn-secondary btn-sm">초기화</button>
				</div>
			<br><br>
        </form>
    </div>


</body>
</html>