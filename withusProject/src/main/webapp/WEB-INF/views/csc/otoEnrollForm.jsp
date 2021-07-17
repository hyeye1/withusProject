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
                <h3>게시글 작성하기</h3>
                <hr>

                <form id="enrollForm" method="post" action="insert.oto" enctype="multipart/form-data">
                    <table class="table table-bordered" align="center" border="1px;">
                        <tr>
                            <th><label for="title">제목</label></th>
                            <td><input type="text" id="title" class="form-control" name="otoTitle" required></td>
                        </tr>
                        <tr>
                            <th><label for="writer">작성자</label></th>
                            <td><input type="text" id="memberNo" class="form-control" name="memberNo" value="${ loginUser.memberNo }" readonly></td>
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
            </div>
            <br><br>
        </div>
    </div>

    <br><br>

    <!-- 푸터바 포함 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>