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

        
        /* content */
        .confirmPwd #content_1{height: 50%;}
        .confirmPwd #content_1_1{margin-top: 50px;}
        
        
        /*큰제목*/
        p{font-size: 23px; font-weight: bolder;}

        /* 입력요소 */
        .confirmPwd table{margin-left: 20px;}
        .confirmPwd th{width: 200px; height: 40px;}
        .confirmPwd input{width: 300px}
        

        /* 버튼 부분 */
        .confirmArea{height: 10px;}
        .confirmPwd button{width:80px;}

    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 회원 정보수정 -->
        <div id="mypage">
            <div id="content" class="confirmPwd">
                
                <!-- 나의정보 비밀번호 확인-->
                <div id="content_1">
                
                    <p>나의 정보</p>
                    <div id="underLine"></div>
                    
                    <div style="margin-top: 20px;">

                         
                        가치가자는 회원님의 개인정보를 신중히 취급하며, 

                        회원님의 동의 없이는 기재하신 회원정보가 공개되지 않습니다.<br><br>

                        보다 다양한 서비스를 받으시려면 정확한 정보를 항상 유지해 주셔야 합니다.
                        
                    </div>

                    <div id="content_1_1">
                        <table>
                            <tr style="height: 50px;">
                                <th style="font-size: 20px;">비밀번호 확인</th>
                            </tr>

                            <tr>
                                <td class="confirmArea">
                                    <input type="password" style="width: 500px;" placeholder="본인확인을 위해 비밀번호를 입력해주세요"> 
                                    
                                </td>
                                <td>
                                    <button type="button" class="btn btn-dark btn-sm">확인</button>
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