package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import WatTimePack.WatTimeDBConnection;
import WatTimePack.WatTimeMemberDTO;

public class WatTimeMemberDAO {
	
	//로그인 관련
	public WatTimeMemberDTO getMember(String memId, String memPass) {
		WatTimeMemberDTO rslt = new WatTimeMemberDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from memberTbl where memId = ? and memPass = password(?)");
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
	public WatTimeMemberDTO getMemberFindId(String memName, String memEmail, String memPhone) {
		WatTimeMemberDTO rslt = new WatTimeMemberDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
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
	public WatTimeMemberDTO getMemberFindPass(String memId, String memEmail, String memPhone) {
		WatTimeMemberDTO rslt = new WatTimeMemberDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
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
	public WatTimeMemberDTO setMemberNewPass(String memPass, String memId) {
		WatTimeMemberDTO rslt = new WatTimeMemberDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update memberTbl set memPass = password(?) where memId = ?");
			pstmt.setString(1, memPass);
			pstmt.setString(2, memId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return rslt;
	}
	private WatTimeMemberDTO registerBeanMapper(ResultSet rs) throws SQLException {
		WatTimeMemberDTO regBean = new WatTimeMemberDTO();
		//
		regBean.setMemId(rs.getString("memId"));
		regBean.setMemPass(rs.getString("memPass"));
		regBean.setMemName(rs.getString("memName"));
		regBean.setMemEmail(rs.getString("memEmail"));
		regBean.setMemPhone(rs.getString("memPhone"));
		regBean.setMemBirth(rs.getString("memBirth"));
		regBean.setMemPostcode(rs.getString("memPostcode"));
		regBean.setMemRoadAddress(rs.getString("memRoadAddress"));
		regBean.setMemDetailAddress(rs.getString("memDetailAddress"));
		regBean.setMemPoint(rs.getInt("memPoint"));
		regBean.setMemAdmin(rs.getInt("memAdmin"));
		regBean.setMemJoinDate(rs.getTimestamp("memJoinDate"));
		return regBean;
	}
	
	public List<WatTimeMemberDTO> getMemList() {
		List<WatTimeMemberDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
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
	public WatTimeMemberDTO getMemberIdOverlapCheck(String memId) {
		WatTimeMemberDTO rslt = new WatTimeMemberDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
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
	//회원 가입 전 전화번호 검색
	public int getMemPhoneCheck(String memPhone) {
		int count = 0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from memberTbl where memPhone = ?");
			pstmt.setString(1, memPhone);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return count;
	}
	//회원 가입 전 전화번호 검색
	public int getMemEmailCheck(String memEmail) {
		int count = 0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from memberTbl where memEmail = ?");
			pstmt.setString(1, memEmail);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return count;
	}
	//회원가입
	public WatTimeMemberDTO setMemberJoin(String memId, String memPass, String memName,String memEmail,String memPhone, String memBirth , String memPostcode, String memRoadAddress, String memDetailAddress) {
		WatTimeMemberDTO rslt = new WatTimeMemberDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			Timestamp memJoinDate = new Timestamp(System.currentTimeMillis());
			int memPoint = 2000;
			int memAdmin = 0;
			PreparedStatement pstmt = con.prepareStatement("insert into memberTbl values(?,password(?),?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, memId);
			pstmt.setString(2, memPass);
			pstmt.setString(3, memName);
			pstmt.setString(4, memEmail);
			pstmt.setString(5, memPhone);
			pstmt.setString(6, memBirth);
			pstmt.setString(7, memPostcode);
			pstmt.setString(8, memRoadAddress);
			pstmt.setString(9, memDetailAddress);
			pstmt.setInt(10, memPoint);
			pstmt.setInt(11, memAdmin);
			pstmt.setTimestamp(12, memJoinDate);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return rslt;
		
	}
	//포인트 적립
	public WatTimeMemberDTO setUpdateTicTok(WatTimeMemberDTO memberDTO) {
		ResultSet rs = null;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update memberTbl set memPoint = ? where memId = ?");
			pstmt.setInt(1, memberDTO.getMemPoint());
			pstmt.setString(2, memberDTO.getMemId());
			pstmt.executeUpdate();
			
			pstmt = con.prepareStatement("select * from memberTbl where memId=?");
			pstmt.setString(1, memberDTO.getMemId());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberDTO.setMemId(rs.getString("memId"));
				memberDTO.setMemPass(rs.getString("memPass"));
				memberDTO.setMemName(rs.getString("memName"));
				memberDTO.setMemEmail(rs.getString("memEmail"));
				memberDTO.setMemPhone(rs.getString("memPhone"));
				memberDTO.setMemBirth(rs.getString("memBirth"));
				memberDTO.setMemPostcode(rs.getString("memPostcode"));
				memberDTO.setMemRoadAddress(rs.getString("memRoadAddress"));
				memberDTO.setMemDetailAddress(rs.getString("memDetailAddress"));
				memberDTO.setMemPoint(rs.getInt("memPoint"));
				memberDTO.setMemAdmin(rs.getInt("memAdmin"));
				memberDTO.setMemJoinDate(rs.getTimestamp("memJoinDate"));
			}
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return memberDTO;
	}
	
	//회원 탈퇴용(회원 탈퇴 전 회원 유효성)
	public int getOutMember(String memId, String memPass) {
		int count = 0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from memberTbl where memId = ? and memPass = password(?)");
			pstmt.setString(1, memId);
			pstmt.setString(2, memPass);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return count;
	}
	//포인트 적립
	public void setOutMember(String memId,String[] random) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update memberTbl set memPass= password(?), memEmail = ?,"+
														   " memPhone = ?, memBirth = ' ', memPostcode = ' ',"+
														   " memRoadAddress = ' ', memDetailAddress = ' ', memPoint = 0,"+
														   " memAdmin = 0 where memId = ?");
			pstmt.setString(1, random[0]);
			pstmt.setString(2, random[1]);
			pstmt.setString(3, random[2]);
			pstmt.setString(4, memId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
			
	}
	//회원 수정 전 패스워드 확인
	public int getMemCheck(String memId, String memPass) {
		int count = 0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from memberTbl where memId = ? and memPass = password(?)");
			pstmt.setString(1, memId);
			pstmt.setString(2, memPass);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return count;
	}
	//회원 정보 수정(패스워드x)
	public void setMemberInfoUpdateNoPass(WatTimeMemberDTO memberDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update memberTbl set memBirth = ?,memPhone = ?, "+
														   "memEmail = ?, memPostcode = ?, memRoadAddress = ?, "+
														   "memDetailAddress=? where memId = ?");
			pstmt.setString(1, memberDTO.getMemBirth());
			pstmt.setString(2, memberDTO.getMemPhone());
			pstmt.setString(3, memberDTO.getMemEmail());
			pstmt.setString(4, memberDTO.getMemPostcode());
			pstmt.setString(5, memberDTO.getMemRoadAddress());
			pstmt.setString(6, memberDTO.getMemDetailAddress());
			pstmt.setString(7, memberDTO.getMemId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//회원 정보 수정(패스워드o)
	public void setMemberInfoUpdate(WatTimeMemberDTO memberDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update memberTbl set memBirth = ?,memPhone = ?, "+
														   "memEmail = ?, memPostcode = ?, memRoadAddress = ?, "+
														   "memDetailAddress=?, memPass = password(?) where memId = ?");
			pstmt.setString(1, memberDTO.getMemBirth());
			pstmt.setString(2, memberDTO.getMemPhone());
			pstmt.setString(3, memberDTO.getMemEmail());
			pstmt.setString(4, memberDTO.getMemPostcode());
			pstmt.setString(5, memberDTO.getMemRoadAddress());
			pstmt.setString(6, memberDTO.getMemDetailAddress());
			pstmt.setString(7, memberDTO.getMemPass());
			pstmt.setString(8, memberDTO.getMemId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
