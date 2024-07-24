package kr.ddit.kixiv.picture.vo;

public class PicPage {
	// 현재 페이지 번호
	private int num=1;

	// 게시물 총 갯수
	private int totalCount;

	// 한 페이지에 출력할 게시물 갯수
	private int postNum = 3;

	// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
	private int pageNum;

	// 출력할 시작 게시물 
	private int startPost;

	// 출력할 마지막 게시물
	private int endPost;
	
	// 한번에 표시할 페이징 번호의 갯수
	private int pageNumCnt = 1;

	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;

	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;

	// 다음/이전 표시 여부
	private boolean prev;
	private boolean next;

	private int board_id;
	
	private String user_id;
	
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		dataCalc();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public int getPostNum() {
		return postNum;
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getStartPost() {
		return startPost;
	}

	public int getEndPost() {
		return endPost;
	}

	public int getPageNumCnt() {
		return pageNumCnt;
	}

	public void setPageNumCnt(int pageNumCnt) {
		this.pageNumCnt = pageNumCnt;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public boolean getPrev() {
		return prev;
	}

	public boolean getNext() {
		return next;
	}

	private void dataCalc() {

		// 마지막 번호
		endPageNum = (int) (Math.ceil((double) num / (double) pageNumCnt) * pageNumCnt);
		System.out.println("endPageNum : " + endPageNum);
		
		// 시작 번호
		startPageNum = endPageNum - (pageNumCnt - 1);

		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) totalCount / (double) postNum));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}

		prev = startPageNum == 1 ? false : true;
		next = endPageNum * postNum >= totalCount ? false : true;

		startPost = (num - 1) * postNum + 1;
		endPost = startPost + (postNum-1);

	}
}
