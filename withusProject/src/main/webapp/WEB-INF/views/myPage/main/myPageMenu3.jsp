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
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
		
        /*div{border: 1px solid red; box-sizing: border-box;}*/
        #left_menu{width: 220px; height: 1200px; margin-top: 50px; margin: auto; }

        #left_menu>div{width: 100%;}

        
        /* 왼쪽 메뉴바 */
        #menu_1{height: 15%;}
        #menu_2{height: 85%;}
        
        #menu_1>div{float: left;}
        #menu_1_1{width: 50%; margin-top: 30px;}
       

        /*프로필 부분*/
        #user_name{font-size: 19px; margin-top: 40px; margin-bottom: 0; margin-left: 10px;}
        #member_grade{margin-top: 0px; margin-left: 10px;}


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

	<!-- 알러트 -->
	<c:if test="${ !empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>


     <!-- 왼쪽 메뉴바 -->
     <div id="left_menu">
        
        <!--프로필-->
        <div id="menu_1">
            
                <table>
                <tr>
                    <td rowspan="2">
                    
                     <c:choose>
		            	<c:when test="${ empty loginUser.memberProfile }">    
				            <div id="menu_1_1">
				            	<img src="resources/member_profile/profile_basic.jpg" width="80" height="80"  class="rounded-circle" >
				           	</div>
			           	</c:when>
			           	<c:otherwise>
			           		<div id="menu_1_1">
				            	<img src="${ loginUser.memberProfile }" width="80" height="80"  class="rounded-circle" >
				           	</div>
			           	</c:otherwise> 
		            </c:choose>
                    </td>
                    
                    <td><label id="user_name">${ loginUser.memberName } 님</label></td>
                </tr>
                <tr>
                    <td>
                    
                     <!-- 서포터/파트너 -->
		                <c:choose>
		                	<c:when test="${ loginUser.partnerJoin eq 'Y' }">
		                		<label id="member_grade">파트너</label>
		                	</c:when>
		                	<c:otherwise>
		                		<label id="member_grade">서포터</label>
		                	</c:otherwise>
		               	</c:choose>
                    
                    </td>
                </tr>
            </table>
                
                
                
                
            
        </div>
        
        <div id="menu_2">
            <ul id="navi">
            	<li><a href="myInfo.me" class="big">나의 정보</a></li>
                <li><a href="myPage.me" class="big">나의 활동</a>
                    <ul class="small">
                        <li><a href="myFunding.me">펀딩내역</a></li>
                        <li><a href="like.me">좋아요</a></li>
                        <li><a href="followlist.me">팔로잉 목록</a></li>
                        <li><a href="myQuery.me">나의 문의</a></li>
                        <li><a href="">내가 쓴 글</a></li>
                    </ul>
                </li>
                <li><a href="fundingMain.me" class="big">펀딩 스튜디오</a>
                    <ul class="small">
                        <li><a href="partnerFunding.me">나의펀딩</a></li>
                        <li><a href="">펀딩관리</a></li>
                        <li><a href="">프로젝트안내</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>