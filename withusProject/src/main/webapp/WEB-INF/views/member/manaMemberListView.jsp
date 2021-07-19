<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin With Us</title>

<!-- Load icon library(검색) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	*{box-sizing: border-box;} 
	
	/* 여기서만 css */
	.btn.btn-withus{background-color: #3498db; color: white;}
	.btn.btn-withus:hover{cursor: pointer; background-color: #2c83be; color: white;}
	
	/* search */
	.search_area {height: 60px;} 
	.search_area select{height: 36px; border-color: lightgray; outline: none;}
	
	.searchKey_1{width: 8%; position: relative; float: left;}
	.searchKey_2{width: 10%; float: left;}
	.searchKey_3{width: 50%; float: right; }
	
	.memberKeyword {width: 20%; float: left; }
	.input-group.search {width: 80%;}
	.btn.searchBtn{background-color: #3498db;}
	.fa.fa-search{color: white;}
	
	/* table */
    .none{margin: 100px 0;}
    
	tbody>tr:hover{cursor: pointer;}
	table *{text-align: center; font-size: 15px;}
	table.table-bordered td, table.table-bordered th {padding: .35rem;}
	.tableHead{background-color: #eaeaea;}
	.btn-sm{ border: none;outline: none;background-color: rgb(44, 62, 80);color: white;}
	.btn-sm:hover{outline: none; border: none;}
	
	/* delModal */
	.modal-header, .modal-footer{border: none;}
	.input-group.mb-s {width: 100%; padding: 0 50px;}
	button.btn.btn-secondary{ width: 47%; float: left;}
	button.btn.btn-withus{ width: 47%;}
	.modal-footer{height: 80%;}
	
	/* pagination */
	.paging_wrap{width:fit-content;margin:auto; margin-top: 50px;}
	.pagination a {
	    color: black;
	    float: left;
	    padding: 8px 16px;
	    text-decoration: none;
	    transition: background-color .3s;
	}
</style>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/manaHeader.jsp"/>
	
	<div class="content_wrap">
	    <div class="title" align="left">
	        <label>회원 조회</label>
	    </div>
	    <div class="container">
	
	        <div class="search_area">
	             <form action="searchMember.mana" name="searchForm">
	        	<input type="hidden" name="currentPage" value="1">
	             <div class="searchKey_1">
	                 <select name="partnerJoin" class="partnerJoin">
	                     <option value="memberAll">전체</option>
	                     <option value="supporter">서포터</option>
	                     <option value="partner">파트너</option>
	                 </select>
	             </div>
	             <div class="searchKey_2">
	                <select name="memberStatus" class="memberStatus">
	                    <option value="T">전체</option>
	                    <option value="Y">활동</option>
	                    <option value="N">탈퇴</option>
	                    <option value="A">관리자</option>
	                </select>
	            </div>
	
	            <div class="searchKey_3">
	                <div class="memberKeyword">
	                    <select name="memKey" class="memKey">
	                        <option value="all">전체</option>
	                        <option value="member_no">회원번호</option>
	                        <option value="member_name">이름</option>
	                        <option value="member_id">이메일</option>
	                    </select>
	                </div>
	
	                <div class="input-group search">
	                    <input type="text" name="keyword" value="${ keyword }" class="form-control" placeholder="검색어를 입력하세요">
	                    <div class="input-group-append">
	                        <button class="btn searchBtn" type="submit"><i class="fa fa-search"></i></button>
	                    </div>
	                </div>
	            </div>
				</form>
	        </div>
		
			 <c:if test="${ !empty partnerJoin or !empty memberStatus or !empty memKey }">
	        	<script>
	        	$(function(){
	        		$(".partnerJoin option[value=${partnerJoin}]").attr("selected", true);
	        		$(".memberStatus option[value=${memberStatus}]").attr("selected", true);
	        		$(".memKey option[value=${memKey}]").attr("selected", true);
	        		
	        		
	        	});
	        	</script>
	        </c:if>
	        
	
	        <table class="table table-bordered">
	        <c:choose>
           	 	<c:when test="${ empty mList }">
       	 			<div class="none"><h4 align="center">검색어와 일치하는 내용이 존재하지 않습니다:(</h4></div>
           	 	</c:when>
           	 	<c:otherwise>
		            <thead class="tableHead">
		                <tr>
		                    <th>회원번호</th>
		                    <th>이메일</th>
		                    <th>이름</th>
		                    <th>가입일</th>
		                    <th>파트너 유무</th>
		                    <th width="200">파트너명</th>
		                    <th>상태</th>
		                    <th>관리</th>
		                </tr>
		            </thead>
		            <tbody>
		             	<c:forEach var="m" items="${ mList }">
			                <tr>
			                    <td class="mno">${ m.memberNo }</td>
			                    <td>${ m.memberId }</td>
			                    <td class="mamName">${ m.memberName }</td>
			                    <td>${ m.memberCreateDate }</td>
			                    <td>${ m.partnerJoin }</td>
			                    <td>
			                    	<c:choose>
			                    	<c:when test="${!empty m.partnerName }">
			                    		${ m.partnerName }
			                    	</c:when>
			                    	<c:otherwise>
			                    		-
			                    	</c:otherwise>
			                    	</c:choose>
			                    </td>
			                    <td>${ m.memberStatus }</td>
			                    <td><button type="button" class="btn-sm" onclick="ajaxMemInfo();"	
			                    			data-toggle="modal" data-target="#delModal">
	                    			탈퇴</button></td>
			                </tr>
		                </c:forEach> 
		            </tbody>
	        	</c:otherwise>
	        </c:choose>
	        </table>
			
			<script>
	        	// 탈퇴 모달
	        	function ajaxMemInfo(){
        			var $memberNo = $(event.target).parent().siblings(".mno").text();
        			//console.log($memberNo);
        			
        			$.ajax({
	        			url:"memStatus.mana",
	        			data:{mno:$memberNo},
	        			success:function(ms){
	        				//console.log(ms);
	        				var result = "<div>"+ ms.memberName 
	        							+ " 회원을 탈퇴시키겠습니까?</div>"
	        									
	        				// value가 안넘어가...			
	        				// -> form태그 안에 회원탈퇴시 넘길 키값만 제시해두고 벨류값은 여기서 넘기기! 
	        				var mname = ms.memberName
   							//console.log(mname);  --> 성공!!
	        				
    						$(".modal-title").html(result);
	        				$(".mname").val(mname);
	        				
 	        			}, error: function(){
	        				console.log("모달 조회 실패")
	        			}
	        		});
        			
	        	}
	        	
	        </script>			
	    
	    </div>
	    
	
	    <!-- 탈퇴 클릭 시 모달  -->
	    <!-- The Modal -->
	    <form action="deleteMem.mana" method="">
			    <div class="modal fade" id="delModal">
			        <div class="modal-dialog modal-dialog-centered" style="width: 380px;">
			        <div class="modal-content">
			        	
			            <!-- Modal Header -->
			            <div class="modal-header">
			            	<h5 class="modal-title"> </h5>
			            	<button type="button" class="close" data-dismiss="modal">&times;</button>
			            </div>
			            
			            <!-- Modal body -->
			            <div class="modal-body">
		            		
		                     <div class="input-group mb-s" >
		                        <div class="input-group-prepend">
		                          <span class="input-group-text">회원상태</span>
		                        </div>
		                        <input class="mname" type="hidden" name="memName" value="">
		                        <select class="form-control" id=mStatus name="mStatus">
		                          <option value="Y">활동</option>
		                          <option value="N">탈퇴</option>
		                        </select>
		                         
		                    	</div>
			            	</div>
			            
				            <!-- Modal footer -->
				            <div class="modal-footer">
				            	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				            	<button type="submit" onclick="form.submit();" class="btn btn-withus" data-dismiss="modal">확인</button>
				            	<!-- ?궁금?  타입'submit'에서는 작동을 안하는데   클릭이벤트론 되네... 왜? -->
				            </div>
			        </div>
			        </div>
			    </div>	
       			</form>
	
	    
	    <br clear="both"><br>
	
	    <!-- 페이징 -->
	    <c:if test="${ !empty mList }">
		    <div class="paging_wrap">
		        <ul class="pagination">	 
		                    
		        	<c:choose>
		        		<c:when test="${ pi.currentPage eq 1 }">
			           		<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
			            </c:when>
			            <c:otherwise>
			            	<c:choose>
			            		<c:when test="${ empty partnerJoin or empty memberStatus or empty memKey  }">
					            	<li class="page-item"><a class="page-link" href="${ pi.currentPage - 1 }">이전</a></li>
					            </c:when>
					            <c:otherwise>
					            	<li class="page-item"><a class="page-link" href="searchMember.mana?currentPage=${pi.currentPage - 1}&partnerJoin=${partnerJoin}&memberStatus=${memberStatus}&memKey=${memKey}&keyword=${keyword}">이전</a></li>
			            		</c:otherwise>
			            	</c:choose>
			            </c:otherwise>
			    	</c:choose>     
			    	   
			    	   
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:choose>
							<c:when test="${ empty partnerJoin and empty memberStatus and empty memKey  }">
				            	<li class="page-item"><a class="page-link" href="memberListView.mana?currentPage=${p}">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="searchMember.mana?currentPage=${p}&partnerJoin=${partnerJoin}&memberStatus=${memberStatus}&memKey=${memKey}&keyword=${keyword}">${ p }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>		            
			            
			            
			        <c:choose> 
			        	<c:when test="${ pi.currentPage eq pi.maxPage }">
			           	 	<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
			           	</c:when>
			           	<c:otherwise>
			           		<c:choose>
			            		<c:when test="${ empty partnerJoin and empty memberStatus and empty memKey  }">
					           		<li class="page-item"><a class="page-link" href="${ pi.currentPage + 1 }">다음</a></li>
					            </c:when>
					            <c:otherwise>
					            	<li class="page-item"><a class="page-link" href="searchMember.mana?currentPage=${pi.currentPage + 1}&partnerJoin=${partnerJoin}&memberStatus=${memberStatus}&memKey=${memKey}&keyword=${keyword}">다음</a></li>
			            		</c:otherwise>
			            	</c:choose>
			           	</c:otherwise> 	
		        	</c:choose>
		        	
		        </ul>
		    </div>
		</c:if>
		
	</div>

</body>
</html>