package kr.ddit.kixiv.notice.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.ddit.kixiv.notice.service.NoticeService;
import kr.ddit.kixiv.notice.vo.NoticeVO;
import kr.ddit.kixiv.utill.Page;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private String uploadPath;
	
	@RequestMapping(value="/notice")
	public String noticeList(HttpSession session, Model model, Page page) {
//			@RequestParam(value="num", required = false, defaultValue = "1") int num,
//			@RequestParam(value="searchType", required = false, defaultValue = "title") String searchType,
//			@RequestParam(value="keyword", required = false, defaultValue = "") String keyword){
		
		page.setTotalCount(noticeService.totalCount(page));

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
		
		List<NoticeVO> list = noticeService.noticeList(page);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
		return "notice/notice";
	}
	
	@RequestMapping(value="/detail")
	public String noticeDetail(@RequestParam String notice_id, NoticeVO notice, Model model) {
		
		noticeService.addHit(notice_id);
		
		notice = noticeService.getNotice(notice_id);
		
		model.addAttribute("notice", notice);
		
		return "notice/detail";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write() {
		return "notice/write";
	}

	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String postWrite(NoticeVO vo) {

		System.out.println("content : " + vo.getNotice_content());

		noticeService.write(vo);
		
		return "redirect:/notice/notice";
	}
	
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		String fileRoot = "D:\\springProject\\kixiv\\src\\main\\webapp\\resources\\summernote\\fileUpload\\";
		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		System.out.println("contextRoot : " + contextRoot);
//
//		String fileRoot = contextRoot+"resources/summernote/fileUpload/";
//		System.out.println("fileRoot : " + fileRoot);
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/fileUpload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}

	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete(NoticeVO vo) {
		noticeService.delete(vo);
		return "redirect:/notice/notice";
	}

	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modify(NoticeVO vo, Model model) {
		vo = noticeService.getNotice(vo.getNotice_id() + "");
		
		System.out.println("get content : " + vo.getNotice_content());
		
		model.addAttribute("notice", vo);
		return "notice/modify";
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String postModify(NoticeVO vo) {
		
//		System.out.println("post content 전 : " + vo.getNotice_content());
//		
//		String content = vo.getNotice_content().replace("\t","").replace("\n", ""); // content 공백 제거
//		vo.setNotice_content(content); 
//		
//		System.out.println("post content 후 : " + vo.getNotice_content());
		noticeService.modify(vo);
		
		return "redirect:/notice/notice";
	}
	
}
