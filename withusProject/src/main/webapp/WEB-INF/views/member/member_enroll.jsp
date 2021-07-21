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
         
                <div class="back">
                    <div class="login">
                        <p class="header">Sign-up</p>
                        <form action="insert.me" method="post" id="enrollForm">
                            
                        <div class="textbtn">
                            <input type="text" class="form-control" id="memberName" name="memberName" placeholder="  Please Enter Name" required>
                        </div>
                        <br>
                        <div class="textbtn">
                            <input type="email" class="form-control" id="memberId" name="memberId" placeholder="  Please Enter Email" required>
                            <div id="checkResult" style="display:none; font-size:0.8em;"></div>
                        </div>
                        <br> <br>
                        <div class="textbtn">
                            <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="  비밀번호 입력" required>
                        </div>
                        <br>
                        <div class="textbtn">
                            <input type="password" class="form-control" id="checkPwd" placeholder="  비밀번호 확인" required>
                        </div>
                        <br><br>
                        <div class="btns">
                            <button type="submit" class="test btn" id="enrollBtn" disabled style="background-color: rgb(71, 189, 250); color: white;">회원가입</button>
                        </div>
                    </form>
                        


                      


                    </div>
                </div>
                <script>
                    $(function(){
                        
                        var $idInput = $("#enrollForm input[name=memberId]"); // 아이디를 입력하는 input요소 객체
                        
                        $idInput.keyup(function(){
                        
                            // 우선 최소 5글자 이상으로 입력했을때만 ajax 요청해서 중복체크 하도록
                            if($idInput.val().length >= 9){
                                
                                $.ajax({
                                    url:"idCheck.me",
                                    data:{checkId:$idInput.val()},
                                    success:function(result){
                                        
                                        if(result == "N"){ // 사용불가능
                                            // 메세지 빨간색 출력, 버튼 비활성화
                                            $("#checkResult").show();
                                            $("#checkResult").css("color", "red").text("중복된 아이디가 존재합니다. 다시 입력해주세요.");
                                            $("#enrollBtn").attr("disabled", true);    							
                                        }else{ // 사용가능
                                            // 메세지 초록색 출력, 버튼 활성화
                                            $("#checkResult").show();
                                            $("#checkResult").css("color", "#ffea51").text("사용가능한 아이디입니다.");
                                            $("#enrollBtn").removeAttr("disabled");    							
                                        }
                                        
                                    },error:function(){
                                        console.log("아이디 중복체크용 ajax 통신 실패");
                                    }
                                })
                                
                                
                            }else{ // 아이디가 5글자 미만일경우 => 비교할 가치도 없음 (애초에 유효하지 않음) => 다시 회원가입버튼 비활성화, 메세지 안보여지도록
                                $("#enrollBtn").attr("disabled", true);
                                $("#checkResult").hide();
                            }
                            
                        })
                        
                        console.log('Location.search : ', location.search);
                       
                        
                        // 파라미터 유무확인
                        let parms = location.search;
                        if(parms && parms.includes("email=") && parms.includes("name=")){
                            parms = parms.replace('?', '');
                            parms = parms.split("&");
            
                            const email = parms[0].replace("email=", '');
                            const name = decodeURI(parms[1].replace("name=", ''));
                            $("#memberId").val(email);
                            $("#memberName").val(name);
                        }
                                
                    })    	
                </script>
            
              
        </body>

        </html>