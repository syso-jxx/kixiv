package kr.ddit.kixiv.picture.vo;

public class SearchVO {
	int page;
	int startNum;
	int endNum;
	String user_id;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "SearchVO [page=" + page + ", startNum=" + startNum + ", endNum=" + endNum + ", user_id=" + user_id
				+ "]";
	}
	
	

}
