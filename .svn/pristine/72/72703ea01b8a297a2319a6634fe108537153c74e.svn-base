package kr.ddit.kixiv.follow.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.follow.mapper.FollowDao;
import kr.ddit.kixiv.follow.vo.FollowVo;

@Service
public class FollowServiceImpl implements FollowService {
	@Autowired
	FollowDao dao;
	
	@Override
	public void followIng(FollowVo follow) {
		dao.followIng(follow);
	}

	@Override
	public void unFollowIng(FollowVo follow) {
		dao.unFollowIng(follow);

	}

	@Override
	public int followYn(FollowVo follow) {
		return dao.followYn(follow);
	}

	@Override
	public List<HashMap<String, Object>> getFollowingList(String user_id) {
		return dao.getFollowingList(user_id);
	}

}
