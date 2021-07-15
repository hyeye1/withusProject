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
    .form-group{
        display: inline-flex;
    }
    
</style>
</head>
<body>

    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp" />
    <br>

    <h3>신고관리</h3>
    <hr><br>

    <div class="container">
        
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
        
        
        <table class="table table-bordered" id="reportList" >
        <c:choose>
        	<c:when test="${ empty list }">
        		<div class="none"><p>조회 결과가 없습니다.</p></div>
        	</c:when>
        	<c:otherwise>        
					<thead class="tableHead">
					  <tr align="center" style="height: 10px; background-color: rgb(224, 224, 224); font-size:smaller ;">
						<th height="30">신고<br>번호</th>
						<th>회원<br>이름</th>
		                <th width="400">신고사유</th>
		                <th>게시물타입</th>
		                <th>게시물번호</th>
		                <th>회원상태</th>
		                <th>누적횟수</th>
		                <th>신고일</th>
		                <th>신고상태</th>
					  </tr>
					</thead>
					<tbody>
						<c:forEach var="r" items="${ list }">
							<tr align="center">
								<td class="rno">${ r.reportNo }</td>
			                    <td>${ r.memberName }</td>
			                    <td>${ r.reportContent}</td>
			                    <td>${ r.reportType}</td>
			                    <td>${ r.reportedNo }</td>
			                    <td>${ r.memberStatus}</td>
			                    <td>${ r.reportCount }</td>
			                    <td>${ r.reportDate }</td>
			                    <c:choose>
			                    	<c:when test="${ r.reportStatus eq 'N' }">
			                    		<td onclick="showModal(this);">진행중</td>
			                    	</c:when>
			                    	<c:when test="${ r.reportStatus eq 'Y' }">
			                    		<td>처리완료</td>
			                    	</c:when>
			                    </c:choose>
			                </tr>
			            </c:forEach>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
		
		<script>
			function showModal(clicked_element){
				var modal = document.getElementById("")
			}
		</script>
		
		
        <br>
        
        

		<!-- 페이징 처리 -->

    </div>
</body>
</html>