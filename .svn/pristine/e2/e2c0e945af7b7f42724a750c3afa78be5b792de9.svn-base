package kr.ddit.kixiv.cmt.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ddit.kixiv.cmt.service.CmtService;
import kr.ddit.kixiv.cmt.vo.CmtVo;
import kr.ddit.kixiv.user.vo.User;

@Controller
public class cmtController {
	
	@Autowired
	CmtService cmtService;
	
	// 댓글 작성
	@ResponseBody
	@RequestMapping(value = "/picture_write_reply")
	public int write_reply(@RequestParam int board_id, @RequestParam String cmt_content, HttpSession session) {
		System.out.println("????????");
		CmtVo to = new CmtVo();
		
	    // 게시물 번호 세팅
	    to.setBoard_id(board_id);
	    // 댓글 내용 세팅
	    to.setCmt_content(cmt_content);
	    // 댓글작성자 nick을 writer로 세팅
	    to.setUser_id((String) session.getAttribute("userId"));
	    // +1된 댓글 갯수를 담아오기 위함
	    int pto = cmtService.pictureWriteReply(to);
	    
	    return pto;
	}
	
	// 댓글 리스트
	@ResponseBody
	@RequestMapping(value = "/picture_replyList")
	public ArrayList<CmtVo> reply_list(@RequestParam int board_id, HttpSession session) {
		System.out.println("gkgkgkgskadlglj;dsajgkl;weqjg'leksjgal;djkls;gja;l");
		CmtVo to = new CmtVo();
		// 가져올 댓글 리스트의 게시물번호를 세팅
		to.setBoard_id(board_id);
		System.out.println("c1");
		ArrayList<CmtVo> replyList = new ArrayList();
		System.out.println("c2");
		replyList = cmtService.picutre_replyList(to);
		System.out.println("c3");
		return replyList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/picture_write_rereply")
	public int write_rereply(@RequestParam int cmt_id, @RequestParam int board_id, @RequestParam String cmt_content,
	        HttpSession session) {
		System.out.println("답글시작");
		CmtVo to = new CmtVo();

	    // 게시물 번호 세팅
	    to.setBoard_id(board_id);

	    // grp, grps, grpl 은 ReplyTO에 int로 정의되어 있기 때문에 String인 no를 int로 변환해서 넣어준다.
	    // 모댓글 번호 no를 grp으로 세팅한다.
	    to.setGrp(cmt_id);

	    // 답글은 깊이가 1이되어야 하므로 grpl을 1로 세팅한다.
	    to.setGrpl(1);

	    // 답글 내용 세팅
	    to.setCmt_content(cmt_content);
	    User user = (User) session.getAttribute("user");
	    // 답글작성자 nick을 writer로 세팅
	    to.setUser_id(user.getUser_id());
	    to.setNickname(user.getNickname());

	    int pto = cmtService.pictureWriteReReply(to);
	    	
	    return pto;
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/picture_delete_reply")
	public int picture_delete_reply(@RequestParam int cmt_id, @RequestParam int board_id) {
		System.out.println("댓글이왓어요");
		CmtVo to = new CmtVo();
		
	    // 모댓글 번호 세팅
	    to.setCmt_id(cmt_id);

	    // 게시물 번호 세팅
	    to.setBoard_id(board_id);
	    
	    
	    // 갱신된 댓글 갯수를 담아오기 위함
	    int pto = cmtService.pictureDeleteReply(to);

	    return pto;
	}

	// 답글 삭제
	@ResponseBody
	@RequestMapping(value = "/picture_delete_rereply")
	public int delete_rereply(@RequestParam int cmt_id, @RequestParam int board_id, @RequestParam int grp) {
		System.out.println("답글이왓어요");
		CmtVo to = new CmtVo();


	    // 답글 번호 세팅 - 답글 삭제하기 위해서 필요함
	    to.setCmt_id(cmt_id);

	    // 게시물 번호 세팅 - p_board 의 reply+1하기 위해 필요함
	    to.setBoard_id(board_id);

	    // grp 세팅(모댓글이 뭔지) - 모댓글은 삭제를 해도 답글이 있으면 남아있게 되는데 답글이 모두 삭제되었을 때 모댓글도 삭제하기 위해
	    // 필요함
	    to.setGrp(grp);

	    // 갱신된 댓글 갯수를 담아오기 위함
	    int pto  = cmtService.pictureDeleteReReply(to);

	    return pto;
	}
	
	
	
}
