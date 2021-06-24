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
        #content{width: 100%; margin-left:150px;}

        
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
        
        
        /* 프로필 사진 */
        .previewBox{margin-left: 100px; margin-top: 20px;}
        #preview{width:95px; height:95px;}
        .fileEdit{margin-left: 110px; margin-top: 5px; margin-bottom: 10px;}
        #delete{margin-left: 20px;}
        
        a{text-decoration: none; color:white; text-decoration-line: none;}

    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 회원 정보수정 -->
        <div id="mypage">
            <div id="content" class="info">
                
                <!-- 기본정보 수정-->
                <div id="info_1">
                    
                    <p>파트너 정보관리</p>
                    <div id="underLine"></div>
                    
                    <form action="partnerUpdate.me" method="post" enctype="multipart/form-data">
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
                                <th>파트너명</th>
                                <td><input type="text" name="partnerName "value="${ loginUser.partnerName }"></td>
                            </tr>
                            
                            <tr>
                                <th>파트너소개</th>
                                <td><textarea name="partnerIntro" id="partnerIntro" cols="35" rows="5" style="resize: none;">${loginUser.partnerIntro }</textarea></td>
                            </tr>
                            <tr>
                                <th class="buttonArea">
                                	<input type="hidden" name="memberProfile" value="${loginUser.memberProfile }">
                                	<input type="hidden" name="memberId" value="${loginUser.memberId }">
                                	
                                	<!-- 비밀번호암호화로그인으로 바꾸면 수정할것 -->
                                	<!-- 정보수정하고 로그인해서 돌아오는데 필요 -->
	                                <input type="hidden" name="memberPwd" value="${loginUser.memberPwd }">
                                    
                                    <button type="submit" class="btn btn-light" id="btn1">정보수정</button>
                                </th>
                                
                            </tr>
    
                        </table>

                    </div>
                    </form>
                </div>
           </div>
            
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
				    $("#preview").removeAttr("src").attr("src", "resources/member_profile/profile_basic.jpg"); // db의 기본프로필파일
				    $("#file").val(""); //파일밸류값 삭제
				    $("#deleteProfile").val("delete"); // 기본이미지로 변경을위해 밸류값줘서 넘긴다
				});
				
				
				$('#edit').click( function() {
				  $("#file").click();
				} );

		</script>      			  
        
        
        
        
        
        
        
        
        

    </div>
</body>
</html>