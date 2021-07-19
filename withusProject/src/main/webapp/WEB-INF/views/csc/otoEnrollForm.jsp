<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #enrollForm>table{width:100%;}
        #enrollForm>table *{ margin:5px;}
</style>
</head>
<body>

    <!-- 해더바 포함 -->
    <jsp:include page="../common/header.jsp"/>

    <div class="container">
        <div class="content">
            <br><br>
            <div class="innerOuter">
                <h3><b>문의글 작성하기</b></h3>
                <hr>
				<c:if test="${ !empty loginUser }">
	                <form id="enrollForm" method="post" action="insert.oto" enctype="multipart/form-data">
	                    <table class="table table-bordered" align="center">
	                		<input type="hidden" id="memberNo" class="form-control" name="memberNo" value="${ loginUser.memberNo }">    
	                        
	                        <tr>
	                            <th><label for="title">제목</label></th>
	                            <td><input type="text" id="title" class="form-control" name="otoTitle" required></td>
	                        </tr>
	                        <tr>
	                        	<th><label for="cate">문의유형</label></th>
	                        	<td>
	                        		<select id="otoCat" name="otoCat">
	                        			<option value="배송 문의">배송 문의</option>
	                        			<option value="상품 문의">상품 문의</option>
	                        			<option value="결제 수단 문의">결제 수단 문의</option>
	                        			<option value="파트너 문의">파트너 문의</option>
	                        			<option value="리워드 문의">리워드 문의</option>
	                        			<option value="기타 문의">기타 문의</option>
	                        		</select>
	                        	</td>
	                        </tr>
	                        <tr>
	                            <th><label for="upfile">첨부파일</label></th>
	                            <td><input type="file" id="cscUpfile" class="form-control-file border" name="cscUpfile"></td>
	                        </tr>
	                        <tr>
	                            <th colspan="2"><textarea class="form-control" required name="otoContent" id="content" style="height: 500px;"></textarea></th>
	                        </tr>
	                    </table>
	                    <br>
	
	                    <div align="center">
	                        <button type="submit" class="btn btn-primary">등록하기</button>
	                        <button type="reset" class="btn btn-danger">취소하기</button>
	                    </div>
	                </form>
                </c:if>
                <c:if test="${ empty loginUser }">
					<h4 align="center">로그인 후 이용해주세요.</h4>                
                </c:if>
            </div>
            <br><br>
        </div>
    </div>
    <br><br>
    
    <!-- Modal -->
    
    

    <!-- 푸터바 포함 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>