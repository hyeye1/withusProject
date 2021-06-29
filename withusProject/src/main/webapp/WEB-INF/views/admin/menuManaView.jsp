<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">


<title>Admin With Us</title>
<style>
	#paginationBox{ padding : 10px 0px; }
</style>
</head>
<body>
	
	<!-- 6/9 윤경 생성, 수정 예정 (틀만 잡아놈) -->
	<!-- 6/10 윤경 라디오버튼 수정 -->
	<!-- 6/22 윤경 전체적 div 수정-->
	<!-- 6/28 윤경 전체적 ui 변경 -->

	<!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

	<div class="container">
	    <div class="outer" id="categoryConfigureView">
	        <br><br>
	
	        <h2 class="contnent-title">
				<span class="blind">메뉴 관리 </span>
			</h2>
	        <hr>
	
			<!-- 테이블로 묶어서 섹션 만든 후 라디오 그룹 만들기 -->
			<div class="cateList" style="display:inline-flex">
				<table cellspacing="0" class="table1">
					<colgroup>
					<col class="coll">
					<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">카테고리 정렬</th>
							<td>
								<input type="radio" name="cateRadio" id="bl_01" class="inputRadioCate3" onclick="$('frmPageSize').value=this.value;" value="3"> <label for="cate_01" class="mgr2">3개</label>
								<input type="radio" name="cateRadio" id="bl_02" class="inputRadioCate5" onclick="$('frmPageSize').value=this.value;" checked="checked" value="5"> <label for="cate_02" class="mgr2">5개</label>
								<input type="radio" name="cateRadio" id="bl_03" class="inputRadioCate7" onclick="$('frmPageSize').value=this.value;" value="7"> <label for="cate_03" class="mgr2">7개</label>
								<input type="radio" name="cateRadio" id="bl_04" class="inputRadioCate10" onclick="$('frmPageSize').value=this.value;" value="10"> <label for="cate_04">10개</label>
							</td>
						</tr>
					</tbody>
				</table>
				<br>				
			</div>
			<br><br>
			<div class="tagList" style="display: inline-flex;">
				<table cellspacing="0" class="table2">
					<colgroup>
					<col class="coll">
					<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">태그 정렬</th>
							<td>
								<input type="radio" name="tagRadio" id="bl_05" class="inputRadioTag1" onclick="$('frmPageSize').value=this.value;" value="1"> <label for="tag_01" class="mgr3">3개</label>
								<input type="radio" name="tagRadio" id="bl_06" class="inputRadioTag3" onclick="$('frmPageSize').value=this.value;" checked="checked" value="3"> <label for="tag_02" class="mgr3">5개</label>
								<input type="radio" name="tagRadio" id="bl_07" class="inputRadioTag5" onclick="$('frmPageSize').value=this.value;" value="5"> <label for="tag_03" class="mgr3">7개</label>
								<input type="radio" name="tagRadio" id="bl_08" class="inputRadioTag10" onclick="$('frmPageSize').value=this.value;" value="10"> <label for="tag_04">10개</label>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
			</div>

			<hr>

		<!-- Menu form -->
		<h4 class="mb-3">Menu Info</h4> 
		<div> 
			<form:form name="form" id="form" role="form" modelAttribute="menuVO" method="post" action="${pageContext.request.contextPath}/menu/saveMenu"> 
			<form:hidden path="mid" id="mid"/> 
			<div class="row"> 
				<div class="col-md-4 mb-3"> 
					<label for="code">Code</label> 
					<form:input path="code" id="code" class="form-control" placeholder="" value="" required="" /> <div class="invalid-feedback"> Valid Code is required. 

					</div> 
				</div>
				<div class="col-md-5 mb-3"> 
					<label for="codename">Code name</label> 
					<form:input path="codename" class="form-control" id="codename" placeholder="" value="" required="" /> 
					<div class="invalid-feedback"> Valid Code name is required. 

					</div> 
				</div> 
				<div class="col-md-3 mb-3"> 
					<label for="sort_num">Sort</label> 
					<form:input path="sort_num" class="form-control" id="sort_num" placeholder="" required="" /> 
				</div> 
			</div> 
			<div class="row"> 
				<div class="col-md-12 mb-3"> 
					<label for="comment">Comment</label> 
					<form:input path="comment" class="form-control" id="comment" placeholder="" value="" required="" /> 
				</div> 
			</div> 
		</form:form> 
	</div> 
	
	<div> 
		<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button> 
		<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button> 
		<button type="button" class="btn btn-sm btn-primary" id="btnInit">초기화</button> 
	</div> 
	
	<h4 class="mb-3" style="padding-top:15px">Menu List</h4> 
	
	<!-- List --> 
	<div class="table-responsive"> 
		<table class="table table-striped table-sm"> 
			<colgroup> 
				<col style="width:10%;" /> 
				<col style="width:15%;" /> 
				<col style="width:15%;" /> 
				<col style="width:10%;" /> 
				<col style="width:auto;" /> 
			</colgroup> 
			<thead> 
				<tr> 
					<th>menu id</th> 
					<th>code</th> 
					<th>codename</th> 
					<th>sort</th> 
					<th>command</th> 
				</tr> 
			</thead> 
			<tbody id="menuList"> 

			</tbody> 
		</table>
	 </div>

	 <script>
		$(function(){
			fn_showList();
		});

		function fn_showList(){
			var paramData = {};

			$.ajax({
				url : "${menuList}"
			  , type : "post"
			  , dataType : "json"
			  , data : paramData
			  , success : function(result){
				  console.log(result);

				if(result.status == "OK"){
					if(result.menuList.lenth > 0) {
						var list = result.menuList;
						var htmls = "";
						result.menuList.forEach(fucntion(e){
							htmls += '<tr>';
							htmls += '<td>' + e.catNo + '</td>';
							htmls += '<td>' + e.catName + '</td>';
							htmls += '<td>' + e.catTag + '</td>';
							htmls += '</tr>';	
						  });
					} else {
						console.log("조회실패");
					}
					$('#munuList').html(htmls);
				}
			}
			});

		}

	 </script>


		
    
    </div>

</body>
</html>