
package com.tech.vo;


public class ProductVO {
	private int prod_seq;
	private String prod_productName;
	private String prod_price;
	private String prod_uploadImg;
	private String prod_selectedId;	//당첨자
	private String prod_selectedName;	//당첨자
	private String prod_selectedTel;	//당첨자
	private String prod_date;
	private int prod_posting;
	private String prod_closeTime;




	public ProductVO() { }
	 
	
	
	public ProductVO(String prod_productName, String prod_price, String prod_uploadImg) {
		super();
		this.prod_productName = prod_productName;
		this.prod_price = prod_price;
		if(prod_uploadImg.equals("") || prod_uploadImg == null) 
		{prod_uploadImg = null;}
		else {
			this.prod_uploadImg = prod_uploadImg;
		}
		this.prod_posting = 0;
	}


	
	public int getProd_posting() {
		return prod_posting;
	}



	public void setProd_posting(int prod_posting) {
		this.prod_posting = prod_posting;
	}



	public int getProd_seq() {
		return prod_seq;
	}


	public void setProd_seq(int prod_seq) {
		this.prod_seq = prod_seq;
	}


	public String getProd_productName() {
		return prod_productName;
	}


	public void setProd_productName(String prod_productName) {
		this.prod_productName = prod_productName;
	}


	public String getProd_price() {
		return prod_price;
	}


	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}


	public String getProd_uploadImg() {
		return prod_uploadImg;
	}


	public void setProd_uploadImg(String prod_uploadImg) {
		this.prod_uploadImg = prod_uploadImg;
	}


	
	public String getProd_selectedId() {
		return prod_selectedId;
	}



	public void setProd_selectedId(String prod_selectedId) {
		this.prod_selectedId = prod_selectedId;
	}



	public String getProd_selectedName() {
		return prod_selectedName;
	}



	public void setProd_selectedName(String prod_selectedName) {
		this.prod_selectedName = prod_selectedName;
	}



	public String getProd_selectedTel() {
		return prod_selectedTel;
	}



	public void setProd_selectedTel(String prod_selectedTel) {
		this.prod_selectedTel = prod_selectedTel;
	}



	public String getProd_date() {
		return prod_date;
	}


	public void setProd_date(String prod_date) {
		this.prod_date = prod_date;
	}

	public String getProd_closeTime() {
		return prod_closeTime;
	}



	public void setProd_closeTime(String prod_closeTime) {
		this.prod_closeTime = prod_closeTime;
	}



	@Override
	public String toString() {
		return "ProductVO [prod_seq=" + prod_seq + ", prod_productName=" + prod_productName + ", prod_price="
				+ prod_price + ", prod_uploadImg=" + prod_uploadImg + ", prod_selectedId=" + prod_selectedId
				+ ", prod_selectedName=" + prod_selectedName + ", prod_selectedTel=" + prod_selectedTel + ", prod_date="
				+ prod_date + "]";
	}
	
	

}
