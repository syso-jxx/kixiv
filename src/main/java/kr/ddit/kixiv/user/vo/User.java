package kr.ddit.kixiv.user.vo;

import java.util.Date;

public class User {

	private String user_id;
	private String nickname;
	private String password;
	private String name;
	private String phone;
	private String zip;
	private String add1;
	private String add2;
	private String email;
	private String gallery_yn;
	private String profile_img="imgProfileUpload/default.svg";
	private Date join_date;
	private String sns_add="";
	private String exit_yn;
	private String user_level;

	public String getUser_level() {
		return user_level;
	}

	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getAdd1() {
		return add1;
	}

	public void setAdd1(String add1) {
		this.add1 = add1;
	}

	public String getAdd2() {
		return add2;
	}

	public void setAdd2(String add2) {
		this.add2 = add2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGallery_yn() {
		return gallery_yn;
	}

	public void setGallery_yn(String gallery_yn) {
		this.gallery_yn = gallery_yn;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public String getSns_add() {
		return sns_add;
	}

	public void setSns_add(String sns_add) {
		this.sns_add = sns_add;
	}

	public String getExit_yn() {
		return exit_yn;
	}

	public void setExit_yn(String exit_yn) {
		this.exit_yn = exit_yn;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", nickname=" + nickname + ", password=" + password + ", name=" + name
				+ ", phone=" + phone + ", zip=" + zip + ", add1=" + add1 + ", add2=" + add2 + ", email=" + email
				+ ", gallery_yn=" + gallery_yn + ", profile_img=" + profile_img + ", join_date=" + join_date
				+ ", sns_add=" + sns_add + ", exit_yn=" + exit_yn + ", user_level=" + user_level + "]";
	}

}
