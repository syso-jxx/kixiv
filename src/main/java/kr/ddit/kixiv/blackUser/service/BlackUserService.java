package kr.ddit.kixiv.blackUser.service;

import java.util.List;
import java.util.Map;

import kr.ddit.kixiv.blackUser.vo.BlackUserVO;
import kr.ddit.kixiv.utill.Page;

public interface BlackUserService {

	// 블랙리스트 목록
	public List<BlackUserVO> blackList(Page page);

	// 블랙리스트 게시물 갯수
	public int totalCount(Page page);
	
	// 블랙유저 삭제
	public void delete(String userId);
	
	// 블랙유저 수정
	public void modify(BlackUserVO vo);
	
	// 블랙유저 추가
	public void blackAdd(BlackUserVO blackData);
	
	// 블랙 확인
	public BlackUserVO blackCheck(String userId);
	
	// 블랙리스트 기간 만료 확인(기간 만료시 DB에서 삭제)
	public void checkValidUser();
}