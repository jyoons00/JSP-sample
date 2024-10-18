<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
       String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>

  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>

  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>

</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">lsh</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
     1. JSP
        get 방식 요청
        post 방식 요청 홍길동 한글 깨짐.
     
     2. 서블릿
        get 방식 요청
        post 방식 요청
        
        Info.java 서블릿 클래스 선언
        /method/info.htm으로 URL 매핑
        
  </xmp>
  
 <div id="tabs">
  <ul>
    <li><a href="#tabs-1">jsp - get 방식 요청</a></li>
    <li><a href="#tabs-2">jsp - post 방식 요청</a></li>
  </ul>
  <div id="tabs-1">
    <p>
       1. 웹 브라우저 : 주소창 url 입력 후 요청<br />
       2. a 링크 태그<br />
       3. location.href 요청<br />
       4. form method='get' 요청<br />
       <br />
       정수 : <input type="text" id="n" name="n" value="10"><br />
       <a href="ex02_ok.jsp">ex02_ok.jsp</a>
    </p>
  </div>
  <div id="tabs-2">
    <p>
       <!-- action x : 자기자신 / method x : get 방식 -->
       <form action="">
          Name : <input type="text" id="name" name="name" value="홍길동"><br />
          age : <input type="text" id="age" name="age" value="20"><br />
          
          <input type="radio" name="method" value="get" checked="checked">GET 요청
          <input type="radio" name="method" value="post">POST 요청
          <br />
          <button type="button">전송(submit)</button>
       </form>
    </p>
  </div>
</div>

   <script>

    <%--   $("#tabs-2 button").on("click",function(){
         // "get" / "post"
         let method = $(":radio[name=method]:checked").val();
         $(this)
            .parent() // form 태그
               .attr({
                  "method":method,
                  "action":"<%= contextPath %>/days03/ex02_ok_02.jsp"
               })
               .submit(); // 서브밋 시킨다.
      });
 --%>
   </script>
  
  <script>
     $("#tabs-1 a").on("click",function(){
        /* 1. 풀이
        let n = $("#n").val();
        let oldHref = $(this).attr("href"); // "ex02_ok.jsp"
        let newHref = `\${oldHref}?n=\${n}`; // "ex02_ok.jsp?n=10"
        $(this).attr("href", newHref);
        */
        
        // 2. 풀이
        $(this).attr("href",function(index,oldHref){
           let n = $("#n").val();
           return `\${oldHref}?n=\${n}`;
        });
     });
  </script>
  
  <script>
  // Info 서플릿 get/post 방식 테스트
  $("#tabs-2 button").on("click",function(){
      // "get" / "post"
      let method = $(":radio[name=method]:checked").val();
      $(this)
         .parent() // form 태그
            .attr({
               "method":method,
               "action":"<%= contextPath %>/method/info.htm" // 수정된 부분 
            })
            .submit(); // 서브밋 시킨다.
   });
  </script>
  
</div>
</body>
</html>