package days04.board.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import days04.board.domain.BoardDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDAOImpl implements BoardDAO {

   private Connection conn = null; // = DBConn.getConnection 결합력 높아져서 X 의존성 주입(DI)O - Setter, 생성자..
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;



   //생성자 DI
   public BoardDAOImpl(Connection conn) {
      super();
      this.conn = conn;
   }



   @Override
   public ArrayList<BoardDTO> select() throws SQLException {
      //싱글톤으로 만들어서 모두가 이거하나 쓰게 만듬 ?
      long seq;
      String title, writer, email;
      Date writerdate;
      int readed;

      ArrayList<BoardDTO> list = null;

      String sql = " SELECT seq, title, writer, email, writedate, readed " 
            + " FROM tbl_cstVSBoard " 
            + " ORDER BY seq DESC " ;

      //days03 ex01 부서조회에서 긁어옴---
      BoardDTO bdto = null;

      try {
         pstmt = conn.prepareStatement(sql); 
         rs = pstmt.executeQuery();


         if (rs.next()) {
            list = new ArrayList<BoardDTO >();
            do {
               seq = rs.getLong("seq");
               title = rs.getString("title");
               writer = rs.getString("writer");
               email = rs.getString("email");
               writerdate = rs.getDate("writedate");
               readed = rs.getInt("readed");
               bdto = new BoardDTO().builder()
                     .seq(seq)
                     .title(title)
                     .writedate(writerdate)
                     .writer(writer)
                     .email(email)
                     .readed(readed)
                     .build();
               list.add(bdto);
            } while (rs.next());
         }//if

         //게시판출력(list);

      } catch (SQLException e1) {
         e1.printStackTrace();
      }    finally {
         try {
            rs.close();
            pstmt.close(); //얘도 pstmt로 바꾸고
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }//finally

      return list;
   }



   @Override
   public int insert(BoardDTO dto) throws SQLException {
      // writedate  default  sysdate
      // readed     default  0
      int rowCount = 0;
      String sql = "INSERT INTO tbl_cstvsboard "
            + " (seq, writer, pwd, email, title, tag, content ) "
            + "VALUES "
            + " (seq_tblcstvsboard.NEXTVAL, ?, ?, ?, ?, ?, ? ) ";

      this.pstmt = conn.prepareStatement(sql);      
      pstmt.setString(1,  dto.getWriter() );
      pstmt.setString(2,  dto.getPwd() );
      pstmt.setString(3,  dto.getEmail() );
      pstmt.setString(4,  dto.getTitle() );
      pstmt.setInt(5, dto.getTag());
      pstmt.setString(6,  dto.getContent() );
      rowCount = this.pstmt.executeUpdate();
      this.pstmt.close();

      return rowCount;
   }





}
