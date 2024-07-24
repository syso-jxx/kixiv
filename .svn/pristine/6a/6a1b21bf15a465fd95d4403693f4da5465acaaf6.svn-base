package kr.ddit.kixiv.blackUser.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ddit.kixiv.blackUser.service.BlackUserService;
import kr.ddit.kixiv.blackUser.vo.BlackUserVO;
import kr.ddit.kixiv.report.service.ReportService;
import kr.ddit.kixiv.report.vo.ReportVo;
import kr.ddit.kixiv.utill.Page;

@Controller
@RequestMapping("/blackUser")
public class BlackUserController {

	@Autowired
	private BlackUserService service;
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="/blackList")
	public String blackList(@RequestParam Map<String, Object> map, Model model, Page page) {
		
//		if(map.get("searchType") == null) map.put("searchType", "");
//		if(map.get("keyword") == null) 	map.put("keyword", "");
		
		
		page.setTotalCount(service.totalCount(page));
		
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
		
		List<BlackUserVO> list = service.blackList(page);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
//		model.addAttribute("searchType", map.get("searchType"));
//		model.addAttribute("keyword", map.get("keyword"));
		
		return "/blackUser/blackList";
	}
	
	@RequestMapping(value="/modify")
	public String modify(BlackUserVO vo, Model model) {
		System.out.println(vo.getUserId());
		System.out.println(vo.getBlackReason());
		service.modify(vo);
		return "redirect:/blackUser/blackList";
	}
	
	@RequestMapping(value="/delete")
	public String delete(@RequestParam String userId) {
		
		service.delete(userId);
		
		return "redirect:/blackUser/blackList";
	}
	
	@RequestMapping(value = "/blackAdd")
	public String blackAdd(BlackUserVO blackData, ReportVo report) {
		
		service.blackAdd(blackData);
		
		report.setReport_yn("b");
//		report.setReport_id(report_id);
		reportService.updateReport(report);
		
		return "redirect:/report/report";
	}
	
	@RequestMapping(value = "/blackUpdate")
	public String blackUpdate(ReportVo report) {
		System.out.println("ㅎㄷㅎㅇㄶㅁㄴㅇㅎㄴㅇㅁㅎ");
		report.setReport_yn("r");
		reportService.updateReport(report);
		
		File file = new File("");
		
		return "forward:/report/report";
	}
	
}
