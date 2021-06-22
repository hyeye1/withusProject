<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="stylesheet" href="https://ssl.pstatic.net/t.static.blog/mylog/versioning//css/admin/blogadmin-642f70d_https.css" type="text/css">
<script type="text/javascript" language="javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//common/lib/jindo/1.5.2/jindo.all-4ca233c_https.js" charset="UTF-8"></script>
<script type="text/javascript" language="javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//common/lib/jindo/agent.ie11/agent.ie11-6694cec_https.js"></script>
<script type="text/javascript" language="javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//js/admin/jindo/jindo.Component-c10fdb8_https.js"></script>
<script type="text/javascript" language="javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//js/admin/jindo/jindo.UIComponent-36c0ca7_https.js"></script>
<script type="text/javascript" language="javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//js/admin/jindo/jindo.Timer-30c3e89_https.js"></script>
<script type="text/javascript" language="javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//js/admin/jindo/jindo.LayerManager-aae3a13_https.js"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//common/js/LocalStorage-f4df393_https.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//common/js/common-369ba90_https.js"></script>
<script type="text/javascript">var LH = new LH_create(); window.onload = LH_exec;</script>
<script type="text/javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//js/admin/util-28777a5_https.js"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning/EasyMakeBlog-467631909_https.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//js/admin/AdminMain-1d32ba3_https.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//js/admin/AdminSkinPreviewController-79e3852_https.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//js/admin/AdminBlogMarket-9e86cfd_https.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning//common/js/util/TripleSRequester-e0db8c4_https.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8" src="https://ssl.pstatic.net/static.gn/templates/gnb_utf8.nhn?20210622"></script>
<script src="https://ssl.pstatic.net/static.gn/js/clickcrD.js" id="gnb_clickcrD" charset="utf-8"></script>
-->
<title>Admin With Us</title>
<style>
	.content-title{padding-bottom:20px;border-bottom:2px solid #353535;font-family:nanumgothic,sans-serif;font-size:20px;line-height:1;font-weight:700;color:#000}
	.content-title .submenu{position:absolute;top:4px;right:4px;color:#d6d6d6;font-weight:400}
	.content-title .submenu a{font-size:12px;color:#8e8e8e;text-decoration:underline}
	.table1{width:100%;border-collapse:collapse}
	.table1 th,.table1 td{padding:19px 4px 15px;border-bottom:1px solid #efefef;vertical-align:top}
	.table1 th{text-align:left}
	.table1 .e th,.table1 .e td{border-bottom-color:#999}
	.uppermenu_admin{width:728px}
	.uppermenu_admin .admin_category_menu{margin:18px 0 5px}
	.uppermenu_admin .n_category_list{width:227px;vertical-align:top}
	.uppermenu_admin .n_admin{vertical-align:top}
	.uppermenu_admin ul.tree1{-webkit-tap-highlight-color:rgba(0,0,0,0)}
	.category_list_area .category_list .tree { border: 1px solid #6f6f65;}
	.category_list_area * { margin: 0; padding: 0;}

</style>
</head>
<body>
	
	<!-- 6/9 윤경 생성, 수정 예정 (틀만 잡아놈) -->
	<!-- 6/10 윤경 라디오버튼 수정 -->
	<!-- 6/22 윤경 전체적 div 수정-->

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
	
	        <h3 class="prologue">카테고리 관리 / 설정</h3>
			<table cellspacing="0" class="uppermenu_admin">
				<tbody><tr>
				<td class="category_list">
					<div class="category_list_area">
						<div class="list_btn">
							<a href="#"><img width="87" height="20" alt="카테고리 추가" src="https://blogimgs.pstatic.net/nblog/admin50/btn_add_category.gif" class="_addCategoryView _nclk(edt_categoryadd)"></a>
							<a href="#" id="deleteBtn" style="float:right;"><img width="44" height="20" class="_deleteCategoryView _nclk(edt_delete)" alt="삭제" src="https://blogimgs.pstatic.net/nblog/admin50/btn_del_category.gif"></a>
						</div>
						<div class="category_list">
							<div class="tree">
								<!-- 카테고리 뷰 -->
								<!--  style의 height로 높이 조절 -->
								<ul style="height:373px;" id="tree">
									<li class="first-child tree-node tree-selected">
										<div tabindex="0" class="tree-div-selected"><label><span>카테고리 전체보기</span></label>
										<button class="tree-button" style="display: none;">+</button>
										</div>
									</li>
									<li class="tree-tree-data-16243419484066762070 tree-node  _nclk(edt_blog.category)">
										<div class="drag-label list tree-has-child" tabindex="0">
											<label><span>하루의,</span></label>
											<img width="22" height="13" style="display:none;" class="basic" alt="대표" src="https://ssl.pstatic.net/static/blog/admin/icon-representative.gif">
										</div>
									</li>
									<li class="tree-tree-data-16243419484104352674 tree-node  _nclk(edt_blog.category)">
										<div class="drag-label list tree-has-child" tabindex="0"><label><span>취준생일기</span></label>
											
											<img width="22" height="13" style="display:none;" class="basic" alt="대표" src="https://ssl.pstatic.net/static/blog/admin/icon-representative.gif">
										</div>
									</li>
									
									<li class="tree-tree-data-16243419484137001758 tree-node  _nclk(edt_blog.category)">
										<div class="drag-label list" tabindex="0">
											<label><span>워킹홀리데이</span></label>
											<button class="tree-button" style="display: none;">접기 or 펼치기</button>
											<img width="22" height="13" style="display:none;" class="basic" alt="대표" src="https://ssl.pstatic.net/static/blog/admin/icon-representative.gif">
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>		
				</td>
				<td class="n_admin">
					<div class="category_add">
						<dl>
						<dt class="category_name">카테고리명</dt>
						<dd class="category_name">
							<div>
								<input type="text" onkeyup="onKeyUp(this.value);" onfocus="" maxlength="16" class="inp _nclk(edt_categoryname)" id="categoryName"> 
								<span title="글 수" id="postCnt" class="t_amount"></span>
							</div>
							<input type="hidden" name="" id="category_name_hidden">
							<div class="info">
								
							</div>
						</dd>	

						<br><hr><br>

						<dt class="category_sort">기본태그 설정</dt>
						<dd class="category_sort">
							<div>
								<input type="text" onkeyup="onKeyUp(this.value);" onfocus="" maxlength="" class="inp _nclk(edt_tag)" id="basicTag">
								
							</div>
						</dd>
						
						</dl>
						<div class="clear"></div>
					</div>
				</td>
			</tr>
			</tbody>
		</table>

		<div class="action1" align="center">
			<span class="btn btn1">
				<input type="submit" class="submitTtn" id="submitButton" value="확인">
			</span>
		</div>
    
    </div>

</body>
</html>