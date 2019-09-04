package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WatTimeProductDAO {
	private WatTimeProductDTO registerBeanMapper(ResultSet rs) throws SQLException {
		WatTimeProductDTO regBean = new WatTimeProductDTO();
		//
		regBean.setProductCode(rs.getString("productCode"));
		regBean.setBrandKor(rs.getString("brandKor"));
		regBean.setBrandEng(rs.getString("brandEng"));
		regBean.setProductName(rs.getString("productName"));
		regBean.setProductType(rs.getString("productType"));
		regBean.setProductPrice(rs.getInt("productPrice"));
		regBean.setTictok(rs.getInt("tictok"));
		regBean.setProductCountry(rs.getString("productCountry"));
		regBean.setProductOrder(rs.getInt("productOrder"));
		regBean.setProductAddDate(rs.getTimestamp("productAddDate"));
		return regBean;
	}
	
	public List<WatTimeProductDTO> getProductList() {
		List<WatTimeProductDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(registerBeanMapper(rs));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	
	//상품 상세보기 부분
	public WatTimeProductDTO getProductSpec(String productCode) {
		WatTimeProductDTO rslt = new WatTimeProductDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where productCode = ?");
			pstmt.setString(1, productCode);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rslt = registerBeanMapper(rs);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return rslt;
	}
}
