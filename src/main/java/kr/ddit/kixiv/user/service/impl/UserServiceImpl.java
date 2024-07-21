package kr.ddit.kixiv.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.user.mapper.UserDao;
import kr.ddit.kixiv.user.service.UserService;
import kr.ddit.kixiv.user.vo.User;
import kr.ddit.kixiv.utill.Page;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao dao;
	
	@Override
	public boolean login(User user) {
		if(dao.login(user) == 1)
			return true;
		else
			return false;
	}

	@Override
	public User item(String userid) {
		return dao.item(userid);
	}

	@Override
	public int signup(User user) {
		return dao.signup(user);
	}

	@Override
	public User getNickname(String nickname) {
		return dao.getNickname(nickname);
	}

	@Override
	public void proifleImgUpdate(User vo) {
		dao.proifleImgUpdate(vo);
	}
	
	@Override
	public User getUser(String user_id) {
		return dao.getUser(user_id);
	}

	@Override
	public int modify(User user) {
		return dao.modify(user);
	}
	
	@Override
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}

	@Override
	public List<User> userList(Page page) {
		System.out.println("user serviceimp");
		System.out.println("getStartPost : " + page.getStartPost());
		System.out.println("getEndPost : " + page.getEndPost());
		return dao.userList(page);
	}

	@Override
	public int totalCount(Page page) {
		return dao.totalCount(page);
	}

	@Override
	public User findPwd(User user) {
		return dao.findPwd(user);
	}

	@Override
	public void changeTempPwd(User vo) {
		dao.changeTempPwd(vo);
	}
	
	@Override
	public int investTotalCount(Page page) {
		return dao.investTotalCount(page);
	}

	@Override
	public List<Map<String, Object>> investList(Page page) {
		return dao.investList(page);
	}

	@Override
	public int refundTotalCount() {
		return dao.refundTotalCount();
	}

	@Override
	public List<Map<String, Object>> refundList(Page page) {
		return dao.refundList(page);
	}

	@Override
	public void permissionRefund(Map<String, Object> map) {
		dao.permissionRefund(map);
	}

	@Override
	public int myFundTotalCount(Page page) {
		return dao.myFundTotalCount(page);
	}

	@Override
	public List<Map<String, Object>> myFundList(Page page) {
		return dao.myFundList(page);
	}

}
