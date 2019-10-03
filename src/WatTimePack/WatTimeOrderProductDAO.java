package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
