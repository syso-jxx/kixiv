package kr.ddit.kixiv.picboard.vo;

import java.util.Date;

public class Picboard {
	private String picboard;
	
	private int board_id;
	private Date board_date;
	private String del_yn;
	private String user_id;

   // Getter for picboard
    public String getPicboard() {
        return picboard;
    }

    // Setter for picboard
    public void setPicboard(String picboard) {
        this.picboard = picboard;
    }
	
	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
