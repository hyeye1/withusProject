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
	<!-- header -->
    <jsp:include page="../common/manaHeader.jsp"/>
	
	
	<br>
    <div align="center" style="margin: 200px 0;">	
        <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-512.png" width="300">
        <br><br>
        <h1 style="font-weight:bold">${ errorMsg }</h1>
    </div>
    <br>

	
</body>
</html>