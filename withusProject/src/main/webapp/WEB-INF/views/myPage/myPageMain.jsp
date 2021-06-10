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

        /*큰제목*/
        p{font-size: 23px; font-weight: bolder;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%;}

        /*------공통---------*/

        
        /* main content */
        #main_1{height: 30%; margin-top: 50px;}
        #main_2{height: 40%;}
        #main_3{height: 30%;}
        

        #main_3>div{float: left;}
        #main_3_1{width: 45%;}
        #main_3_2{width: 45%;}
        
        

        /* 펀딩내역 */
        #count{
          background-color: rgba(41, 128, 185, 0.16);
          width: 300px;
          margin-left: 300px;
          margin-top: 50px;
          font-size: 30px;
          border-radius: 40px;
          text-align: center;
        }

        /* 좋아요 */
        #main_2>.like{float: left; padding: 10px;}
        .like>table{width: 90%;}


        /* 문의내역 */
        #main_3_1>table{width: 90%;}
        #qTitle{width: 70%; height: 60px;}
        #qDate{width: 30%;}
        
        
        /* 팔로잉 테이블 */
        #main_3_2>table{width: 100%;}
        #profile{width: 10%; height: 60px;}
        #user{width: 60%}
        #status{width: 20%}

        #id{font-size: 12px; font-weight: bold;}
        #idDetail{font-size: 10px;}

       
        a{text-decoration: none; color: black;}

    </style>



</head>
<body>
    <div class="wrap">
        
        <!-- 나의 펀딩 내역  -->
        <div id="mypage">
            <div id="content">
                
                <!-- 나의 펀딩 목록-->
                <div id="main_1">
                  <p><a href="">나의 펀딩 내역</a></p>
                  <div id="underLine"></div>

                  <div id="count">펀딩 참여<br> 2회</div>


                </div>
                
                
                <!--좋아요-->
                <div id="main_2">
                  <p><a href="">좋아요</a></p>
                  <div id="underLine"></div>

                  <div class="like">
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

                  <div class="like">
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

                  <div class="like">
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

                
                <!--나의문의 & 팔로잉-->
                <div id="main_3">
                  
                  <div id="main_3_1">
                    <p><a href="">나의 문의 내역</a></p>
                    <div id="underLine"></div>

                    <!--3개-->
                    <table>
                      <tr>
                        <td id="qTitle">문의합니다 </td>
                        <td id="qDate">2021-06-21</td>
                      </tr>
                      <tr>
                        <td id="qTitle">문의합니다 </td>
                        <td id="qDate">2021-06-21</td>
                      </tr>
                      <tr>
                        <td id="qTitle">문의합니다 </td>
                        <td id="qDate">2021-06-21</td>
                      </tr>
                    </table>  



                  </div>    
                  
                  
                  <div id="main_3_2">
                    <p><a href="">팔로잉</a></p>
                    <div id="underLine"></div>

                    <!--3개-->
                    <table>
                      <tr>
                        <td id="profile">
                          <img src="city1.PNG" width="40" height="40" class="rounded-circle" >
                        </td>
                        <td id="user">
                          <div id="id">유저아이디</div>
                          <div id="idDetail">오픈펀딩 20</div>
                        </td>
                        
                      </tr>

                      <tr>
                        <td id="profile">
                          <img src="city1.PNG" width="40" height="40" class="rounded-circle" >
                        </td>
                        <td id="user">
                          <div id="id">유저아이디</div>
                          <div id="idDetail">오픈펀딩 20</div>
                        </td>
                        
                      </tr>

                     <tr>
                        <td id="profile">
                          <img src="city1.PNG" width="40" height="40" class="rounded-circle" >
                        </td>
                        <td id="user">
                          <div id="id">유저아이디</div>
                          <div id="idDetail">오픈펀딩 20</div>
                        </td>
                        
                      </tr>

                      
                      
                    </table>





                  </div>
                  
                
                
                
                
                
                </div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>