<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
    
    
</style>
</head>
<body>

    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp" />
    

    <div class="container">
        <br>
	
	    <h3><b>신고관리</b></h3>
	    <hr><br>
        <!-- 검색기능 
        <div class="searchArea">
        	<form action="searchReport.mana" name="searchReport">
        	<input type="hidden" name="currentPage" value="1">
        	<div class="searchForm">
		        <select id="searchKey" name="searchMenu">
		          <option value="memberNo">회원번호</option>
		          <option value="memberName">이름</option>
		          <option value="reportCount">누적횟수</option>
		        </select>
	           <input type="text" class="form-control form-control-sm" name="keyword" value="${ keyword } placeholder="입력칸">
	        </div>
	        <br>
	        <div class="searchBtn" align="right">
	            <button class="btn searchBtn1" type="submit" id="submitB">검색</button>
	            <button class="btn searchBtn2" type="reset" id="resetB">초기화</button>
	        </div>
	        </form>
        </div>
        
        <c:if test="${ !empty searchkey }">
	        <script>
	        	$(function(){
	        		$("#searchKey option[value=${searchKey}]").attr("selected", true);
	        	});
	        
	        	// 초기화버튼 클릭시
		        $("#resetB").click(function(){
					$("#searchKey option[value=${searchKey}]").removeAttr("selected");
					$("input[name='keyword']").empty();
				});
	        </script>
        </c:if>
        -->	
        
        <p>
        	* 게시물타입 - ( 1 : 게시글, 2 : 프로젝트, 3 : 댓글 )
        </p>
        <table class="table table-bordered" id="reportList" >
        	<thead>
        		<tr align="center" style="height: 10px; font-size:smaller ;">
        			<c:choose>
        				<c:when test="${ empty list }">
        					<div class="none"><p>조회 결과가 없습니다.</p></div>
        				</c:when>
        				<c:otherwise>        
							<th width="10%" height="30">신고<br>번호</th>
							<th width="10%">회원<br>이름</th>
			                <th width="">신고사유</th>
			                <th width="10%">회원<br>상태</th>
			                <th width="13%">신고일</th>
			                <th>처리현황</th>
			            </c:otherwise>
					</c:choose>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
				
		</table>
		
		<!-- The Modal -->
		  <div class="modal fade" id="reportModal">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">신고 승인/반려</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		          회원이 강제 탈퇴됩니다. 다시 검토 바랍니다.
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">승인</button>
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">반려</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		
		
		<script>
			$(function(){
				selectReportList();
					
			})
				
			
			function selectReportList(){
				$(document).on("click", "#submit", function(){
					$.ajax({
						url : "reportList.mana",
						data : {rno:${r.reportNo}},
						success:function(list){
							//console.log(list);
							var value="";
							$.each(list, function(i, obj){
								value += "<tr>"
								       +    "<td>" + list[i].reportNo + "</td>"
								       +    "<td>" + list[i].memberName + "</td>"
								       +    "<td>" + list[i].reportContent + "</td>"
								       +    "<td>" + list[i].memberStatus + "</td>"
								       +    "<td>" + list[i].reportDate + "</td>"
								       +    "<td><button id='submit' on='postForm(1)'>" + list[i].reportStatus + "</button></td>"
								       + "</tr>";
							})
							
							$("#reportList tbody").html(value);
							
						},error:function(){
							console.log("테이블 조회 실패");
						}	
				});
				
				})		
			}
				
			
		</script>        
		
		
		<!-- 페이징 처리 -->
	    <div id="pagingArea">
        	<ul class="pagination">
            <!-- list가 있을때만 페이지버튼 -->
	            <c:if test="${ !empty list }">
		        	<c:choose>
		            	<c:when test="${ pi.currentPage eq 1 }">
		                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		                </c:when>
			            <c:otherwise>
			                <li class="page-item"><a class="page-link" href="reportList.mana?currentPage=${ pi.currentPage-1 }">Previous</a></li>
			            </c:otherwise>
			        </c:choose>
			                        
			        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				    	<li class="page-item"><a class="page-link" href="reportList.mana?currentPage=${ p }">${ p }</a></li>
				    </c:forEach>
			                       
			        <c:choose>
				       	<c:when test="${ pi.currentPage eq pi.maxPage }">
					       	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					    </c:when>
					    <c:otherwise>
					       	<li class="page-item"><a class="page-link" href="reportList.mana?currentPage=${ pi.currentPage+1 }">Next</a></li>
				       	</c:otherwise>
			        </c:choose>
			    </c:if>
            </ul>
        </div>
        <br>
    </div>
</body>
</html>