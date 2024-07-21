package kr.ddit.kixiv.likey.vo;

public class LikeyVo {
	private int like_seq;
	private String user_id;
	private int pic_num;
	private int cmt_id;
	private int tocmt_id;
	private int fund_id;

	public int getLike_seq() {
		return like_seq;
	}

	public void setLike_seq(int like_seq) {
		this.like_seq = like_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getPic_num() {
		return pic_num;
	}

	public void setPic_num(int pic_num) {
		this.pic_num = pic_num;
	}

	public int getCmt_id() {
		return cmt_id;
	}

	public void setCmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
	}

	public int getTocmt_id() {
		return tocmt_id;
	}

	public void setTocmt_id(int tocmt_id) {
		this.tocmt_id = tocmt_id;
	}

	public int getFund_id() {
		return fund_id;
	}

	public void setFund_id(int fund_id) {
		this.fund_id = fund_id;
	}

}
