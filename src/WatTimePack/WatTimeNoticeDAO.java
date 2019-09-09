package WatTimePack;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WatTimeNoticeDAO {
	//공지사항 갯수
	public int getNoticeCount() {
		int noticeCount=0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from noticeTbl");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				noticeCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return noticeCount;
	}
	//공지사항 리스트
	public List<WatTimeNoticeDTO> getNoticeList(int start, int end) {
		List<WatTimeNoticeDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from noticeTbl order by writeDate desc limit ?,?");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeNoticeDTO noticeDTO = new WatTimeNoticeDTO();
					noticeDTO.setNum(rs.getInt("num"));
					noticeDTO.setTitle(rs.getString("title"));
					noticeDTO.setContent(rs.getString("content"));
					noticeDTO.setWriter(rs.getString("writer"));
					noticeDTO.setWriteDate(rs.getTimestamp("writeDate"));
					noticeDTO.setCount(rs.getInt("count"));
					noticeDTO.setFilePath(rs.getString("filePath"));
					noticeDTO.setFileName(rs.getString("fileName"));
					list.add(noticeDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//공지사항 내용 가져오기
	public WatTimeNoticeDTO getNoticeContent(int noticeNum) {
		WatTimeNoticeDTO noticeDTO = new WatTimeNoticeDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			//조회수 증가
			PreparedStatement pstmt = con.prepareStatement("update noticeTbl set count=count+1 where num = ?");
			pstmt.setInt(1, noticeNum);
			pstmt.executeUpdate();
			
			//내용검색
			pstmt = con.prepareStatement("select * from noticeTbl where num = ?");
			pstmt.setInt(1, noticeNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				noticeDTO.setNum(rs.getInt("num"));
				noticeDTO.setTitle(rs.getString("title"));
				noticeDTO.setContent(rs.getString("content"));
				noticeDTO.setWriter(rs.getString("writer"));
				noticeDTO.setWriteDate(rs.getTimestamp("writeDate"));
				noticeDTO.setCount(rs.getInt("count"));
				noticeDTO.setFilePath(rs.getString("filePath"));
				noticeDTO.setFileName(rs.getString("fileName"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return noticeDTO;
	}
	//공지사항 등록
	public void setNotice(WatTimeNoticeDTO noticeDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("insert into noticeTbl(title,content,writer,writeDate,count,fileName,filePath) values(?,?,?,?,?,?,?)");
			pstmt.setString(1, noticeDTO.getTitle());
			pstmt.setString(2, noticeDTO.getContent());
			pstmt.setString(3, noticeDTO.getWriter()); 
			pstmt.setTimestamp(4, noticeDTO.getWriteDate()); 
			pstmt.setInt(5, noticeDTO.getCount()); 
			pstmt.setString(6, noticeDTO.getFileName()); 
			pstmt.setString(7, noticeDTO.getFilePath());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
