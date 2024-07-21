package kr.ddit.kixiv.tag.service;

import java.util.List;

import kr.ddit.kixiv.tag.vo.TagVo;


public interface TagService {
	
	List<TagVo> list();

	TagVo tagList(String tag_id);

	void deleteTag(int board_id);


}
