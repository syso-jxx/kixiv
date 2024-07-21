package kr.ddit.kixiv.gallery.service;

import java.util.List;
import java.util.Map;

import kr.ddit.kixiv.gallery.vo.RentVO;

public class MyRentReqPage {
	private int total;	//전체 글개수
	private int currentPage;	//현재 페이지번호
	private int searchTotal;
	private List<Map<String, Object>> content;	
	private int totalPages;	//전체 페이지수
	private int startPage;	//페이지 시작 번호[1]...
	private int endPage;	//페이지 종료 번호...[5]
	private String keyword;

	public MyRentReqPage(int total, int searchTotal, int currentPage, int size, String keyword, List<Map<String, Object>> content) {
		this.total = total;
		this.searchTotal = searchTotal;
		this.currentPage = currentPage;
		this.content = content;
		this.keyword = keyword;
		
		if(keyword == "") {
			if(total==0) {	//목록 데이터가 없을 때
				totalPages = 0;
				startPage = 0;
				endPage = 0;
			}else {
				totalPages = total / size;	//총37행 / 10행씩출력 => 3페이지
				if(total%size>0) {	//총37행 / 10행씩출력 시 3페이지에 7행이므로
					totalPages++;	//4페이지로 처리
				}
				int modVal = currentPage % 5;	//[1][2][3][4][*5] => 0
				startPage = currentPage / 5 * 5 + 1;	// 5/5*5+1=> 6이므로 [6]부터 시작
				if(modVal == 0) startPage -= 5;	//[5]의 경우 modval이 0이므로 [6-5] => [1]부터 시작
				
				endPage = startPage + 4;
				if(endPage > totalPages) endPage = totalPages; //[1][2][3]까지만 출력해줌
			}//end if
		}else {
			if(searchTotal==0) {
				totalPages = 0;
				startPage = 0;
				endPage = 0;
			}else {
				totalPages = searchTotal / size;
				if(searchTotal%size>0) {
					totalPages++;
				}
				int modVal = currentPage % 5;
				startPage = currentPage / 5 * 5 + 1;
				if(modVal == 0) startPage -= 5;	
				
				endPage = startPage + 4;
				if(endPage > totalPages) endPage = totalPages;
			}//end if
		}
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<Map<String, Object>> getContent() {
		return content;
	}

	public void setContent(List<Map<String, Object>> content) {
		this.content = content;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int getSearchTotal() {
		return searchTotal;
	}

	public void setSearchTotal(int searchTotal) {
		this.searchTotal = searchTotal;
	}

	@Override
	public String toString() {
		return "GalleryRentPage [total=" + total + ", currentPage=" + currentPage + ", searchTotal=" + searchTotal
				+ ", content=" + content + ", totalPages=" + totalPages + ", startPage=" + startPage + ", endPage="
				+ endPage + ", keyword=" + keyword + "]";
	}
	
}
