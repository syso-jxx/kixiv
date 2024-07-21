package kr.ddit.kixiv.picture.vo;

public class Picture {
	private int pic_num;
	private String pic_path;
	private String pic_name;
	private String thum_name;
	private int down_cnt;
	private int board_id;
	private String user_id;
	private int cnt;
	private int likey_cnt;
	private String profile_img;
	
	public int getPic_num() {
		return pic_num;
	}

	public void setPic_num(int pic_num) {
		this.pic_num = pic_num;
	}

	public String getPic_path() {
		return pic_path;
	}

	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}

	public String getPic_name() {
		return pic_name;
	}

	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}

	public String getThum_name() {
		return thum_name;
	}

	public void setThum_name(String thum_name) {
		this.thum_name = thum_name;
	}

	public int getDown_cnt() {
		return down_cnt;
	}

	public void setDown_cnt(int down_cnt) {
		this.down_cnt = down_cnt;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getLikey_cnt() {
		return likey_cnt;
	}

	public void setLikey_cnt(int likey_cnt) {
		this.likey_cnt = likey_cnt;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	
	
	
}
