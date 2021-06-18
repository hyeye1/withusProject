<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<style>
     @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    body{
        margin:0;
        padding:0;
    }
    div, p, a {
        box-sizing: border-box;
        font-family: 'Noto Sans KR', sans-serif;
        font-size:14.5px;
        color:rgb(90, 86, 86)
    }
    
    a {
        text-decoration: none;
    }

    #menubar{
        height:90%;
        width:12%; 
        float:left;
        background-color: rgb(240, 244, 245);
        width:160px;
    }
    #menubar li:hover{background-color: rgb(71, 189, 250);}
    #menubar a{display: block;}
    #menubar a:hover{color:white;}
    #menubar>ul{
        list-style-type: none;
        padding: 0;
        text-align: center;
        width:100%;
        margin-top:80px;
        height:100vh;
    }
    .menubar_admin p{
        font-weight: 600;
        margin: 30px;
        font-weight: 900;
    }
    .menubar_admin a{
        margin: 10px;
        color: rgb(71, 189, 250);
        font-weight: 500;
    }
 
    </style>
</head>
<body>


        <div id="menubar">
            <ul id="menubar_member" class="menubar_admin">
                <p>커뮤니티</p>
                <li><a href="">자유</a></li>
                <li><a href="">질문</a></li>
                <li><a href="">공구모집</a></li>
            </ul>
        </div>    

</body>
</html>