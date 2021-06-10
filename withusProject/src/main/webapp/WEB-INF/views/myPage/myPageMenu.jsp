<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<style>
        /*div{border: 1px solid red; box-sizing: border-box;}*/
        #left_menu{width: 200px; height: 1000px; margin: left;}

        #left_menu>div{width: 100%;}

        
        /* 왼쪽 메뉴바 */
        #menu_1{height: 15%;}
        #menu_2{height: 85%;}
        
        #menu_1>div{float: left;}
        #menu_1_1{width: 50%; margin-top: 30px;}
        #menu_1_2{width: 50%; margin-top: 60px;}

        /*프로필 부분*/
       

        #left_menu>#menu_1>div>li{
            list-style-type: none
        }


        /*메뉴부분*/
        #navi{
            margin: 0;
            padding: 0;
            height: 100%;
            list-style-type: none;
           
        }
        #navi>li{
            
            text-align: left; 
            padding: 5px ;
        }

        #navi a{
            text-decoration: none;
            font-weight: 900;
            height: 100%;
            display: block;
            line-height: 35px;
            
        }


        /* 큰메뉴 */
        .big{color: rgb(52, 152, 219); font-size: 22px;}
        #navi>li>a:hover+ul{display: block; }

        
        /* 안쪽 메뉴 */
        .small>li>a{color: rgb(2, 2, 2); font-size: 20px; padding: 5px;}
        #navi>li>ul>li>a:hover {color: rgb(178, 185, 223);}
        #navi>li>ul{list-style-type: none; padding: 5px; display: none; }
        #navi>li>ul:hover{display: block;}
        

	</style>


</head>



<body>
     <!-- 왼쪽 메뉴바 -->
     <div id="left_menu">
        
        <!--프로필-->
        <div id="menu_1">
            
            <div id="menu_1_1">
                <img src="city1.PNG" width="80" height="80"  class="rounded-circle" >
            </div>
            
            <div id="menu_1_2">
                
                <li style="font-size: 19px;">사용자</li>
                <li>서포터</li>
                
            </div>
        </div>
        
        <div id="menu_2">
            <ul id="navi">
                <li><a href="" class="big">나의 활동</a>
                    <ul class="small">
                        <li><a href="">펀딩내역</a></li>
                        <li><a href="">좋아요</a></li>
                        <li><a href="">나의 문의</a></li>
                        <li><a href="">팔로잉 목록</a></li>
                    </ul>
                </li>
                <li><a href="" class="big">나의 정보</a>
                    
                </li>
                <li><a href="" class="big">펀딩 스튜디오</a>
                    <ul class="small">
                        <li><a href="">나의펀딩</a></li>
                        <li><a href="">펀딩관리</a></li>
                        <li><a href="">프로젝트안내</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>