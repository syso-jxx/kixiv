package kr.ddit.kixiv.follow.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ddit.kixiv.follow.vo.FollowVo;

@Mapper
public interface FollowDao {

	void followIng(FollowVo follow);

	void unFollowIng(FollowVo follow);

	int followYn(FollowVo follow);
	
	// 팔로잉 리스트 가져오기
	List<HashMap<String, Object>> getFollowingList(String user_id);

}
