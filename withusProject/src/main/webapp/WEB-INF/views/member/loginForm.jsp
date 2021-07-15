<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

                .back {
                    border: 1px solid #7f7fd5;
                    width: 100vw;
                    height: 100vh;
                    background: -webkit-linear-gradient(to right,
                            #91eae4,
                            #86a8e7,
                            hsl(240, 51%, 67%));
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

                /* .kakao {
        display: table;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 10px;
        }
        .naver {
        display: table;
        margin-left: auto;
        margin-right: auto;
        } */
                #naver_id_login img {
                    border-radius: 50%;
                }

                ul {
                    list-style: none;
                    margin: 0px;
                    padding: 0px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                li {
                    margin: 0px;
                    margin-right: 15px;
                    padding: 0px;
                    float: left;
                }
            </style>
        </head>

        <body>
            <form action="login.me" method="post">
                <div class="back">
                    <div class="login">
                        <p class="header">login</p>
                        <div class="textbtn">
                            <input type="text" name="memberId" placeholder="  아이디" id="memberId">
                        </div>
                        <br>
                        <div class="textbtn">
                            <input type="password" name="memberPwd" placeholder="  비밀번호" id="memberPwd">
                        </div>
                        <br>
                        <input type="checkbox" class="check">아이디저장
                        <a href="" onclick="alert('시스템 내부 개발로 준비중 입니다. 죄송합니다.')" class="id">아이디/비밀번호 찾기</a>
                        <br><br>
                        <div class="loginbtn">
                            <button type="submit" class="test">로그인</button>
                        </div>
                        <p class="join">가치가자에 처음오셨나요? <a href="enrollForm.me">회원가입</a></p>


                        <ul>
                            <li>
                                <div class="kakao">
                                    <a href="javascript:kakaoLogin();"><img
                                            src="https://blog.kakaocdn.net/dn/QnHVz/btqBPXNbjox/T3N8cTlreOvRDECKyrHbx1/img.png"
                                            style="height: 50px;width: auto;"></a>
                                </div>
                            </li>
                            <li>
                                <div class="naver">
                                    <div id="naver_id_login"></div>
                                </div>
                            </li>
                        </ul>


                    </div>
                </div>
            </form>


            <script type="text/javascript">
                window.Kakao.init("70bef0ced683f03aafded8ae014c584c");

                function kakaoLogin() {
                    window.Kakao.Auth.login({
                        scope: 'profile, account_email, gender',
                        success: function (authObj) {
                            console.log(authObj);
                            window.Kakao.API.request({
                                url: '/v2/user/me',
                                success: function (res) {
                                    const kakao_account = res.kakao_account;
                                    console.log(kakao_account);
                                }
                            });
                        }
                    });
                }
            </script>

            <script type="text/javascript">
                var naver_id_login = new naver_id_login("dLjj3gw6QxxdyRGAZ9q6", "http://localhost:8888/withus/naver_callback.me");
                var state = naver_id_login.getUniqState();
                naver_id_login.setButton("green", 1, 50);
                naver_id_login.setDomain("http://localhost:8888/withus/");
                naver_id_login.setState(state);
                naver_id_login.setPopup();
                naver_id_login.init_naver_id_login();

                function naverLoginResult(email, name, token) {
                    if (!token) {
                        console.log("로그인 실패하셨습니다.");
                        return;
                    } else {
                        console.log(email);
                        console.log(name);
                        alert(token);
                        // 로그인 성공시 서버인증을 통해 토큰발급
                        // 토큰발급까지 성공했으면 메인페이지로
                        window.location.replace("http://localhost:8888/withus/");
                    }


                }
            </script>

        </body>

        </html>