<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    .content{
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 15%;
        background:white;
    }
</style>

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp"/>
	
	<div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form action="insert.me" method="post" id="enrollForm">
                <div class="form-group">
                
                	<label for="memberName">* 이름 :</label>
                    <input type="text" class="form-control" id="memberName" name="memberName" placeholder="Please Enter Name" required><br>
                    
               	    <label for="memberId">* 이메일 :</label>
                    <input type="email" class="form-control" id="memberId" name="memberId" placeholder="Please Enter Email" required><br>
                    
                    <label for="memberPwd">* 비밀번호 :</label>
                    <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="비밀번호 입력" required><br>
                    
                    <input type="password" class="form-control" id="checkPwd" placeholder="비밀번호 확인" required><br>
                    
                </div>
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary">회원가입</button>
                    <button type="reset" class="btn btn-danger"> 초기화</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>

	<br><br><br>
	
	<!-- 푸터바 -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>