package com.tech.vo;



public class CommentVO {
	private int c_seq;
	private String c_writer;
	private String c_text;
	private int c_boardSeq;
	private String c_date;
	
	public CommentVO() {
	}

	public CommentVO(String c_writer, String c_text, int c_boardSeq) {
		super();
		this.c_writer = c_writer;
		this.c_text = c_text;
		this.c_boardSeq = c_boardSeq;
	}
	
	public int getC_seq() {
		return c_seq;
	}
	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}
	public String getC_text() {
		return c_text;
	}
	public void setC_text(String c_text) {
		this.c_text = c_text;
	}
	public int getC_boardSeq() {
		return c_boardSeq;
	}
	public void setC_boardSeq(int c_boardSeq) {
		this.c_boardSeq = c_boardSeq;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	@Override
	public String toString() {
		return "CommentVO [c_seq=" + c_seq + ", c_writer=" + c_writer + ", c_text=" + c_text + ", c_boardSeq="
				+ c_boardSeq + ", c_date=" + c_date + "]";
	}
	
	
	
	

	
	
}
