package kr.ddit.kixiv.root;

import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ddit.kixiv.MyConfig;
import kr.ddit.kixiv.blackUser.service.BlackUserService;
import kr.ddit.kixiv.cmt.vo.CmtVo;
import kr.ddit.kixiv.follow.service.FollowService;
import kr.ddit.kixiv.gallery.service.GalleryService;
import kr.ddit.kixiv.likey.service.LikeyService;
import kr.ddit.kixiv.picboard.service.PicBoardService;
import kr.ddit.kixiv.picture.service.PictureService;
import kr.ddit.kixiv.picture.vo.Picture;
import kr.ddit.kixiv.user.service.UserService;


@Controller
public class RootController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	PictureService picService;
	
	@Autowired
	PicBoardService picboardService;
	
	@Autowired
	LikeyService likeyService;
	
	@Autowired
	FollowService followService;
	
	@Autowired
	BlackUserService blackUserService;
	
	@Autowired
	GalleryService galleryService;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context = new AnnotationConfigApplicationContext(MyConfig.class);
	}
	
	
	@RequestMapping(value="/")
	String main(Model model, HttpSession session) {
		blackUserService.checkValidUser();
		galleryService.galleryValidUser();
		if(session.getAttribute("userId") != null) {
			//구독작가사진
			String user_id = (String)session.getAttribute("userId");
			List<Picture> followList = picService.followImg(user_id);
			List<Picture> recomList = picService.recomImg(user_id);
			
			model.addAttribute("followList", followList);
			model.addAttribute("recomList", recomList);
		}
		List<Picture> rank5 = new ArrayList<Picture>(); 
		//최신사진
		List<Picture> newsList = picService.newsImg();
		//인기사진
		List<Picture> likeyList = picService.veryLikeImg();
		System.out.println("likeyList.size : " + likeyList.size());

		model.addAttribute("rank5",rank5);
		model.addAttribute("newsList", newsList);
		model.addAttribute("likeyList", likeyList);
		
		return "main";
	}
	
	@ResponseBody
	@RequestMapping("/mainBannerNew")
	public ArrayList<Picture> mainBannerNew() {
		ArrayList<Picture> mainBannerNew = new ArrayList();
		mainBannerNew = picService.newTopImg();
		System.out.println(mainBannerNew);
		
		return mainBannerNew;
	}

	@RequestMapping(value="/cartoon")
	String cartoon() {
		return "cartoon";
	}
	
	@RequestMapping(value="/galleryRentDetail")
	String galleryRentDetail() {
		return "galleryRentDetail";
	}
	
	@RequestMapping(value="/galleryRentEvent")
	String galleryRentEvent() {
		return "galleryRentEvent";
	}
	@RequestMapping(value="/404")
	String error404() {
		return "404";
	}
	@RequestMapping(value="/500")
	String error500() {
		return "500";
	}
	

	@RequestMapping(value="/reportList")
	void reportList() {
		
	}
	
	@RequestMapping(value="/following")
	String following() {
		return "following";
	}
	
}	
 