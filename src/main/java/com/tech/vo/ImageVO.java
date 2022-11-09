package com.tech.vo;

import java.util.List;

public class ImageVO {

	private int i_seq;
	private int i_boardSeq;
	private String i_img;
	public int getI_seq() {
		return i_seq;
	}
	public void setI_seq(int i_seq) {
		this.i_seq = i_seq;
	}
	public int getI_boardSeq() {
		return i_boardSeq;
	}
	public void setI_boardSeq(int i_boardSeq) {
		this.i_boardSeq = i_boardSeq;
	}
	public String getI_img() {
		return i_img;
	}
	public void setI_img(String i_img) {
		this.i_img = i_img;
	}
	@Override
	public String toString() {
		return "ImageVO [i_seq=" + i_seq + ", i_boardSeq=" + i_boardSeq + ", i_img=" + i_img + "]";
	}
	
	
	
}
