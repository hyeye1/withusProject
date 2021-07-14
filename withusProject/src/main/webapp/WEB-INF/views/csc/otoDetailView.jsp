<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!-- 6/9 윤경 생성-->
    <!-- 메뉴바 포함 -->
	<jsp:include page="../common/header.jsp"/>

    <h2>문의하기 상세보기</h2>
    <hr><br>

    <div class="container">
    
    	<br>
    	
    	<!-- 로그인 했을 시에만 보여지는 페이지 -->
    	
    		
    	
        <table border="1">
        	<c:forEach var="o" items="${ list }">
	            <tr>
	                <th width="200" height="35">제목</th>
	                <td width="800">${ o.otoTitle }</td>
	            </tr>
	            <tr>
	                <th height="35">작성자</th>
	                <td>${ o.memberNo }</td>
	            </tr>
	            <tr>
	                <th height="35">작성일</th>
	                <td>${ o.createDate }</td>
	            </tr>
	            <tr>
	                <th height="35">첨부파일</th>
	                <td><a href="" download="">${ }</a></td>
	            </tr>
	            <tr>
	                <td colspan="2" height="700"></td>
	            </tr>
            </c:forEach>

            <!-- 답변(댓글) 기능-->
            <tr>
               <td colspan="2" height="200"></td> 
            </tr>
        </table>
        <br>
        
        <div class="controlBtn">
        	<button>등록</button> <button>삭제</button>
        </div>
        <br><br>
        <button>목록</button>
    </div>
    
    
    
    <!-- 푸터바 포함 -->
    <jsp:include page="../common/footer.jsp"/>
    
    

</body>
</html>