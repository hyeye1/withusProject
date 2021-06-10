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

        
        /* info content */
        #info_1{height: 50%;}
        #info_2{height: 30%; margin-top: 150px;}
        #info_3{height: 20%; margin-top: 100px;}

        #info_1_1{margin-top: 20px;}
        #info_2_1{margin-top: 20px;}
        #info_3_1{margin-top: 20px;}
        
        /*큰제목*/
        p{font-size: 23px; font-weight: bolder;}

        /* 입력요소 */
        .info table{margin-left: 20px;}
        .info th{width: 200px; height: 40px;}
        .info input{width: 300px}
        .info label{cursor: pointer; font-size: 12px;}

        /* 버튼 부분 */
        .info .buttonArea{height: 150px; text-align: center;}

        .info #btn1{background-color: rgb(52, 152, 219); color: honeydew;}
        .info button{width: 200px;}

    </style>

</head>
<body>
    <div class="wrap">
        
        <!-- 회원 정보수정 -->
        <div id="mypage">
            <div id="content" class="info">
                
                <!-- 기본정보 수정-->
                <div id="info_1">
                    
                    <p>기본정보 수정</p>
                    <div id="underLine"></div>
                    
                    <div id="info_1_1">
                        <table>
                            <tr>
                                <th>프로필사진</th>
                                <td>
                                    <div style="margin-left: 100px; margin-top: 20px;">
                                        <img src="city1.PNG" width="100" height="100" class="rounded-circle" >
                                    </div>
                                    <div style="margin-left: 110px; margin-top: 5px; margin-bottom: 10px;">
                                        <label>편집</label>
                                        <label style="margin-left: 20px;">삭제</label>
                                    </div>
                                    
                                </td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" value="" readonly></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="text" value="" readonly></td>
                            </tr>
                            <tr>
                                <th>휴대폰</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th colspan="2" class="buttonArea">
                                    <button type="button" class="btn btn-light" id="btn1">정보수정</button>
                                </th>
                                
                            </tr>
    
                        </table>

                    </div>
                </div>
                
                <!-- 비밀번호 변경-->
                <div id="info_2" >
                 
                    <p>비밀번호 변경</p>
                    <div id="underLine"></div>

                    <div id="info_2_1">
                        <table>
                            <tr>
                                <th>현재 비밀번호</th>
                                <td><input type="password"></td>
                            </tr>
                            <tr>
                                <th>새 비밀번호</th>
                                <td><input type="password"></td>
                            </tr>
                            <tr>
                                <th>새 비밀번호 확인</th>
                                <td><input type="password"></td>
                            </tr>
                            <tr>
                                <th colspan="2" class="buttonArea">
                                    <button type="button" class="btn btn-light" id="btn1">비밀번호 변경</button>
                                </th>
                            </tr>

                        </table>
                    </div>
                </div>
                
                <!-- 회원 탈퇴-->
                <div id="info_3">
                
                    <p>회원탈퇴</p>
                    <div id="underLine"></div>
                

                    <div id="info_3_1">
                        <table>
                            <tr>
                                <td>
                                    
                                    유의사항 안내 페이지를 확인하신 후 신중하게 진행해 주시기 바랍니다.
                                      
                                </td>
                            </tr>
                            <tr>
                                <td class="buttonArea">
                                    <button type="button" class="btn btn-outline-secondary">회원탈퇴로 이동</button>
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