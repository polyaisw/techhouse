package com.tech.vo;


	// @Data : lombok연결 게터, 세터 자동생성
public class BoardVO implements BVO{
	private int b_seq;
	private String b_title;
	private String b_writer;
	private int b_views;
	private int b_recommed;		//추천수
	private int b_commentcount;
	private String b_text;
	private String b_uploadImg;
	private String b_category;
	private String b_date;
	private String keyword;		//getBoardListKeywordNumber용	ex)"b_recommed"많은순
	private int listSize;		//getBoardListKeywordNumber용	"5"개 가져오기
	
	 public BoardVO() {} 
	
	 //생성용
	public BoardVO(String b_title, String b_writer,String b_text,
			String b_uploadImg, String b_category) {
		super();
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_text = b_text;
		this.b_uploadImg = b_uploadImg;
		this.b_category = b_category;
		this.b_recommed = 0;
		this.b_commentcount = 0;
		this.b_views = 0;
	}
	
	
	

	public int getB_seq() {
		return b_seq;
	}

	public void setB_seq(String b_seq) {
		this.b_seq = Integer.parseInt(b_seq);
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public int getB_views() {
		return b_views;
	}

	public void setB_views(int b_views) {
		this.b_views = b_views;
	}

	public int getB_recommed() {
		return b_recommed;
	}

	public void setB_recommed(int b_recommed) {
		this.b_recommed = b_recommed;
	}

	public int getB_commentcount() {
		return b_commentcount;
	}

	public void setB_commentcount(int b_commentcount) {
		this.b_commentcount = b_commentcount;
	}

	public String getB_text() {
		return b_text;
	}

	public void setB_text(String b_text) {
		this.b_text = b_text;
	}

	public String getB_uploadImg() {
		return b_uploadImg;
	}

	public void setB_uploadImg(String b_uploadImg) {
		this.b_uploadImg = b_uploadImg;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	@Override
	public String toString() {
		return "BoardVO [b_seq=" + b_seq + ", b_title=" + b_title + ", b_writer=" + b_writer + ", b_views=" + b_views
				+ ", b_recommed=" + b_recommed + ", b_commentcount=" + b_commentcount + ", b_text=" + b_text
				+ ", b_uploadImg=" + b_uploadImg + ", b_category=" + b_category + ", b_date=" + b_date + "]";
	}



}