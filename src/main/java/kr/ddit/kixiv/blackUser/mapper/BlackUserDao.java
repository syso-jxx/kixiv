package kr.ddit.kixiv.blackUser.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.ddit.kixiv.blackUser.vo.BlackUserVO;
import kr.ddit.kixiv.utill.Page;

@Mapper
public interface BlackUserDao {
	
	// 블랙리스트 목록
	public List<BlackUserVO> blackList(Page page);
	
	// 블랙리스트 게시물 갯수
	public int totalCount(Page page);
	
	// 블랙유저 삭제
	public void delete(String userId);
	
	// 블랙유저 수정
	public void modify(BlackUserVO vo);

	public void blackAdd(BlackUserVO blackData);

	// 블랙 확인
	public BlackUserVO blackCheck(String userId);
	
	// 블랙리스트 기간 만료 확인(기간 만료시 DB에서 삭제)
	public void checkValidUser();
	
}
