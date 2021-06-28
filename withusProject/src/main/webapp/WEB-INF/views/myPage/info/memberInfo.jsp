<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
        #content{width: 100%; margin-left:110px;}

        
        /* info content */
        #info_1{height: 50%;}
        #info_2{height: 30%; margin-top: 150px;}
        #info_3{height: 20%; margin-top: 100px;}

        #info_1_1{margin-top: 20px;}
        #info_2_1{margin-top: 20px;}
        #info_3_1{margin-top: 20px;}
        
        /*큰제목*/
        #mainTitle{font-size: 23px; font-weight: bolder;}

        /* 입력요소 */
        .info table{margin-left: 20px;}
        .info th{width: 200px; height: 40px;}
        .info td{width: 320px}
        .info input{width: 300px}
        .info label{cursor: pointer; font-size: 12px;}
         #readonly{background-color: lightgray;}
        

        /* 버튼 부분 */
        .info .buttonArea{height: 150px; text-align: center;}

        .info #btn1{background-color: rgb(52, 152, 219); color: honeydew;}
        .info button{width: 200px;}
        
        a{text-decoration: none; color: black;}
        
        /* 프로필 사진 */
        .previewBox{margin-left: 100px; margin-top: 20px;}
        #preview{width:95px; height:95px;}
        .fileEdit{margin-left: 110px; margin-top: 5px; margin-bottom: 10px;}
        #delete{margin-left: 20px;}

    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 회원 정보수정 -->
        <div id="mypage">
            <div id="content" class="info ff">
                
                <!-- 기본정보 수정-->
                <div id="info_1">
                    
                    <p id="mainTitle">기본정보 수정</p>
                    <div id="underLine"></div>
                    
                    <form action="update.me" method="post" enctype="multipart/form-data">
                    	<div id="info_1_1">
                        	<table>
	                            <tr>
	                                <th>프로필사진</th>
	                                <td>
	                                    <!-- 등록프사가 있을경우 없을경우 -->
	                                    <c:choose>
							            	<c:when test="${ empty loginUser.memberProfile }">    
									            <div class="previewBox">
		                                        	<img src="resources/member_profile/profile_basic.jpg" class="rounded-circle" id="preview" >
		                                    	</div>
								           	</c:when>
								           	<c:otherwise>
								           		<div class="previewBox">
			                                        <img src="${ loginUser.memberProfile }" class="rounded-circle" id="preview" >
			                                    </div>
								           	</c:otherwise> 
							            </c:choose>
	                                    
	                                    <div class="fileEdit">
	                                    	<label id="edit">편집</label>
	                                        <label id="delete">삭제</label>
	                                        
	                                        <input type="file" name="file" id="file" accept="image/*" style="display: none;">
	                                    	<input type="hidden" id="deleteProfile" name="deleteProfile">
	                                    </div>
	                                    
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>이름</th>
	                                <td><input type="text" value="${ loginUser.memberName }" readonly id="readonly"></td>
	                            </tr>
	                            <tr>
	                                <th>이메일</th>
	                                <td><input type="text" value="${ loginUser.memberId }" readonly id="readonly" name="memberId"></td>
	                            </tr>
	                            <tr>
	                                <th>휴대폰</th>
	                                <td>
	                                	<input type="text" value="${ loginUser.memberPhone }" name="memberPhone" id="memberPhone" placeholder="휴대폰번호를 입력해주세요(선택사항)">
	                                </td>
	                            </tr>
	                            <tr>
	                            	<th></th>
	                                <td class="buttonArea">
	                                	
	                                	<input type="hidden" name="memberProfile" value="${loginUser.memberProfile }">
	                                	<input type="hidden" name="memberNo" value="${loginUser.memberNo }">
	                                	
	                                	
	                                	<button type="submit" class="btn btn-light" id="btn1">정보수정</button>
	                                </td>
	                                
	                            </tr>
	    
	                        </table>
						
                    	</div>
                    
                    </form>
                </div>
                
                
                <!-- 프로필사진 파일 미리보기 -->
                <script>
					  function handleFileSelect(event) {
					  	var input = this;
						
							if (input.files && input.files.length) {
						    	var reader = new FileReader();
						        this.enabled = false
						        reader.onload = (function (e) {
						        
						            $("#preview").attr("src", e.target.result);
						        
						        });
						        reader.readAsDataURL(input.files[0]);
						    }
						}
					  
						$('#file').change(handleFileSelect);
						$('.fileEdit').on('click', '#delete', function () {
						    $("#preview").removeAttr("src").attr("src", "resources/images/profile_basic.jpg"); // db의 기본프로필파일
						    $("#file").val(""); //파일밸류값 삭제
						    $("#deleteProfile").val("delete"); // 기본이미지로 변경을위해 밸류값줘서 넘긴다
						});
						
						
						$('#edit').click( function() {
						  $("#file").click();
						} );

				</script>
				
				
				<!-- 기본정보수정 유효성 체크 -->
				<script>
				$(function(){

				    $("#memberPhone").on('keydown', function(e){
				       // 숫자만 입력받기
				        var trans_num = $(this).val().replace(/-/gi,'');
					var k = e.keyCode;
								
					if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
					{
				  	    e.preventDefault();
					}
				    }).on('blur', function(){ // 포커스를 잃었을때 실행
				        if($(this).val() == '') return;

				        // 기존 번호에서 - 를 삭제합니다.
				        var trans_num = $(this).val().replace(/-/gi,'');
				      
				        // 입력값이 있을때만 실행합니다.
				        if(trans_num != null && trans_num != '')
				        {
				            // 총 핸드폰 자리수는 11글자이거나, 10자
				            if(trans_num.length==11 || trans_num.length==10) 
				            {   
				                // 유효성 체크
				                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
				                if(regExp_ctn.test(trans_num))
				                {
				                    // 유효성 체크에 성공시 '-'을 넣는다
				                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
				                    $(this).val(trans_num);
				                }
				                else
				                {
				                    alert("유효하지 않은 번호 입니다.");
				                    $(this).val("");
				                    $(this).focus();
				                }
				            }
				            else 
				            {
				                alert("유효하지 않은 번호 입니다.");
				                $(this).val("");
				                $(this).focus();
				            }
				      }
				  });  
				});
				</script>


			                
                
                
                <!-- 비밀번호 변경-->
                <div id="info_2" >
                 
                    <p id="mainTitle">비밀번호 변경</p>
                    <div id="underLine"></div>

                    <div id="info_2_1">
			            <form action="updatePwd.me" method="post">
			            	<table>
			                    <tr>
			                        <th>현재 비밀번호</th>
			                        <td><input type="password" name="memberPwd" id="checkPwd"></td>
			                        
			                    </tr>
			                    <tr>
			                        <th>새 비밀번호</th>
			                        <td>
			                        	<input type="password" name="newPwd" id="newPwd" class="pw">
			                            <div id="input" style="display: none;"> 영문, 숫자, 특수문자를 포함한 8~15자리</div>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th>새 비밀번호 확인</th>
			                        <td><input type="password" name="newPwdCheck" id="newPwdCheck" class="pw"></td>
			                    </tr>
			                    <tr>
			                        <th></th>
			                        <td class="buttonArea">
			                        	<input type="hidden" name="memberNo" value="${loginUser.memberNo }">
			                        	<input type="hidden" name="memberId" value="${loginUser.memberId }">
			                            <button type="submit" class="btn btn-light" id="btn1" onclick="return updatePwd();">비밀번호 변경</button>
			                            <input type="hidden" id="confirmPwd" value="no">
			                            
			                        </td>
			                    </tr>
			
			                </table>
			            </form>
			        </div>
		    	</div>
		    	
		    	<!-- 현재 비밀번호 확인 ajax -->
		    	<script>
		    	$(function(){
		      		
		      		var checkPwd = $("#checkPwd"); // 비밀번호블 입력하는 input요소 객체
		      		
		      		checkPwd.keyup(function(){
		      			
		      			// 우선 최소 5글자 이상으로 입력했을 때만 ajax 요청해서 중복체크 
		      			if(checkPwd.val().length >= 5){
		      				
		      				$.ajax({
		      					url:"pwd.me",
		      					data:{checkPwd:checkPwd.val()},
		      					success:function(result){
		      						
		      						if(result == "N"){ // 사용 불가능
		      							console.log("비밀번호 불일치")
		      							$("#confirmPwd").val("no");
		      							
		      			                
		      			            } else { // 사용가능
		      							console.log("비밀번호 일치")
		      							$("#confirmPwd").val("ok");
		      						}
		      						
		      					
		      						
		      					}, error:function(){
		      						console.log("ajax통신 실패")
		      					}
		      					
		      				})
		      				
		      				
		      				
		      			}else { // 비밀번호가 5글자 미만일 경우 => 비교X 실행X
		      				
		      				
		      			}
		      		})
		      	})  
				      	
				        
		     </script>
		    
		    	
		    <!-- 비밀번호수정 유효성검사 -->
		    <script>
		    	
		    	// 새비밀번호 입력시 안내문구
		    	$('.pw').keyup(function () {
			        var newPwd = $("#newPwd").val();
			        var newPwdCheck = $("#newPwdCheck").val();
			  
			        if ( newPwd != '' && newPwdCheck == '' ) { 
			        	$("#input").css('display', 'inline-block');
			        
			       
			      	} 
			    
			    });
		    	
		    	
		    	// 유효성검사해서 넘기기
		    	function updatePwd(){
		    		
		    		var newPwd = $("#newPwd").val();
		    		var newPwdCheck = $("#newPwdCheck").val();
		    		var regExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
		    		//8자이상 15자이하, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자

		    	
		    		if(!regExp.test(newPwd) && !regExp.test(newPwdCheck)){
		    			alert("유효한 비밀번호를 입력해주세요");
		    			$("#newPwd").val("");
		    			$("#newPwdCheck").val("");
		    			$("#newPwd").focus();
		    			
		    			return false;
		    		
		    		} else { // 새 비밀번호 유효성 통과
		    			
		    			if(newPwd==newPwdCheck){ // 두 비밀번호 일치할때
		    				
		    				if( $("#confirmPwd").val()=="ok"){
				    			
				    			var result = confirm("비밀번호를 변경 하시겠습니까?");
			                	
			                	if(result){
			                		
			                		
			                	} else {
			                		alert("취소되었습니다");
			                		return false;
			                	}
				    			
				    			
				    		} else {
				    			
				    			alert("현재 비밀번호가 일치하지않습니다");
				    			$("#checkPwd").val("");
				    			$("#checkPwd").focus();
				    			return false;
				    		}
		    				
		    				
		    				
		    				
		    			} else { // 두 비밀번호 일치하지 않을 때
		    				
		    				alert("새 비밀번호가 일치하지 않습니다");
		    				$("#newPwdCheck").val("");
		    				$("#newPwdCheck").focus();
		    				return false;
		    			}
		    			
		    		}
		    		
		    	}				
			        
      		</script>   
    		
		    
		    
		    	<!-- 회원 탈퇴-->
                <div id="info_3">
                
                    <p id="mainTitle">회원탈퇴</p>
                    <div id="underLine"></div>
                

                    <div id="info_3_1">
                       	유의사항 안내 페이지를 확인하신 후 신중하게 진행해 주시기 바랍니다.
                       <table>
                           <tr>
                            	<th></th>
                                <td class="buttonArea">
                                    <button type="button" class="btn btn-outline-secondary"><a href="deleteForm.me">회원탈퇴로 이동</a></button>
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