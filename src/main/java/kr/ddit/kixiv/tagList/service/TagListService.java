package kr.ddit.kixiv.tagList.service;

import java.util.List;

import kr.ddit.kixiv.tagList.vo.TagAllVo;
import kr.ddit.kixiv.tagList.vo.TagListVo;

public interface TagListService {

	void insertTagWithSeq(String tag_id, int board_id);

	List<TagAllVo> tagData(int board_id);
	
	//수정시 태그 전부삭제
	void tagAllDel(int board_id);

	void deleteTag(int board_id);
	
}
