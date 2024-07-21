package kr.ddit.kixiv.tagList.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ddit.kixiv.tagList.vo.TagAllVo;
import kr.ddit.kixiv.tagList.vo.TagListVo;


@Mapper
public interface TagListDao {

	void tagListIns(TagListVo tagList);

	List<TagAllVo> tagData(int board_id);

	void tagAllDel(int board_id);

	void deleteTag(int board_id);

}
