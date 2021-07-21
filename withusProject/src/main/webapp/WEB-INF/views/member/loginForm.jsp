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
                    
                    width: 100vw;
                    height: 100vh;
                    background: url(https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=813&q=80);
  			 	    background-size: cover;		
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
                        <p class="header">Login</p>
                        <div class="textbtn">
                            <input type="text" name="memberId" placeholder="  아이디" id="memberId">
                        </div>
                        <br>
                        <div class="textbtn">
                            <input type="password" name="memberPwd" placeholder="  비밀번호" id="memberPwd">
                        </div>
                        <br>
                        <input type="checkbox" class="check" id="idSaveCheck">아이디저장
                        <a href="" onclick="alert('시스템 내부 개발로 준비중 입니다. 새로 회원가입 해 주세요.')" class="id">아이디/비밀번호 찾기</a>
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
                                    console.log(kakao_account.profile.nickname);
                                    emailCheck(kakao_account.email, kakao_account.profile.nickname);
                                }
                            });
                        }
                    });
                }
                function emailCheck(email, name){
                	$.ajax({
    					url:"idCheck.me",
    					data:{checkId:email},
    					success:function(result){
    					console.log('응답결과 :', result);
    						if(result == "N"){ // 사용불가능
    							// 로그인 처리 
    							
    						}else{ // 사용가능
    							// 회원가입 페이지로 이동		
    							location.href="enrollForm.me?email="+ email + "&name=" + name;
    						}
    						
    					},error:function(){
    						console.log("아이디 중복체크용 ajax 통신 실패");
    					}
    				})
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
				console.log(emailCheck);
                function naverLoginResult(email, name, token) {
                	
                	console.log(email);
                	console.log(name);
                	console.log(token);
                    if (!token) {
                        console.log("로그인 실패하셨습니다.");
                        return;
                    } else {
                    	emailCheck(email, name);
                   
                    }


                }
            </script>
			
			<script>
			$(document).ready(function(){
				 
			    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
			    var key = getCookie("key");
			    $("#memberId").val(key); 
			     
			    if($("#memberId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
			        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			    }
			     
			    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
			        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
			            setCookie("key", $("#memberId").val(), 7); // 7일 동안 쿠키 보관
			        }else{ // ID 저장하기 체크 해제 시,
			            deleteCookie("key");
			        }
			    });
			     
			    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
			    $("#memberId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
			        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
			            setCookie("key", $("#memberId").val(), 7); // 7일 동안 쿠키 보관
			        }
			    });
			});
			 
			function setCookie(cookieName, value, exdays){
			    var exdate = new Date();
			    exdate.setDate(exdate.getDate() + exdays);
			    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
			    document.cookie = cookieName + "=" + cookieValue;
			}
			 
			function deleteCookie(cookieName){
			    var expireDate = new Date();
			    expireDate.setDate(expireDate.getDate() - 1);
			    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
			}
			 
			function getCookie(cookieName) {
			    cookieName = cookieName + '=';
			    var cookieData = document.cookie;
			    var start = cookieData.indexOf(cookieName);
			    var cookieValue = '';
			    if(start != -1){
			        start += cookieName.length;
			        var end = cookieData.indexOf(';', start);
			        if(end == -1)end = cookieData.length;
			        cookieValue = cookieData.substring(start, end);
			    }
			    return unescape(cookieValue);
			}

			</script>
        </body>

        </html>