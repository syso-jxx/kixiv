package kr.ddit.kixiv.likey.service;


import kr.ddit.kixiv.likey.vo.LikeyVo;

public interface LikeyService {
	
	//좋아요 갯수 구해오기
	int pictureSaveHeart(LikeyVo to);

	//좋아요 데이터 추가
	void heartUp(LikeyVo to);
	
	//좋아요 데이터 삭제
	void heartDown(LikeyVo to);
	
	//해당 개시글의 그림 좋아요 정보를 리스트형태로 가져오기
	LikeyVo LikeyList(LikeyVo likeyVo);
	
	//그림삭제시 좋아요도같이삭제
	void deleteLikey(String pic_num);
	
	//좋아요삭제
	void deleteLikeyB(int board_id);


}
