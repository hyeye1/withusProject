<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    .content{
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 15%;
        background:white;
    }
</style>

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp"/>
	
	<div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form action="insert.me" method="post" id="enrollForm">
                <div class="form-group">
                
                	<label for="memberName">* 이름 :</label>
                    <input type="text" class="form-control" id="memberName" name="memberName" placeholder="Please Enter Name" required><br>
                    
               	    <label for="memberId">* 이메일 :</label>
                    <input type="email" class="form-control" id="memberId" name="memberId" placeholder="Please Enter Email" required><br>
                    <div id="checkResult" style="display:none; font-size:0.8em;"></div>
                    <br>
                    
                    <label for="memberPwd">* 비밀번호 :</label>
                    <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="비밀번호 입력" required><br>
                    
                    <input type="password" class="form-control" id="checkPwd" placeholder="비밀번호 확인" required><br>
                    
                </div>
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary" id="enrollBtn" disabled>회원가입</button>
                    <button type="reset" class="btn btn-danger"> 초기화</button>
                </div>
            </form>
        </div>
        <br><br>
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
    							$("#checkResult").css("color", "green").text("사용가능한 아이디입니다.");
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
    		//"?email=yonghuy4188@naver.com&name=김가은"
    		
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

	<br><br><br>
	
	<!-- 푸터바 -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>