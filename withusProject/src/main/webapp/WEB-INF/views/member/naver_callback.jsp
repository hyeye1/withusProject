<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("dLjj3gw6QxxdyRGAZ9q6", "http://localhost:8888/withus/naver_callback.me");

  // TODO : 토큰을 못받았을때 처리가 필요하다
  naver_id_login.get_naver_userprofile("naverSignInCallback()");

  
  function naverSignInCallback() {
	  var token = naver_id_login.oauthParams.access_token;
	  var email = naver_id_login.getProfileData('email');
	  var name = naver_id_login.getProfileData('name');
	  
	  console.log(email);
	  console.log(name);
	  
    //alert(naver_id_login.getProfileData('email'));
    //alert(naver_id_login.getProfileData('name'));
    window.opener.naverLoginResult(email, name, token);
    window.close();
  }
</script>
</body>
</html>