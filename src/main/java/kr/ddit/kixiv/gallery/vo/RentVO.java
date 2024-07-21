package kr.ddit.kixiv.gallery.vo;

import java.sql.Date;

public class RentVO {
	private int rent_seq;
    private Date rent_sdate;
    private Date rent_edate;
    private String rent_content;
    private String fund_yn;
    private int rent_price; 
    private Date rentdate;
    private String del_yn;
    private int gallery_num;
    private String gallery_name;
    private String gallery_zip;
    private String gallery_add1;
    private String gallery_add2;
    private String gallery_tel;
    private String gallery_intro;
    private String gallery_thum;
    private String homepage;
    private String phone;
    private String rent_status;
	private String user_id;
    
	public RentVO() {}
    
    public String getRent_status() {
		return rent_status;
	}

	public void setRent_status(String rent_status) {
		this.rent_status = rent_status;
	}
    
    public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getRent_seq() {
		return rent_seq;
	}

	public void setRent_seq(int rent_seq) {
		this.rent_seq = rent_seq;
	}

	public Date getRent_sdate() {
		return rent_sdate;
	}

	public void setRent_sdate(Date rent_sdate) {
		this.rent_sdate = rent_sdate;
	}

	public Date getRent_edate() {
		return rent_edate;
	}

	public void setRent_edate(Date rent_edate) {
		this.rent_edate = rent_edate;
	}

	public String getRent_content() {
		return rent_content;
	}

	public void setRent_content(String rent_content) {
		this.rent_content = rent_content;
	}

	public String getFund_yn() {
		return fund_yn;
	}

	public void setFund_yn(String fund_yn) {
		this.fund_yn = fund_yn;
	}

	public int getRent_price() {
		return rent_price;
	}

	public void setRent_price(int rent_price) {
		this.rent_price = rent_price;
	}

	public Date getRentdate() {
		return rentdate;
	}

	public void setRentdate(Date rentdate) {
		this.rentdate = rentdate;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public int getGallery_num() {
		return gallery_num;
	}

	public void setGallery_num(int gallery_num) {
		this.gallery_num = gallery_num;
	}

	public String getGallery_name() {
		return gallery_name;
	}

	public void setGallery_name(String gallery_name) {
		this.gallery_name = gallery_name;
	}

	public String getGallery_zip() {
		return gallery_zip;
	}

	public void setGallery_zip(String gallery_zip) {
		this.gallery_zip = gallery_zip;
	}

	public String getGallery_add1() {
		return gallery_add1;
	}

	public void setGallery_add1(String gallery_add1) {
		this.gallery_add1 = gallery_add1;
	}

	public String getGallery_add2() {
		return gallery_add2;
	}

	public void setGallery_add2(String gallery_add2) {
		this.gallery_add2 = gallery_add2;
	}

	public String getGallery_tel() {
		return gallery_tel;
	}

	public void setGallery_tel(String gallery_tel) {
		this.gallery_tel = gallery_tel;
	}

	public String getGallery_intro() {
		return gallery_intro;
	}

	public void setGallery_intro(String gallery_intro) {
		this.gallery_intro = gallery_intro;
	}

	public String getGallery_thum() {
		return gallery_thum;
	}

	public void setGallery_thum(String gallery_thum) {
		this.gallery_thum = gallery_thum;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "RentVO [rent_seq=" + rent_seq + ", rent_sdate=" + rent_sdate + ", rent_edate=" + rent_edate
				+ ", rent_content=" + rent_content + ", fund_yn=" + fund_yn + ", rent_price=" + rent_price
				+ ", rentdate=" + rentdate + ", del_yn=" + del_yn + ", gallery_num=" + gallery_num 
				+ ", gallery_name=" + gallery_name + ", gallery_zip=" + gallery_zip + ", gallery_add1="
				+ gallery_add1 + ", gallery_add2=" + gallery_add2 + ", gallery_tel=" + gallery_tel + ", gallery_intro="
				+ gallery_intro + ", gallery_thum=" + gallery_thum + ", homepage=" + homepage + ", phone=" + phone
				+ ", rent_status=" + rent_status + ", user_id=" + user_id + "]";
	}
}
