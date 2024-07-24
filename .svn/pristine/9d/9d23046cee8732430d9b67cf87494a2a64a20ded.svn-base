package kr.ddit.kixiv.tagList.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.tagList.mapper.TagListDao;
import kr.ddit.kixiv.tagList.service.TagListService;
import kr.ddit.kixiv.tagList.vo.TagAllVo;
import kr.ddit.kixiv.tagList.vo.TagListVo;

@Service
public class TagListServiceImpl implements TagListService {
	@Autowired
	TagListDao dao;
	
	@Override
	public void tagListIns(TagListVo tagList) {
		dao.tagListIns(tagList);

	}

	@Override
	public List<TagAllVo> tagData(int board_id) {
		return dao.tagData(board_id);
	}

	@Override
	public void tagAllDel(int board_id) {
		dao.tagAllDel(board_id);
	}

	@Override
	public void deleteTag(int board_id) {
		dao.deleteTag(board_id);
	}

}
