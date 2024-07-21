package kr.ddit.kixiv.fund.vo;

import java.util.Date;

public class FundVO {
	private int fund_id; 
	private String fund_title;
	private String fund_content; 
	private String fund_achieve;
	private Date fund_date;
	private Date fund_sdate; 
	private Date fund_edate;
	private int one_price;
	private String fund_zip;
	private String fund_add1; 
	private String fund_add2;
	private String place_tel;
	private String user_id;
	private String fund_code;
	private String total;
	private int rate;
	private String thumbnail;
	private int dday;
	
	public FundVO() {}

	public int getFund_id() {
		return fund_id;
	}

	public void setFund_id(int fund_id) {
		this.fund_id = fund_id;
	}

	public String getFund_title() {
		return fund_title;
	}

	public void setFund_title(String fund_title) {
		this.fund_title = fund_title;
	}

	public String getFund_content() {
		return fund_content;
	}

	public void setFund_content(String fund_content) {
		this.fund_content = fund_content;
	}

	public String getFund_achieve() {
		return fund_achieve;
	}

	public void setFund_achieve(String fund_achieve) {
		this.fund_achieve = fund_achieve;
	}

	public Date getFund_date() {
		return fund_date;
	}

	public void setFund_date(Date fund_date) {
		this.fund_date = fund_date;
	}

	public Date getFund_sdate() {
		return fund_sdate;
	}

	public void setFund_sdate(Date fund_sdate) {
		this.fund_sdate = fund_sdate;
	}

	public Date getFund_edate() {
		return fund_edate;
	}

	public void setFund_edate(Date fund_edate) {
		this.fund_edate = fund_edate;
	}

	public int getOne_price() {
		return one_price;
	}

	public void setOne_price(int one_price) {
		this.one_price = one_price;
	}

	public String getFund_zip() {
		return fund_zip;
	}

	public void setFund_zip(String fund_zip) {
		this.fund_zip = fund_zip;
	}

	public String getFund_add1() {
		return fund_add1;
	}

	public void setFund_add1(String fund_add1) {
		this.fund_add1 = fund_add1;
	}

	public String getFund_add2() {
		return fund_add2;
	}

	public void setFund_add2(String fund_add2) {
		this.fund_add2 = fund_add2;
	}

	public String getPlace_tel() {
		return place_tel;
	}

	public void setPlace_tel(String place_tel) {
		this.place_tel = place_tel;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFund_code() {
		return fund_code;
	}

	public void setFund_code(String fund_code) {
		this.fund_code = fund_code;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getDday() {
		return dday;
	}

	public void setDday(int dday) {
		this.dday = dday;
	}

	@Override
	public String toString() {
		return "FundVO [fund_id=" + fund_id + ", fund_title=" + fund_title + ", fund_content=" + fund_content
				+ ", fund_achieve=" + fund_achieve + ", fund_date=" + fund_date + ", fund_sdate=" + fund_sdate
				+ ", fund_edate=" + fund_edate + ", one_price=" + one_price + ", fund_zip=" + fund_zip + ", fund_add1="
				+ fund_add1 + ", fund_add2=" + fund_add2 + ", place_tel=" + place_tel + ", user_id=" + user_id
				+ ", fund_code=" + fund_code + ", total=" + total + ", rate=" + rate + ", thumbnail=" + thumbnail
				+ ", dday=" + dday + "]";
	}

}
