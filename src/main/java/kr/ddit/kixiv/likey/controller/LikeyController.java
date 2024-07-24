package kr.ddit.kixiv.likey.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ddit.kixiv.likey.service.LikeyService;
import kr.ddit.kixiv.likey.vo.LikeyVo;

@Controller
public class LikeyController {
	@Autowired
	LikeyService likeyService;
	
	// 빈하트 클릭시 하트 저장
	@ResponseBody
	@RequestMapping(value = "/saveHeart")
	public String save_heart(@RequestParam String no, HttpSession session) {
		System.out.println("여기오니? 라이키");
		LikeyVo to = new LikeyVo();
		int picNum = Integer.parseInt(no);
	    // 그림 번호 세팅
	    to.setPic_num(picNum);

	    // 좋아요 누른 사람 nick을 userid로 세팅
	    to.setUser_id((String) session.getAttribute("userId"));
	    
	    //좋아요 데이터 추가(+)
	    likeyService.heartUp(to);
	    
	    // +1된 하트 갯수를 담아오기위함
	    int cnt = likeyService.pictureSaveHeart(to);
	    
	    String pto = cnt+"";
	    
	    return pto;
	}

	// 꽉찬하트 클릭시 하트 해제
	@ResponseBody
	@RequestMapping(value = "/removeHeart")
	public String remove_heart(@RequestParam String no, HttpSession session) {
		LikeyVo to = new LikeyVo();
		
		int picNum = Integer.parseInt(no);
	    // 게시물 번호 세팅
	    to.setPic_num(picNum);

	    // 좋아요 누른 사람 nick을 userid로 세팅
	    to.setUser_id((String) session.getAttribute("userId"));
	    
	    //좋아요데이터 삭제(-)
	    likeyService.heartDown(to); 
	    
	    int cnt = likeyService.pictureSaveHeart(to);
	    
	    String pto = cnt+"";
	    return pto;
	}
}
