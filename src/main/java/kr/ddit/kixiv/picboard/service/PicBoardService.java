package kr.ddit.kixiv.picboard.service;

import java.util.ArrayList;
import java.util.List;

import kr.ddit.kixiv.picboard.vo.Picboard;

public interface PicBoardService {

	Picboard item(String userid);

	List<Picboard> list();

	List<Picboard> likelist();

	int boarditem();

	void boradUp(Picboard board);

	String checkUser(int board_id);

	void deleteBoard(int board_id);

	void deleteYnBoard(int board_id);

	void upcnt(int board_id);

	int countCnt(int board_id);
	//총조회수
	int myLookCnt(String user_id);
	
	//게시글정보조회
	Picboard picitem(int board_id);

}
