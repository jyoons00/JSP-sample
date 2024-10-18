<%@page import="java.util.Arrays"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   // ex01_emp.jsp?deptno=10 : 여기 파라미터값을 WHERE deptno = ? 에 주면 된다.   
   // ex01_emp.jsp null
   // ex01_emp.jsp?deptno= ""
   // ex01_emp.jsp?deptno=10&deptno=40 : 파라미터가 여러개 넘어오는 것을 받아야 된다.
   
   String [] deptnoArr = request.getParameterValues("deptno");
   // System.out.println( Arrays.toString(deptnoArr) );
   
   /*
   String sql = " SELECT empno, ename, job, mgr, "
               + " TO_CHAR(hiredate,'yyyy-MM-dd') hiredate, sal, comm, deptno "
               + " FROM emp "
               + " WHERE deptno = ";
   
   sql += String.join(" OR deptno=", deptnoArr);
   */
   
   String sql = " SELECT empno, ename, job, mgr, "
         + " TO_CHAR(hiredate,'yyyy-MM-dd') hiredate, sal, comm, deptno "
         + " FROM emp "
         + " WHERE ";
   
   for(int i=0; i<deptnoArr.length; i++){
      sql += " deptno=? OR";
   };
   
   sql = sql.substring(0, sql.length()-3);
   
   sql += " ORDER BY deptno ASC ";
   
   // System.out.println( sql );
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   int deptno;
   int empno, mgr;
   String ename, job;
   Date hiredate;
   double sal, comm;
   
   EmpVO vo = null;
   ArrayList<EmpVO> list = null;
   Iterator<EmpVO> ir = null;
   
   try{
      conn = DBConn.getConnection();
      // System.out.println("> Conn = " + conn);
      // System.out.println("> isClosed = " + conn.isClosed());
      pstmt = conn.prepareStatement(sql);
      
      // ? ? ? 여러개 일 수 있다. 에 대한 쿼리
      // 파라미터 값을 ? 갯수만큼 만들어라
      for(int i=0; i<deptnoArr.length; i++){
         pstmt.setInt(i+1, Integer.parseInt(deptnoArr[i]));
      };
      
      rs = pstmt.executeQuery();
      if(rs.next()){
         list = new ArrayList<>();
         do{
            
            empno = rs.getInt("empno");
            ename = rs.getString("ename");
            job = rs.getString("job");
            mgr = rs.getInt("mgr");
            hiredate = rs.getDate("hiredate");
            sal = rs.getDouble("sal");
            comm = rs.getDouble("comm");
            deptno = rs.getInt("deptno");
            
            vo = new EmpVO().builder()
               .empno(empno).ename(ename).job(job).mgr(mgr)
               .hiredate(hiredate).sal(sal).comm(comm).deptno(deptno).build();

            list.add(vo);
            
         }while(rs.next());
      } // if
         }catch(Exception e){
      
   }finally{
      try{
         pstmt.close();
         DBConn.close();
      }catch(Exception e){
         e.printStackTrace();
      }

   } // try
   
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
     ex01_emp_02.jsp
  </xmp>
  
  <h2>emp list</h2>
  <table>
     <thead>
        <th>empno</th>
        <th>ename</th>
        <th>job</th>
        <th>mgr</th>
        <th>hiredate</th>
        <th>sal</th>
        <th>comm</th>
        <th>deptno</th>
     </thead>
     <tbody>
     
     <% 
        if(list == null){
     %>
        <tr>
           <td colspan="8">사원이 존재하지 않습니다.</td>
        </tr>
     <%
        }else{
           ir = list.iterator();
           while( ir.hasNext() ){
              vo = ir.next();
     %>
     <tr>
        <td><%= vo.getEmpno() %></td>
        <td><%= vo.getEname() %></td>
        <td><%= vo.getJob() %></td>
        <td><%= vo.getMgr() %></td>
        <td><%= vo.getHiredate() %></td>
        <td><%= vo.getSal() %></td>
        <td><%= vo.getComm() %></td>
        <td><%= vo.getDeptno() %></td>
     </tr>
     <%
           } // while
        } // if
     %>
     
     <%-- <%
        ir = list.iterator();
        while( ir.hasNext() ){
           vo = ir.next();
           empno = vo.getEmpno();
           ename = vo.getEname();
           job = vo.getJob();
           mgr = vo.getMgr();
           hiredate = vo.getHiredate();
           sal = vo.getSal();
           comm = vo.getComm();
           deptno = vo.getDeptno();
     %>
     <tr>
        <td><%= empno %></td>
        <td><%= ename %></td>
        <td><%= job %></td>
        <td><%= mgr %></td>
        <td><%= hiredate %></td>
        <td><%= sal %></td>
        <td><%= comm %></td>
        <td><%= deptno %></td>
     </tr>
     <%
        } // while
     %> --%>
     
     </tbody>
     <tfoot>
        <tr>
           <td colspan="8">
              <span class="badge left red"><%= list == null ? 0 : list.size() %></span>명
              <a href="javascript:history.back()">뒤로 가기</a>
           </td>
        </tr>
     </tfoot>
  </table>
  
</div>
</body>
</html>