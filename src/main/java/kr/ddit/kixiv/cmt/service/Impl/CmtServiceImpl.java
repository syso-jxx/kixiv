package kr.ddit.kixiv.cmt.service.Impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.cmt.mapper.CmtDao;
import kr.ddit.kixiv.cmt.service.CmtService;
import kr.ddit.kixiv.cmt.vo.CmtVo;

@Service
public class CmtServiceImpl implements CmtService {
	@Autowired
	CmtDao dao;
	
	
	@Override
	public int pictureWriteReply(CmtVo to) {
		int cmt = 0;
		// 해당 게시물의 댓글의 갯수를 센다
		cmt = dao.reply_count(to);
		// 댓글 생성
		int result = dao.picture_reply_write(to);
		
		if (result == 1) {	// p_reply 테이블에 새로운 댓글 추가가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			cmt = dao.reply_count(to);
		}
		
		return cmt;
	}


	@Override
	public ArrayList<CmtVo> picutre_replyList(CmtVo to) {
		System.out.println("dd!!!!!!!! sss");
		return dao.picutre_replyList(to);
	}


	@Override
	public int pictureWriteReReply(CmtVo to) {
		System.out.println("rereply 서비스");
		int cmt = 0;
		cmt = dao.reply_count(to);
		
		// p_reply 테이블에 추가 (댓글 작성과 동일)
		int result = dao.picture_rereply_write(to);
		System.out.println("답글등록완료");
		
		if (result == 1) {	// p_reply 테이블에 새로운 댓글 추가가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			cmt = dao.reply_count(to);
		}
		
		return cmt;
	}


	@Override
	public int pictureDeleteReply(CmtVo to) {
		int cmt = 0;
		cmt = dao.reply_count(to);
		
		// grp가 reply의 no와 일치하는 댓글이 몇갠지 카운트한다. 모댓글에 딸린 답글이 몇갠지 카운트하기 위함
		int count_rereply = dao.picture_count_rereply(to);
		int result = 0;
		
		// 해당 게시물의 reply를 -1 한다.
		cmt = dao.reply_count(to);
		
		System.out.println("count_rereply = " + count_rereply);
		System.out.println("???????????????????????????????????????????????????????????????????????????????????????????");
		if(count_rereply == 0) {	// 답글이 없을 때 - 그냥 삭제
			// p_reply 테이블에서 삭제
			result = dao.picture_reply_delete(to);
		}else {					// 답글이 있을 때 - content에 공백을 넣음 ("삭제된 게시물입니다" 라고 표기하기 위함)
			// p_reply 테이블에서 삭제하지 않고 content에 공백을 넣음 
			result = dao.picture_reply_not_delete(to);
		}
		
		if (result == 1) {	// p_reply 테이블에서 댓글삭제가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			cmt = dao.reply_count(to);
		}
		return cmt;
	}


	@Override
	public int pictureDeleteReReply(CmtVo to) {
		
		int cmt = 0;
		cmt = dao.reply_count(to);
				
		// p_reply 테이블에서 삭제
		int result = dao.picture_reply_delete(to);
		
		// grp가  일치하는 답글이 몇갠지 카운트 한다. 없고 모댓글의 content가 ""이면 모댓글을 삭제하기 위함.
		int count_rereply = dao.picture_count_rereply_fromrereply(to);
		
		
		System.out.println("count_rereply = " + count_rereply);
		if(count_rereply == 0) {
			dao.picture_reply_delete_after_rereply_delete(to);
		}
		
		if (result == 1) {	// p_reply 테이블에서 댓글삭제가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			cmt = dao.reply_count(to);
		}
		return cmt;
	}

}
