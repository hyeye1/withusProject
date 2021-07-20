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
        #content{width: 100%; margin-left: 110px;}

        
        /* query content */
        #query_1{height: 80%; margin-top: 50px; width: 80%;}
      
        
        
        
        /*큰제목*/
        p{font-size: 23px; font-weight: bolder;}

        
        /* 문의내역 테이블 */
        #qCat{width: 10%;}
        #qTitle{width: 60%;}
        #qDate{width: 20%; text-align: right;}
        #qContent, #qReply{height: 280px;}
        #backBtn{text-align: center;}
        
        .btn{background-color: rgb(178, 185, 223); color: white;}
		a{text-decoration:none; color:white;}
	
		#file{color:black;}


    </style>

</head>
<body>
	<div class="wrap">
        
        <!-- 나의 문의내역  -->
        <div id="mypage">
            <div id="content">
                <p>나의 문의</p>
                <div id="underLine"></div>
                
                
                <!-- 나의 문의 목록-->
                
                <div id="query_1">
                    <table class="table">
                        <thead class="thead-light">
                          <tr>
                            <th id="qCategory">${ detail.otoCat }</th>
                            <th id="qTitle">${ detail.otoTitle }</th>
                            <th id="qDate">${ detail.otoDate }</th>
                          </tr>
                        </thead>
                        <tbody>
                         <!-- 첨부파일있는경우 --><!-- 다운로드 -->
                         <c:if test="${ !empty detail.otoChangeName}">
	                         <tr>
	                        	<td colspan="3" style="text-align: left;">첨부파일 : <a id="file" href="${ detail.otoChangeName }" download="${ detail.otoOriginName }">${ detail.otoOriginName }</a></td>
	                         </tr>
                         </c:if>
                         <tr>
                            <td colspan="3"id="qContent">${ detail.otoContent }</td>
                         </tr>
                        </tbody>
                        <tfoot>
                          <tr>
                            <c:choose>
                            	<c:when test="${ detail.otoReStatus eq 'N'}">
                            		<td colspan="3" style="text-align: right;">처리중</td>
                          	
                            	</c:when>
                            	<c:otherwise>
                            		<td colspan="3" style="text-align: right;">답변완료</td>
                            	</c:otherwise>
                            </c:choose>
                          </tr>
                          <!--답변완료일시에만 보이게-->
                          
                          <c:if test="${ detail.otoReStatus eq 'Y'}">
                          	<tr>
                            <td colspan="3" id="qReply">${ detail.otoReply }</td>
                          </tr>
                          </c:if>
                          <tr>
                            <td colspan="3" id="backBtn">
                            	<form action="deleteQuery.me" method="post">
                            	<input type="hidden" name="otoNo" value="${ detail.otoNo }">
                            	<button class="btn btn-sm"><a href="myQuery.me">목록</a></button>
                            	<button type="submit" class="btn btn-sm" onclick="return validate();">삭제</button>
                            	</form>
                            </td>
                            
                          </tr>
                        </tfoot>
                      </table>
                      
                      <!-- 문의삭제 컨펌 -->
						<script>
						
						function validate(){
		                	
		                	
		                	
		                	var result = confirm("문의를 삭제 하시겠습니까?");
		                	
		                	if(result){
		                		
		                	} else {
		                		alert("삭제가 취소되었습니다");
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
