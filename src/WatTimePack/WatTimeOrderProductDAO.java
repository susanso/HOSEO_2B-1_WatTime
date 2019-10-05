package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WatTimeOrderProductDAO {
	//결제 상품 목록
	public void setProduct(WatTimeOrderProductDTO orderProductDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("insert into orderProductTbl(orderNum,memId,memName"
														  +",productName,productCount,productPrice,TicTok,orderDate"
														  +",productCode) values(?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, orderProductDTO.getOrderNum());
			pstmt.setString(2, orderProductDTO.getMemId());
			pstmt.setString(3, orderProductDTO.getMemName());
			pstmt.setString(4, orderProductDTO.getProductName());
			pstmt.setInt(5, orderProductDTO.getProductCount());
			pstmt.setInt(6, orderProductDTO.getProductPrice());
			pstmt.setInt(7, orderProductDTO.getTicTok());
			pstmt.setTimestamp(8, orderProductDTO.getOrderDate());
			pstmt.setString(9, orderProductDTO.getProductCode());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//주문 내역에 상품 이름 클릭시 
	public List<WatTimeOrderProductDTO> getOrderProductList(int orderNum) {
		List<WatTimeOrderProductDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from orderProductTbl where orderNum = ?");
			pstmt.setInt(1, orderNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeOrderProductDTO orderProductDTO = new WatTimeOrderProductDTO();
					orderProductDTO.setProductCode(rs.getString("productCode"));
					orderProductDTO.setOrderProductNum(rs.getInt("orderProductNum"));
					orderProductDTO.setOrderNum(rs.getInt("orderNum"));
					orderProductDTO.setMemId(rs.getString("memId"));
					orderProductDTO.setMemName(rs.getString("memName"));
					orderProductDTO.setProductName(rs.getString("productName"));
					orderProductDTO.setProductCount(rs.getInt("productCount"));
					orderProductDTO.setProductPrice(rs.getInt("productPrice"));
					orderProductDTO.setTicTok(rs.getInt("TicTok"));
					orderProductDTO.setOrderDate(rs.getTimestamp("orderDate"));
					list.add(orderProductDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
}
