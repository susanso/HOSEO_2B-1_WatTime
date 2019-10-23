package WatTimePack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WatTimeProductDAO {
	//전체 브랜드의 상품 갯수
	public int getProductAllCount() {
		int productCount=0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from productTbl");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productCount;
	}

	//전체 상품 리스트 가져오는 부분
	public List<WatTimeProductDTO> getProductAllList(int start, int end, String sort) {
		List<WatTimeProductDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl order by "+sort+" limit ?,?");
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
					productDTO.setProductDetailImgFilePath(rs.getString("productSimpleImgFilePath"));
					productDTO.setProductVolume(rs.getInt("productVolume"));
					list.add(productDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//메인 남자
	public List<WatTimeProductDTO> getProductMainManList() {
		List<WatTimeProductDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where productType = 'man' and "+
														   "productVolume>0 order by productOrder DESC limit 0,8");
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeProductDTO productDTO = new WatTimeProductDTO();
					productDTO.setProductCode(rs.getString("productCode"));
					productDTO.setBrandKor(rs.getString("brandKor"));
					productDTO.setBrandEng(rs.getString("brandEng"));
					productDTO.setProductName(rs.getString("productName"));
					productDTO.setProductType(rs.getString("productType"));
					productDTO.setProductOriginalPrice(rs.getInt("productOriginalPrice"));
					productDTO.setProductSale(rs.getInt("productSale"));
					productDTO.setProductPrice(rs.getInt("productPrice"));
					productDTO.setTictok(rs.getInt("tictok"));
					productDTO.setProductSimpleImgFileName(rs.getString("productSimpleImgFileName"));
					productDTO.setProductVolume(rs.getInt("productVolume"));
					list.add(productDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//메인 여자
	public List<WatTimeProductDTO> getProductMainWomanList() {
		List<WatTimeProductDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where productType = 'woman' and "+
														   "productVolume>0 order by productOrder DESC limit 0,8");
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					WatTimeProductDTO productDTO = new WatTimeProductDTO();
					productDTO.setProductCode(rs.getString("productCode"));
					productDTO.setBrandKor(rs.getString("brandKor"));
					productDTO.setBrandEng(rs.getString("brandEng"));
					productDTO.setProductName(rs.getString("productName"));
					productDTO.setProductType(rs.getString("productType"));
					productDTO.setProductOriginalPrice(rs.getInt("productOriginalPrice"));
					productDTO.setProductSale(rs.getInt("productSale"));
					productDTO.setProductPrice(rs.getInt("productPrice"));
					productDTO.setTictok(rs.getInt("tictok"));
					productDTO.setProductSimpleImgFileName(rs.getString("productSimpleImgFileName"));
					productDTO.setProductVolume(rs.getInt("productVolume"));
					list.add(productDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//성별 브랜드의 상품 갯수
	public int getProductTypeCount(String type) {
		int productCount=0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from productTbl where productType like '"+type+"'");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productCount;
	}

	//타입별 상품 리스트 가져오는 부분
	public List<WatTimeProductDTO> getProductTypeList(String type,int start, int end, String sort) {
		List<WatTimeProductDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where productType like '"+type+"' order by "+sort+"  limit ?,?");
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
					productDTO.setProductDetailImgFilePath(rs.getString("productSimpleImgFilePath"));
					productDTO.setProductVolume(rs.getInt("productVolume"));
					list.add(productDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	
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
	public List<WatTimeProductDTO> getProductList(String brand,String type, int start, int end, String sort) {
		List<WatTimeProductDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where brandEng=? and productType like '%"+type+"%'"+
															" order by "+sort+" limit ?,?");
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
					productDTO.setProductDetailImgFilePath(rs.getString("productSimpleImgFilePath"));
					productDTO.setProductVolume(rs.getInt("productVolume"));
					list.add(productDTO);
				}while(rs.next());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return list;
	}
	//검색한 상품의 리스트 갯수
	public int getSearchProductCount(String searchText) {
		int searchProductCount = 0;
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select count(*) from productTbl where productName like '%"+searchText+"%' or"+
														   " brandEng like '%"+searchText+"%' or brandKor like '%"+searchText+"%' or productType like '"+searchText+"'");
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
	public List<WatTimeProductDTO> getSearchProductList(String searchText, int start, int end, String sortText) {
		List<WatTimeProductDTO> list = new ArrayList<>();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where productName like '%"+searchText+"%' or "+
														   "brandEng like '%"+searchText+"%' or brandKor like '%"+searchText+"%' or "+
														   "productType like '"+searchText+"' order by "+sortText+" limit ?,?");
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
					productDTO.setProductDetailImgFilePath(rs.getString("productSimpleImgFilePath"));
					productDTO.setProductVolume(rs.getInt("productVolume"));
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
				productDTO.setProductVolume(rs.getInt("productVolume"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productDTO;
	}
	//상품 등록
	public void setProduct(WatTimeProductDTO productDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("insert into productTbl values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, productDTO.getProductCode());
			pstmt.setString(2, productDTO.getBrandKor());
			pstmt.setString(3, productDTO.getBrandEng());
			pstmt.setString(4, productDTO.getProductName());
			pstmt.setString(5, productDTO.getProductType());
			pstmt.setInt(6, productDTO.getProductOriginalPrice());
			pstmt.setInt(7, productDTO.getProductSale());
			pstmt.setInt(8, productDTO.getProductPrice());
			pstmt.setInt(9, productDTO.getTictok());
			pstmt.setString(10, productDTO.getProductCountry());
			pstmt.setInt(11, productDTO.getProductOrder());
			pstmt.setTimestamp(12, productDTO.getProductAddDate());
			pstmt.setString(13, productDTO.getProductSimpleImgFileName());
			pstmt.setString(14, productDTO.getProductSimpleImgFilePath());
			pstmt.setString(15, productDTO.getProductDetailImgFileName());
			pstmt.setString(16, productDTO.getProductDetailImgFilePath());
			pstmt.setInt(17, productDTO.getProductVolume());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//상품 수정 정보
	public WatTimeProductDTO getProductModifyForm(String productCode) {
		WatTimeProductDTO productDTO = new WatTimeProductDTO();
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where productCode = ?");
			pstmt.setString(1, productCode);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
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
				productDTO.setProductDetailImgFilePath(rs.getString("productSimpleImgFilePath"));
				productDTO.setProductVolume(rs.getInt("productVolume"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productDTO;
	}
	//상품 수정
	public void setProductModify(WatTimeProductDTO productDTO) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update productTbl set brandKor=?, brandEng=?, productName=?, productType=?, productOriginalPrice=?, "
					+"productSale=?, productPrice=?, tictok=?, productCountry=?, productSimpleImgFileName=? "+
					", productDetailImgFileName=?, productVolume=? where productCode = ?");
			pstmt.setString(1, productDTO.getBrandKor());
			pstmt.setString(2, productDTO.getBrandEng());
			pstmt.setString(3, productDTO.getProductName());
			pstmt.setString(4, productDTO.getProductType());
			pstmt.setInt(5, productDTO.getProductOriginalPrice());
			pstmt.setInt(6, productDTO.getProductSale());
			pstmt.setInt(7, productDTO.getProductPrice());
			pstmt.setInt(8, productDTO.getTictok());
			pstmt.setString(9, productDTO.getProductCountry());
			pstmt.setString(10, productDTO.getProductSimpleImgFileName());
			pstmt.setString(11, productDTO.getProductDetailImgFileName());
			pstmt.setInt(12, productDTO.getProductVolume());
			pstmt.setString(13, productDTO.getProductCode());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void setProductDelete(String productCode) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("delete from productTbl where productCode = ?");
			pstmt.setString(1, productCode);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//장바구니에 담을 때 재고 수량 바꾸기
	public void setProductVolumeChange(String productCode, int productCount) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update productTbl set productVolume=productVolume-? where productCode = ?");
			pstmt.setInt(1, productCount);
			pstmt.setString(2, productCode);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//장바구니 페이지에서 수량 바꿨을 때
	public void setBasketProductVolume(String productCode, int productCount) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update productTbl set productVolume=productVolume+? where productCode = ?");
			pstmt.setInt(1, productCount);
			pstmt.setString(2, productCode);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//결제 완료 후 주문수 올리기
	public void setProductOrderUpdate(String productCode) {
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("update productTbl set productOrder=productOrder+1 where productCode = ?");
			pstmt.setString(1, productCode);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//주문 내역 이미지 가져오기
	public String getProductImg(WatTimeOrderProductDTO orderProductDTO) {
		String productImg = "";
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select productSimpleImgFileName from productTbl where productCode = ?");
			pstmt.setString(1, orderProductDTO.getProductCode());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				productImg= rs.getString("productSimpleImgFileName");
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productImg;
	}
	//이미지 가져오기
	public String getProductImg(String productCode) {
		String productImg = "";
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select productSimpleImgFileName from productTbl where productCode = ?");
			pstmt.setString(1, productCode);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				productImg= rs.getString("productSimpleImgFileName");
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return productImg;
	}
}
