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
<title>Admin With Us</title>
<style>
	.noticeDetail>tr>th{
		align-content: center;
	}
	.noticeDetail{
		border:1px solid black;
	}
</style>
</head>
<body>

    <!-- 메뉴바 포함 -->
    <jsp:include page="../../../common/manaHeader.jsp"/>

    <h2>공지사항 상세보기</h2>
    <hr><br>

	<div class="container">

		<table class="table table-bordered noticeDetail">
			<thead>
			  <tr>
				<th width="200" height="35">제목</th>
	            <td  width="800" style="padding-left: 10px;">${ n.noticeTitle }</td>
			  </tr>
			</thead>
			<tbody>
				<tr>
					<th height="35">작성일</th>
					<td style="padding-left: 10px;">${ n.createDate }</td>
				</tr>
				<tr>
					<td colspan="2"><textarea required style="width:1000px; height: auto;">${ n.noticeContent }</textarea></td>
				</tr>
			</tbody>
		</table>

	    <br>

		<div class="edit" align="right" style="padding-right: 200px;">
			<a class="btn btn-success" onclick="postFormSubmit(1)">수정</a> &nbsp;
		    <a class="btn btn-warning" onclick="postFormSubmit(2)">삭제</a>
		</div>

	    <br><br>
	    
	    <form id="postForm" action="" method="post">
			<input type="hidden" name="nno" value="${ n.noticeNo }">
			<input type="hidden" name="filePath" value="${ n.noticeChangename }" >
		</form>
	    
	    <script>
			function postFormSubmit(num){
				if(num == 1){// 수정 클릭
					$("#postForm").attr("action", "ManaUpdateForm.no").submit();
				} else { // 삭제 클릭
					$("#postForm").attr("action", "ManaDelete.no").submit();
				}
			}
		</script>

		<div class="list" align="center">
			<a class="btn btn-secondary" href="ManaList.no">목록</a>
		</div>
    </div>
	

</body>
</html>