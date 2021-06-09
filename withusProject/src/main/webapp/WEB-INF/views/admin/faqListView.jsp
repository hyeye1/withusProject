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
    
    .according_list>li{
		list-style: none;
	}
	
</style>
</head>
<body>
	
	<!-- 6/9 윤경 생성-->
    <!-- 메뉴바 포함 -->
    <jsp:include page="../common/manaHeader.jsp"/>

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

        <button type="button" class="btn btn-secondary" align="right">등록</button>

        <!-- 게시글 없을 시 -->
        <div class="faqN" align="center">
            <p>FAQ가 없습니다. 등록해주세요.</p>
        </div>

        <!-- 게시글 있을 시-->
        <div class="faqY">
            <div class="center" style="width:80%">
                <ul class="accodrding_list">
                    <li>
                        <button type="button" class="btn btn-light" data-toggle="collapse" data-target="#demo">
                            Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 카테고리 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            FAQ제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ▼
                        </button>
                        <div id="faqContent" class="collapse">
                            <button type="button" class="btn btn-warning">수정</button>
                            <button type="button" class="btn btn-danger">삭제</button> <br>
                            
                            가치가자는 펀딩 목록에 따라 무료 혜택이 적용될 수 있습니다. <br>
                            기본 배송비는 3,000원이며 도서산간지역은 5,000원이 부과됩니다.
                            
                        </div>
                    </li>
                    <li>
                        <button type="button" class="btn btn-light" data-toggle="collapse" data-target="#demo">
                            Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 카테고리 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            FAQ제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ▼
                        </button>
                        <div id="faqContent" class="collapse">
                            <button type="button" class="btn btn-warning">수정</button>
                            <button type="button" class="btn btn-danger">삭제</button> <br>
                            
                            가치가자는 펀딩 목록에 따라 무료 혜택이 적용될 수 있습니다. <br>
                            기본 배송비는 3,000원이며 도서산간지역은 5,000원이 부과됩니다.
                            
                        </div>
                    </li>
                    <li>
                        <button type="button" class="btn btn-light" data-toggle="collapse" data-target="#demo">
                            Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 카테고리 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            FAQ제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ▼
                        </button>
                        <div id="faqContent" class="collapse">
                            <button type="button" class="btn btn-warning">수정</button>
                            <button type="button" class="btn btn-danger">삭제</button> <br>
                            
                            가치가자는 펀딩 목록에 따라 무료 혜택이 적용될 수 있습니다. <br>
                            기본 배송비는 3,000원이며 도서산간지역은 5,000원이 부과됩니다.
                            
                        </div>
                    </li>
                </ul>
            </div>
        </div>
	</div>

</body>
</html>