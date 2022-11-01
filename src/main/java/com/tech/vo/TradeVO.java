package com.tech.vo;

public class TradeVO implements BVO{

	private int t_seq;
	private String t_title;
	private String t_writer;
	private String t_prodName;
	private String t_price;
	private String t_state;
	private int t_views;
	private String t_text;
	private String t_uploadImg;
	private String t_category;
	private String t_date;
	private String keyword;		//getBoardListKeywordNumber용	ex)"b_recommed"많은순
	private int listSize;		//getBoardListKeywordNumber용	"5"개 가져오기
	
	//등록용
	public TradeVO(String t_title, String t_writer, String t_prodName, String t_price,
			String t_text, String t_uploadImg, String t_category) {
		super();
		this.t_title = t_title;
		this.t_writer = t_writer;
		this.t_prodName = t_prodName;
		this.t_price = t_price;
		this.t_state = "판매중";
		this.t_views = 0;
		this.t_text = t_text;
		this.t_uploadImg = t_uploadImg;
		this.t_category = t_category;
	}

	public TradeVO() {
		this.t_category = "거래게시판";
		// TODO Auto-generated constructor stub
	}

	public int getT_seq() {
		return t_seq;
	}

	public void setT_seq(int t_seq) {
		this.t_seq = t_seq;
	}

	public String getT_title() {
		return t_title;
	}

	public void setT_title(String t_title) {
		this.t_title = t_title;
	}

	public String getT_writer() {
		return t_writer;
	}

	public void setT_writer(String t_writer) {
		this.t_writer = t_writer;
	}

	public String getT_prodName() {
		return t_prodName;
	}

	public void setT_prodName(String t_prodName) {
		this.t_prodName = t_prodName;
	}

	public String getT_price() {
		return t_price;
	}

	public void setT_price(String t_price) {
		this.t_price = t_price;
	}


	public String getT_state() {
		return t_state;
	}

	public void setT_state(String t_state) {
		this.t_state = t_state;
	}

	public int getT_views() {
		return t_views;
	}

	public void setT_views(int t_views) {
		this.t_views = t_views;
	}

	public String getT_text() {
		return t_text;
	}

	public void setT_text(String t_text) {
		this.t_text = t_text;
	}

	public String getT_uploadImg() {
		return t_uploadImg;
	}

	public void setT_uploadImg(String t_uploadImg) {
		this.t_uploadImg = t_uploadImg;
	}

	public String getT_category() {
		return t_category;
	}

	public void setT_category(String t_category) {
		this.t_category = t_category;
	}

	public String getT_date() {
		return t_date;
	}

	public void setT_date(String t_date) {
		this.t_date = t_date;
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
		return "TradeVO [t_seq=" + t_seq + ", t_title=" + t_title + ", t_writer=" + t_writer + ", t_prodName="
				+ t_prodName + ", t_price=" + t_price + ", t_state=" + t_state + ", t_views=" + t_views + ", t_text="
				+ t_text + ", t_uploadImg=" + t_uploadImg + ", t_category=" + t_category + ", t_date=" + t_date + "]";
	}

	
	
	
}
