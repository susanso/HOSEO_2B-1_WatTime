package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WatTimeComunicationCommentsDAO {
	//해당 게시글의 댓글 전체 갯수
	public int getCommentsCount(int boardNum) {
		int comunicationListCount=0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from comunicationCommentsTbl where boardNum = ?");
			pstmt.setInt(1, boardNum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				comunicationListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return comunicationListCount;
	}
	//해당 게시글의 댓글 전체 가져오기
	public List<WatTimeComunicationCommentsDTO> getCommentsList(int boardNum, int start, int end) {
		List<WatTimeComunicationCommentsDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from comunicationCommentsTbl"+
										" where boardNum = ? order by ref desc, re_step asc limit ?,?");
			pstmt.setInt(1, boardNum);
			pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeComunicationCommentsDTO commentsDTO = new WatTimeComunicationCommentsDTO();
					commentsDTO.setNum(rs.getInt("num"));
					commentsDTO.setBoardNum(rs.getInt("boardNum"));
					commentsDTO.setMemId(rs.getString("memId"));
					commentsDTO.setMemName(rs.getString("memName"));
					commentsDTO.setComment(rs.getString("comment"));
					commentsDTO.setWriteDate(rs.getTimestamp("writeDate"));
					commentsDTO.setRef(rs.getInt("ref"));
					commentsDTO.setRe_step(rs.getInt("re_step"));
					commentsDTO.setRe_level(rs.getInt("re_level"));
					list.add(commentsDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//댓글 작성
	public void setCommentInsert(WatTimeComunicationCommentsDTO commentsDTO) {
		int number=0;
		int num = commentsDTO.getNum();
		int ref = commentsDTO.getRef();
		int re_step = commentsDTO.getRe_step();
		int re_level = commentsDTO.getRe_level();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select max(num) from comunicationCommentsTbl");
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				number=rs.getInt(1)+1;
			}else {
				number=1; 
			}
			//새글이면 0 답글이면 원글의 번호를 가져옴
			if (num!=0) {  
				pstmt = con.prepareStatement("update comunicationCommentsTbl set re_step=re_step+1 where ref= ? and re_step> ?");
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step=re_step+1;
				re_level=re_level+1;
			}else{
				ref=number;
				re_step=0;
				re_level=0;
			}	 
			
			pstmt = con.prepareStatement("insert into comunicationCommentsTbl(boardNum, memId, memName, comment, writeDate, ref,"
					+"re_step, re_level) values(?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, commentsDTO.getBoardNum());
			pstmt.setString(2, commentsDTO.getMemId());
			pstmt.setString(3, commentsDTO.getMemName());
			pstmt.setString(4, commentsDTO.getComment());
			pstmt.setTimestamp(5, commentsDTO.getWriteDate());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
