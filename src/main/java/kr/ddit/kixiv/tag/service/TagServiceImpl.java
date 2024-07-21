package kr.ddit.kixiv.tag.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.tag.mapper.TagDao;
import kr.ddit.kixiv.tag.vo.TagVo;

@Service
public class TagServiceImpl implements TagService {

	@Autowired
	TagDao dao;
	
	@Override
	public List<TagVo> list() {
		System.out.println("ㅎㅇ");
		return dao.list();
	}

	@Override
	public TagVo tagList(String tag_id) {
		return dao.tagList(tag_id);
	}

	@Override
	public void deleteTag(int board_id) {
		
	}

}
