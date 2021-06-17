<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
<!-- Bootstrap core CSS -->
<link href="./Sidebars · Bootstrap v5.0_files/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<style>
  .nav-link:hover{
    color:white;
    background-color: #a4c8ff;
  }
</style>
<!-- Custom styles for this template -->
<link href="./Sidebars · Bootstrap v5.0_files/sidebars.css" rel="stylesheet">
</head>
<body>

	<!-- header -->
    <jsp:include page="../common/header.jsp"/>
    
    
     <main>
        <h1 class="visually-hidden">Sidebars examples</h1>
        <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
          <a href="https://getbootstrap.com/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <span class="fs-4">커뮤니티</span>
          </a>
          <hr>
          <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
              <a href="#" class="nav-link active" aria-current="page">
                자유
              </a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link link-dark">
                질문
              </a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link link-dark">
                공구모집        
              </a>
            </li>
          </ul>
        </div>
        <div class="b-example-divider"></div>
      </main>
      
      
          <script src="./Sidebars · Bootstrap v5.0_files/bootstrap.bundle.min.js.다운로드" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
      
          <script src="./Sidebars · Bootstrap v5.0_files/sidebars.js.다운로드"></script>
    
    
    
    <!-- footer -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>