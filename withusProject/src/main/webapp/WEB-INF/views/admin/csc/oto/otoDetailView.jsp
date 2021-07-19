<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <div class="container">
	    <h2>문의하기 상세보기</h2>
	    <hr>
    	<br>
        <table border="1">
	            <tr>
	                <th width="200" height="35">제목</th>
	                <td width="800">${ o.otoTitle }</td>
	            </tr>
	            <tr>
	                <th height="35">작성일</th>
	                <td>${ o.createDate }</td>
	            </tr>
	            <tr>
	                <th height="35">첨부파일</th>
	                <td>
	                	<c:choose>
	                    	<c:when test="${ empty o.otoOriginname }">
	                    		첨부파일이 없습니다.
	                    	</c:when>
	                    	<c:otherwise>
	                        	<a href="${ o.otoChangename }" download="${ o.otoOriginname }">${ o.otoOriginname }</a>
							</c:otherwise>                        
                        </c:choose>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" height="700"></td>
	            </tr>
		</table>
		
        <!-- 답변(댓글) 기능-->
        <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                    	<c:choose>
                    		<c:when test="${ empty loginUser.memberStatus eq 'A' }">
		                        <th colspan="2">
		                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%" readonly>관리자만 사용가능한 서비스입니다.</textarea>
		                        </th>
		                        <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
                       		</c:when>
                       		<c:otherwise>
		                        <th colspan="2">
		                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
		                        </th>
		                        <th style="vertical-align: middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
                        	</c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                       <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
                    </tr>
                </thead>
                <tbody>
                   
                </tbody>
            </table>
        </div>
        <br><br>
    </div>
    
    <script>
    	$(function(){
    		selectReplyList();
    	})
    	
    	function addReply(){
    		
    		if($("#content").val().trim().length != 0) { 
    			
    			$.ajax({
    				url:"oinsert.oto",
    				data:{
    					otoReply:$("#content").val(),
    					otoReDate:${o.otoReDate},
    				},
    				success:function(status){
    					if(status == "success"){
    						$("#content").val("");
    						selectReplyList();
    					}
    				},error:function(){
    					console.log("댓글 작성 실패")
    				}
    			})
    			
    			
    		}else{ 
    			alertify.alert("댓글 작성 후 다시 요청해주세요.");
    		}
    			
    	}
    	
    	function selectReplyList(){
    		$.ajax({
    			url:"olist.oto",
    			data:{ono:${o.otoNo}},
    			success:function(list){
    				
    				var value="";
    				$.each(list, function(i, obj){
    					value += "<tr>"
    				           + 	"<td>" + obj.replyContent + "</td>"
    				           + 	"<td>" + obj.createDate + "</td>"
    				           + "</tr>";
    				})
    				
    				$("#replyArea tbody").html(value);
    				$("#rcount").text(list.length);
    			},error:function(){
    				console.log("댓글 리스트 조회 실패");
    			}
    		})
    	}
    </script>
	<br>            
        
    
    <!-- 푸터바 포함 -->
    <jsp:include page="../common/footer.jsp"/>
    
    

</body>
</html>