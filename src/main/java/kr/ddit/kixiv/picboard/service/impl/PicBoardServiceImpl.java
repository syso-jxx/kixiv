package kr.ddit.kixiv.picboard.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.picboard.mapper.PicboardDao;
import kr.ddit.kixiv.picboard.service.PicBoardService;
import kr.ddit.kixiv.picboard.vo.Picboard;

@Service
public class PicBoardServiceImpl implements PicBoardService {
	@Autowired
	PicboardDao dao;
	

	@Override
	public Picboard item(String userid) {
		return dao.item(userid);
	}

	@Override
	public List<Picboard> list() {
		return dao.list();
	}

	@Override
	public List<Picboard> likelist() {
		return dao.likelist();
	}

	@Override
	public int boarditem() {
		return dao.boarditem();
	}

	@Override
	public void boradUp(Picboard board) {
		dao.boardUp(board);
	}
	
	@Override
	public int boradSelect() {
		return dao.boardSelect();
	}

	@Override
	public String checkUser(int board_id) {
		return dao.checkUser(board_id);
	}

	@Override
	public void deleteBoard(int board_id) {
		dao.deleteBoard(board_id);
	}

	@Override
	public void deleteYnBoard(int board_id) {
		dao.deleteYnBoard(board_id);
	}

	@Override
	public void upcnt(int board_id) {
		dao.upcnt(board_id);
	}

	@Override
	public int countCnt(int board_id) {
		return dao.countCnt(board_id);
	}

	@Override
	public int myLookCnt(String user_id) {
		return dao.myLookCnt(user_id);
	}

	@Override
	public Picboard picitem(int board_id) {
		return dao.picitem(board_id);
	}



}
