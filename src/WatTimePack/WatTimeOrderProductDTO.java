package WatTimePack;

import java.sql.Timestamp;

public class WatTimeOrderProductDTO {
	private int orderProductNum;
	private int orderNum;
	private String memId;
	private String memName;
	private String productName;
	private int productCount;
	private int productPrice;
	private int TicTok;
	private Timestamp orderDate;
	private String productCode;
	
	
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public int getOrderProductNum() {
		return orderProductNum;
	}
	public void setOrderProductNum(int orderProductNum) {
		this.orderProductNum = orderProductNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getTicTok() {
		return TicTok;
	}
	public void setTicTok(int ticTok) {
		TicTok = ticTok;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
