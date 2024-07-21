package kr.ddit.kixiv.report.vo;

import java.util.Date;

public class ReportVo {

	private int report_id;
	private String report_content;
	private Date report_date;
	private String report_yn;
	private String report_reason;
	private String report_add;
	private String report_title;
	private String report_what;
	private String user_id;
	private String bad_user_id;

	public int getReport_id() {
		return report_id;
	}

	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public String getReport_yn() {
		return report_yn;
	}

	public void setReport_yn(String report_yn) {
		this.report_yn = report_yn;
	}

	public String getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	public String getReport_add() {
		return report_add;
	}

	public void setReport_add(String report_add) {
		this.report_add = report_add;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	public String getReport_what() {
		return report_what;
	}

	public void setReport_what(String report_what) {
		this.report_what = report_what;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBad_user_id() {
		return bad_user_id;
	}

	public void setBad_user_id(String bad_user_id) {
		this.bad_user_id = bad_user_id;
	}

}
