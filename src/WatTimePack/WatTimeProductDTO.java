package WatTimePack;

import java.sql.Timestamp;

public class WatTimeProductDTO {
	private String productCode;
	private String brandKor;
	private String brandEng;
	private String productName;
	private String productType;
	private int productPrice;
	private int tictok;
	private String productCountry;
	private int productOrder;
	private Timestamp productAddDate;
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getBrandKor() {
		return brandKor;
	}
	public void setBrandKor(String brandKor) {
		this.brandKor = brandKor;
	}
	public String getBrandEng() {
		return brandEng;
	}
	public void setBrandEng(String brandEng) {
		this.brandEng = brandEng;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getTictok() {
		return tictok;
	}
	public void setTictok(int tictok) {
		this.tictok = tictok;
	}
	public String getProductCountry() {
		return productCountry;
	}
	public void setProductCountry(String productCountry) {
		this.productCountry = productCountry;
	}
	public int getProductOrder() {
		return productOrder;
	}
	public void setProductOrder(int productOrder) {
		this.productOrder = productOrder;
	}
	public Timestamp getProductAddDate() {
		return productAddDate;
	}
	public void setProductAddDate(Timestamp productAddDate) {
		this.productAddDate = productAddDate;
	}
	
	
}
