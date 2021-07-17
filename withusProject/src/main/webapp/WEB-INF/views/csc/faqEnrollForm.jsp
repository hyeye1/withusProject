<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Us</title>
<style>
	#enrollForm input, #enrollForm textarea{
		width:100%;
		box-sizing: border-box;
		border: 1px solid rgb(220, 214, 214);
	}
</style>
</head>
<body>
	
    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/header.jsp"/>

    <br><br>

    <div class="container">
        <form id="enrollForm" action="insert.faq" method="post" enctype="multipart/form-data">
            <div align="center">
	            <table class="table table-bordered">
	                <tr>
	                    <th style="width:200px;">카테고리 선택</th>
	                    <td>
	                        <select class="select" required>
	                            <option id="funding">펀딩상품 관련</option>
	                            <option id="delivery">배송 관련</option>
	                            <option id="exchange">교환/반품 관련</option>
	                            <option id="etc">기타 관련</option>
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <th><label for="title">제목</label></th>
	                    <td><input type="text" class="form-control" id="faqTitle" name="faqTitle" required>${ f.faqTitle }</td>
	                </tr>
	                <tr>
	                    <th><label for="title">내용</label></th>
	                    <td><textarea style="height:300px" class="form-control" id="faqContent" name="faqContent" required>${ f.faqContent }</textarea></td>
	                </tr>
	            </table>
            </div>
        </form>
    </div>

    <br><br>
		<div align="center">
			<button type="submit" class="btn btn-primary btn-sm">등록하기</button>
			<button type="reset" class="btn btn-secondary btn-sm">초기화</button>
		</div>
	<br><br>


    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp"/>


</body>
</html>