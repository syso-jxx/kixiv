package kr.ddit.kixiv.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ddit.kixiv.notice.vo.NoticeVO;
import kr.ddit.kixiv.utill.Page;

@Mapper
public interface NoticeDao {
	//게시물 목록 + 페이징 + 검색
	public List<NoticeVO> noticeList(Page page);
	
	//게시물 총 갯수
	public int totalCount(Page page);
	
	// 조회수 추가
	public void addHit(String notice_id);
			
	// 게시물 가져오기
	public NoticeVO getNotice(String notice_id);

	// 게시물 등록
	public int write(NoticeVO vo);
	
	// 게시물 삭제
	public void delete(NoticeVO vo);
	
	// 게시물 수정
	public void modify(NoticeVO vo);
	
}
