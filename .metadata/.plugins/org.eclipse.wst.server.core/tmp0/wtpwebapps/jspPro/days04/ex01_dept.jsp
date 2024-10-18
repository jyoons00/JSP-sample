<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   // 캐스팅 필요하다.
   ArrayList<DeptVO> list = (ArrayList<DeptVO>)request.getAttribute("list");
   Iterator<DeptVO> ir = null;
   DeptVO vo = null;
   int deptno;
   String dname;
   
   String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">lsh</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
     ex01_dept.jsp
     
     1. 세션에 저장한다.
     2. db에 저장한다.
     3. 포워딩은 request 가 같기 때문에 그걸 가져올 수 있으면 된다.
  </xmp>
  
  <select name="deptno" id="deptno">
     <option value="">부서를 선택하세요.</option>
     <%
        ir = list.iterator();
        while( ir.hasNext() ){
           vo = ir.next();
           deptno = vo.getDeptno();
           dname = vo.getDname();
     %>
        <option value="<%= deptno %>"><%= dname %></option>
     <%
        } // while
     %>
  </select>
  
  <script>
  
     <%-- $("#deptno").on("change", function(event){
        // alert("test");
        let deptno = $(this).val();
        // location.href = `ex01_emp.jsp?deptno=\${deptno}`;
        location.href = "<%= contextPath %>/scott/emp";
     }); --%>
     
     $("#deptno")
        .wrap("<form></form>") // wrap : 묶다.
        .on("change", function(event){
           $(this)
              .parent()
                 .attr({
                    method:"get",
                    action:"<%= contextPath %>/scott/emp"
                 })
                 .submit();
        });
  </script>
  
</div>
</body>
</html>