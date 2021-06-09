<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin With Us</title>
</head>
<body>

	
    <!-- 6/9 윤경 생성, 수정 예정 -->
    <!-- 메뉴바 포함 -->
    <jsp:include page=""/>

    <h2>펀딩 관리</h2>
    <hr><br>

    <form action="test1">
        <select>
            <option value="ing">진행중인 펀딩</option>
            <option value="end">종료된 펀딩</option>
        </select>
    </form>
    <form action="test2">
        <select>
            <option value="best">인기순</option>
            <option value="deadline">마감임박순</option>
            <option value="newest">최신순</option>
        </select>
    </form>
    <br><br>


    <!-- 11행 9열 표만들기인데 예시는 5개만 -->
    <table border="1" id="listView">
        <tr style="background-color: rgb(224, 224, 224);">
            <th width="50" height="30">글번호</th>
            <th width="110">카테고리</th>
            <th width="500">제목</th>
            <th width="100">파트너명</th>
            <th width="60">달성률</th>
            <th width="100">마감일</th>
            <th width="70">좋아요<br>갯수</th>
            <th width="60">펀딩상태<br>(Y/N)</th>
            <th width="60">승인상태<br>(Y/N)</th>
        </tr>
        <tr>
            <td>1123</td>
            <td>테크/가전</td>
            <td>펀딩 제목 입니다. 펀딩 제목 입니다.</td>
            <td>가파트너</td>
            <td>0%</td>
            <td>2021-09-02</td>
            <td>0</td>
            <td>N</td>
            <td>N</td>
        </tr>
        <tr>
            <td>1122</td>
            <td>뷰티</td>
            <td>펀딩 제목 입니다. 펀딩 제목 입니다.</td>
            <td>나파트너</td>
            <td>0%</td>
            <td>2021-08-16</td>
            <td>2</td>
            <td>Y</td>
            <td>Y</td>
        </tr>
        <tr>
            <td>1121</td>
            <td>디자인소품</td>
            <td>펀딩 제목 입니다. 펀딩 제목 입니다.</td>
            <td>다파트너</td>
            <td>3%</td>
            <td>2021-07-26</td>
            <td>33</td>
            <td>Y</td>
            <td>Y</td>
        </tr>
        <tr>
            <td>1120</td>
            <td>스포츠/모빌리티</td>
            <td>펀딩 제목 입니다. 펀딩 제목 입니다.</td>
            <td>라파트너</td>
            <td>12%</td>
            <td>2021-07-22</td>
            <td>44</td>
            <td>Y</td>
            <td>Y</td>
        </tr>
        <tr>
            <td>1119</td>
            <td>패션/잡화</td>
            <td>펀딩 제목 입니다. 펀딩 제목 입니다.</td>
            <td>마파트너</td>
            <td>122%</td>
            <td>2021-07-01</td>
            <td>5555</td>
            <td>Y</td>
            <td>Y</td>
        </tr>
    </table>

    <!-- 페이징바 추가할 것 -->

	

</body>
</html>