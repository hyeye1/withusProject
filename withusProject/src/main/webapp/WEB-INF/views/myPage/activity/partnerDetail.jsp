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
        .wrap{width: 1000px; height: 800px; margin: auto;}

        .wrap>div{width: 100%;}

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%;}

        
        /* userDetail content */
        .userDetail #content_1{height: 15%;}
        .userDetail #content_2{height: 60%;}
        .userDetail #content_3{height: 20%;}

        /*프로필 부분*/
        
        .userDetail #content_1>div{float: left; list-style-type: none; }
        .userDetail #content_1_1{width: 10%;  margin-left: 100px; margin-top: 30px;}
        .userDetail #content_1_2{width: 30%; margin-top: 40px; margin-left: 50px;}

        .userDetail #content_1_2>div{float: left; margin-top: 20px; text-align: center; font-size: 12px;}
        
        .followBtn{color:black;}
        .followingBtn{color:white;}

        
        /* 펀딩 목록 */
        .userDetail #content_2{margin-top: 50px; margin-left: 100px; margin-right: 10px;}
        .userDetail #content_2>div{float: left; padding: 10px;}


        /* 페이징 */
        #pagingArea{width:fit-content;margin:auto;}
        
    </style>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../../common/header.jsp"/>
	
    <div class="wrap">
        
        <!-- 유저 -->
        <div id="mypage" class="ff">
            <div id="content" class="userDetail">
                
                <!-- 유저 프로필 -->
                <div id="content_1">
                    
                    <!-- 이미지 등록했을때 안했을때  (기본이미지) -->
            
		            <c:choose>
		            	<c:when test="${ empty m.memberProfile }">    
				            <div id="content_1_1">
				            	<img src="resources/profile/profile_basic.jpg" width="80" height="80"  class="rounded-circle" >
				           	</div>
			           	</c:when>
			           	<c:otherwise>
			           		<div id="content_1_1">
				            	 <img src="${ m.memberProfile }" width="100" height="100" class="rounded-circle" >
				           	</div>
			           	</c:otherwise> 
		            </c:choose>
                    
                    
                    <div id="content_1_2">
                        <!-- 파트너명 -->
                        <li style="font-size: 20px;">
                            	${ m.partnerName }
                        </li>
                        
                        
                        <!-- 서포터/파트너 (파트너페이지 이지만..) -->
		                <c:choose>
		                	<c:when test="${ m.partnerJoin eq 'Y' }">
		                		<li style="font-size: 12px;">파트너</li>
		                	</c:when>
		                	<c:otherwise>
		                		<li style="font-size: 12px;">서포터</li>
		                	</c:otherwise>
		               	</c:choose>
                        
                        <!-- 펀딩수 -->
                        <div>
                            <li style="color: rgb(52, 152, 219);">${ fundingCount }</li>
                            <li >오픈펀딩</li>
                        </div>
					
						<!-- 팔로워수 -->
                        <div style="margin-left: 25px;">
                            <li style="color: rgb(52, 152, 219);" id="followerCount"></li>
                            <li>팔로워</li>
                        </div>
                        
                        <!-- 팔로우on/off버튼 로그인했을때만 보여지게 & 로그인한 유저가 팔로잉한 상태일경우/아닐경우 -->
                        <c:if test="${ !empty loginUser }">
							<div style="margin-left: 25px; margin-top: 25px;">
                            
                            	<c:choose>
                            		<c:when test="${ result != '0' }">
                            			<button type="button" class="btn btn-dark btn-sm followingBtn" id="followBtn">팔로잉</button>
                            		</c:when>
                            		<c:otherwise>
                            			<button type="button" class="btn btn-outline-dark btn-sm followBtn" id="followBtn">팔로우</button>
                            		</c:otherwise>
                            	</c:choose>
                            </div>	
						</c:if>
                        
                    </div>
                </div>
                
                <!-- 로그인유저의 회원번호 -->
                <input type="hidden" value="${ loginUser.memberNo }" name="memberNo">
                
                <!-- 해당 파트너의 회원번호 -->
                <input type="hidden" value="${ m.memberNo }" name="followMemberNo" id="followMemberNo">
                
                <script>
                $(function(){
                	followerCount();
            		
            		setInterval(followerCount, 1000); // 1초 간격 실시간으로 갱신
            		
                })
                
                	// 파트너의 팔로워수를 실시간으로 갱신
                	function followerCount(){
                	var $followMemberNo = $("input[name=followMemberNo]").val();	// 해당 파트너의 회원번호
                	
                		$.ajax({
	      					url:"followerCount.me",
	      					data:{followMemberNo : $followMemberNo},
	      					success:function(count){
	      						
	      						if(count !== null){ // 팔로워수
	      							
	      							$("#followerCount").text(count);
	      							
	      						
	      						} else { // 오류
	      							
	      							alert("오류가 발생했습니다");
	      						}
	      						
	      					}, error:function(){
	      						console.log("followerCount ajax통신 실패")
	      					}
	      					
	      				})
                	
                	
                	}
                
                </script>
                
                
                
                <!-- 언팔/팔로 버튼 -->
                <script>
					$(function() {
						
						
						$('#followBtn').click( function() {
						  
						  var $memberNo = $("input[name=memberNo]").val();
						  var $followMemberNo = $("input[name=followMemberNo]").val();
						  
						  
						  
					    if( $(this).html() == '팔로잉' ) {
					      
					    	$(this).attr("id", "clicked");
					    	$.ajax({
		      					url:"unfollow.me",
		      					data:{memberNo: $memberNo,
		      						  followMemberNo : $followMemberNo},
		      					success:function(result){
		      						
		      						if(result == "Y"){ // 언팔하기
		      							
		      							$("#clicked").html('팔로우').removeAttr("class").attr("class", "btn btn-outline-dark btn-sm");
		      							alert("팔로우를 해제하였습니다");
		      							
		      							
		      						} else { // 오류
		      							
		      							alert("오류가 발생했습니다");
		      						}
		      						
		      					}, error:function(){
		      						console.log("언팔로우 ajax통신 실패")
		      					}
		      					
		      				})
					      
					    } else {
					    	$(this).attr("id", "clicked");
					    	$.ajax({
		      					url:"follow.me",
		      					data:{memberNo: $memberNo,
		      						  followMemberNo : $followMemberNo},
		      					success:function(result){
		      						
		      						if(result == "Y"){ // 팔로우 중
		      							
		      							$("#clicked").html('팔로잉').removeAttr("class").attr("class", "btn btn-dark btn-sm");
		      							alert("해당 파트너를 팔로우했습니다");
		      							
		      						}else{ // 오류
		      							
		      							alert("오류가 발생했습니다");
		      							
		      						}
		      						
		      					}, error:function(){
		      						console.log("재팔로우 ajax통신 실패")
		      					}
		      					
		      				})
					      
					    }
					    	
					 	});
					});
				</script>
                
                
                <!-- 진행중인 펀딩 -->
                <div id="content_2">
                    <p style="font-size: 20px; font-weight: 1000;">
                        	진행중인 펀딩 
                    </p>
                    <c:choose>
                    	<c:when test="${ empty fundingList }">
                    		<div>
                    			해당 파트너의 펀딩 목록이 없습니다
                    		</div>
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="list" items="${ fundingList }">
	                    		<div>
			                        <table>
			                            <tr>
			                                <td colspan="2">
			                                	<c:choose>
			                                		<c:when test="${ empty list.projectThum }">
			                                			<img src="resources/project_thumbnail/no_image.jpg"  width="250" height="200">
			                                		</c:when>
			                                		<c:otherwise>
			                                			<img src="${ list.projectThum }"  width="250" height="200">
			                                		</c:otherwise>
			                                	</c:choose>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td colspan="2" style="width:10px;">${ list.projectTitle }</td>
			                            </tr>
			                            <tr>
			                                <td>${ list.projectGPrice }</td>
			                                <td>~ ${ list.projectEndDt }</td>
			                            </tr>
			                        </table>
			                    </div>
                    		</c:forEach>
                    	</c:otherwise>
                    </c:choose>
                    

                </div>
                
                
                <!-- 페이징 -->
                <div id="content_3">
                    <div id="pagingArea">
                        <ul class="pagination">
                            <!-- list가 있을때만 페이지버튼 -->
                        	<c:if test="${ !empty fundingList }">
	                        	<c:choose>
	                        		<c:when test="${ pi.currentPage eq 1 }">
	                        			<li class="page-item disabled" ><a class="page-link" href="#">Previous</a></li>
	                        		</c:when>
		                            <c:otherwise>
		                            	<li class="page-item"><a class="page-link" href="partnerDetail.me?memberNo=${ m.memberNo }&currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                            </c:otherwise>
		                        </c:choose>
		                        
		                        
		                        
		                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                    	<li class="page-item"><a class="page-link" href="partnerDetail.me?memberNo=${ m.memberNo }&currentPage=${ p }">${ p }</a></li>
			                    </c:forEach>
		                       
		                        <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				                    </c:when>
				                    <c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="partnerDetail.me?memberNo=${ m.memberNo }&currentPage=${ pi.currentPage+1 }">Next</a></li>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:if>
                         </ul>
                    </div>
                </div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>