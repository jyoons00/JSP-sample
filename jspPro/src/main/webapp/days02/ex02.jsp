<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google" content="notranslate">
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">JYP Ent</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
       이미지 등 파일 넣을 때
       상대경로 
       도메인(http://) 뒤 부터 절대경로로 잡기
       
       /jspPro/days02/..... 이렇게
       
       /jspPro : context path.. 하나의 서버에 여러 개의 웹어플리케이션이 구동 중이라면 하나하나 구분하기 위한 경로..
       
  </xmp>
   <%
      String contextPath = request.getContextPath();
   
   %>
   
   context path = <%= contextPath %>  <!-- /jspPro -->
   <img alt="테스트사진" src="<%= contextPath %>.images/item01.gif">
</div>

</body>

</html>









