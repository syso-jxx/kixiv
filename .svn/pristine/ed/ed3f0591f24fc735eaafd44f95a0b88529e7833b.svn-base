package kr.ddit.kixiv.cmt.mapper;

import java.util.ArrayList;

import kr.ddit.kixiv.cmt.vo.CmtVo;

public interface CmtDao {
	
	//총 댓글 수를 읽어온다
	int reply_count(CmtVo to);
	
	//댓글 작성
	int picture_reply_write(CmtVo to);

	//댓글리스트 가져오기
	ArrayList<CmtVo> picutre_replyList(CmtVo to);
	
	//답글 작성
	int picture_rereply_write(CmtVo to);
	
	// 해당 댓글에 답글이 몇개인(존재하는지) 확인
	int picture_count_rereply(CmtVo to);
	
	// 답글이 0 개면 삭제
	int picture_reply_delete(CmtVo to);
	
	// 답글이 0개가 아니면 내용을 공백처리하고 삭제여부를 y롤 바꾼다
	int picture_reply_not_delete(CmtVo to);
	
	// 답글의 갯수가 몇개인지 확인 한다 
	int picture_count_rereply_fromrereply(CmtVo to);
	
	// 댓글이 공백처리되어있고(글을 지운상태) 답글도 하나도 없을경우 답글도 삭제하면서 댓글도 삭제한다.
	void picture_reply_delete_after_rereply_delete(CmtVo to);
	
	

}
