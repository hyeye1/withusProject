<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>With Us, Admin</title>
<style>

    .enrollBtn{
        padding-right: 20%;
    }
    .according_list{
		list-style: none;
	}
    .titleBtn span{
        display:inline-block;
        box-sizing: border-box;
    }
	
</style>
</head>
<body>
	
	<!-- 6/9 윤경 생성-->
    <!-- 6/12 윤경 수정 -->
    <!-- 6/14 윤경 수정 : according_list 간격 조정 -->

    <!-- 메뉴바 포함 -->
    <jsp:include page="../../../common/manaHeader.jsp"/>

    <h2>FAQ</h2>
    <hr><br>

	<div class="container">
        <div class="btn" align="center">
            <button type="button" class="btn btn-outline-secondary" style="height: 50px; width: 150px;">전체보기</button> &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-secondary" style="height: 50px; width: 150px;">펀딩상품관련</button> &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-secondary" style="height: 50px; width: 150px;">배송관련</button> &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-secondary" style="height: 50px; width: 150px;">교환/반품관련</button> &nbsp;&nbsp;
            <button type="button" class="btn btn-outline-secondary" style="height: 50px; width: 150px;">기타관련</button>
        </div>
        <br><br><br>

        <div class="enrollBtn" align="right">
            <button type="button" class="btn btn-secondary" align="right">등록</button>
        </div>

        <!-- 게시글 없을 시 -->
        <div class="faqN" align="center">
            <p>FAQ가 없습니다. 등록해주세요.</p>
        </div>

        <!-- 게시글 있을 시-->
        <div class="faqY" align="center">
            <div class="faqCon">
                <ul class="according_list">
                    <li> <!-- 얘 규격? 좀 어케 해야됨 ㅡㅡ -->
                        <button type="button" class="btn btn-light titleBtn" data-toggle="collapse" data-target="#faqContent" style="width:80%;">
                            <span style="width: 25%;">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 카테고리</span> 
                            <span style="width: 60%;">FAQ 제목 </span>
                            <span style="width: 15%;">▼</span>
                        </button>
                        <div id="faqContent" class="collapse" style="background-color: rgb(224,224,224); width:80%;">
                            
                            <!-- 관리자 페이지만 보이는 버튼-->
                            <div class="faqConBtn" align="right">
                                <button type="button" class="btn btn-warning"><a herf="">수정</a></button>
                                <button type="button" class="btn btn-danger">삭제</button> <br>
                            </div>


                            <p align="left" style="padding-left: 5%;">
                                <br>
                                가치가자는 펀딩 목록에 따라 무료 혜택이 적용될 수 있습니다. <br>
                                기본 배송비는 3,000원이며 도서산간지역은 5,000원이 부과됩니다. <br><br><br>
                            </p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
	</div>

    <!-- 스크롤 올라가는 페이징? -->

    <br><br>

</body>
</html>