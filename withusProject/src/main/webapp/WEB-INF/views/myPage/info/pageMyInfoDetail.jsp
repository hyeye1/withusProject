<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        
        .mypage_wrap{width: 1100px; height: 1200px; margin: auto;}

        .mypage_wrap>div{width: 100%;}

        #mypage_main{height: 100%;}
        
       
        /* mypage안의 세부영역 */
        #mypage_main>div{height: 100%; float: left;}
        #mypage_left_menu{width: 15%;}
        #mypage_content{width: 85%;  }

        
       footer {
			margin-top:100px;
	    	clear: both;
		}

        
	</style>
</head>
<body>

	<!-- header자리 -->
    <header>
	
		<jsp:include page="../../common/header.jsp"/>
	</header>
    
    
    <!-- 콘텐츠자리 -->
    <div class="mypage_wrap">
        
        <div id="mypage_main">
            
            <!-- 왼쪽 메뉴바 -->
            <div id="mypage_left_menu">
                <jsp:include page="../main/myPageMenu.jsp"/>
            </div>

            
            
            <!-- 회원정보-->
            <div id="mypage_content" class="ff">
                <jsp:include page="memberInfo.jsp"/>
			</div>
            
        </div>
        
	</div>
    
    <!-- footer자리 -->
    <footer>
		<jsp:include page="../../common/footer.jsp"/>
	</footer>


</body>
</html>