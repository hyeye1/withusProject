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
        .wrap{width: 1000px; height: 1000px; margin: auto;}

        .wrap>div{width: 100%;}

        /* 메뉴 아래 선 */
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 80%;
            
        }

        #mypage{height: 100%; margin-top: 50px; }
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%;}

        /* 입력요소 */
        #partnerJoin{height: 700px;}
        #pTitle{font-size: 20px; font-weight: 900;}
        #partnerName, #partnerIntro{width: 300px; margin-top: 5px;}
        #sub{font-size: 13px; font-weight: 800; color: rgb(52, 152, 219);  margin-bottom: 30px; }
        

        #partnerJoin>tbody{
            border-top:  rgb(192, 189, 189) solid 0.2px;
            border-bottom: rgb(192, 189, 189) solid 0.2px;
           }

       
        
        #icon{width: 30px; height: 30px; margin-right: 10px;}
        #arrow{width: 15px; height: 15px; float: right;}
        
        
        /* 프로필 사진 */
        .previewBox{margin-left: 100px; margin-top: 20px;}
        #preview{width:95px; height:95px;}
        .fileEdit{margin-left: 110px; margin-top: 5px; margin-bottom: 10px;}
        label{font-size: 14px; font-weight: 700;}
        #delete{margin-left: 20px;}
        
        
        
        
        /* 버튼 부분 */
        .buttonArea{height: 80px; text-align: center;}

        #btn1{background-color: rgb(52, 152, 219); color: honeydew;}
        button{width: 200px;}

    </style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>

    <div class="wrap">
        
        <!-- 파트너등록 -->
        <div id="mypage" align="center">
            <form action="partnerJoin.me" method="post" enctype="multipart/form-data">
	            <table id="partnerJoin">
	                <thead>
	                	<tr>
	                        <td style="font-size: 25px; font-weight: 900; height: 50px;">파트너 등록</td>
	                    </tr>
	                    <tr>
	                        <td id="pTitle">파트너명</td>
	                    </tr>
	                    <tr>
	                        <td><input type="text" name="partnerName" id="partnerName" required>
	                            <div id="sub">프로젝트에 사용될 이름을 입력해주세요</div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td id="pTitle">파트너소개</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div class="previewBox">
			                 		<img src="${ loginUser.memberProfile }" class="rounded-circle" id="preview" >
			                    </div>
								        
								<div class="fileEdit">
	                            	<label id="edit">편집</label>
	                                <label id="delete">삭제</label>
	                                        
	                                <input type="file" name="file" id="file" accept="image/*" style="display: none;">
	                                <input type="hidden" id="deleteProfile" name="deleteProfile">
	                           	</div>           	
	                        </td>
	                    </tr>
	                
	                    <tr>
	                        <td>
	                            <textarea name="partnerIntro" id="partnerIntro" cols="40" rows="5" style="resize: none;" required></textarea>
	                            <div id="sub">프로젝트에 사용될 소개글을 입력해주세요</div>
	                        </td>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>
	                            <div style="margin-top: 20px;">
	                                <input type="checkbox" value=""  id="allSelect">&nbsp;전체동의<img src="resources/images/myPage/right_arrow.png" id="arrow" >
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div>
	                                <input type="checkbox" value=""  id="checkbox1">&nbsp;가치가자 이용동의(필수)<img src="resources/images/myPage/right_arrow.png" id="arrow" >
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div style="margin-bottom: 20px;">
	                                <input type="checkbox" value=""  id="checkbox2">&nbsp;만 18세 이상(필수)<img src="resources/images/myPage/right_arrow.png" id="arrow" >
	                            </div>
	                        </td>
	                    </tr>
	                </tbody>
	                <tfoot>
	                    <tr>
	                        <td>
	                            <div style="margin-top: 10px;"><img src="resources/images/myPage/help.png" id="icon" >펀딩프로젝트 헬프센터</div>
	                        </td>
	                    </tr>    
	                    <tr>
	                        <th class="buttonArea">
	                        	<input type="hidden" name="memberProfile" value="${loginUser.memberProfile }">
	                        	<input type="hidden" name="memberNo" value="${loginUser.memberNo }">
	                        	<input type="hidden" name="memberId" value="${loginUser.memberId }">
	                            <button type="submit" class="btn btn-light" id="btn1" onclick="return check();">프로젝트 시작하기</button>
	                        </th>
	                    </tr>
	                </tfoot>
	
	            </table>
            </form>
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
		    $("#preview").removeAttr("src").attr("src", "resources/images/profile_basic.jpg"); // db의 기본프로필파일
		    $("#file").val(""); //파일밸류값 삭제
		    $("#deleteProfile").val("delete"); // 기본이미지로 변경을위해 밸류값줘서 넘긴다
		});
		
		
		$('#edit').click( function() {
		  $("#file").click();
		} );

	</script>

	<!-- 체크박스 전체선택 -->
	<script>

        $("#allSelect").click(function(){
            
        	if($("input:checkbox[id='allSelect']").prop("checked")){
            
        		$("input[type=checkbox]").prop("checked", true);

            } else {

            	$("input[type=checkbox]").prop("checked",false);
            }
        });



    
  	//파트너이름,파트너소개, 체크박스 선택안하고 누르면 알람띄우기
	function check(){
 		
		var partnerName = document.getElementById("partnerName");
    	var partnerIntro = document.getElementById("partnerIntro");
    	
    	var regExp = /[\S+$]/; 			// 공백을 제외한 모든 문자로 1글자이상 등록
  		
    	if(!regExp.test(partnerName.value)){ 
    		alert("파트너명을 입력해주세요");
    	
    		partnerName.value="";
    		partnerName.focus();
    		
    		return false;
    	}
    	
    	if(!regExp.test(partnerIntro.value)){ 
    		alert("파트너소개글을 등록해주세요");
    	
    		partnerIntro.value="";
    		partnerIntro.focus();
    		
    		return false;
    	}
  		
  		
  		
  		
		if($("input:checkbox[id='checkbox1']").is(":checked") == true && $("input:checkbox[id='checkbox2']").is(":checked") == true) {
 			var result = confirm("가치가자의 파트너로 등록하시겠습니까?");
     			
 			if(result){
                		
                		
            } else {
              	alert("파트너등록이 취소되었습니다");
             	return false;
            }
     				
 				
 		} else {
 			alert("유의사항에 동의해주세요");
 			return false;
 		}
 			
 			
    }

	</script>            					   					  
   
   
   
   
   
   
</body>
</html>