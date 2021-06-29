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
  
  	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding&display=swap');
  	.ff{font-family: 'Nanum Gothic Coding', monospace;}
  
    #left_menu{width: 200px; height: 1300px; margin: left;}

    #left_menu>div{width: 100%;}

        
    /* 왼쪽 메뉴바 */
    #menu_1{height: 15%;}
    #menu_2{height: 85%;}
        
    #menu_1>div{float: left;}
    #menu_1_1{width: 50%; margin-top: 30px;}
    #menu_1_2{width: 50%; margin-top: 60px;}

    /*프로필 부분*/
    #user_name{font-size: 19px; margin-top: 40px; margin-bottom: 0; margin-left: 10px;}
    #member_grade{margin-top: 0px; margin-left: 10px;}    

    a{text-decoration: none !important; color: black; } 


      *{
    box-sizing: border-box;
     
    }
  
   
    
    .main_menu{
      position: relative;
      padding: 17px 0;
      cursor: pointer;
      font-size: 22px;
      font-weight: 900;
      color: black;
      margin-left: 20px;
      
    
    }

    .main_menu a{text-decoration: none !important; color: black;}
    .main_menu>span>a:hover{color: rgba(52, 152, 219, 0.568);}
    .main_menu>span:hover{color: rgba(52, 152, 219, 0.568);}
    
    .main_menu.on>span{
      font-weight: bold;
      color: rgb(52, 152, 219);
    }
    
    .sub_menu{
      
      display: none;
      overflow: hidden;
      font-size: 20px;
      background-color: #f9fcfc;
      width: 85%;
      padding: 17px 0;
      text-decoration: none;
    
    }

    .sub_menu a{
      text-decoration: none;
      font-weight: 600;
      height: 100%;
      display: block;
      padding: 8px;
      margin-left: -20px;
      color: black;
      
            
     }


    .sub_menu>ul>li{
      list-style-type: none;
      text-align: left;
      line-height: 35px;
      text-decoration: none;}

    .sub_menu>ul>li>a:hover {color: rgb(178, 185, 223);}
    
    



     


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
	<div id="left_menu" class="ff">
	        
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
	    	<div class="main_menu">
	        	<span><a href="myInfo.me" class="big">나의정보</a></span>
	      	</div>
	      
		      <div class="main_menu">
		        <span>나의활동</span>
		      </div>
		      
		      <div class="sub_menu">
		        <ul>
		            <li><a href="myFunding.me">펀딩내역</a></li>
		            <li><a href="like.me">좋아요</a></li>
		            <li><a href="followlist.me">팔로잉 목록</a></li>
		            <li><a href="myQuery.me">나의 문의</a></li>
		             <li><a href="">내가 쓴 글</a></li>
		        </ul>
		
		      </div>
	
		      <div class="main_menu">
		        <span>펀딩스튜디오</span>
		      </div>
		
		      <div class="sub_menu">
		          <ul>
		            <li><a href="fundingMain.me">펀딩스튜디오</a>  
		            <li><a href="partnerFunding.me">나의펀딩</a></li>
		            <li><a href="">펀딩관리</a></li>
		            <li><a href="">프로젝트안내</a></li>
		          </ul>
		      </div>
		</div>
	</div>
	
		<!-- 메뉴 펼치기 -->
		<script>
		    $(".main_menu").click(function() {
		        $(this).next(".sub_menu").stop().slideToggle(300);
		        $(this).toggleClass('on').siblings().removeClass('on');
		        $(this).next(".sub_menu").siblings(".sub_menu").slideUp(300); // 1개씩 펼치기
		        });
		</script>

</body>
</html>