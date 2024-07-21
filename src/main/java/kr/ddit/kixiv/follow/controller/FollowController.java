package kr.ddit.kixiv.follow.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ddit.kixiv.follow.service.FollowService;
import kr.ddit.kixiv.follow.vo.FollowVo;

@Controller
public class FollowController {
	@Autowired
	FollowService followService;
	
	
	@ResponseBody
	@RequestMapping(value =  "/followIng")
	String followIng(@RequestParam String b_userId, HttpSession session) {
		System.out.println("팔로우");
		FollowVo follow = new FollowVo();
		follow.setFrom_id(b_userId);
		follow.setTo_id((String)session.getAttribute("userId"));
		
		followService.followIng(follow);

		String data ="ok";
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value =  "/unfollowIng")
	String unfollowIng(@RequestParam String b_userId, HttpSession session) {
		System.out.println("언팔로우");
		FollowVo follow = new FollowVo();
		follow.setFrom_id(b_userId);
		follow.setTo_id((String)session.getAttribute("userId"));
		
		followService.unFollowIng(follow);
		
		String data ="ok";
		return data;
	}
}
