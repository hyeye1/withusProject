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
    <script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <style>
        .back {
        border: 1px solid #7f7fd5;
        width: 100vw;
        height: 100vh;
        background: -webkit-linear-gradient(
            to right,
            #91eae4,
            #86a8e7,
            hsl(240, 51%, 67%)
        );
        background: linear-gradient(to right, #91eae4, #86a8e7, #7f7fd5);
        outline: 0;
        border: 0;

        display: flex;
        justify-content: center;
        align-items: center;
        }

        .login {
        background: rgba(255, 255, 255, 0.4);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        height: 500px;
        width: 400px;
        margin-left: auto;
        margin-right: auto;
        }
        .header {
        text-align: center;
        font-size: 3em;
        font-weight: bold;
        }
        .textbtn {
        background: rgba(255, 255, 255, 0.4);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        height: 20px;
        width: 300px;
        margin-left: auto;
        margin-right: auto;

        padding: 0;
        }

        .textbtn input {
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0);
        border: 0;
        }

        .textbtn input:focus {
        outline: 0;
        }
        .check {
        margin-left: 50px;
        }
        .id {
        margin-left: 80px;
        font-size: 12px;
        }
        .test {
        background: rgba(255, 255, 255, 0.4);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        height: 40px;
        width: 300px;
        /*가운데 정렬로 쓰기위해서 컴포넌트 테이블화*/
        display: table;
        margin-left: auto;
        margin-right: auto;
        padding: 0;
        border: 0;
        outline: 0;
        }
        .join {
        margin-left: 90px;
        font-size: 13px;
        }
        .kakao {
        display: table;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 10px;
        }
        .naver {
        display: table;
        margin-left: auto;
        margin-right: auto;
        }

    </style>
</head>
<body>
    <div class="back">
        <div class="login">
            <p class="header">login</p>
            <div class="textbtn">
                <input type="text" placeholder="  아이디"> 
            </div>
            <br>
            <div class="textbtn">
                <input type="text" placeholder="  비밀번호"> 
            </div>
            <br>
            <input type="checkbox" class="check">아이디저장
            <a href="" class="id">아이디/비밀번호 찾기</a>
            <br><br>
            <div class="loginbtn">
                <button class="test">로그인</button>
            </div>
            <p class="join">가치가자에 처음오셨나요? <a href="">회원가입</a></p>

            <div class="kakao">
                <a href="javascript:kakaoLogin();"><img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png" style="height: 50px;width: auto;"></a>
            </div>
            <div class="naver">
                <div id="naver_id_login"></div>
            </div>
         </div>
   </div>




<script type="text/javascript">
    window.Kakao.init("70bef0ced683f03aafded8ae014c584c");

    function kakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile, account_email, gender',
            success: function (authObj) {
                console.log(authObj);
                window.Kakao.API.request({
                    url: '/v2/user/me',
                    success: res => {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account);
                    }
                });
            }
        });
    }
</script>

<script type="text/javascript">
    var naver_id_login = new naver_id_login("dLjj3gw6QxxdyRGAZ9q6", "http://127.0.0.1:5500/html/naver_callback.html");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("green", 3, 50);
    naver_id_login.setDomain("http://127.0.0.1:5500");
    naver_id_login.setState(state);
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();
</script>
    
</body>
</html>