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
	    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding&display=swap');
	  	.ff{font-family: 'Nanum Gothic Coding', monospace;}
        
        /*div{border: 1px solid red; box-sizing: border-box;}*/
        .wrap{width: 1000px; height: 1000px; margin: auto;}

        .wrap>div{width: 100%; }

        /* 메뉴 아래 선 */
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 80%;
            
        }

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%; margin-left: 150px;}

        
        /* content */
        #content_1{height: 50%;}
        #content_1_1{margin-top: 20px;}
        
        
        /*큰제목*/
        #mainTitle{font-size: 23px; font-weight: bolder;}

        /* 내용 */
        #dropTable{margin-left: 20px; width: 75%;}
       
        #dropCheck{font-size: 20px; margin-top: 10px;}
        #contentTitle{font-weight: 650; font-size: 16px; color: rgb(52, 73, 94)}
        #contentDetail{font-size: 15px; margin-left: 25px; margin-top: 5px;}

        #checkImg{width: 18px; height: 18px; margin-right: 5px;}

        
        #tableTitle{font-size: 20px; margin-top: 25px;}
        #checkboxArea{font-size: 15px; margin-bottom: 40px;  margin-top: 20px; margin-left: 5px; }

        #pwdInput{width: 400px; font-size: 15px; margin-bottom: 60px; margin-left: 5px;}
        #checkResult{margin-left: 5px;}

        /* 버튼 부분 */
        tbody, tfoot{border-top: solid 0.2px rgb(192, 189, 189);}
        #submitBtn{width:200px; margin-top: 60px; margin-left: 5px;}
        
        

    </style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
    <div class="wrap" class="ff">
        
        <!-- 회원 정보수정 -->
        <div id="mypage" class="ff" >
            <div id="content" >
                
                <!-- 나의정보 비밀번호 확인-->
                <div id="content_1">
                
                    <p id="mainTitle">회원탈퇴</p>
                    <div id="underLine"></div>
                   

                    <div id="content_1_1">
                        <form action="delete.me" method="post">
	                        <table id="dropTable">
	                            <thead>
	                                <tr>
	                                    <th><p id="dropCheck">회원탈퇴 유의사항</p></th>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <p id="dropContent">
	                                            <div id="contentTitle">
	                                                <img src="resources/images/myPage/check.png" id="checkImg">사용하고 계신 아이디(${loginUser.memberId})는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
	                                            </div>
	                                            <div id="contentDetail">
	                                                	탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.
	                                            </div>
	                                        </p>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <p id="dropContent">
	                                            <div id="contentTitle">
	                                                <img src="resources/images/myPage/check.png" id="checkImg">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.
	                                            </div>
	                                            <div id="contentDetail">
	                                                	회원 정보 및 프로젝트 등 개인 정보 일괄 삭제되며 데이터는 복구되지 않습니다.
	                                            </div>
	                                        </p>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <p id="dropContent">
	                                            <div id=contentTitle>
	                                                <img src="resources/images/myPage/check.png" id="checkImg">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.
	                                            </div>
	                                            <div id="contentDetail">
							                                                게시글, 댓글, 펀딩한 프로젝트에 남겨진 이름 등은 자동 삭제되지 않고 그대로 남아 있습니다.<br>
							                                                삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.
	                                            </div>
	                                        </p>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <div id="checkboxArea"><input type="checkbox">&nbsp;회원탈퇴 유의사항에 동의합니다</div>
	                                    </td>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <th><p id="tableTitle">본인 확인</p></th>
	                                </tr>
	
	                                <tr>
	                                    <td class="confirmArea">
	                                        <input type="password" placeholder="안전한 탈퇴를 위해서 비밀번호를 입력해주세요" name="memberPwd" id="pwdInput"> 
	                                        <label id="checkResult"  style="display:none;"></label>
	                                    </td>
	                                </tr>
	                            </tbody>
	                            <tfoot>
	                                <tr>
	                                    <td style="text-align: center;">
	                                        <button type="button" class="btn btn-dark btn-sm" id="submitBtn" disabled onclick="return check();">회원탈퇴</button>
	                                    </td>
	                                </tr>
	                            </tfoot>
	                            
	                        </table>
                        </form>
                    </div>

                    
                    
                    <script>
        
				      	$(function(){
				      		
				      		var $pwdInput = $("#pwdInput[name=memberPwd]"); // 비밀번호블 입력하는 input요소 객체
				      		
				      		$pwdInput.keyup(function(){
				      			
				      			// 우선 최소 5글자 이상으로 입력했을 때만 ajax 요청해서 중복체크 하도록
				      			if($pwdInput.val().length >= 5){
				      				
				      				$.ajax({
				      					url:"pwd.me",
				      					data:{checkPwd:$pwdInput.val()},
				      					success:function(result){
				      						
				      						if(result == "N"){ // 사용 불가능
				      							// 메세지 빨간색 출력, 버튼 비활성화
				      							$("#checkResult").show();
				      							$("#checkResult").css("color", "red").text("비밀번호가 일치하지 않습니다.");
				      							$("#submitBtn").attr("disabled", true);
				      							
				      						}else{ // 사용가능
				      							$("#checkResult").show();
				      							$("#checkResult").css("color", "green").text("비밀번호가 일치합니다");
				      							
				      							$("#submitBtn").removeAttr("disabled");
				      							
				      						}
				      						
				      						
				      						
				      					}, error:function(){
				      						console.log("비밀번호체크 ajax통신 실패")
				      					}
				      					
				      				})
				      				
				      				
				      				
				      			}else { // 비밀번호가 5글자 미만일 경우 => 비교할 가치도 없음 (애초에 유효하지 않음) => 다시 회원가입버튼 비활성화, 메세지 안보여지도록
				      				$("#submitBtn").attr("disabled", true);
				      				$("#checkResult").hide();
				      				
				      			}
				      		})
				      	})  
				        
				      </script>
				      
				      
				      <script>
						//체크박스 선택안하고 삭제누르면 알람띄우기
	                	function check(){
	                 		
	                		if($("input:checkbox").is(":checked") == true) {
	                 				var result = confirm("정말 회원탈퇴하시겠습니까?");
		                 			
	                 			if(result){
		                            		
		                            		
		                        } else {
		                          	alert("탈퇴가 취소되었습니다");
		                         	return false;
		                        }
		                 				
	                 				
	                 		} else {
	                 			alert("유의사항에 동의해주세요");
	                 			return false;
	                 		}
	                 			
	                 			
			            }

					</script>   
        
                
                
                </div>
            
            </div>
            
        </div>
        

    </div>
    
    
</body>
</html>