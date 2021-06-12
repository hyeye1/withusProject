<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Us, Admin</title>
</head>
<body>
	
    <!-- 6/12 윤경 생성? 수정? -->

    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

    <br><br>

    <div class="container">
        <div class="contentTable" align="center">
            <table border="1px">
                <tr>
                    <th style="width:200px;"><label for="title">카테고리 선택</label></th>
                    <td>
                        <select class="select">
                            <option value="funding">펀딩상품 관련</option>
                            <option value="delivery">배송 관련</option>
                            <option value="exchange">교환/반품 관련</option>
                            <option value="etc">기타 관련</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><label for="title">제목</label></th>
                    <td><input type="text" required></td>
                </tr>
                <tr>
                    <th><label for="title">내용</label></th>
                    <td><textarea style="width:600px;" rows="10" required></textarea></td>
                </tr>
            </table>
        </div>
    </div>

    <br><br>

    <div align="center">
        <button type="button"><a herf="">등록/수정</a></button>
        <button type="button"><a herf="">목록</a></button>
    </div>


</body>
</html>