package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import WatTimePack.DBMgr;
import WatTimePack.RegisterBean;

public class MemberMgr {
	
	//로그인 관련
	public RegisterBean getMember(String memId, String memPass) {
		RegisterBean rslt = new RegisterBean();
		try(Connection con = DBMgr.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from memberTbl where memId = ? and memPass = ?");
			pstmt.setString(1, memId);
			pstmt.setString(2, memPass);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rslt = registerBeanMapper(rs);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return rslt;
	}
	//아이디 찾기
	public RegisterBean getMemberFindId(String memName, String memEmail, String memPhone) {
		RegisterBean rslt = new RegisterBean();
		try(Connection con = DBMgr.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from memberTbl where memName = ? and memEmail = ? and memPhone = ?");
			pstmt.setString(1, memName);
			pstmt.setString(2, memEmail);
			pstmt.setString(3, memPhone);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rslt = registerBeanMapper(rs);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return rslt;
	}
	//패스워드 찾기
	public RegisterBean getMemberFindPass(String memId, String memEmail, String memPhone) {
		RegisterBean rslt = new RegisterBean();
		try(Connection con = DBMgr.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from memberTbl where memId = ? and memEmail = ? and memPhone = ?");
			pstmt.setString(1, memId);
			pstmt.setString(2, memEmail);
			pstmt.setString(3, memPhone);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rslt = registerBeanMapper(rs);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return rslt;
	}
	//새 패스워드 적용
	public RegisterBean setMemberNewPass(String memPass, String memId) {
		RegisterBean rslt = new RegisterBean();
		try(Connection con = DBMgr.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update memberTbl set memPass = ? where memId = ?");
			pstmt.setString(1, memPass);
			pstmt.setString(2, memId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return rslt;
	}
	
	
	private RegisterBean registerBeanMapper(ResultSet rs) throws SQLException {
		RegisterBean regBean = new RegisterBean();
		//
		regBean.setMemId(rs.getString("memId"));
		regBean.setMemPass(rs.getString("memPass"));
		regBean.setMemName(rs.getString("memName"));
		regBean.setMemEmail(rs.getString("memEmail"));
		regBean.setMemPhone(rs.getString("memPhone"));
		regBean.setMemBirth(rs.getString("memBirth"));
		regBean.setMemPostcode(rs.getString("memPostcode"));
		regBean.setMemRoadAddress(rs.getString("memRoadAddress"));
		regBean.setMemJibunAddress(rs.getString("memJibunAddress"));
		regBean.setMemDetailAddress(rs.getString("memDetailAddress"));
		regBean.setMemEtcAddress(rs.getString("memEtcAddress"));
		regBean.setMemPoint(rs.getInt("memPoint"));
		regBean.setMemAdmin(rs.getInt("memAdmin"));
		regBean.setMemJoinDate(rs.getTimestamp("memJoinDate"));
		return regBean;
	}
	
	public List<RegisterBean> getMemList() {
		List<RegisterBean> list = new ArrayList<>();
		try(Connection con = DBMgr.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from memberTbl");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(registerBeanMapper(rs));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//아이디 중복 체크를 위한 메소드
	public RegisterBean getMemberIdOverlapCheck(String memId) {
		RegisterBean rslt = new RegisterBean();
		try(Connection con = DBMgr.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from memberTbl where memId = ?");
			pstmt.setString(1, memId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rslt = registerBeanMapper(rs);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return rslt;
	}
	
	//회원가입
	public RegisterBean setMemberJoin(String memId, String memPass, String memName,String memEmail,String memPhone, String memBirth , String memPostcode, String memRoadAddress,String memJibunAddress, String memEtcAddress, String memDetailAddress) {
		RegisterBean rslt = new RegisterBean();
		try(Connection con = DBMgr.getInstance().getConnection()){
			Timestamp memJoinDate = new Timestamp(System.currentTimeMillis());
			int memPoint = 2000;
			int memAdmin = 0;
			PreparedStatement pstmt = con.prepareStatement("insert into memberTbl values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, memId);
			pstmt.setString(2, memPass);
			pstmt.setString(3, memName);
			pstmt.setString(4, memEmail);
			pstmt.setString(5, memPhone);
			pstmt.setString(6, memBirth);
			pstmt.setString(7, memPostcode);
			pstmt.setString(8, memRoadAddress);
			pstmt.setString(9, memJibunAddress);
			pstmt.setString(10, memEtcAddress);
			pstmt.setString(11, memDetailAddress);
			pstmt.setInt(12, memPoint);
			pstmt.setInt(13, memAdmin);
			pstmt.setTimestamp(14, memJoinDate);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return rslt;
		
	}
	
}
