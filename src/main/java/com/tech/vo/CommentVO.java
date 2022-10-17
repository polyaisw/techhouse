package com.tech.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int c_seq;
	private String c_writer;
	private String c_text;
	private int c_boardSeq;
	private String c_date;
	
	public CommentVO(String c_writer, String c_text, int c_boardSeq) {
		super();
		this.c_writer = c_writer;
		this.c_text = c_text;
		this.c_boardSeq = c_boardSeq;
	}


	
	
}
