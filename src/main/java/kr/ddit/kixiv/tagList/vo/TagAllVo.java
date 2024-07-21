package kr.ddit.kixiv.tagList.vo;

public class TagAllVo {

	private String tag_id;
	private int tag_seq;
	private String tag_name;
	private String del_yn;

	
	public String getTag_id() {
		return tag_id;
	}

	public void setTag_id(String tag_id) {
		this.tag_id = tag_id;
	}

	public int getTag_seq() {
		return tag_seq;
	}

	public void setTag_seq(int tag_seq) {
		this.tag_seq = tag_seq;
	}

	public String getTag_name() {
		return tag_name;
	}

	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

}
