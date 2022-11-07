package com.tech.vo;

public class UserVO {

	private String id;		//10/13일 수정 
	private String password;
	private String name;
	private int point;
	private String rank;
	private int blacklist;
	private String profileimg;
	private String tel;
	private String post;	//10/13일 수정
	private String addr;
	private String addr2;
	private int ticket;		//10/13일 수정
	private int boardCnt;
	private int tradeCnt;
	private int commentCnt; //11/05일 수정
	
	
	public int getTradeCnt() {
		return tradeCnt;
	}
	public void setTradeCnt(int tradeCnt) {
		this.tradeCnt = tradeCnt;
	}
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public int getBlacklist() {
		return blacklist;
	}
	public void setBlacklist(int blacklist) {
		this.blacklist = blacklist;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public int getTicket() {
		return ticket;
	}
	public void setTicket(int ticket) {
		this.ticket = ticket;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", point=" + point + ", rank=" + rank
				+ ", blacklist=" + blacklist + ", profileimg=" + profileimg + ", tel=" + tel + ", post=" + post + ", addr="
				+ addr + ", addr2=" + addr2 + ", ticket=" + ticket + ", boardCnt=" + boardCnt + ", commentCnt="
				+ commentCnt + ", tradeCnt=" + tradeCnt + "]";
	}

	
	
	
	
}
