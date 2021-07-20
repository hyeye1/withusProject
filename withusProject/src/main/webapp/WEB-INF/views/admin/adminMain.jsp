<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin With Us</title>
</head>
<body>
    <jsp:include page="../common/manaErrorPage.jsp"/>
    
	<c:choose>
        	<c:when test="${ loginUser.memberStatus eq 'A' }">
        		<script>
			     // 로그인이 null일때 모달창 자동으로 노출
				    $(document).ready(function(){
				    	//alert("작동되니?");
			    		location.href = "memberListView.mana";
				    });
		    	</script> 
        	
        	</c:when>
        	<c:otherwise>
        		<script>
			     	// 로그인이 null일때 모달창 자동으로 노출
				    $(document).ready(function(){
			    		$("#manaLogin").modal();
				    });
			    </script> 
        	</c:otherwise>
        </c:choose>
        

</body>
</html>