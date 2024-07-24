package kr.ddit.kixiv.tagList.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.ddit.kixiv.tagList.vo.TagAllVo;
import kr.ddit.kixiv.tagList.vo.TagListVo;


@Mapper
public interface TagListDao {
	
	int getNextTagSeq();
	
    void tagListIns(@Param("tag_seq") int tagSeq, @Param("tag_id") String tagId, @Param("board_id") int boardId);
	
	List<TagAllVo> tagData(int board_id);

	void tagAllDel(int board_id);

	void deleteTag(int board_id);

}
