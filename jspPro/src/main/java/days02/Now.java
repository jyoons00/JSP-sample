package days02;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿 규약을 따르는 서블릿 클래스 선언
public class Now extends HttpServlet{

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      super.doGet(request, response);
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      super.doPost(request, response);
   }

   @Override
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   // jsp : contentType="text/html; charset=utf-8" 속성 설정
	   response.setContentType("text/html; charset=utf-8");
	   
	   PrintWriter out = response.getWriter();
	   
	   // out.write();
	   
	   Date now = new Date();
	   // 출력 형식 2024-10-24 10:05:43
	   String pattern = "yyyy-MM-dd hh:mm:ss";
	   SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String strNow = sdf.format(now);

	   out.write("<!DOCTYPE html>");
	      out.write("<html>");
	      out.write("<head>");
	      out.write("<meta charset='UTF-8'>");
	      out.write("<title>Insert title here</title>");
	      out.write("<link rel='shortcut icon' type='image/x-icon' href='http://localhost/jspPro/images/SiSt.ic'>");
	      out.write("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'></script>");
	      out.write("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
	      out.write("<link rel='stylesheet' href='http://localhost/jspPro/resources/cdn-main/example.css'>");
	      out.write("<script src='http://localhost/jspPro/resources/cdn-main/example.js'></script>");
	      out.write("<style>");
	      out.write(" span.material-symbols-outlined{");
	      out.write("    vertical-align: text-bottom;");
	      out.write(" }");  
	      out.write("</style>");
	      out.write("</head>");
	      out.write("<body>");
	      out.write("<header>");
	      out.write("  <h1 class='main'><a href='#' style='position: absolute;top:30px;'>kenik HOme</a></h1>");
	      out.write("  <ul>");
	      out.write("    <li><a href='#'>로그인</a></li>");
	      out.write("    <li><a href='#'>회원가입</a></li>");
	      out.write("  </ul>");
	      out.write("</header>");
	      out.write("<div>");
	      out.write("  <xmp class='code'>");                                 
	      out.write("  </xmp>");
	      
	      out.write(" <h3>현재 날짜 시간: " + strNow + "</h3>");
	      
	      out.write("</div>"); 
	      out.write("</body>");
	      out.write("</html>");

   }

}
