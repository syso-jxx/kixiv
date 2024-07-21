package kr.ddit.kixiv.picboard.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ddit.kixiv.picboard.vo.Picboard;

@Mapper
public interface PicboardDao {

	void boardUp(Picboard board);

	int boarditem();
	
	Picboard item(String userid);

	List<Picboard> list();

	List<Picboard> likelist();

	String checkUser(int board_id);

	void deleteBoard(int board_id);

	void deleteYnBoard(int board_id);

	void upcnt(int board_id);

	int countCnt(int board_id);

	int myLookCnt(String user_id);

	Picboard picitem(int board_id);


}
