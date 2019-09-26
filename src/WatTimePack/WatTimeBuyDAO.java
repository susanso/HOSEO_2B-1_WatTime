package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WatTimeBuyDAO {
	//상품 상세보기 부분
	public WatTimeProductDTO getProductSpec(String productCode) {
		WatTimeProductDTO productDTO = new WatTimeProductDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where productCode = ?");
			pstmt.setString(1, productCode);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productDTO.setProductCode(rs.getString("productCode"));
				productDTO.setBrandKor(rs.getString("brandKor"));
				productDTO.setBrandEng(rs.getString("brandEng"));
				productDTO.setProductName(rs.getString("productName"));
				productDTO.setProductType(rs.getString("productType"));
				productDTO.setProductOriginalPrice(rs.getInt("productOriginalPrice"));
				productDTO.setProductSale(rs.getInt("productSale"));
				productDTO.setProductPrice(rs.getInt("productPrice"));
				productDTO.setTictok(rs.getInt("tictok"));
				productDTO.setProductCountry(rs.getString("productCountry"));
				productDTO.setProductOrder(rs.getInt("productOrder"));
				productDTO.setProductAddDate(rs.getTimestamp("productAddDate"));
				productDTO.setProductSimpleImgFileName(rs.getString("productSimpleImgFileName"));
				productDTO.setProductSimpleImgFilePath(rs.getString("productSimpleImgFilePath"));
				productDTO.setProductDetailImgFileName(rs.getString("productDetailImgFileName"));
				productDTO.setProductDetailImgFilePath(rs.getString("productDetailImgFilePath"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productDTO;
	}
}
