package kr.ddit.kixiv.blackUser.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.blackUser.mapper.BlackUserDao;
import kr.ddit.kixiv.blackUser.service.BlackUserService;
import kr.ddit.kixiv.blackUser.vo.BlackUserVO;
import kr.ddit.kixiv.utill.Page;

@Service
public class BlackUserServiceImpl implements BlackUserService {

	@Autowired
	private BlackUserDao dao;
	
	@Override
	public List<BlackUserVO> blackList(Page page) {
		return dao.blackList(page);
	}

	@Override
	public int totalCount(Page page) {
		return dao.totalCount(page);
	}

	@Override
	public void delete(String userId) {
		dao.delete(userId);
	}

	@Override
	public void modify(BlackUserVO vo) {
		dao.modify(vo);
	}

	@Override
	public void blackAdd(BlackUserVO blackData) {
		dao.blackAdd(blackData);
	}

	@Override
	public BlackUserVO blackCheck(String userId) {
		return dao.blackCheck(userId);
	}

	@Override
	public void checkValidUser() {
		dao.checkValidUser();
	}

}
