package kr.ddit.kixiv.fund.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import kr.ddit.kixiv.fund.service.FundService;
import kr.ddit.kixiv.fund.service.FundingPage;
import kr.ddit.kixiv.fund.vo.FundCodeVO;
import kr.ddit.kixiv.fund.vo.FundVO;
import kr.ddit.kixiv.gallery.vo.GalleryRentVO;
import kr.ddit.kixiv.user.vo.User;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FundController {
	@Autowired
	FundService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/funding", method = RequestMethod.GET)
	public ModelAndView funding(@RequestParam Map<String, Object> map, ModelAndView mav) {
		//get parameter
		String fundCode = (String) map.get("fund_code") == null ? "all" : (String) map.get("fund_code");
		String strPageNum = (String)map.get("pageNum") == null ? "1" : (String)map.get("pageNum");
		String keyword = (String)map.get("keyword") == null ? "" : (String)map.get("keyword");
		
		int pageNum = 0;
		
		//pageNum 체크 > 숫자형태가 아닐경우 redirect
		try {
			pageNum = Integer.parseInt(strPageNum);
		} catch (NumberFormatException e) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "funding");
			mav.setViewName("error/redirect");
			return mav;
		}
		
		map.put("keyword", keyword);
		map.put("pageNum", pageNum);
		map.put("fundCode", fundCode);
		
		//총 게시글 갯수 체크
		int total = this.service.getFundTotal(map);
		//parameter에 해당하는 fundList 불러오기
		List<Map<String, Object>> fundList = this.service.getFundList(map);
		//배너목록 불러오기
		List<Map<String, Object>> fundBannerList = this.service.getFundBanner();
		//코드목록 불러오기
		List<FundCodeVO> codeList = this.service.selectCodeList();
		//검색 키워드가 있으나 검색 결과가 없을경우 redirect
		if((keyword != null && keyword != "") && total == 0) {
			mav.addObject("msg", "검색 결과가 없습니다.");
			mav.addObject("url", "funding");
			mav.setViewName("error/redirect");
			return mav;
		}
		
		mav.addObject("fund_code", fundCode);
		mav.addObject("fundList", new FundingPage(total, pageNum, 8, keyword, fundList)); //페이징처
		mav.addObject("fundBannerList", fundBannerList);
		mav.addObject("codeList", codeList);
		mav.setViewName("fund/funding");

		return mav;
	}

	@RequestMapping(value = "/fundDetail", method = RequestMethod.GET)
	public ModelAndView fundDetail(HttpSession session, @RequestParam Map<String, Object> map, ModelAndView mav)
			throws Exception {
		String fundId = (String) map.get("fund_id") == null ? null : (String) map.get("fund_id");
		String fundCode = (String) map.get("fund_code") == null ? null : (String) map.get("fund_code");

		if (fundId == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "funding");
			mav.setViewName("error/redirect");
			return mav;
		}
		
		map.put("fundId", fundId);
		FundVO fund = this.service.selectFundVO(map);
		
		if (fund == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "funding");
			mav.setViewName("error/redirect");
			return mav;
		}
		
		List<Map<String, Object>> fundPicList = this.service.selectFundPicList(map);
		User fundUser = this.service.selectFundUser(map);
		List<FundCodeVO> codeList = this.service.selectCodeList();
		
		mav.addObject("fund", fund);
		mav.addObject("fundCode", fundCode);
		mav.addObject("fundPicList", fundPicList);
		mav.addObject("fundUser", fundUser);
		mav.addObject("codeList", codeList);
		mav.setViewName("fund/fundDetail");
		return mav;
	}

	@RequestMapping(value = "/fundWriteFront", method = RequestMethod.GET)
	public ModelAndView fundWrite(@RequestParam Map<String, Object> map, ModelAndView mav, HttpSession session) throws Exception {
		List<FundCodeVO> codeList = this.service.selectCodeList();
		
		if(session.getAttribute("user") == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "/");
			mav.setViewName("error/redirect");
			return mav;
		}
		
		User loginUser = (User)session.getAttribute("user");
		String userLvl = loginUser.getUser_level();
		
		if(!userLvl.equals("u")) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "/");
			mav.setViewName("error/redirect");
			return mav;
		}
		
		String loginUserId = loginUser.getUser_id();
		System.out.println("userId : " + loginUserId);
		
		mav.addObject("loginUserId", loginUserId);
		mav.addObject("codeList", codeList);
		mav.setViewName("fund/fundWrite");
		return mav;
	}

	@RequestMapping(value = "/fundWritePros", method = RequestMethod.POST)
	String fundWrite(MultipartHttpServletRequest mtfRequest, HttpSession session) throws Exception {
		Map<String, Object> fundMap = new HashMap<String, Object>();
		
		int fundId = this.service.selectMaxFundId()+1;

		User user = (User)session.getAttribute("user");
		String userId = user.getUser_id();

		String sdate = (String) mtfRequest.getParameter("sdate");
		String edate = (String) mtfRequest.getParameter("edate");
		String achieve = (String) mtfRequest.getParameter("achieve").replace(",", "");
		String one_price = (String) mtfRequest.getParameter("one_price").replace(",", "");
		String fundCode = (String) mtfRequest.getParameter("fundCode");
		String fund_title = (String) mtfRequest.getParameter("fund_title");
		String fund_content = (String) mtfRequest.getParameter("fund_content");
		String fund_zip = (String) mtfRequest.getParameter("fund_zip");
		String fund_add1 = (String) mtfRequest.getParameter("fund_add1");
		String fund_add2 = (String) mtfRequest.getParameter("fund_add2");
		String place_tel1 = (String) mtfRequest.getParameter("place_tel1");
		String place_tel2 = (String) mtfRequest.getParameter("place_tel2");
		String place_tel3 = (String) mtfRequest.getParameter("place_tel3");
		String place_tel = place_tel1+")"+place_tel2+"-"+place_tel3;

		fundMap.put("userId", userId);
		fundMap.put("fundId", fundId);
		fundMap.put("sdate", sdate);
		fundMap.put("edate", edate);
		fundMap.put("achieve", achieve);
		fundMap.put("one_price", one_price);
		fundMap.put("fundCode", fundCode);
		fundMap.put("fund_title", fund_title);
		fundMap.put("fund_content", fund_content);
		fundMap.put("fund_zip", fund_zip);
		fundMap.put("fund_add1", fund_add1);
		fundMap.put("fund_add2", fund_add2);
		fundMap.put("place_tel", place_tel);
		
		System.out.println("userId = " + userId);
		System.out.println("maxFundId : " + fundId);
		System.out.println("sdate : " + sdate + " / edate : " + edate + " / achieve : " + achieve + " / one_price : "
				+ one_price + " / fundCode : " + fundCode);
		System.out.println("fund_title : " + fund_title + " / fund_content : " + fund_content);
		System.out.println("fund_zip : " + fund_zip + " / fund_add1 : " + fund_add1 + " / fund_add2 : " + fund_add2 + " / place_tel : " + place_tel);
		
		
		//fund 테이블에 insert
		int insertFundResult = this.service.insertFund(fundMap);
		
		if (insertFundResult != 0) { // insert 성공시
			System.out.println("========fund 추가 완료========");

			List<MultipartFile> fileList = mtfRequest.getFiles("files");
			
			String path = uploadPath + File.separator + "fundImgUpload" + File.separator;

			for (MultipartFile mf : fileList) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize(); // 파일 사이즈

				Map<String, Object> fileMap = new HashMap<String, Object>();

				if (fileSize == 0) {
					continue;
				}
				
				String chName = System.currentTimeMillis() + "_" + originFileName;

				String safeFile = path + chName;
				String picPath = File.separator + "fundImgUpload" + File.separator + chName;

				System.out.println("picNum : " + fundId);
				System.out.println("picPath : " + picPath);
				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);

				fileMap.put("picPath", picPath);
				fileMap.put("picName", originFileName);
				fileMap.put("fundId", fundId);

			    int insertPicResult = this.service.insertFundPicture(fileMap);
			    
			    if (insertPicResult != 0) {
			    	System.out.println("========fundPicture 추가 완료========");
			    	try {
						mf.transferTo(new File(safeFile));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
			    } else {
			    	System.out.println("글 작성 도중 에러가 발생했습니다.");
			    	return "redirect:funding";
			    }
			}
		} else {
			System.out.println("글 작성 도중 에러가 발생했습니다.");
			return "redirect:funding";
		}
		return "redirect:fundDetail?fund_id="+fundId+"&fund_code="+fundCode;
	}
	
	@RequestMapping(value = "/fundDelete", method = RequestMethod.POST)
	@ResponseBody
	String fundDelete(HttpServletRequest request) throws Exception {
		String msg = "";
		String fundId = request.getParameter("fundId");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fundId", fundId);
		
		List<Map<String, Object>> fundPicList = this.service.selectFundPicList(map);
		
		if (fundPicList.size() != 0) {
			if(this.service.deleteFundPic(fundId) != 0) {
				System.out.println("사진목록 삭제 완료");
			}
		}
		
		if (this.service.deleteFund(fundId) != 0) {
			msg = "ok";
		} else {
			msg = "ng";
		}
		
		return msg;
	}
	
	@RequestMapping(value = "/fundUpdate", method = RequestMethod.GET)
	public ModelAndView fundUpdate(@RequestParam Map<String, Object> map, ModelAndView mav, HttpSession session, HttpServletRequest request) throws Exception {
		if(session.getAttribute("user") == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "/");
			mav.setViewName("error/redirect");
			return mav;
		}
		
		map.put("fundId", request.getParameter("fund_id"));
		
		FundVO fund = this.service.selectFundVO(map);
		List<FundCodeVO> codeList = this.service.selectCodeList();
		List<Map<String, Object>> fundPicList = this.service.selectFundPicList(map);
		List<String> pathList = new ArrayList<String>();
		
		
		for ( Map<String, Object> fundPic : fundPicList) {
			String picPath = (String)fundPic.get("FUND_PICPATH");
			pathList.add(picPath);
		}
		
		String tel = fund.getPlace_tel();
		int idx_tel1 = tel.indexOf(")");
		int idx_tel2 = tel.indexOf("-");
		
		String place_tel1 = tel.substring(0, idx_tel1);
		String place_tel2 = tel.substring(idx_tel1+1, idx_tel2);
		String place_tel3 = tel.substring(idx_tel2+1);
		
		mav.addObject("place_tel1", place_tel1);
		mav.addObject("place_tel2", place_tel2);
		mav.addObject("place_tel3", place_tel3);
		mav.addObject("fund", fund);
		mav.addObject("codeList", codeList);
		mav.addObject("pathList", pathList);
		mav.setViewName("fund/fundUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/fundUpdate", method = RequestMethod.POST)
	String fundUpdate(MultipartHttpServletRequest mtfRequest, HttpSession session) throws Exception {
		Map<String, Object> fundMap = new HashMap<String, Object>();
		
		String fundId = (String)mtfRequest.getParameter("fund_id");
		
		String fund_title = (String) mtfRequest.getParameter("fund_title");
		String fund_content = (String) mtfRequest.getParameter("fund_content");
		String fund_zip = (String) mtfRequest.getParameter("fund_zip");
		String fund_add1 = (String) mtfRequest.getParameter("fund_add1");
		String fund_add2 = (String) mtfRequest.getParameter("fund_add2");
		String place_tel1 = (String) mtfRequest.getParameter("place_tel1");
		String place_tel2 = (String) mtfRequest.getParameter("place_tel2");
		String place_tel3 = (String) mtfRequest.getParameter("place_tel3");
		String place_tel = place_tel1+")"+place_tel2+"-"+place_tel3;
		
		fundMap.put("fundId", fundId);
		fundMap.put("fund_title", fund_title);
		fundMap.put("fund_content", fund_content);
		fundMap.put("fund_zip", fund_zip);
		fundMap.put("fund_add1", fund_add1);
		fundMap.put("fund_add2", fund_add2);
		fundMap.put("place_tel", place_tel);
		
		System.out.println("fundId : " + fundId);
		System.out.println("fund_title : " + fund_title + " / fund_content : " + fund_content);
		System.out.println("fund_zip : " + fund_zip + " / fund_add1 : " + fund_add1 + " / fund_add2 : " + fund_add2 + " / place_tel : " + place_tel);
		

		int updateFundResult = this.service.updateFund(fundMap);

		if (updateFundResult != 0) {
			System.out.println("========fund 추가 완료========");
			int cnt = 0;

			List<Map<String, Object>> picseqList = this.service.getPicseq(fundId);
			List<MultipartFile> fileList = mtfRequest.getFiles("files");

			String path = uploadPath + File.separator + "fundImgUpload" + File.separator;

			for (MultipartFile mf : fileList) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize(); // 파일 사이즈

				Map<String, Object> fileMap = new HashMap<String, Object>();

				if (fileSize == 0) {
					continue;
				}
				
				String chName = System.currentTimeMillis() + "_" + originFileName;

				String safeFile = path + chName;
				String picPath = File.separator + "fundImgUpload" + File.separator + chName;

				System.out.println("picNum : " + fundId);
				System.out.println("picPath : " + picPath);
				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);

				fileMap.put("picPath", picPath);
				fileMap.put("picName", originFileName);
				fileMap.put("fundId", fundId);

			    int insertPicResult = this.service.insertFundPicture(fileMap);
			    
			    if (insertPicResult != 0) {
			    	System.out.println("========fundPicture 추가 완료========");
			    	try {
						mf.transferTo(new File(safeFile));
						cnt++;
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
			    } else {
			    	System.out.println("글 수정 도중 에러가 발생했습니다.");
			    	return "redirect:funding";
			    }
			}
			
			if (cnt != 0) {
				for (Map<String, Object> picseq : picseqList) {
					int result = this.service.deleteFundPicSeq(picseq);
				}
			}
			
		} else {
			System.out.println("글 수정 도중 에러가 발생했습니다.");
			return "redirect:funding";
		}
		return "redirect:fundDetail?fund_id="+fundId;
	}
	// ===================펀드 결제 관련 시작======================
	@RequestMapping(value = "/fundPay", method = RequestMethod.GET)
	public ModelAndView fundPay(@RequestParam Map<String, Object> map, ModelAndView mav, HttpSession session, HttpServletRequest request) {
		String fundId = (String) map.get("fund_id") == null ? null : (String) map.get("fund_id");
		User user = (User)session.getAttribute("user");
		String userId = user.getUser_id();
		
		if (fundId == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "funding");
			mav.setViewName("error/redirect");
			return mav;
		}

		map.put("user_id", userId);
		map.put("fundId", fundId);
		FundVO fund = this.service.selectFundVO(map);
		
		if (fund == null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "funding");
			mav.setViewName("error/redirect");
			return mav;
		}
		
		Map<String,Object> investOk = this.service.selectInvestor(map);
		
		if(!investOk.isEmpty()) {
			mav.addObject("msg", "투자는 게시글당 1회만 가능합니다.");
			mav.addObject("url", "fundDetail?fund_id="+fundId+"&fund_code="+fund.getFund_code());
			mav.setViewName("error/redirect");
			return mav;
		}
		
		User fundUser = this.service.selectFundUser(map);
		
		mav.addObject("fund", fund);
		mav.addObject("fundUser", fundUser);
		
		mav.setViewName("fund/fundPay");

		return mav;
	}
	
	String fund_imp_uid;
	
	private IamportClient api;
	@ResponseBody
	@RequestMapping(value="/fundVerifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session, 
			@RequestParam Map<String, Object> map, @PathVariable(value= "imp_uid") String imp_uid) 
					throws IamportResponseException, IOException	{
		
		api = new IamportClient("5478977203813634","Nb2oM8tlAgcw3WJ8iBgFfB8nljX5tSRg3TEQ28cDoo9skTADvRiKsr8OL6UeYLv2FaSIj5lItvaOoLsT");
		fund_imp_uid = (String)imp_uid;
		return api.paymentByImpUid(imp_uid);
	}
	
	@ResponseBody
	@RequestMapping(value="/fundPay", method=RequestMethod.POST)
	public String postRentReq(@RequestParam Map<String, Object> param, HttpServletRequest request, 
			ModelAndView mav, HttpSession session) {
		
		String msg = "";
		User user = (User)session.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("fund_id", (String)param.get("fund_id"));
		map.put("fund_name", (String)param.get("fund_name"));
		map.put("fund_tel", (String)param.get("fund_tel"));
		map.put("fund_email", (String)param.get("fund_email"));
		map.put("user_id", user.getUser_id());
		map.put("merchant_uid", (String)param.get("merchant_uid"));
		map.put("fund_imp_uid", fund_imp_uid);
		
		int investorResult = this.service.insertInvestor(map);
		System.out.println("=====================결과 : " + investorResult+"==========================");
		
		if (investorResult != 0) {
			msg = "ok";
		} else {
			msg = "ng";
		}
		return msg;
	}
	
	
	
}
