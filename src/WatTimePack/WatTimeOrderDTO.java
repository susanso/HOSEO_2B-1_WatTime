package WatTimePack;

import java.sql.Timestamp;

public class WatTimeOrderDTO {
	private int orderNum;
	private String memId;
	private String memName;
	private String productName;
	private int totalPrice;
	private int useTicTok;
	private int TicTok;
	private Timestamp orderDate;
	private String paymentMethod;
	private String serialNumber;
	private int installments;
	private String orderStatus;
	private String orderMessage;
	private String orderAddress;
	private String orderPostCode;
	
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
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getUseTicTok() {
		return useTicTok;
	}
	public void setUseTicTok(int useTicTok) {
		this.useTicTok = useTicTok;
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
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public int getInstallments() {
		return installments;
	}
	public void setInstallments(int installments) {
		this.installments = installments;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderMessage() {
		return orderMessage;
	}
	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderPostCode() {
		return orderPostCode;
	}
	public void setOrderPostCode(String orderPostCode) {
		this.orderPostCode = orderPostCode;
	}
}
