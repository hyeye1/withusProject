<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<!-- jQuery 라이브러리 -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
			<!-- 부트스트랩에서 제공하고 있는 스타일 -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
			<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

			<style>
				@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
				a {
					text-decoration: none;
				}

				a:hover {
					cursor: pointer;
					text-decoration: none;
				}

				.headerOuter {
					width: 1200px;
					margin: auto;
					height: 117px;
					padding: 10px;
				}
				.headerOuter a,
				.headerOuter button {
					color: rgb(64, 64, 64);
				}
				.projectBtn{
					font-weight: 600;
					font-size: 17px;
				}
				.headerLeft {
					float: left;
					margin-top: 33px;
					margin-left: 30px;
				}

				.headerCenter {
					float: left;
					margin-left: 158px;
				}

				#searchIcon {
					margin-top: 28px;
					margin-left: 270px;
					width: 31px;

				}

				.headerRight {
					float: right;
					margin-right: 26px;
					margin-top: 33px;
				}
				.headerRight>a{
					padding: 0 3px;
				    font-size: 1.03rem;
				    font-weight: 900;
				}

				/*  카테고리 */
				.category {
					position: relative;
					float: left;
				}

				.cateToggle {
					border: none;
					outline: none;
					background: none;
				}

				#cateContent {
					position: absolute;
					width: 1200px;
					height: 250px;
					background-color: white;
					padding: 30px 40px;
				}

				.cateLeft{float: left; width: 20%; margin-top: 0.4rem;}
				.cateCenter,
				.cateRight {
					float: left;
					width: 40%;
					position: relative;
				}
				.cateCenter {
					padding: 0 75px;
					border-left: 1px solid lightgray;
				}
				.cateRight {
					position: relative;
					top: 25%;
				}

				.sub1,
				.sub2 {
					float: left;
					width: 50%;
				}

				.cateRight div {
					float: left;
				}

				.tagBox {
					margin-bottom: 0.75rem;
					display: flex;
					-webkit-box-align: center;
					align-items: center;
					margin: 0px 0.4rem 0px 0px;
					border-radius: 3px;
					padding: 0.5em 0.7em;
				}
				.tagBox>a{
					color: white;
				    font-size: 1.0rem;
				    font-weight: bolder;
				}

				.style_1{
					margin-bottom: 0.35rem;
					display: flex;
					align-items: center;
					font-size: 1.2rem;
					font-weight: bolder;
				}
				.style_2{
					margin-bottom: 0.35rem;
					display: flex;
					align-items: center;
				}
				.style_2a{
					font-size: 1.0rem;
    				font-weight: 540;
				}
				.style_3{
					font-size: 14px;
					color: grey;
					margin-bottom: 12px;
				}

				.hash{position: absolute;}
				a:hover {
					color: rgb(117, 117, 117);
    				cursor: pointer;
    			}
			</style>
		</head>

		<body>
			<div class="headerOuter">

				<div class="headerLeft">

					<button class="cateToggle projectBtn" type="button" onclick="dropCate();" style="color: rgb(52, 152, 219);">
						<img src="${ pageContext.request.contextPath }/resources/images/catIcon.PNG" width="25px"
							style="margin-top: -6px;">
						프로젝트 둘러보기
					</button>
					<a href="register.fd" class="projectBtn"> 프로젝트 올리기</a>

					<div id="cateContent" style="display: none; z-index: 100;">
						<div class="cateLeft">
							<div class="style_1"><a href="#">모든 프로젝트</a></div>
							<div class="style_1"><a href="#">인기 추천 프로젝트</a></div>
							<div class="style_1"><a href="#">성공 임박 프로젝트</a></div>
							<div class="style_1"><a href="#">신규 추천 프로젝트</a></div>
							<div class="style_1"><a href="#">공개예정 프로젝트</a></div>
						</div>

						<div class="cateCenter">
							<div clear="both" class="style_3">카테고리</div>
							<div class="sub1">
								<div class="style_2"><a class="style_2a" href="#">전체보기</a></div>
								<div class="style_2"><a class="style_2a" href="#">테크/가전</a></div>
								<div class="style_2"><a class="style_2a" href="#">패션/잡화</a></div>
								<div class="style_2"><a class="style_2a" href="#">뷰티</a></div>
								<div class="style_2"><a class="style_2a" href="#">푸드</a></div>

							</div>
							<div class="sub2">
								<div class="style_2"><a class="style_2a" href="#">홈리핑</a></div>
								<div class="style_2"><a class="style_2a"a href="#">디자인 소품</a></div>
								<div class="style_2"><a class="style_2a" href="#">여행/레저</a></div>
								<div class="style_2"><a class="style_2a" href="#">스포츠/모빌리티</a></div>
								<div class="style_2"><a class="style_2a" href="#">반려동물</a></div>

							</div>

						</div>
						<div class="cateRight">
							<div clear="both" class="style_3">태그</div> <br>
							<div class="hash">
								<div class="tagBox"><a href="#">#좋아요 </a></div>
								<div class="tagBox"><a href="#">#친환경 </a></div>
								<div class="tagBox"><a href="#">#인형놀이 </a></div>
								<div class="tagBox"><a href="#">#얼리버드 </a></div>
							</div>
						</div>

						<script>


							function dropCate() {
								//alert("작동되니?");
								var click = document.getElementById("cateContent");
								if (click.style.display === "none") {
									click.style.display = "block";
								} else {
									click.style.display = "none"
								}

								var result = document.getElementsByClassName("tagBox");
								var tagColor = ["rgb(190, 190, 190)", "rgba(135, 163, 224, 0.8)", "rgba(211, 182, 37, 0.65)", "rgba(152, 31, 102, 0.57)"];

								for (var i = 0; i < tagColor.length; i++) {
									var num = Math.floor(Math.random() * tagColor.length);

									//중복제거 추가

									result[i].style.backgroundColor = tagColor[num];
								}

							}
						</script>
					</div>
				</div>

				<div class="headerCenter">
					<a href="${ pageContext.request.contextPath }"><img
							src="${ pageContext.request.contextPath }/resources/images/logo.PNG" width="165px"
							id="logoImg"></a>
				</div>

				<input type="image" src="${ pageContext.request.contextPath }/resources/images/searchIcon.PNG"
					id="searchIcon">


				<c:if test="${ !empty alertMsg }">
					<script>
						alert("${alertMsg}");
					</script>
<<<<<<< HEAD
			</div>
		</div>
		
		<div class="headerCenter">
			<a href="${ pageContext.request.contextPath }"><img src="${ pageContext.request.contextPath }/resources/images/logo.PNG" width="165px" id="logoImg" ></a>
		</div>
        
        <input type="image" src="${ pageContext.request.contextPath }/resources/images/searchIcon.PNG" id="searchIcon">
        
        
		<c:if test="${ !empty alertMsg }">
			<script>
				alert("${alertMsg}");
			</script>
			<c:remove var="alertMsg" scope="session"/>
		</c:if>
		<c:choose>
            <c:when test="${ empty loginMember }">
            
				<!-- 로그인전 -->
				<div class="headerRight">
					<a href="login.me">로그인</a>
					<a href="enrollForm.me"> 회원가입</a>
					<img src="${ pageContext.request.contextPath }/resources/images/memberIcon.PNG" width="30px" style="margin-left: -3px; margin-top: -6px;">
				</div>
				</c:when>
	    	    <c:otherwise>
				
					<!-- 로그인후 -->
					<div class="headerRight" style="display:none">
						<label>${ loginMember.memberName }님 </label>
						<a href="logout.me">로그아웃</a>
						<a href=""> 마이페이지</a>
						<img src="${ pageContext.request.contextPath }/resources/images/memberIcon.PNG" width="30px" style="margin-left: -3px; margin-top: -6px;">
					</div>
					
				</c:otherwise>
         </c:choose>
		
					<c:remove var="alertMsg" scope="session" />
				</c:if>
				<c:choose>
					<c:when test="${ empty loginUser }">

						<!-- 로그인전 -->
						<div class="headerRight">
							<a href="login.me">로그인</a>
							<a href="enrollForm.me"> 회원가입</a>
							<img src="${ pageContext.request.contextPath }/resources/images/memberIcon.PNG" width="30px"
								style="margin-left: -3px; margin-top: -6px;">
						</div>
					</c:when>
					<c:otherwise>

						<!-- 로그인후 -->
						<div class="headerRight" style="display:none">
							<a href="logout.me">로그아웃</a>
							<a href=""> 마이페이지</a>
							<img src="${ pageContext.request.contextPath }/resources/images/memberIcon.PNG" width="30px"
								style="margin-left: -3px; margin-top: -6px;">
						</div>

					</c:otherwise>
				</c:choose>

				<!-- 관리자 -->
				<div class="headerRight" style="display:none">
					<a href="logout.me">로그아웃</a>
					<a href=""> 관리자</a>
					<img src="resources/images/memberIcon.PNG" width="30px"
						style="margin-left: -3px; margin-top: -6px;">
				</div>
			</div>

		</body>

		</html>