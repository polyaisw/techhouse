package com.tech.vo;


public class QnaVO{
	private int q_seq;
	private int q_boardSeq;
	private String q_category;
	private String q_title;
	private String q_text;
	private String q_email;
	private String q_tel;
	private String q_uploadImg;
	private int q_complete;
	private String q_date;
	
	
	public QnaVO(int q_boardSeq, String q_category, String q_title, String q_text, String q_email, String q_tel,
			String q_uploadImg) {
		super();
		this.q_boardSeq = q_boardSeq;
		this.q_category = q_category;
		this.q_title = q_title;
		this.q_text = q_text;
		this.q_email = q_email;
		this.q_tel = q_tel;
		this.q_uploadImg = q_uploadImg;
		this.q_complete = 0;
	}
	
	
	
	
	public int getQ_seq() {
		return q_seq;
	}




	public void setQ_seq(int q_seq) {
		this.q_seq = q_seq;
	}




	public int getQ_boardSeq() {
		return q_boardSeq;
	}




	public void setQ_boardSeq(int q_boardSeq) {
		this.q_boardSeq = q_boardSeq;
	}




	public String getQ_category() {
		return q_category;
	}




	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}




	public String getQ_title() {
		return q_title;
	}




	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}




	public String getQ_text() {
		return q_text;
	}




	public void setQ_text(String q_text) {
		this.q_text = q_text;
	}




	public String getQ_email() {
		return q_email;
	}




	public void setQ_email(String q_email) {
		this.q_email = q_email;
	}




	public String getQ_tel() {
		return q_tel;
	}




	public void setQ_tel(String q_tel) {
		this.q_tel = q_tel;
	}




	public String getQ_uploadImg() {
		return q_uploadImg;
	}




	public void setQ_uploadImg(String q_uploadImg) {
		this.q_uploadImg = q_uploadImg;
	}




	public int getQ_complete() {
		return q_complete;
	}




	public void setQ_complete(int q_complete) {
		this.q_complete = q_complete;
	}




	public String getQ_date() {
		return q_date;
	}




	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}




	@Override
	public String toString() {
		return "QnaVO [q_seq=" + q_seq + ", q_boardSeq=" + q_boardSeq + ", q_category=" + q_category + ", q_title="
				+ q_title + ", q_text=" + q_text + ", q_email=" + q_email + ", q_tel=" + q_tel + ", q_uploadImg="
				+ q_uploadImg + ", q_complete=" + q_complete + ", q_date=" + q_date + "]";
	}








	
	
}
