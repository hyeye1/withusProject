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
        .wrap{width: 1000px; height: 800px; margin: auto;}

        .wrap>div{width: 100%;}

        /* 메뉴 아래 선 */
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 80%;
            
        }

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%;}

        /*큰제목*/
        p{font-size: 23px; font-weight: bolder;}


        /* content */
        .like #content_1{height: 80%;}
        .like #content_2{height: 10%; width: 80%;}
        
        
        /* 좋아요 목록 */
        .like #content_1{margin-top: 50px;}
        .like #content_1>div{float: left; padding: 10px;}


        /* 페이징 */
        #pagingArea{width:fit-content; margin:auto;}


    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 회원 정보수정 -->
        <div id="mypage">
            <div id="content" class="like">
                <p>좋아요</p>
                <div id="underLine"></div>
                
                
                <!-- 좋아요 목록-->
                
                <div id="content_1">
                    
                    <div>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <img src="city1.PNG" class="img-thumbnail" width="250" height="300">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">프로젝트 제목</td>
                            </tr>
                            <tr>
                                <td>가격</td>
                                <td>날짜</td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <img src="city1.PNG" class="img-thumbnail" width="250" height="300">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">프로젝트 제목</td>
                            </tr>
                            <tr>
                                <td>가격</td>
                                <td>날짜</td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <img src="city1.PNG" class="img-thumbnail" width="250" height="300">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">프로젝트 제목</td>
                            </tr>
                            <tr>
                                <td>가격</td>
                                <td>날짜</td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <img src="city1.PNG" class="img-thumbnail" width="250" height="300">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">프로젝트 제목</td>
                            </tr>
                            <tr>
                                <td>가격</td>
                                <td>날짜</td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <img src="city1.PNG" class="img-thumbnail" width="250" height="300">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">프로젝트 제목</td>
                            </tr>
                            <tr>
                                <td>가격</td>
                                <td>날짜</td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <img src="city1.PNG" class="img-thumbnail" width="250" height="300">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">프로젝트 제목</td>
                            </tr>
                            <tr>
                                <td>가격</td>
                                <td>날짜</td>
                            </tr>
                        </table>
                    </div>
                    

                </div>
                
                
                
                
                
                <!-- 페이징 -->
                <div id="content_2">
                    <div id="pagingArea">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                          </ul>
                    </div>
                </div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>