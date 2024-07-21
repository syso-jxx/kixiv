package kr.ddit.kixiv.likey.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ddit.kixiv.likey.vo.LikeyVo;
import kr.ddit.kixiv.picture.vo.Picture;


@Mapper
public interface LikeyDao {
	
	//해당 개시글의 좋아요 총 갯수
	int pictureSaveHeart(LikeyVo to);
	
	//좋아요 데이터 추가(+)
	void heartUp(LikeyVo to);
	
	//좋아요 데이터 삭제(-)
	void heartDown(LikeyVo to);
	
	//해당 개시글의 그림 좋아요 정보를 리스트형태로 가져오기
	LikeyVo LikeyList(LikeyVo likeyVo);
	
	void deleteLikey(String pic_num);

	void deleteLikeyB(int board_id);


}
