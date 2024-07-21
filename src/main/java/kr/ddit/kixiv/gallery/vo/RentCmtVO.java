package kr.ddit.kixiv.gallery.vo;

import java.util.Date;

public class RentCmtVO {
	private int cmt_id;
	private String cmt_content;
	private Date cmt_date;
	private String del_yn;
	private int board_id;
	private String user_id;
	private String nickname;
	private int rent_seq;
	private String profile_img;
	private int grp;
	private int grps;
	private int grpl;
	private int gb_seq;
	private int gb_status;
	private int good;
	private int bad;
	
	public RentCmtVO() {
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getBad() {
		return bad;
	}

	public void setBad(int bad) {
		this.bad = bad;
	}

	public int getGb_seq() {
		return gb_seq;
	}

	public void setGb_seq(int gb_seq) {
		this.gb_seq = gb_seq;
	}

	public int getGb_status() {
		return gb_status;
	}

	public void setGb_status(int gb_status) {
		this.gb_status = gb_status;
	}

	public int getGrp() {
		return grp;
	}

	public void setGrp(int grp) {
		this.grp = grp;
	}

	public int getGrps() {
		return grps;
	}

	public void setGrps(int grps) {
		this.grps = grps;
	}

	public int getGrpl() {
		return grpl;
	}

	public void setGrpl(int grpl) {
		this.grpl = grpl;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public int getCmt_id() {
		return cmt_id;
	}

	public void setCmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public Date getCmt_date() {
		return cmt_date;
	}

	public void setCmt_date(Date cmt_date) {
		this.cmt_date = cmt_date;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getRent_seq() {
		return rent_seq;
	}

	public void setRent_seq(int rent_seq) {
		this.rent_seq = rent_seq;
	}

	@Override
	public String toString() {
		return "RentCmtVO [cmt_id=" + cmt_id + ", cmt_content=" + cmt_content + ", cmt_date=" + cmt_date + ", del_yn="
				+ del_yn + ", board_id=" + board_id + ", user_id=" + user_id + ", nickname=" + nickname + ", rent_seq="
				+ rent_seq + ", profile_img=" + profile_img + ", grp=" + grp + ", grps=" + grps + ", grpl=" + grpl
				+ ", gb_seq=" + gb_seq + ", gb_status=" + gb_status + ", good=" + good + ", bad=" + bad + "]";
	}
}
