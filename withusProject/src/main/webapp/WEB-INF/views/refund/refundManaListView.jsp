<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin With Us</title>

<style>
	/* pagination */
	.paging_wrap{width:fit-content;margin:auto; margin-top: 100px;}

	.pagination a {
     color: black;
     float: left;
     padding: 8px 16px;
     text-decoration: none;
     transition: background-color .3s;
	}

	/* searchBox */
	.search_box{
	    height: 130px; 
	    background-color: #f4f4f4; 
	    padding: 20px; 
	}
	#refundKeyword{
	    height: 36px; 
	    float: left; 
	    margin-right: 10px; 
	    border: 1px solid #ced4da;
	    border-radius: .25rem;
	}
	.form-control.refund{width: 400px;}
	.refundAllStatus{width: 80%; float: left;}
	.refundRadios {font-size: 13px; float: left; margin: 4px 15px;}
	.searchBtns{width: 20%; float: right;}
	.searchBtns button{margin: 0 7px;} 
	.btn.btn-withus{background-color: #3498db; color: white;}
	.btn.btn-withus:hover{cursor: pointer; background-color: #2c83be;}
	
	table *{text-align: center; font-size: 15px;}
	tbody>tr:hover{cursor: pointer;}
	table.table-bordered td, table.table-bordered th {padding: .35rem; vertical-align: inherit;}
	.tableHead{background-color: #eaeaea;}

</style>

</head>
<body>

	<!-- header -->
    <jsp:include page="../common/manaHeader.jsp"/>

    <div class="content_wrap">
        <div class="title" align="left">
            <label>환불신청 내역</label>
        </div>

        <div class="container">

            <div class="search_box">
                <form action="">
                    <div class="searchForm">
                        <select name="refundKeyword" id="refundKeyword">
                            <option value="refundAll">전체</option>
                            <option value="refundName">신청인</option>
                            <option value="refundNo">신청번호</option>
                        </select>
                        <input type="text" class="form-control refund" placeholder="검색어를 입력하세요">
                    </div>
                    <br>
                    <div class="refundAllStatus">
                        <label for="" style="float: left;"><b>환불상태</b></label> &nbsp;&nbsp;
                        <div class="refundRadios">
                            <input type="radio" name="refundStatus" value=""> 환불대기
                            <input type="radio" name="refundStatus" value=""> 환불완료
                        </div>
                    </div>
                    <div class="searchBtns" align="right">
                        <button type="reset" class="btn btn-secondary btn-sm">초기화</button>
                        <button type="submit" class="btn btn-withus btn-sm">검색</button>
                    </div>
                </form>
            </div>

            <br>

            <table class="table table-bordered">
                <thead class="tableHead">
                    <tr>
                        <th>신청번호</th>
                        <th>환불 신청인</th>
                        <th width="330">펀딩 정보</th>
                        <th width="180">환불 사유</th>
                        <th>신청 날짜</th>
                        <th>환불 상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td >10491</td>
                        <td>김지원</td>
                        <td>프로젝트이름<br>리원드/옵션명111</td>
                        <td>배송 중 파손</td>
                        <td>2021-06-09 15:24:11</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td >10491</td>
                        <td>김지원</td>
                        <td>프로젝트이름<br>리원드/옵션명111</td>
                        <td>배송 중 파손</td>
                        <td>2021-06-09 15:24:11</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td >10491</td>
                        <td>김지원</td>
                        <td>프로젝트이름<br>리원드/옵션명111</td>
                        <td>배송 중 파손</td>
                        <td>2021-06-09 15:24:11</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td >10491</td>
                        <td>김지원</td>
                        <td>프로젝트이름<br>리원드/옵션명111</td>
                        <td>배송 중 파손</td>
                        <td>2021-06-09 15:24:11</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td >10491</td>
                        <td>김지원</td>
                        <td>프로젝트이름<br>리원드/옵션명111</td>
                        <td>배송 중 파손</td>
                        <td>2021-06-09 15:24:11</td>
                        <td>N</td>
                    </tr>                                                                                
                </tbody>
            </table>
        </div>
        
        <br clear="both"><br>

        <!-- 페이징 -->
        <div class="paging_wrap">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>

    </div>


</body>
</html>