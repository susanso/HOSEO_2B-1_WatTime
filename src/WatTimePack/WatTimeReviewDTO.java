package WatTimePack;

import java.sql.Timestamp;

public class WatTimeReviewDTO {
	private int num;
	private String productCode;
	private String memId;
	private String memName;
	private int reviewScore;
	private String reviewContent;
	private Timestamp reg_date;
	private int ref;
    private int re_step;	//기본 0으로 원글 +1로 증가하면서 
    private int re_level;
    private String productName;
    private String productSimpleImgFileName;
    
    
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductSimpleImgFileName() {
		return productSimpleImgFileName;
	}
	public void setProductSimpleImgFileName(String productSimpleImgFileName) {
		this.productSimpleImgFileName = productSimpleImgFileName;
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
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
    
    
}
