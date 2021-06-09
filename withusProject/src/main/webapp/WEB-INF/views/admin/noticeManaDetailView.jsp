<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
    <!-- 6/9 윤경 생성-->
    <!-- 메뉴바 포함 -->
    <jsp:include page=""/>

    <h2>공지사항 상세보기</h2>
    <hr><br>

    <table border="1">
        <tr>
            <th width="200" height="35">제목</th>
            <td width="800">공지사항입니다.</td>
        </tr>
        <tr>
            <th height="35">작성자</th>
            <td>관리자1</td>
        </tr>
        <tr>
            <th height="35">작성일</th>
            <td>2021-06-09</td>
        </tr>
        <tr>
            <td colspan="2" height="800"></td>
        </tr>
    </table>
    <br>
    <button>수정</button> <button>삭제</button>
    <br><br>
    <button>목록</button>
	

</body>
</html>