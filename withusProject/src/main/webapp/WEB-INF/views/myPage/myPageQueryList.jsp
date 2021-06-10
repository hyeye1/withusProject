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

        
        /* query content */
        #query_1{height: 80%; margin-top: 50px; width: 80%;}
        #query_2{height: 10%; width: 80%;}
        
        
        
        /*큰제목*/
        p{font-size: 23px; font-weight: bolder;}

        
        /* 문의내역 테이블 */
        #replyTitle{width: 60%;}
        #replyDate{width: 20%}
        #replyStatus{width: 20%}
        
        


        /* 페이징 */
        #pagingArea{width:fit-content; margin:auto;}


    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 나의 문의내역  -->
        <div id="mypage">
            <div id="content">
                <p>나의 문의 내역</p>
                <div id="underLine"></div>
                
                
                <!-- 나의 문의 목록-->
                
                <div id="query_1">
                    <table class="table table-hover">
                        <thead class="thead-light">
                          <tr>
                            <th id="replyTitle">문의 제목</th>
                            <th id="replyDate">문의 날짜</th>
                            <th id="replyStatus">답변 상태</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>문의문의 합니다</td>
                            <td>2021-06-09</td>
                            <td>답변대기중</td>
                          </tr>
                          <tr>
                            <td>문문문문의</td>
                            <td>2021-06-06</td>
                            <td>답변 완료</td>
                          </tr>
                          <tr>
                            <td>J문의문의</td>
                            <td>2021-06-01</td>
                            <td>답변 완료</td>
                          </tr>
                        </tbody>
                      </table>       
                    
                </div>
                
                
                <!-- 페이징 -->
                <div id="query_2">
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