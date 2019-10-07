package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WatTimeBasketDAO {
	//장바구니 넣기
	public void setBasket(WatTimeBasketDTO basketDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("insert into basketTbl(productCode,productName,memId,memName"
					+",productSimpleImgFileName,productPrice,productCount,basketAddDate,tictok) values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, basketDTO.getProductCode());
			pstmt.setString(2, basketDTO.getProductName());
			pstmt.setString(3, basketDTO.getMemId());
			pstmt.setString(4, basketDTO.getMemName());
			pstmt.setString(5, basketDTO.getProductSimpleImgFileName());
			pstmt.setInt(6, basketDTO.getProductPrice());
			pstmt.setInt(7, basketDTO.getProductCount());
			pstmt.setTimestamp(8, basketDTO.getBasketAddDate());
			pstmt.setInt(9, basketDTO.getTictok());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//중복 체크
	public int getBasketOverlapCheck(String memId,String productCode) {
		int basketOverlapCheckCount = 0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from basketTbl where memId = ? and productCode = ?");
			pstmt.setString(1, memId);
			pstmt.setString(2, productCode);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				basketOverlapCheckCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return basketOverlapCheckCount;
	}
	//회원 장바구니 갯수
	public int getBasketListCount(String memId) {
		int basketCount = 0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from basketTbl where memId = ?");
			pstmt.setString(1, memId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				basketCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return basketCount;
	}
	//회원 장바구니 검색
	public List<WatTimeBasketDTO> getMemberBasketList(String memId) {
		List<WatTimeBasketDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from basketTbl where memId = ? order by basketAddDate DESC");
			pstmt.setString(1, memId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeBasketDTO basketDTO = new WatTimeBasketDTO();
					basketDTO.setNum(rs.getInt("num"));
					basketDTO.setProductCode(rs.getString("productCode"));
					basketDTO.setProductName(rs.getString("productName"));
					basketDTO.setMemId(rs.getString("memId"));
					basketDTO.setMemName(rs.getString("memName"));
					basketDTO.setProductSimpleImgFileName(rs.getString("productSimpleImgFileName"));
					basketDTO.setProductPrice(rs.getInt("productPrice"));
					basketDTO.setProductCount(rs.getInt("productCount"));
					basketDTO.setBasketAddDate(rs.getTimestamp("basketAddDate"));
					basketDTO.setTictok(rs.getInt("tictok"));
					list.add(basketDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//장바구니 구매 수량 변경
	public void setProductCountModify(String memId, int num, int productCount) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("UPDATE basketTbl SET productCount="+productCount+" WHERE num=? and memId=?");
			pstmt.setInt(1, num);
			pstmt.setString(2, memId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//장바구니 모두 삭제
	public void setBasketAllDelete(String memId) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("delete from basketTbl where memId = ?");
			pstmt.setString(1, memId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//장바구니 하나 삭제
	public void setBasketOneDelete(String memId, int num) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("delete from basketTbl where memId = ? and num = ?");
			pstmt.setString(1, memId);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//orderProductTbl에 insert 후 해당 아이디 장바구니 비우기
	public void setDeleteBasket(WatTimeBasketDTO basketDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("delete from basketTbl where memId=? and memName=? and productName=?");
			pstmt.setString(1, basketDTO.getMemId());
			pstmt.setString(2, basketDTO.getMemName());
			pstmt.setString(3, basketDTO.getProductName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//수량 수정 전 초기 개수
	public int getBasketCount(String memId,int num) {
		int basketCount = 0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from basketTbl where memId = ? and num=?");
			pstmt.setString(1, memId);
			pstmt.setInt(2, num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				basketCount = rs.getInt("productCount");
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return basketCount;
	}
}
