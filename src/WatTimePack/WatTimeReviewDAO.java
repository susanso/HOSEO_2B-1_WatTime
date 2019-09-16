package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class WatTimeReviewDAO {
	//상세 페이지 구매후기 갯수 찾기
	public int getReviewCount(String productCode) {
		int productCount=0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from reviewTbl where productCode = ?");
			pstmt.setString(1, productCode);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productCount;
	}
	//해당 상품 구매후기 가져오기
	public List<WatTimeReviewDTO> getReviewList(String productCode, String sortText,int start, int end) {
		List<WatTimeReviewDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from reviewTbl where productCode = ? ORDER BY "+sortText+" limit ?,?");
			pstmt.setString(1, productCode);
			pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeReviewDTO reviewDTO = new WatTimeReviewDTO();
					reviewDTO.setNum(rs.getInt("num"));
					reviewDTO.setProductCode(rs.getString("productCode"));
					reviewDTO.setMemId(rs.getString("memId"));
					reviewDTO.setMemName(rs.getString("memName"));
					reviewDTO.setReviewScore(rs.getInt("reviewScore"));
					reviewDTO.setReviewContent(rs.getString("reviewContent"));
					reviewDTO.setReg_date(rs.getTimestamp("reg_date"));
					reviewDTO.setRef(rs.getInt("ref"));
					reviewDTO.setRe_step(rs.getInt("re_step"));
					reviewDTO.setRe_level(rs.getInt("re_level"));
					reviewDTO.setProductName(rs.getString("productName"));
					reviewDTO.setProductSimpleImgFileName(rs.getString("productSimpleImgFileName"));
					list.add(reviewDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}

	//구매후기 테이블에 넣기
	public void setReview(WatTimeReviewDTO reviewDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			String sql ="insert into reviewTbl(productCode,memId,memName,reviewScore,";
			sql += "reviewContent,reg_date,ref,re_step,re_level,productName,productSimpleImgFileName) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewDTO.getProductCode());
			pstmt.setString(2, reviewDTO.getMemId());
			pstmt.setString(3, reviewDTO.getMemName());
			pstmt.setInt(4, reviewDTO.getReviewScore());
			pstmt.setString(5, reviewDTO.getReviewContent());
			pstmt.setTimestamp(6, reviewDTO.getReg_date());
			pstmt.setInt(7, reviewDTO.getRef());
			pstmt.setInt(8, reviewDTO.getRe_step());
			pstmt.setInt(9, reviewDTO.getRe_level());
			pstmt.setString(10, reviewDTO.getProductName());
			pstmt.setString(11, reviewDTO.getProductSimpleImgFileName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//구매후기 삭제
	public void setReviewDelete(int reviewNum, String memId) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("delete from reviewTbl where num=? and memId=?");
			pstmt.setInt(1, reviewNum);
			pstmt.setString(2, memId);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//구매후기 수정
	public void setReviewModify(WatTimeReviewDTO reviewDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update reviewTbl set reviewScore=?, reviewContent=? where num=?");
			pstmt.setInt(1, reviewDTO.getReviewScore());
			pstmt.setString(2, reviewDTO.getReviewContent());
			pstmt.setInt(3, reviewDTO.getNum());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//상세 페이지 구매후기 별점 찾기
	public List<WatTimeReviewDTO> getProductReviewScore(String productCode) {
		List<WatTimeReviewDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from reviewTbl where productCode=?");
			pstmt.setString(1, productCode);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeReviewDTO reviewDTO = new WatTimeReviewDTO();
					reviewDTO.setNum(rs.getInt("num"));
					reviewDTO.setProductCode(rs.getString("productCode"));
					reviewDTO.setMemId(rs.getString("memId"));
					reviewDTO.setMemName(rs.getString("memName"));
					reviewDTO.setReviewScore(rs.getInt("reviewScore"));
					reviewDTO.setReviewContent(rs.getString("reviewContent"));
					reviewDTO.setReg_date(rs.getTimestamp("reg_date"));
					reviewDTO.setRef(rs.getInt("ref"));
					reviewDTO.setRe_step(rs.getInt("re_step"));
					reviewDTO.setRe_level(rs.getInt("re_level"));
					reviewDTO.setProductName(rs.getString("productName"));
					reviewDTO.setProductSimpleImgFileName(rs.getString("productSimpleImgFileName"));
					list.add(reviewDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//구매후기 전체 갯수
	public int getReviewAllCount() {
		int productCount=0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from reviewTbl");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				productCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productCount;
	}
	//구매후기 전체 가져오기
	
	public List<WatTimeReviewDTO> getReviewAllList(String sort,int start, int end) {
		List<WatTimeReviewDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from reviewTbl ORDER BY "+sort+" limit ?,?");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeReviewDTO reviewDTO = new WatTimeReviewDTO();
					reviewDTO.setNum(rs.getInt("num"));
					reviewDTO.setProductCode(rs.getString("productCode"));
					reviewDTO.setMemId(rs.getString("memId"));
					reviewDTO.setMemName(rs.getString("memName"));
					reviewDTO.setReviewScore(rs.getInt("reviewScore"));
					reviewDTO.setReviewContent(rs.getString("reviewContent"));
					reviewDTO.setReg_date(rs.getTimestamp("reg_date"));
					reviewDTO.setRef(rs.getInt("ref"));
					reviewDTO.setRe_step(rs.getInt("re_step"));
					reviewDTO.setRe_level(rs.getInt("re_level"));
					reviewDTO.setProductName(rs.getString("productName"));
					reviewDTO.setProductSimpleImgFileName(rs.getString("productSimpleImgFileName"));
					list.add(reviewDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
}
