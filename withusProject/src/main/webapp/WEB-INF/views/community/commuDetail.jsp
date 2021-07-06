<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <title>Document</title>
            <style>
                @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

                /* 메뉴바 */
                body {
                    margin: 0;
                    padding: 0;

                }

                div,
                p,
                a {
                    box-sizing: border-box;
                    font-family: 'Noto Sans KR', sans-serif;
                    font-size: 14.5px;
                    color: rgb(90, 86, 86);
                }

                a {
                    text-decoration: none;
                }

                #menubar {
                    height: 100%;
                    background-color: rgb(240, 244, 245);
                }

                #menubar li:hover {
                    background-color: rgb(71, 189, 250);
                }

                #menubar a {
                    display: block;
                }

                #menubar a:hover {
                    color: white;
                }

                #menubar>ul {
                    list-style-type: none;
                    padding: 0;
                    padding-top: 1rem;
                    text-align: center;
                    width: 100%;
                    height: 100vh;
                }

                .menubar_admin p {
                    font-weight: 600;
                    font-weight: 900;
                }

                .menubar_admin a {
                    margin: 10px;
                    color: rgb(71, 189, 250);
                    font-weight: 500;
                }

                /* 시작 */
                #page_main {
                    display: flex;
                    height: 1000px;
                }

                #page_main .page-wraper__side {
                    flex: 2;
                }

                #page_main .page-wraper__table {
                    flex: 8;
                    padding: 1rem;
                    position: relative;

                }

                .content {
                    /* background-color:rgb(247, 245, 245); */
                    width: 80%;
                    margin: auto;
                }

                .innerOuter {
                    border: 1px solid lightgray;
                    width: 80%;
                    margin: auto;
                    padding: 5% 15%;
                    background: white;
                }

                table * {
                    margin: 5px;
                }

                table {
                    width: 100%;
                }

                .ray1 {
                    display: flex;
                }
            </style>
        </head>

        <body>
            <!-- 헤더 -->
            <jsp:include page="../common/header.jsp" />
			<br><br><br>
            <!-- 사이드메뉴바 -->
            <div id="page_main">
                <section class="page-wraper__side">
                    <article>
                        <div id="menubar">
                            <ul id="menubar_member" class="menubar_admin">
                                <p>커뮤니티</p>
                                <li><a href="">자유</a></li>
                                <li><a href="">질문</a></li>
                                <li><a href="">공구모집</a></li>
                            </ul>
                        </div>
                    </article>
                </section>
                <section class="page-wraper__table">
                    <div class="content">
                        <br><br>
                        <div class="innerOuter">

                            <a class="btn btn-secondary" style="float:right" href="commu.main">목록으로</a>
                            <br><br>
                            <table id="contentArea" align="center" class="table">
                                <tr>
                                    <div class="ray1">
                                        <!-- <div id="nav1_1">
                                            <img src="${ pageContext.request.contextPath }/resources/images/memberIcon.PNG"
                                                width="50" height="50" class="rounded-circle">
                                        </div>
                                        <div id="nav1_2">
                                            <b class="name">김미미</b>
                                            <div class="date">
                                                2021-04-12 12:25:19
                                            </div>
                                        </div> -->
                                    </div>
                                </tr>
                                <br>
                                <tr>
                                    <th>작성자</th>
                                    <td>${ c.commuWriter }</td>
                                    <th>작성일</th>
                                    <td>${ c.commuCreate }</td>
                                </tr>
                                <tr>
                                    <th width="100">제목</th>
                                    <td colspan="3">${ c.commuTitle }</td>
                                </tr>
                                <tr>
                                    <th>첨부파일</th>
                                    <td colspan="3">
                                        <c:choose>
				                    		<c:when test="${ empty c.commuOrigin }">
					                    		첨부파일이 없습니다.
					                    	</c:when>
					                    	<c:otherwise>
					                        	<a href="${ c.commuChange }" download="${ c.commuOrigin }">${ c.commuOrigin }</a>
				                        	</c:otherwise>
				                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <p style="height:150px">${ c.commuContent }</p>
                                    </td>
                                </tr>
                            </table>
                            <br>

							<c:if test="${ loginUser.memberId eq c.commuWriter }">
					            <div align="center">
					                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
					                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
					                <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
					            </div><br><br>
					            
					            <form id="postForm" action="" method="post">
					            	<input type="hidden" name="bno" value="${ c.commuNo }">
					            	<input type="hidden" name="filePath" value="${ c.commuChange }"> 	
					            </form>
					            
					            <script>
					            	function postFormSubmit(num){
					            		if(num == 1){ // 수정하기 클릭시
					            			$("#postForm").attr("action", "updateForm.co").submit();
					            		}else{ // 삭제하기 클릭시
					            			$("#postForm").attr("action", "delete.co").submit();
					            		}
					            	}
					            </script>
				            </c:if>


                            <!-- 댓글 기능은 나중에 ajax 배우고 접목시킬예정! 우선은 화면구현만 해놓음 -->
                            <table id="commuReplyArea" class="table" align="center">
                                <thead>
                                    <tr>
                                        <c:choose>
				                    		<c:when test="${ empty loginUser }">
						                        <th colspan="2">
						                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%" readonly>로그인한 사용자만 사용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
						                        </th>
						                        <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
					                        </c:when>
					                        <c:otherwise>
						                        <th colspan="2">
						                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
						                        </th>
						                        <th style="vertical-align: middle"><button class="btn btn-secondary" onclick="addCommuReply();">등록하기</button></th>
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
                </section>
            </div>
            
             <script>
		    	$(function(){
		    		selectCommuReplyList();
		    		
		    		setInterval(selectCommuReplyList, 1000);
		    	})
		    	
		    	function addCommuReply(){
		    		
		    		if($("#content").val().trim().length != 0){ // 댓글작성되어있을 경우 => ajax로 댓글작성요청
		    			
		    			$.ajax({
		    				url:"rinsert.co",
		    				data:{
		    					comReContent:$("#content").val(),
		    					refCommuNo:${c.commuNo},
		    					comReWriter:'${loginUser.memberId}'
		    				},
		    				success:function(status){
		    					if(commuStatus == "success"){
		    						$("#content").val("");
		    						selectCommuReplyList();
		    					}
		    				},error:function(){
		    					console.log("댓글 작성용 ajax 통신 실패");
		    				}
		    			})
		    			
		    			
		    		}else{ // 댓글미작성 => alert
		    			alertify.alert("댓글 작성 해주세요!!");
		    		}
		    		
		    	}
		    	
		    	function selectCommuReplyList(){
		    		$.ajax({
		    			url:"rlist.co",
		    			data:{cno:${c.commuNo}},
		    			success:function(list){
		    				console.log(list);
		    			
		    				var value="";
		    				$.each(list, function(i, obj){
		    					value += "<tr>"
		    						   +    "<td>" + obj.comReWriter + "</td>"
		    						   +    "<td>" + obj.comReContent + "</td>"
		    						   +    "<td>" + obj.comReCreate + "</td>"
		    						   + "</tr>";
		    				})
		    				
		    				$("#commuReplyArea tbody").html(value);
		    				$("#comReCount").text(list.length);
		    				
		    			},error:function(){
		    				console.log("댓글 리스트 조회용 ajax실패");
		    			}
		    			
		    		})
		    	}
		    	
		    </script>
    
            <!-- 푸터바  -->
            <jsp:include page="../common/footer.jsp" />

        </body>

        </html>