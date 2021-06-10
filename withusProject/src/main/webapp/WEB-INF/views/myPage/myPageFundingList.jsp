<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        
        /*div{border: 1px solid red; box-sizing: border-box;}*/
        .wrap{width: 1000px; height: 800px; margin: auto;}

        .wrap>div{width: 100%;}

        /* 메뉴 아래 선 */
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 80%;
            
        }

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%;}

        /*큰제목*/
        p{font-size: 23px; font-weight: bolder;}


        
        /* fundingList content */
        .fundingList #content_1{height: 80%; margin-top: 50px; width: 80%;}
        .fundingList #content_2{height: 10%; width: 80%;}
        
        
        /* 주문내역 테이블 */
        .fundingList #orderNo{width: 15%;}
        .fundingList #product{width: 45%}
        .fundingList #price{width: 15%;}
        .fundingList #status{width: 10%}
        .fundingList #orderDate{width: 15%}
       
        .fundingList table{text-align: center;}


        /* 페이징 */
        #pagingArea{width:fit-content; margin:auto;}


    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 나의 펀딩 내역  -->
        <div id="mypage">
            <div id="content" class="fundingList">
                <p>나의 펀딩 내역</p>
                <div id="underLine"></div>
                
                
                <!-- 나의 펀딩 목록-->
                
                <div id="content_1">
                    <table class="table table-hover">
                        <thead class="thead-light">
                          <tr>
                            <th id="orderNo">주문번호</th>
                            <th id="product">펀딩 상품</th>
                            <th id="price">펀딩금액</th>
                            <th id="status">상태</th>
                            <th id="orderDate">구매일</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>123123</td>
                            <td>아이패드 거치대</td>
                            <td>20000</td>
                            <td>진행중</td>
                            <td>2021-06-01</td>
                          </tr>
                          <tr>
                            <td>123123</td>
                            <td>아이패드 거치대</td>
                            <td>20000</td>
                            <td>진행중</td>
                            <td>2021-06-01</td>
                          </tr>
                          <tr>
                            <td>123123</td>
                            <td>아이패드 거치대</td>
                            <td>20000</td>
                            <td>진행중</td>
                            <td>2021-06-01</td>
                          </tr>
                        </tbody>
                      </table>       
                    
                </div>
                
                
                <!-- 페이징 -->
                <div id="content_2">
                    <div id="pagingArea">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                          </ul>
                    </div>
                </div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>