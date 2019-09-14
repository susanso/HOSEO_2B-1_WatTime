package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WatTimeComunicationDAO {
	//커뮤니티 게시글 전체 갯수
	public int getComunicationListCount() {
		int comunicationListCount=0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from comunicationTbl");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				comunicationListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return comunicationListCount;
	}
	//커뮤니티 게시글 가져오기
	
	public List<WatTimeComunicationDTO> getComunicationList(int start, int end) {
		List<WatTimeComunicationDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from comunicationTbl order by ref desc, re_step asc limit ?,?");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeComunicationDTO comunicationDTO = new WatTimeComunicationDTO();
					comunicationDTO.setNum(rs.getInt("num"));
					comunicationDTO.setMemId(rs.getString("memId"));
					comunicationDTO.setMemName(rs.getString("memName"));
					comunicationDTO.setTitle(rs.getString("title"));
					comunicationDTO.setContent(rs.getString("content"));
					comunicationDTO.setWriteDate(rs.getTimestamp("writeDate"));
					comunicationDTO.setReadCount(rs.getInt("readCount"));
					comunicationDTO.setRecommend(rs.getInt("recommend"));
					comunicationDTO.setUnrecommend(rs.getInt("unrecommend"));
					comunicationDTO.setRef(rs.getInt("ref"));
					comunicationDTO.setRe_step(rs.getInt("re_step"));
					comunicationDTO.setRe_level(rs.getInt("re_level"));
					comunicationDTO.setPhoto1(rs.getString("photo1"));
					comunicationDTO.setPhoto2(rs.getString("photo2"));
					comunicationDTO.setPhoto3(rs.getString("photo3"));
					comunicationDTO.setPhoto4(rs.getString("photo4"));
					comunicationDTO.setPhoto5(rs.getString("photo5"));
					list.add(comunicationDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//커뮤니티 게시판 내용 가져오기
	public WatTimeComunicationDTO getComunicationForm(int num) {
		WatTimeComunicationDTO comunicationDTO = new WatTimeComunicationDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			//조회수 증가
			PreparedStatement pstmt = con.prepareStatement("update comunicationTbl set readCount=readCount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			//내용검색
			pstmt = con.prepareStatement("select * from comunicationTbl where num = ?");
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				comunicationDTO.setNum(rs.getInt("num"));
				comunicationDTO.setMemId(rs.getString("memId"));
				comunicationDTO.setMemName(rs.getString("memName"));
				comunicationDTO.setTitle(rs.getString("title"));
				comunicationDTO.setContent(rs.getString("content"));
				comunicationDTO.setWriteDate(rs.getTimestamp("writeDate"));
				comunicationDTO.setReadCount(rs.getInt("readCount"));
				comunicationDTO.setRecommend(rs.getInt("recommend"));
				comunicationDTO.setUnrecommend(rs.getInt("unrecommend"));
				comunicationDTO.setRef(rs.getInt("ref"));
				comunicationDTO.setRe_step(rs.getInt("re_step"));
				comunicationDTO.setRe_level(rs.getInt("re_level"));
				comunicationDTO.setPhoto1(rs.getString("photo1"));
				comunicationDTO.setPhoto2(rs.getString("photo2"));
				comunicationDTO.setPhoto3(rs.getString("photo3"));
				comunicationDTO.setPhoto4(rs.getString("photo4"));
				comunicationDTO.setPhoto5(rs.getString("photo5"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return comunicationDTO;
	}
	//커뮤니티 게시글 넣기
	public void setComunicationInsert(WatTimeComunicationDTO comunicationDTO) {
		int number=0;
		int num = comunicationDTO.getNum();
		int ref = comunicationDTO.getRef();
		int re_step = comunicationDTO.getRe_step();
		int re_level = comunicationDTO.getRe_level();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select max(num) from comunicationTbl");
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				number=rs.getInt(1)+1;
			}else {
				number=1; 
			}
			//새글이면 0 답글이면 원글의 번호를 가져옴
			if (num!=0) {  
				pstmt = con.prepareStatement("update comunicationTbl set re_step=re_step+1 where ref= ? and re_step> ?");
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
			
			pstmt = con.prepareStatement("insert into comunicationTbl(memId,memName,title,content,writeDate,readCount,"
					+"recommend,unrecommend,ref,re_step,re_level,photo1,photo2,photo3,photo4,photo5)"+
					" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, comunicationDTO.getMemId());
			pstmt.setString(2, comunicationDTO.getMemName());
			pstmt.setString(3, comunicationDTO.getTitle());
			pstmt.setString(4, comunicationDTO.getContent());
			pstmt.setTimestamp(5, comunicationDTO.getWriteDate());
			pstmt.setInt(6, comunicationDTO.getReadCount());
			pstmt.setInt(7, comunicationDTO.getRecommend());
			pstmt.setInt(8, comunicationDTO.getUnrecommend());
			pstmt.setInt(9, ref);
			pstmt.setInt(10, re_step);
			pstmt.setInt(11, re_level);
			pstmt.setString(12, comunicationDTO.getPhoto1());
			pstmt.setString(13, comunicationDTO.getPhoto2());
			pstmt.setString(14, comunicationDTO.getPhoto3());
			pstmt.setString(15, comunicationDTO.getPhoto4());
			pstmt.setString(16, comunicationDTO.getPhoto5());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
