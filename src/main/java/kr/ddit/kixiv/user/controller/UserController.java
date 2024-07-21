package kr.ddit.kixiv.user.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ddit.kixiv.blackUser.service.BlackUserService;
import kr.ddit.kixiv.blackUser.vo.BlackUserVO;
import kr.ddit.kixiv.chart.service.ChartService;
import kr.ddit.kixiv.follow.service.FollowService;
import kr.ddit.kixiv.follow.vo.FollowVo;
import kr.ddit.kixiv.fund.service.FundService;
import kr.ddit.kixiv.gallery.service.GalleryService;
import kr.ddit.kixiv.gallery.vo.GalleryVO;
import kr.ddit.kixiv.picboard.service.PicBoardService;
import kr.ddit.kixiv.picture.service.PictureService;
import kr.ddit.kixiv.user.service.UserService;
import kr.ddit.kixiv.user.vo.User;
import kr.ddit.kixiv.utill.Page;

@Controller
@RequestMapping(value="/")
public class UserController {
	//
	@Autowired
	private UserService userService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private MailSender mailSender;
	
	@Autowired
	private BlackUserService blackUserService;
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private GalleryService galleryService;
	
	@Autowired
	private ChartService chartService;
	
	@Autowired
	private PicBoardService picboardService;
	
	@RequestMapping(value="/signup", method = RequestMethod.GET )
	public String signup() {
		return "user/signup";
	}

	@RequestMapping(value="/signup", method = RequestMethod.POST )
	@ResponseBody
	public String postSignup(User user) {
		System.out.println("getUser_id : " + user);
		
		System.out.println("getUser_level : " + user.getUser_level());
		System.out.println("전 " + user.getGallery_yn());
		if(user.getUser_level().equals("g")) {
			user.setGallery_yn("y");
		}else {
			user.setGallery_yn("n");
		}
		System.out.println("후 " + user.getGallery_yn());
		
		int cnt = userService.signup(user);
		
		if(cnt > 0) {
			return "ok";
		}else {
			return "ng";
		}
		
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam String user_id) {
		
		String msg = "";
		
		if(userService.getUser(user_id) != null) {
			msg = "ng";
		}else {
			msg = "ok";
		}
		
		return msg;
	}


	// 닉네임 중복 체크
	@RequestMapping(value="/nicknameCheck", method = RequestMethod.POST)
	@ResponseBody
	public String nicknameCheck(@RequestParam String nickname) {
		System.out.println("nickname 컨트롤러");
		System.out.println("nickname : " + nickname);
		
		String msg = "";
		
		if(userService.getNickname(nickname) != null) {
			msg = "ng";
		}else {
			msg = "ok";
		}
		
		return msg;
	}

	// 이메일 인증
	@RequestMapping(value="/certifyEmail", method = RequestMethod.POST)
	@ResponseBody
	public String certifyEmail(@RequestParam String email) {
		String msg = "";
		
		String tempKey = "";
		for (int i = 0; i < 5; i++) {
			tempKey += (int)(Math.random()*10);
		}
		
		System.out.println(tempKey);
		
		String receiver = email;
		String title = "KIXIV 이메일 인증 번호 발급";
		String content = "이메일 인증 번호는  " + tempKey + " 입니다.";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("team5.tomato@gmail.com");
		message.setTo(receiver);
		message.setSubject(title);
		message.setText(content);
		
		try {
			mailSender.send(message);
			
		} catch (Exception e) {
			System.out.println("email 예외 "+e.getMessage());
			e.printStackTrace();
		}
		
		return tempKey;
	}

	
	@RequestMapping(value="/login" )
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(User user, Model model, HttpSession session) {
		
		BlackUserVO blackUser = blackUserService.blackCheck(user.getUser_id());
		
		if(blackUser == null) {
			if(userService.login(user)) {
				// 로그인 유저 정보 세션에 저장
				user = userService.getUser(user.getUser_id());
				
				System.out.println("getUser_level : " + user.getUser_level());
				
				session.setAttribute("userId", user.getUser_id());
				session.setAttribute("user",user);
				
				if(user.getUser_level().equals("u")) {
					return "redirect:/";
				}else if(user.getUser_level().equals("a")){
					return "redirect:/adminPage";
				}
				return "redirect:/mypage";
			}else {
				model.addAttribute("error", true);
				return "login";
			}
		}else {
		    Calendar cal = Calendar.getInstance();
	        cal.setTime(blackUser.getBlackDate());
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	        cal.add(Calendar.DATE, 30);
	        blackUser.setBlackDate(new Date(cal.getTimeInMillis()));
			
			model.addAttribute("blackUser", blackUser);
			return "login";
		}
	} 

	@RequestMapping(value="/logout" )
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 내 정보
	@RequestMapping(value = "/mypage")
	String mypage(Model model, HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		/* System.out.println("이름은? : " + user.getName()); */
		String user_id = user.getUser_id();
		model.addAttribute("userVO", user);
		
		List<HashMap<String, Object>> list = followService.getFollowingList(user_id);
		model.addAttribute("followList", list);
		
		if(user.getUser_level().equals("a")) {
			return "user/adminPage";
		}else if(user.getUser_level().equals("g")) {
			List<GalleryVO> galleryList = galleryService.galleryList(user_id);
			
			System.out.println("size:" + galleryList.size());
			model.addAttribute("galleryList", galleryList);
			System.out.println("갤러리 페이지 이동");
			return "user/galleryPage";
		}
		int myLookCnt = picboardService.myLookCnt(user_id);
		model.addAttribute("myLookCnt",myLookCnt);
		return "user/mypage";
	}

	// 회원 정보 수정
	@RequestMapping(value = "/user/modify", method = RequestMethod.GET)
	String modify(HttpSession session, Model model) {
		System.out.println("get 탄다");
		User user = (User)session.getAttribute("user");
		System.out.println("user : " + user);
		model.addAttribute("userVO", user);
		return "user/modify";
	}
	
	
	// 회원 정보 수정 post
	@RequestMapping(value="/user/modify", method = RequestMethod.POST )
	public String postModify(User user, HttpSession session) {
		
		System.out.println("post 탄다");
		if(user.getUser_level() == null) {
			user.setUser_level("a");
		}
		
		userService.modify(user);
		session.setAttribute("userId", user.getUser_id());
		System.out.println("session : " + session.getAttribute("user"));
		return "redirect:/mypage";
	}
	
	
    @RequestMapping(value = "/profileFileUpload", method = RequestMethod.POST)
	@ResponseBody
	String profileFile(MultipartHttpServletRequest mtfRequest, HttpSession session, HttpServletRequest req) {

		MultipartFile mf = mtfRequest.getFile("file");
		
		String path = uploadPath + File.separator + "imgProfileUpload" + File.separator;
		System.out.println("path : " + path);
		
		
		File fileDir = new File(path);
		
		// 폴더 존재 여부 확인
		if(!fileDir.exists()) {
			fileDir.mkdirs();
		}
		
		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		System.out.println("originFileName : " + originFileName);

		//시연 전까지 이미지 파일 이름 앞 난수 제거
//		String saveFileName = String.format("%d_%s", System.currentTimeMillis(), originFileName);
		String saveFileName = originFileName;
		System.out.println("saveFileName : " + saveFileName);
		
		long fileSize = mf.getSize(); // 파일 사이즈
		System.out.println("fileSize : " + fileSize);
		
		String profile_img = String.format("imgProfileUpload/%s", saveFileName);
		System.out.println("profile_img : " + profile_img);
		
		User vo = (User) session.getAttribute("user");

		try {
			// 용량이 적은 파일 사용시 유리 함.
//			mf.transferTo(new File(path, saveFileName));
//			mf.getBytes();
//			mf.getInputStream();
			
			// 용량이 크고 많을 경우 유리..
			FileUtils.writeByteArrayToFile(new File(path, saveFileName), mf.getBytes());
			
			vo.setProfile_img(profile_img);
			userService.proifleImgUpdate(vo);
			
//			Thread.sleep(5000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return profile_img; 
	}
    
    // 비밀번호 찾기(이메일 아이디 일치여부 확인)
	@RequestMapping(value = "/findPwd")
	String findPwd() {
		return "/user/findPwd";
	}
	
	// 비밀번호 찾기 post(이메일 아이디 일치여부 확인)
	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
	@ResponseBody
	String postFindPwd(Model model, User vo) {
		
		System.out.println("findPwd 콘트롤러");
		
		System.out.println("getUser_id : " + vo.getUser_id());
		System.out.println("getEmail : " + vo.getEmail());
		
		vo = userService.findPwd(vo);
		
		String msg = "ok";
		
		if(vo == null) {
			msg = "ng";
		}
		
		return msg;
	}
	
	// 회원 이메일 체크
	@RequestMapping(value="/emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public String emailChsseck(@RequestParam String email) {
		System.out.println("이메일 체크 컨트롤러");
		String msg = "";
		
		if(userService.emailCheck(email) > 0) {
			msg = "ok";
		}else {
			msg = "ng";
		}
		
		return msg;
	}
	
	// 임시비밀번호 보내기
	@RequestMapping(value="/sendPwd", method = RequestMethod.POST)
	@ResponseBody
	public String sendPwd(User vo) throws Exception{
		
		System.out.println("getUser_id : " + vo.getUser_id());
		System.out.println("getEmail : " + vo.getEmail());
		
		// 임시 비밀번호 생성
		String[] pwd_list = {"!", "@", "#", "$", "%", "^", "&", "+", "=", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q",
				"R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q",
                "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};
		
		System.out.println(pwd_list.length);
		
		String tempPwd = "";
		for (int i = 0; i < 10; i++) {
			tempPwd += pwd_list[(int)(Math.random()*71)];
		}
		
		System.out.println(tempPwd);
		
		String receiver = vo.getEmail();
		String title = "KIXIV 임시 비밀번호 발급";
		String content = vo.getUser_id() + " 님의 임시 비밀번호는 " + tempPwd + " 입니다. \n\n 로그인 후에 비밀번호를 변경하여 사용하시기를 권장합니다";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("team5.tomato@gmail.com");
		message.setTo(receiver);
		message.setSubject(title);
		message.setText(content);
		
		try {
			mailSender.send(message);
			vo.setPassword(tempPwd);
			userService.changeTempPwd(vo);
		} catch (Exception e) {
			System.out.println("email 예외 "+e.getMessage());
			e.printStackTrace();
			return "ng";
		}

		return "ok";
        
	}
	
	// 회원 리스트
	@RequestMapping(value = "/user/userList")
	String mypage(Model model, Page page) {
		
		page.setTotalCount(userService.totalCount(page));
		
		List<User> userList = userService.userList(page);

		model.addAttribute("list", userList);
		model.addAttribute("page", page);
		
		return "/user/userList";
	}
	
	// 회원 상세
	@RequestMapping(value = "/user/userDetail")
	String detail(Model model, User userVO) {
		
		userVO = userService.getUser(userVO.getUser_id());
		model.addAttribute("userVO", userVO);
		
		List<GalleryVO> galleryList =  galleryService.galleryList(userVO.getUser_id());
		model.addAttribute("galleryList", galleryList);
		
		return "/user/userDetail";
	}
	
	@RequestMapping(value = "/adminPage")
	String adminPage(Model model, HttpSession session, HttpServletRequest req) {
		User user = (User)session.getAttribute("user");
		List<String> dlist = chartService.chartCountDate();
		List<String> ulist = chartService.chartCountPeple();
		List<String> glist = chartService.chartCountGPeple();
		List<String> fdlist = chartService.chartFundCountData();
		List<String> cclist = chartService.chartFundCountCnt();
		List<String> taglist = chartService.chartTag();
		List<String> tCntlist = chartService.tCntlist();
		List<String> taglistRankList = chartService.taglistRankList();
		List<String> tCntRankList = chartService.tCntRankList();
 		List<String> userRankList = chartService.userRankList();
 		List<String> userRankCntList = chartService.userRankCntList();
 		List<String> newUserRank = chartService.newUserRank();
 		List<String> newUserRankList = chartService.newUserRankList();
 		
 		System.out.println(newUserRankList.size());
 		//System.out.println(newUserRankList.size());
		
		 for (int i = 0; i < newUserRankList.size(); i++) {
			 	String why = newUserRankList.get(i); 
		 		System.out.println(why +"?"); 
		 		System.out.println("11");
		 	}
	 		System.out.println("ㅎㅇ1");
		//연 펀딩 글 작성율 현황
		List<List> list = new ArrayList<List>();
		list.add(dlist);
		list.add(ulist);
		list.add(glist);
		list.add(fdlist);
		list.add(cclist);
		list.add(taglist);
		list.add(tCntlist);
		list.add(taglistRankList);
		list.add(tCntRankList);
		list.add(userRankList);
		list.add(userRankCntList);
		list.add(newUserRank);
		list.add(newUserRankList);
		req.getSession().setAttribute("alist", list);
		model.addAttribute("userVO", user);
		
		return "/user/adminPage";
	}
	
	@RequestMapping(value = "/galleryPage")
	String galleryPage(Model model, HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		model.addAttribute("userVO", user);
		
		return "/user/galleryPage";
	}

	// 유저페이지
	@RequestMapping(value = "/userPage")
	String following(@RequestParam String user_id, Model model, HttpSession session) {
		
		User user = userService.getUser(user_id);
		model.addAttribute("userVO", user);
		
		//팔로우 유무 확인
		FollowVo follow = new FollowVo();
		follow.setFrom_id(user.getUser_id());
		System.out.println("userId : " + session.getAttribute("userId"));
		follow.setTo_id((String)session.getAttribute("userId"));
		int followCnt =  followService.followYn(follow);
		user_id = follow.getFrom_id();
		int myLookCnt = picboardService.myLookCnt(user_id);
		
		model.addAttribute("myLookCnt",myLookCnt);
		model.addAttribute("followCnt",followCnt);
		
		return "user/userPage";
	}
    
	// 일반회원 투자 리스트
	@RequestMapping(value="/investList", method = RequestMethod.GET)
	public String investList(@RequestParam Map<String, Object> map, Model model, Page page, HttpSession session) {
		System.out.println("investList 컨트롤러");
		
		String user_id = ((User)session.getAttribute("user")).getUser_id();
		page.setUser_id(user_id);
		page.setTotalCount(userService.investTotalCount(page));
		
		List<Map<String, Object>> list = userService.investList(page);		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "/user/investList";
	}
	
	// 일반회원 펀드 리스트
	@RequestMapping(value="/myFundList", method = RequestMethod.GET)
	public String myFundList(@RequestParam Map<String, Object> map, Model model, Page page, HttpSession session) {
		System.out.println("myFundList 컨트롤러");
		
		String user_id = ((User)session.getAttribute("user")).getUser_id();
		page.setUser_id(user_id);
		page.setTotalCount(userService.myFundTotalCount(page));
		
		List<Map<String, Object>> list = userService.myFundList(page);		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "/user/myFundList";
	}
	
	// 갤러리 대관 환불 요청 리스트
	@RequestMapping(value="/refundList", method = RequestMethod.GET)
	public String refundList(Model model, Page page) {
		System.out.println("refundList 컨트롤러");
		
		page.setTotalCount(userService.refundTotalCount());
		
		List<Map<String, Object>> list = userService.refundList(page);		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "/user/refundList";
	}
	
	// 갤러리 대관 환불 승인
	@RequestMapping(value="/permissionRefund", method = RequestMethod.GET)
	public String permissionRefund(@RequestParam Map<String, Object> map,  Model model) {
		userService.permissionRefund(map);		
		return "redirect:/refundList";
	}
	
	
}
