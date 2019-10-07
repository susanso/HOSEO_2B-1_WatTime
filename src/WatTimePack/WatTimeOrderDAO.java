package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

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
	//관리자
	public List<WatTimeOrderDTO> getProductAdminList(int start, int end, Timestamp startDate, Timestamp endDateFormat,String orderStatus) {
		List<WatTimeOrderDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from orderTbl where orderStatus like '%"+orderStatus+"%' and orderDate between ? and ? order by orderDate DESC limit ?,?");
			pstmt.setTimestamp(1, startDate);
			pstmt.setTimestamp(2, endDateFormat);
			pstmt.setInt(3, start-1);
			pstmt.setInt(4, end);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeOrderDTO orderDTO = new WatTimeOrderDTO();
					orderDTO.setOrderNum(rs.getInt("orderNum"));
					orderDTO.setMemId(rs.getString("memId"));
					orderDTO.setMemName(rs.getString("memName"));
					orderDTO.setProductName(rs.getString("productName"));
					orderDTO.setTotalPrice(rs.getInt("totalPrice"));
					orderDTO.setUseTicTok(rs.getInt("useTicTok"));
					orderDTO.setTicTok(rs.getInt("TicTok"));
					orderDTO.setOrderDate(rs.getTimestamp("orderDate"));
					orderDTO.setPaymentMethod(rs.getString("paymentMethod"));
					orderDTO.setSerialNumber(rs.getString("serialNumber"));
					orderDTO.setInstallments(rs.getInt("installments"));
					orderDTO.setOrderStatus(rs.getString("orderStatus"));
					orderDTO.setOrderMessage(rs.getString("orderMessage"));
					orderDTO.setOrderAddress(rs.getString("orderAddress"));
					orderDTO.setOrderPostCode(rs.getString("orderPostCode"));
					list.add(orderDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
	//관리자 주문내역 주문 개수
	public int getProductAllCount(Timestamp startDate,Timestamp endDate,String orderStatus) {
		int orderCount=0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from orderTbl where orderStatus like '%"+orderStatus+"%' and orderDate between ? and ?");
			pstmt.setTimestamp(1, startDate);
			pstmt.setTimestamp(2, endDate);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				orderCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return orderCount;
	}
	//일반 사용자 주문내역 주문 개수
	public int getProductUserCount(String memId,Timestamp startDate,Timestamp endDate) {
		int orderCount=0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from orderTbl where memId=? and orderDate between ? and ?");
			pstmt.setString(1, memId);
			pstmt.setTimestamp(2, startDate);
			pstmt.setTimestamp(3, endDate);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				orderCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return orderCount;
	}
	//일반 유저
	public List<WatTimeOrderDTO> getProductUserList(int start, int end, Timestamp startDate, Timestamp endDateFormat,String memId) {
		List<WatTimeOrderDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from orderTbl where (memId=?) and (orderDate between ? and ?) order by orderDate DESC limit ?,?");
			pstmt.setString(1, memId);
			pstmt.setTimestamp(2, startDate);
			pstmt.setTimestamp(3, endDateFormat);
			pstmt.setInt(4, start-1);
			pstmt.setInt(5, end);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeOrderDTO orderDTO = new WatTimeOrderDTO();
					orderDTO.setOrderNum(rs.getInt("orderNum"));
					orderDTO.setMemId(rs.getString("memId"));
					orderDTO.setMemName(rs.getString("memName"));
					orderDTO.setProductName(rs.getString("productName"));
					orderDTO.setTotalPrice(rs.getInt("totalPrice"));
					orderDTO.setUseTicTok(rs.getInt("useTicTok"));
					orderDTO.setTicTok(rs.getInt("TicTok"));
					orderDTO.setOrderDate(rs.getTimestamp("orderDate"));
					orderDTO.setPaymentMethod(rs.getString("paymentMethod"));
					orderDTO.setSerialNumber(rs.getString("serialNumber"));
					orderDTO.setInstallments(rs.getInt("installments"));
					orderDTO.setOrderStatus(rs.getString("orderStatus"));
					orderDTO.setOrderMessage(rs.getString("orderMessage"));
					orderDTO.setOrderAddress(rs.getString("orderAddress"));
					orderDTO.setOrderPostCode(rs.getString("orderPostCode"));
					list.add(orderDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
	//상태 업데이트
	public void setOrderStatusUpdate(int orderNum, String orderStatus) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update orderTbl set orderStatus = ? where orderNum = ?");
			pstmt.setString(1, orderStatus);
			pstmt.setInt(2, orderNum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
