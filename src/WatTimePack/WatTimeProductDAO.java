package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WatTimeProductDAO {
	//해당 브랜드 상품 갯수
	public int getProductCount(String brand, String type) {
		int productCount=0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from productTbl where brandEng=? and productType like '%"+type+"%'");
			pstmt.setString(1, brand);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productCount;
	}
	//상품 리스트 가져오는 부분
	public List<WatTimeProductDTO> getProductList(String brand,String type, int start, int end, String sortText) {
		List<WatTimeProductDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where brandEng=? and productType like '%"+type+"%' ORDER BY "+sortText+" limit ?,?");
			pstmt.setString(1, brand);
			pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeProductDTO productDTO = new WatTimeProductDTO();
					productDTO.setProductCode(rs.getString("productCode"));
					productDTO.setBrandKor(rs.getString("brandKor"));
					productDTO.setBrandEng(rs.getString("brandEng"));
					productDTO.setProductName(rs.getString("productName"));
					productDTO.setProductType(rs.getString("productType"));
					productDTO.setProductPrice(rs.getInt("productPrice"));
					productDTO.setTictok(rs.getInt("tictok"));
					productDTO.setProductCountry(rs.getString("productCountry"));
					productDTO.setProductOrder(rs.getInt("productOrder"));
					productDTO.setProductAddDate(rs.getTimestamp("productAddDate"));
					list.add(productDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//검색한 상품의 리스트 갯수
	public int getSearchProductCount(String unText) {
		int searchProductCount = 0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from productTbl where productName like '%"+unText+"%' or brandEng like '%"+unText+"%' or brandKor like '%"+unText+"%' or productType like '%"+unText+"%'");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				searchProductCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return searchProductCount;
	}
	//검색한 상품 목록
	public List<WatTimeProductDTO> getSearchProductList(String unText, int start, int end, String sortText) {
		List<WatTimeProductDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where productName like '%"+unText+"%' or brandEng like '%"+unText+"%' or brandKor like '%"+unText+"%'or productType like'%"+unText+"%' order by "+sortText+" limit ?,?");
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeProductDTO productDTO = new WatTimeProductDTO();
					productDTO.setProductCode(rs.getString("productCode"));
					productDTO.setBrandKor(rs.getString("brandKor"));
					productDTO.setBrandEng(rs.getString("brandEng"));
					productDTO.setProductName(rs.getString("productName"));
					productDTO.setProductType(rs.getString("productType"));
					productDTO.setProductPrice(rs.getInt("productPrice"));
					productDTO.setTictok(rs.getInt("tictok"));
					productDTO.setProductCountry(rs.getString("productCountry"));
					productDTO.setProductOrder(rs.getInt("productOrder"));
					productDTO.setProductAddDate(rs.getTimestamp("productAddDate"));
					list.add(productDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
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
				productDTO.setProductPrice(rs.getInt("productPrice"));
				productDTO.setTictok(rs.getInt("tictok"));
				productDTO.setProductCountry(rs.getString("productCountry"));
				productDTO.setProductOrder(rs.getInt("productOrder"));
				productDTO.setProductAddDate(rs.getTimestamp("productAddDate"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productDTO;
	}
}
