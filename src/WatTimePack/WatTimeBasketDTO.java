package WatTimePack;

import java.sql.Timestamp;

public class WatTimeBasketDTO {

	private int num;
	private String productCode;
	private String productName;
	private String memId;
	private String memName;
	private String productSimpleImgFileName;
	private int productPrice;
	private int productCount;
	private Timestamp basketAddDate;
	private int tictok;
	
	
	public int getTictok() {
		return tictok;
	}
	public void setTictok(int tictok) {
		this.tictok = tictok;
	}
	public Timestamp getBasketAddDate() {
		return basketAddDate;
	}
	public void setBasketAddDate(Timestamp basketAddDate) {
		this.basketAddDate = basketAddDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getProductSimpleImgFileName() {
		return productSimpleImgFileName;
	}
	public void setProductSimpleImgFileName(String productSimpleImgFileName) {
		this.productSimpleImgFileName = productSimpleImgFileName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	
	
}
