package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WatTimeOrderDAO {
	//결제 내역 넣기
	public void setOrder(WatTimeOrderDTO orderDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("insert into orderTbl(memId,memName,productName,totalPrice"
					+",useTicTok,TicTok,orderDate,paymentMethod,serialNumber,installments,orderStatus,orderMessage,"+
					"orderAddress,orderPostCode) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, orderDTO.getMemId());
			pstmt.setString(2, orderDTO.getMemName());
			pstmt.setString(3, orderDTO.getProductName());
			pstmt.setInt(4, orderDTO.getTotalPrice());
			pstmt.setInt(5, orderDTO.getUseTicTok());
			pstmt.setInt(6, orderDTO.getTicTok());
			pstmt.setTimestamp(7, orderDTO.getOrderDate());
			pstmt.setString(8, orderDTO.getPaymentMethod());
			pstmt.setString(9, orderDTO.getSerialNumber());
			pstmt.setInt(10, orderDTO.getInstallments());
			pstmt.setString(11, orderDTO.getOrderStatus());
			pstmt.setString(12, orderDTO.getOrderMessage());
			pstmt.setString(13, orderDTO.getOrderAddress());
			pstmt.setString(14, orderDTO.getOrderPostCode());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//orderTbl에 넣은 번호 가져오기
	public int getOrderNum(WatTimeOrderDTO orderDTO) {
		int orderNum = 0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select orderNum from orderTbl where memId=? and memName=? and orderDate=?");
			pstmt.setString(1, orderDTO.getMemId());
			pstmt.setString(2, orderDTO.getMemName());
			pstmt.setTimestamp(3, orderDTO.getOrderDate());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				orderNum = rs.getInt("orderNum");
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return orderNum;
	}
}
