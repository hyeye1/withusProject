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

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%;}

        
        /* userDetail content */
        .userDetail #content_1{height: 20%;}
        .userDetail #content_2{height: 70%;}
        .userDetail #content_3{height: 10%;}

        /*프로필 부분*/
        
        .userDetail #content_1>div{float: left; list-style-type: none; }
        .userDetail #content_1_1{width: 10%;  margin-left: 100px; margin-top: 30px;}
        .userDetail #content_1_2{width: 30%; margin-top: 40px; margin-left: 50px;}

        .userDetail #content_1_2>div{float: left; margin-top: 20px; text-align: center; font-size: 12px;}

        
        /* 펀딩 목록 */
        .userDetail #content_2{margin-top: 50px; margin-left: 100px; margin-right: 10px;}
        .userDetail #content_2>div{float: left; padding: 10px;}


        /* 페이징 */
        #pagingArea{width:fit-content;margin:auto;}
        
    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 유저 -->
        <div id="mypage">
            <div id="content" class="userDetail">
                
                <!-- 유저 프로필 -->
                <div id="content_1">
                    <div id="content_1_1">
                        <img src="city1.PNG" width="100" height="100" class="rounded-circle" >
                       
                    </div>
                    
                    <div id="content_1_2">
                        <li style="font-size: 20px;">
                            사용자
                            (파트너명)
                        </li>
                        <li style="font-size: 12px;">파트너</li>

                        <div>
                            <li style="color: rgb(52, 152, 219);">6</li>
                            <li >오픈펀딩</li>
                        </div>

                        <div style="margin-left: 25px;">
                            <li style="color: rgb(52, 152, 219);">100</li>
                            <li>팔로워</li>
                        </div>
                        
                        <div style="margin-left: 25px; margin-top: 25px;">
                            <button type="button" class="btn btn-dark btn-sm">팔로잉</button>
                        </div>
                        
                    </div>
                    
                    
                    
                </div>
                
                
                <!-- 진행중인 펀딩 -->
                <div id="content_2">
                    <p style="font-size: 20px; font-weight: 1000;">
                        진행중인 펀딩 
                    </p>
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
                <div id="content_3">
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