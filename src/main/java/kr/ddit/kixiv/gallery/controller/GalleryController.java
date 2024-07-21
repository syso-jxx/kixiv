package kr.ddit.kixiv.gallery.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import kr.ddit.kixiv.cmt.vo.GoodBadCntVo;
import kr.ddit.kixiv.gallery.service.GalleryRentPage;
import kr.ddit.kixiv.gallery.service.GalleryService;
import kr.ddit.kixiv.gallery.vo.GalleryRentVO;
import kr.ddit.kixiv.gallery.vo.GalleryVO;
import kr.ddit.kixiv.gallery.vo.RentCmtVO;
import kr.ddit.kixiv.gallery.vo.RentVO;
import kr.ddit.kixiv.user.vo.User;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GalleryController {
	@Autowired
	GalleryService service;
	
	@Resource(name = "uploadPath")
	private String uploadPath;

///////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////갤러리 대여/////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////	
	
	private int size = 10;
	
	// 대여 갤러리 리스트 페이지 페이징 처리
	@RequestMapping(value = "/galleryRentEvent", method = RequestMethod.GET)
	public ModelAndView galleryRentPage(@RequestParam Map<String, Object> map, ModelAndView mav) {
		
		String strPageNum = (String)map.get("pageNum") == null ? "1" : (String)map.get("pageNum");
		String keyword = (String)map.get("keyword") == null ? "" : (String)map.get("keyword");
		int pageNum = Integer.parseInt(strPageNum);
		map.put("pageNum", pageNum);
		map.put("keyword", keyword);
		System.out.println("keyword : " + keyword);
		int total = this.service.selectCount(map);
		
		List<Map<String, Object>> galleryRentList = service.getGalleryRentList(map);
		
		System.out.println("galleryRentList : "+ galleryRentList);
		mav.addObject("galleryRentList", new GalleryRentPage(total, pageNum, size, galleryRentList));
		mav.setViewName("/gallery/galleryRentEvent");
		return mav;
	}
	
	// 대여 갤러리 상세 페이지
	@RequestMapping(value = "/galleryRentDetail", method = RequestMethod.GET)
	public ModelAndView detailPage(@RequestParam Map<String, Object> map, ModelAndView mav) {
		
		Map<String, Object> rent = service.getRent(map);	
		List<RentCmtVO> rentCmtList = service.getCmtList(map);
		
		// 일반글
		mav.addObject("rent", rent);  	
		// 댓글
		mav.addObject("rentCmtList", rentCmtList);
		
		mav.setViewName("/gallery/galleryRentDetail");
		return mav;
	}
	
	//	모댓글 등록 POST
	@RequestMapping(value = "/galleryRentCmtWrite")
	public ModelAndView postWriteCmt(ModelAndView mav, RentCmtVO cmtVO, HttpSession session) {
		
		// vo에 댓글이 담긴다.
		// retSeq라는 변수를 설정 CmtVO에 들어가잇는 rentSeq 값을  삽입
		int rent_seq = cmtVO.getRent_seq();	//부모글 기본키를 가져옴
		cmtVO.setUser_id((String)session.getAttribute("userId")); //로그인한 사용자를 vo에 넣음
		// vo 에 담긴값을 getCmtVO에 넘기기
		service.writeCmtVO(cmtVO);	//댓글 입력
		mav.setViewName("/gallery/galleryRentDetail");	//setViewName() : 이곳으로 갈 경로설정(jsp)
		RedirectView redirectView = new RedirectView("/galleryRentDetail");	//이곳으로 갈 경로를 담음
		redirectView.addStaticAttribute("rent_seq", rent_seq);	//갈 때 함께갈 데이터(name과 value)
		mav.setView(redirectView);	//최종세팅
		return mav;	//보냄
	}
	
	// 모댓글 수정 POST
	@RequestMapping(value = "/galleryRentCmtUpdate")
	public ModelAndView postUpdateCmt(ModelAndView mav, RentCmtVO cmtVO, HttpSession session) {
		
		int rent_seq = cmtVO.getRent_seq();
		User user = (User)session.getAttribute("user");
		cmtVO.setUser_id(user.getUser_id());
		service.updCmtVO(cmtVO); // 댓글 수정
		mav.setViewName("/gallery/galleryRentDetail");
		RedirectView redirectView = new RedirectView("/galleryRentDetail");
		redirectView.addStaticAttribute("rent_seq", rent_seq);
		mav.setView(redirectView);
		return mav;
	}
	
	//	모댓글 삭제 POST
	@RequestMapping(value = "/galleryRentCmtDeletePros")
	public ModelAndView postDeleteCmt(ModelAndView mav, RentCmtVO cmtVO, HttpSession session) {
		
		int rent_seq = cmtVO.getRent_seq(); // 글번호 rent_seq에 저장
		User user = (User)session.getAttribute("user"); // user 정보 가져오기
		cmtVO.setUser_id(user.getUser_id()); // VO에 user_id 저장
		
		int cnt = service.getGrpCount(cmtVO.getGrp()); // 댓글이 속한 댓글 번호(grp)의 개수 cnt에 저장
		int resultDeleteCmt = 0; // resultDeleteCmt 초기화
		
		if(cnt != 1) { // 대댓글이 있으면
			resultDeleteCmt = service.delCmtVO(cmtVO); // 댓글 상태값 변경
		} else { // 대댓글이 없으면
			int cntGB = service.getCountGB(cmtVO); // 좋아요 싫어요 개수 cntGB에 저장
			if (cntGB > 0) { // cntGB가 0보다 크면
				int resultDeleteGB = service.deleteGB(cmtVO); // GOOD_BAD 테이블의 데이터 삭제
			}
			resultDeleteCmt = service.delCmtVOComp(cmtVO); // 댓글이 삭제되면 1, 아니면 0
		}
		if(resultDeleteCmt > 0) {
			mav.addObject("msg", "삭제가 완료되었습니다.");
			mav.addObject("url", "/galleryRentDetail?rent_seq="+rent_seq);
			mav.setViewName("error/redirect");
			return mav;
		} else {
			mav.addObject("msg", "삭제도중 문제가 발생했습니다.");
			mav.addObject("url", "/galleryRentDetail?rent_seq="+rent_seq);
			mav.setViewName("error/redirect");
			return mav;
		}
	}
	
	// 대댓글 등록 POST
	@RequestMapping(value = "/galleryRentCmtReWrite")
	public ModelAndView postReplyWriteCmt(ModelAndView mav, RentCmtVO cmtVO, HttpSession session) {
		
		int rent_seq = cmtVO.getRent_seq();
		User user = (User)session.getAttribute("user");
		cmtVO.setUser_id(user.getUser_id());
		service.replyWriteCmtVO(cmtVO);	//대댓글 입력
		mav.setViewName("/gallery/galleryRentDetail");
		RedirectView redirectView = new RedirectView("/galleryRentDetail");
		redirectView.addStaticAttribute("rent_seq", rent_seq);
		mav.setView(redirectView);
		return mav;
	}
	
	//	대댓글 수정	POST
	@RequestMapping(value = "/galleryRentCmtReUpdate")
	public ModelAndView postReplyUpdateCmt(ModelAndView mav, RentCmtVO cmtVO, HttpSession session) {
	
		int rent_seq = cmtVO.getRent_seq();
		User user = (User)session.getAttribute("user");
		cmtVO.setUser_id(user.getUser_id());
		service.replyUpdCmtVO(cmtVO); // 대댓글 수정
		mav.setViewName("/gallery/galleryRentDetail");
		RedirectView redirectView = new RedirectView("/galleryRentDetail");
		redirectView.addStaticAttribute("rent_seq", rent_seq);
		mav.setView(redirectView);
		return mav;
	}
	
	//	대댓글 삭제 POST
	@RequestMapping(value = "/galleryRentCmtReDelete")
	public ModelAndView postReplyDeleteCmt(ModelAndView mav, RentCmtVO cmtVO, HttpSession session) {
		
		int rent_seq = cmtVO.getRent_seq();
		User user = (User)session.getAttribute("user");
		cmtVO.setUser_id(user.getUser_id());
		
		service.deleteGB(cmtVO);
		int resultDeleteCmt = service.replyDelCmtVO(cmtVO);
		
		if(resultDeleteCmt == 1) {
			int cnt = service.getGrpCount(cmtVO.getGrp());
			
			if (cnt == 1) { //대댓글 삭제 후 댓글이 하나만 남은경우 모댓글 삭제여부 체크
				String del_yn = service.getDelYn(cmtVO.getGrp());

				if(del_yn.equals("y")) { // 모댓글이 삭제된 상태일경우만 모댓글도 삭제
					int cmt_id = service.getCmtId(cmtVO);
					cmtVO.setCmt_id(cmt_id);
					service.deleteGB(cmtVO);
					service.delCmtVOComp(cmtVO);
				}
			}
		}
		if(resultDeleteCmt > 0) {
			mav.addObject("msg", "삭제가 완료되었습니다.");
			mav.addObject("url", "/galleryRentDetail?rent_seq="+rent_seq);
			mav.setViewName("error/redirect");
			return mav;
		} else {
			mav.addObject("msg", "삭제도중 문제가 발생했습니다.");
			mav.addObject("url", "/galleryRentDetail?rent_seq="+rent_seq);
			mav.setViewName("error/redirect");
			return mav;
		}
	}
	
	// 좋아요/싫어요 클릭 시 수행 POST
	@ResponseBody
	@RequestMapping(value = "/galleryRentCmtStatus")
	public Map<String,Object> gb_list(@RequestParam Map<String, Object> map, HttpSession session) {
		
		int gb_status = Integer.parseInt((String)map.get("gb_status"));	// 좋아요 1 싫어요 2
		int cmtId = Integer.parseInt((String)map.get("cmtId"));			// 댓글번호
		User user = (User)session.getAttribute("user");
		
		RentCmtVO cmtVO = new RentCmtVO(); // VO에 담기
		cmtVO.setGb_status(gb_status);
		cmtVO.setCmt_id(cmtId);
		cmtVO.setUser_id(user.getUser_id());
		
		// 로그인한 user가 '좋아요' or '싫어요'를 눌렀으면 상태값 가져오기
		String ex_status = service.getStatus(cmtVO) == null ? "" : service.getStatus(cmtVO);
		//결과를 return해줄 Map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if (!ex_status.equals(""+gb_status) || ex_status.equals("")) { // 상태값이 빈 문자열이거나 ex_status이 gb_status와 다를 때
			service.goodAndBadVO(cmtVO); // merge문으로 update 혹은 insert
			resultMap.put("result", "merge");
//			System.out.println(resultMap.get("result"));
		} else { // 상태값이 빈 문자열이 아니거나 ex_status이 gb_status와 같을 때
			int result = service.delGBFromUser(cmtVO); // 해당 user의 좋아요/싫어요 cnt - 1
			resultMap.put("result", "del");
//			System.out.println(resultMap.get("result"));
		}
		
		//좋아요 싫어요 정보를 담아올 리스트 생성
		ArrayList<GoodBadCntVo> gb_list = new ArrayList();
		//cntg --> 좋아요 갯수, cntb --> 싫어요 갯수
		gb_list = service.gb_list(cmtVO);
		resultMap.put("gb_list", gb_list);
		resultMap.put("result", "merge");
		
		return resultMap;
	}
	
	String rent_imp_uid;
	
	// 일반회원의 갤러리 대여 결제
	private IamportClient api;
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
				Model model, @RequestParam Map<String, Object> map,
				@PathVariable(value= "imp_uid") String imp_uid)  // @PathVariable : URL 경로에 변수를 넣어주는 어노테이션
				throws IamportResponseException, IOException	
	{	
		api = new IamportClient("5478977203813634","Nb2oM8tlAgcw3WJ8iBgFfB8nljX5tSRg3TEQ28cDoo9skTADvRiKsr8OL6UeYLv2FaSIj5lItvaOoLsT");
		rent_imp_uid = (String)imp_uid;
		return api.paymentByImpUid(imp_uid);
	}
	
	// 일반회원의 갤러리 대여 신청 GET
	@RequestMapping(value="/galleryRentReq", method=RequestMethod.GET)
	public ModelAndView rentReq(ModelAndView mav, RentVO rentVO, HttpSession session, @RequestParam Map<String, Object> map) {
		
		// User 정보 가져오기
		User user = (User)session.getAttribute("user");
		// 갤러리 정보 가져오기
		int rent_seq = rentVO.getRent_seq();
		
		// 로그인을 하지 않았을 경우
		if(user == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "/");
			mav.setViewName("error/redirect");
			return mav;
		}
		
		// 일반회원이 아닐 경우
		User loginUser = (User)session.getAttribute("user");
		String userLvl = loginUser.getUser_level();
		
		if(!userLvl.equals("u")) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "/");
			mav.setViewName("error/redirect");
			return mav;
		}

		map.put("rent_seq", rent_seq);
		Map<String, Object> rent = service.getRent(map);
		
		mav.addObject("rent", rent);
		mav.addObject("rent_seq", rent_seq);
		mav.addObject("user", user);
		mav.setViewName("/gallery/galleryRentReq");
		return mav;
	}
	
	// 일반회원의 갤러리 대여 신청 POST
	@ResponseBody
	@RequestMapping(value="/galleryRentReq", method=RequestMethod.POST)
	public ModelAndView postRentReq(@RequestParam Map<String, Object> map, 
			HttpServletRequest request, ModelAndView mav, HttpSession session) {
		
		// session에서 user 정보 가져오기
		User user = (User)session.getAttribute("user");
		
		// galleryRentVO에 결제정보 저장
		GalleryRentVO galleryRentVO = new GalleryRentVO();
		galleryRentVO.setRent_imp_uid(rent_imp_uid);
		galleryRentVO.setUser_id(user.getUser_id());
		
		// gallery_rent테이블에 결제정보 insert
		service.rentReqVO(galleryRentVO);
		// rent테이블에 rent_status = 'n' 상태로 update
		service.rentReqStVO(galleryRentVO);
		
		mav.addObject("galleryRentVO", galleryRentVO);
		mav.setViewName("/gallery/galleryRentReq");
		RedirectView redirectView = new RedirectView("/galleryRentReq");
		mav.setView(redirectView);
		return mav;
	}
	
	// 대여 가능 갤러리 글쓰기 GET
	@RequestMapping(value="/galleryRentWrite", method = RequestMethod.GET)
	public String writeRentVO(Model model, HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/");
			return "error/redirect";
		}
		
		String userId = user.getUser_id();
		
		List<GalleryVO> galleryList = service.galleryList(userId);
		
		model.addAttribute("galleryList", galleryList);
		return "/gallery/galleryRentWrite";
	}
	
	// 대여 가능 갤러리 글쓰기 POST
	@RequestMapping(value = "/galleryRentWrite", method = RequestMethod.POST)
	String postWrite(@RequestParam HashMap<String, Object> rentMap, MultipartHttpServletRequest mtfRequest, HttpSession session) throws Exception {
		
		int rent_seq = this.service.selectMaxRentSeq()+1;
		User user = (User)session.getAttribute("user");
		String userId = user.getUser_id();
		String gallery_num_ = (String)mtfRequest.getParameter("selectOption");
		int gallery_num = Integer.parseInt(gallery_num_);
		rentMap.put("userId", userId);
		rentMap.put("gallery_num", gallery_num);
		int insertRentResult = service.writeRent(rentMap);
		return "redirect:galleryRentEvent";
	}
	
	// 대여 가능 갤러리 글쓰기 사진 업로드
	@ResponseBody
	@RequestMapping(value="/uploadSummernoteRentImageFile", produces = "application/json; charset=utf8")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		
		JsonObject jsonObject = new JsonObject();

		String fileRoot = "D:\\springProject\\kixiv\\src\\main\\webapp\\resources\\summernote\\fileUpload\\";
		// 내부경로로 저장
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); //파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			// 파일 저장
			FileUtils.copyInputStreamToFile(fileStream, targetFile); 
			// contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("url", "/fileUpload/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	// 대여 가능한 갤러리 게시글 수정 GET
	@RequestMapping(value="/galleryRentModify", method = RequestMethod.GET)
	public String modify(int rent_seq, Model model) {
		
		RentVO rentVO = new RentVO();
		GalleryVO galleryVO = new GalleryVO();
		
		rentVO = service.getRentVO(rent_seq);
		int gallery_num = rentVO.getGallery_num();
		galleryVO = service.getGalleryVO(gallery_num);
		
		model.addAttribute("rentVO", rentVO);
		model.addAttribute("galleryVO", galleryVO);
		return "gallery/galleryRentModify";
	}
	
	// 대여 가능한 갤러리 게시글 수정 POST
	@RequestMapping(value="/galleryRentModify", method = RequestMethod.POST)
	public String postModify(RentVO rentVO) {
		
		int rent_seq = rentVO.getRent_seq();
		service.galleryRentModify(rentVO);
		
		return "redirect:/galleryRentDetail?rent_seq="+rent_seq;
	}
	
	// 대여 가능한 갤러리 게시글 삭제
	@RequestMapping(value="/galleryRentDelete", method = RequestMethod.GET)
	public String delete(int rent_seq) {
		
		service.galleryRentDelete(rent_seq);
		
		return "redirect:/galleryRentEvent";
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////갤러리 마이페이지////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////	
	
	// 일반회원의 대여 중인 갤러리 목록
	@RequestMapping(value = "/myGalleryRentReqList")
	ModelAndView myGalleryRentReq(@RequestParam Map<String, Object> map, ModelAndView mav, HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		String strPageNum = (String)map.get("pageNum") == null ? "1" : (String)map.get("pageNum");
		String keyword = (String)map.get("keyword") == null ? "" : (String)map.get("keyword");
		String user_id = user.getUser_id();
		
		map.put("user_id", user_id);
		map.put("keyword", keyword);
		
		int total = this.service.getMyRentReqListCnt(map);
		
		int pageNum = Integer.parseInt(strPageNum);
		map.put("pageNum", pageNum);
		List<Map<String, Object>> myRentReqList = this.service.getMyRentReqList(map);
		
		mav.addObject("rent_period_start", map.get("rent_period_start"));
		mav.addObject("rent_period_end", map.get("rent_period_end"));
		mav.addObject("myRentReqList", new GalleryRentPage(total, pageNum, size, myRentReqList));
		mav.setViewName("myGalleryRentReqList");
		return mav;
	}
	
	// 일반회원의 갤러리 대여 상세
	@RequestMapping(value = "/myGalleryRentReceipt")
	public String rentReceipt(HttpSession session, Model model, String rent_num, GalleryRentVO galleryRentVO) throws Exception {
		
		User user = (User)session.getAttribute("user");
		galleryRentVO.setUser_id(user.getUser_id());
		galleryRentVO = service.oneitemPick(rent_num);
		model.addAttribute("detail", galleryRentVO);
		return "myGalleryRentReceipt";
	}
	
   @RequestMapping(value="/myGalleryReqReceipt")
   public String postStatusUadate(GalleryRentVO galleryRentVO, RentVO rentVO) {
	  
      service.galleryReqRefund(galleryRentVO);
      service.rentStatusUpdate(rentVO);
      return "redirect:/myGalleryRentReqList";
   }

	// 갤러리 리스트
	@RequestMapping(value = "/myGalleryList")
	String myGalleryList(Model model, HttpSession session) {
		
		String user_id = (String)session.getAttribute("userId");
		
		System.out.println("user_id : " + user_id);
		
		List<GalleryVO> myGalleryList = service.galleryList(user_id);

		model.addAttribute("list", myGalleryList);
		
		return "/myGalleryList";
	}
	
	// 갤러리 상세
	@RequestMapping(value = "/myGalleryDetail")
	String myGalleryDetail(@RequestParam String gallery_num, Model model) {
		
		GalleryVO vo = service.myGalleryDetail(gallery_num);
		
		model.addAttribute("galleryVO", vo);
		
		return "/myGalleryDetail";
	}

	// 갤러리 추가
	@RequestMapping(value = "/addGallery")
	String addGallery() {
		return "/addGallery";
	}

	// 갤러리 추가
	@RequestMapping(value = "/addGallery", method = RequestMethod.POST)
	String postAddGallery(GalleryVO vo) {
		
		System.out.println("getGallery_name : " + vo.getGallery_name());
		System.out.println("getGallery_tel : " + vo.getGallery_tel());
		System.out.println("getGallery_intro : " + vo.getGallery_intro());
		System.out.println("getHomepage : " + vo.getHomepage());
		System.out.println("getGallery_zip : " + vo.getGallery_zip() );
		System.out.println("getGallery_add1 : " + vo.getGallery_add1());
		System.out.println("getGallery_add2 : " + vo.getGallery_add2());
		System.out.println("getGallery_img : " + vo.getGallery_img());
		System.out.println("getUser_id : " + vo.getUser_id());
		
		service.addGallery(vo);
		
		return "redirect:/mypage";
	}
	
	// 갤러리 이미지 추가
	@RequestMapping(value = "/galleryImgUpload", method = RequestMethod.POST)
	@ResponseBody
	String profileFile(MultipartHttpServletRequest mtfRequest, HttpSession session, HttpServletRequest req) {

		MultipartFile mf = mtfRequest.getFile("file");
		
		String path = uploadPath + File.separator + "imgGalleryUpload" + File.separator;
		
		File fileDir = new File(path);
		
		// 폴더 존재 여부 확인
		if(!fileDir.exists()) {
			fileDir.mkdirs();
		}
		
		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		System.out.println("originFileName : " + originFileName);

		//시연 전까지 이미지 파일 이름 앞 난수 제거
//		String saveFileName = String.format("%d_%s", System.currentTimeMillis(), originFileName);
		String saveFileName = String.format("%s", originFileName);
		System.out.println("saveFileName : " + saveFileName);
		
		long fileSize = mf.getSize(); // 파일 사이즈
		System.out.println("fileSize : " + fileSize);
		
		String gallery_img = String.format("imgGalleryUpload/%s", saveFileName);
		System.out.println("gallery_img : " + gallery_img);
		
		try {
			// 용량이 크고 많을 경우 유리..
			FileUtils.writeByteArrayToFile(new File(path, saveFileName), mf.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gallery_img; 
	}
	
	// 주소 중복 체크
	@RequestMapping(value="/addressCheck", method = RequestMethod.POST)
	@ResponseBody
	public String addressCheck(@RequestParam String gallery_add1,
		@RequestParam(value="old_add", required = false, defaultValue = "") String old_add) {
	
		String msg = "";
		System.out.println("old_add : " + old_add);
		GalleryVO vo = service.addressCheck(gallery_add1);
		
		if(vo == null){
			msg = "ok";
		}else {
			if(old_add != "") {
				if(vo.getGallery_add1().contentEquals(old_add)) {
					msg = "ok";
				}else {
					msg = "ng";
				}
			}else {
				msg = "ng";
			}
		}
		System.out.println(msg);
		return msg;
	}

	// 갤러리 수정
	@RequestMapping(value = "/modifyGallery")
	String modifyGallery(@RequestParam String gallery_num, Model model) {
		
		GalleryVO vo = service.myGalleryDetail(gallery_num);
		model.addAttribute("galleryVO", vo);
		
		return "/modifyGallery";
	}
	
	// 갤러리 수정 post
	@RequestMapping(value = "/modifyGallery", method = RequestMethod.POST)
	String postModifyGallery(GalleryVO vo) {
		
		System.out.println("갤러리 수정 컨트롤러");
		System.out.println("getGallery_num : " + vo.getGallery_num());
		System.out.println("getGallery_name : " + vo.getGallery_name());
		System.out.println("getGallery_tel : " + vo.getGallery_tel());
		System.out.println("getGallery_intro : " + vo.getGallery_intro());
		System.out.println("getHomepage : " + vo.getHomepage());
		System.out.println("getGallery_zip : " + vo.getGallery_zip() );
		System.out.println("getGallery_add1 : " + vo.getGallery_add1());
		System.out.println("getGallery_add2 : " + vo.getGallery_add2());
		System.out.println("getGallery_img : " + vo.getGallery_img());
		System.out.println("getUser_id : " + vo.getUser_id());
		
		service.modifyGallery(vo);
		
		return "redirect:/mypage";
	}
	
	// 갤러리 삭제(delete_yn => y변경)
	@RequestMapping(value = "/deleteGallery")
	String deleteGallery(@RequestParam String gallery_num, Model model) {
		System.out.println("getGallery_num : " + gallery_num);
		service.deleteGallery(gallery_num);
		
		return "redirect:/mypage";
	}
	
	// 갤러리 회원 대관 목록 
	@RequestMapping(value = "/myGalleryRent")
	String MyGalleryRent(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		
		System.out.println("갤러리 회원 렌트 컨트롤러");
		
		
		String user_id = (String)session.getAttribute("userId");
		String strPageNum = (String)map.get("pageNum") == null ? "1" : (String)map.get("pageNum");
		String keyword = (String)map.get("keyword") == null ? "" : (String)map.get("keyword");
		map.put("user_id", user_id);
		map.put("keyword", keyword);
		
		int total = this.service.totalCount(map);
		System.out.println("total : " + total);

		//		int searchTotal = this.service.selectSearchCount(keyword);
		int pageNum = Integer.parseInt(strPageNum);
		map.put("pageNum", pageNum);
		List<Map<String, Object>> list = this.service.myGalleryRent(map);
		
		model.addAttribute("rent_period_start", map.get("rent_period_start"));
		model.addAttribute("rent_period_end", map.get("rent_period_end"));
		model.addAttribute("myGalleryRent", new GalleryRentPage(total, pageNum, size, list));
		return "myGalleryRent";
	}
}