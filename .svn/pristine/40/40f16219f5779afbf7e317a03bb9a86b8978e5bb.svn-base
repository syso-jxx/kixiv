package kr.ddit.kixiv.likey.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.likey.mapper.LikeyDao;
import kr.ddit.kixiv.likey.service.LikeyService;
import kr.ddit.kixiv.likey.vo.LikeyVo;
import kr.ddit.kixiv.picture.vo.Picture;

@Service
public class LikeyServiceImpl implements LikeyService {
	
	@Autowired
	LikeyDao dao;
	
	@Override
	public int pictureSaveHeart(LikeyVo to) {
		return dao.pictureSaveHeart(to);
	}

	@Override
	public void heartUp(LikeyVo to) {
		dao.heartUp(to);
	}

	@Override
	public void heartDown(LikeyVo to) {
		dao.heartDown(to);
	}

	@Override
	public LikeyVo LikeyList(LikeyVo likeyVo) {
		return dao.LikeyList(likeyVo);
	}

	@Override
	public void deleteLikey(String pic_num) {
		dao.deleteLikey(pic_num);
	}

	@Override
	public void deleteLikeyB(int board_id) {
		dao.deleteLikeyB(board_id);
	}
}
