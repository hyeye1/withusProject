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

        
        /* fundingDetail content */
        .fundingDetail #content_1{height: 10%;}
        .fundingDetail #content_2{height: 30%; margin-top: 150px;}
        .fundingDetail #content_3{height: 30%; margin-top: 100px;}

        
        
        

        /* .fundingDetail 테이블 */
        .fundingDetail table{margin-left: 20px;}
        .fundingDetail th{width: 150px; height: 40px;}
        .fundingDetail td{width: 150px; height: 30px;}
        

        /* .fundingDetail 버튼 부분 */
        .fundingDetail .buttonArea{height: 150px; text-align: center;}

        .fundingDetail #btn1{background-color: rgb(52, 152, 219); color: honeydew;}
        .fundingDetail button{width: 200px;}

    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 펀딩내역 상세 -->
        <div id="mypage">
            <div id="content" class="fundingDetail">
              
              <p>펀딩내역</p>
              <div id="underLine"></div>
                
              <table border="1">
                <tr>
                  <th>펀딩날짜 : </th>
                  <td>2021-06-08</td>
                  <th>주문번호 : </th>
                  <td>202106080001</td>
                </tr>
              </table>
              
                
                <!-- 펀딩상품-->
                <div id="content_1">
                
                  <p>펀딩상품</p>

                  <table border="1">
                    <tr>
                      <th colspan="2">상품명</th>
                      <th>수량</th>
                      <th>진행현황</th>
                    </tr>
                    <tr>
                      <td>
                        <img src="city1.PNG" class="rounded" width="80" height="80">
                      </td>
                      <td>손목보호대</td>
                      <td>1</td>
                      <td>진행중</td>
                    </tr>

                  </table>
                  
                </div>

                
                <!-- 배송지 정보-->
                <div id="content_2">
                  <p>배송지 정보</p>
                  <table>
                    <tr>
                      <th>받는사람</th>
                      <td>이윤정</td>
                    </tr>
                    <tr>
                      <th>휴대폰번호</th>
                      <td>010-1234-1234</td>
                    </tr>
                    <tr>
                      <th>주소</th>
                      <td>(우편번호) 경기도 고양시 일산서구</td>
                    </tr>
                    <tr>
                      <th>배송시 요청사항</th>
                      <td>없음</td>
                    </tr>
                    <tr>
                      <td colspan="2" class="buttonArea">
                        <button>배송지수정</button>
                      </td>
                    </tr>
                  </table>
                </div>
                


                <!-- 결제정보-->
                <div id="content_3">
                
                  <p>결제정보</p>

                  <table border="1">
                    <tr>
                      <td style="text-align: center; width: 200px;">리워드금액</td>
                      <td colspan="2" style="text-align: center; width: 200px;">추가후원금</td>
                    </tr>
                    <tr>
                      <td style="text-align: center; width: 200px;">20000원</td>
                      <td colspan="2" style="text-align: center; width: 200px;">0원</td>
                      
                    </tr>
                    <tr>
                      <td></td>
                      <td style="text-align: right;">배송비</td>
                      <td style="text-align: right;">0원</td>
                    </tr>
                    <tr>
                      <td></td>
                      <td style="text-align: right;">총 결제금액</td>
                      <td style="text-align: right;">20000원</td>
                    </tr>
                    
                  </table>
                </div>
            
                
                <div class="buttonArea">
                  <button>목록</button>
                  <button>펀딩 반환 신청</button>
                </div>
                

            </div>
            
        </div>
        

    </div>
</body>
</html>