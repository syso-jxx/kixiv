package kr.ddit.kixiv.report.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ddit.kixiv.report.service.ReportService;
import kr.ddit.kixiv.report.vo.ReportVo;
import kr.ddit.kixiv.user.service.UserService;
import kr.ddit.kixiv.user.vo.User;
import kr.ddit.kixiv.utill.Page;

@Controller
@RequestMapping("/report")
public class ReprotController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ReportService repotService;
	
	@RequestMapping(value = "report")
	String report(HttpSession session, Model model, Page page) {
		
		page.setTotalCount(repotService.totalCount(page));
		
		System.out.println("keyword : " + page.getTotalCount());
		System.out.println("num : " + page.getNum());
		System.out.println("totalCount : " + page.getTotalCount());
		System.out.println("getStartPost : " + page.getStartPost());
		System.out.println("getEndPost : " + page.getEndPost());
		System.out.println("getPostNum : " + page.getPostNum());
		System.out.println("getStartPageNum : " + page.getStartPageNum());
		System.out.println("getEndPageNum : " + page.getEndPageNum());
		System.out.println("getPageNum : " + page.getPageNum());
		System.out.println("searchType : " + page.getSearchType());
		System.out.println("keyword : " + page.getKeyword());
		
		List<ReportVo> list = repotService.reportList(page);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
		return "report/report";
		
	}

	@RequestMapping(value="reportWhite")
	String reportWhite(@RequestParam String url, @RequestParam String bad_user_id, Model model, ReportVo rvo, User user) {
		String user_id = bad_user_id;
		//프로필 이미지를 가져오기위해
		user = userService.getUser(user_id);
		System.out.println(user.getUser_id());
		System.out.println(user.getNickname());
		System.out.println(user.getProfile_img());
		
		rvo.setReport_add(url);
		model.addAttribute("user",user);
		model.addAttribute("report_add",url);
		
		return "report/reportWhite";
	}
	
	
	@RequestMapping(value = "reportAdd")
	public @ResponseBody String reportAdd(ReportVo reportVo, HttpSession session) {
		System.out.println("등록되니??????????????????????????????????????????????????");
		reportVo.setUser_id((String)session.getAttribute("userId"));
		System.out.println("---------------------------데이터확인 ----------------------------------------");
		System.out.println(reportVo.getBad_user_id());
		System.out.println(reportVo.getReport_add());
		System.out.println(reportVo.getReport_content());
		System.out.println(reportVo.getReport_reason());
		System.out.println(reportVo.getReport_title());
		System.out.println(reportVo.getReport_what());
		System.out.println(reportVo.getUser_id());
		
		repotService.Reportadd(reportVo);
		
		return "ok";
	}
	
	@RequestMapping(value = "reportDetail")
	String reportDetail(@RequestParam int report_id, ReportVo vo, Model model) {
		
		vo = repotService.detailItem(report_id);
		
		model.addAttribute("reportVo", vo);
		
		return "report/reportDetail";
	}
	
	@RequestMapping(value = "myReportList")
	String myReportList(HttpSession session, Model model, Page page) {
		
		String user_id = (String)session.getAttribute("userId");
		page.setUser_id(user_id);
		
		page.setTotalCount(repotService.totalCount(page));
		
		System.out.println("keyword : " + page.getTotalCount());
		System.out.println("num : " + page.getNum());
		System.out.println("totalCount : " + page.getTotalCount());
		System.out.println("getStartPost : " + page.getStartPost());
		System.out.println("getEndPost : " + page.getEndPost());
		System.out.println("getPostNum : " + page.getPostNum());
		System.out.println("getStartPageNum : " + page.getStartPageNum());
		System.out.println("getEndPageNum : " + page.getEndPageNum());
		System.out.println("getPageNum : " + page.getPageNum());
		System.out.println("searchType : " + page.getSearchType());
		System.out.println("keyword : " + page.getKeyword());

		
		System.out.println("user_id : " + page.getUser_id());
		List<ReportVo> list = repotService.reportList(page);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
		return "report/myReportList";
	}

	
}
