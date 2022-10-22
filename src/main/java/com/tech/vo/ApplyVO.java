package com.tech.vo;

public class ApplyVO {

	private int a_seq;
	private String a_productName;	//상품명
	private String a_applyId;		//지원자메일
	private String a_applyName;		//지원자이름
	private String a_applyTel;
	
	
	
	public ApplyVO(String a_productName, String a_applyId, String a_applyName, String a_applyTel) {
		super();
		this.a_productName = a_productName;
		this.a_applyId = a_applyId;
		this.a_applyName = a_applyName;
		this.a_applyTel = a_applyTel;
	}



	public int getA_seq() {
		return a_seq;
	}



	public void setA_seq(int a_seq) {
		this.a_seq = a_seq;
	}



	public String getA_productName() {
		return a_productName;
	}



	public void setA_productName(String a_productName) {
		this.a_productName = a_productName;
	}



	public String getA_applyId() {
		return a_applyId;
	}



	public void setA_applyId(String a_applyId) {
		this.a_applyId = a_applyId;
	}



	public String getA_applyName() {
		return a_applyName;
	}



	public void setA_applyName(String a_applyName) {
		this.a_applyName = a_applyName;
	}



	public String getA_applyTel() {
		return a_applyTel;
	}



	public void setA_applyTel(String a_applyTel) {
		this.a_applyTel = a_applyTel;
	}



	@Override
	public String toString() {
		return "ApplyVO [a_seq=" + a_seq + ", a_productName=" + a_productName + ", a_applyId=" + a_applyId
				+ ", a_applyName=" + a_applyName + ", a_applyTel=" + a_applyTel + "]";
	}





	
	
}
