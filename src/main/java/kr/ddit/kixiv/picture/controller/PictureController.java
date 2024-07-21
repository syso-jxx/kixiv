package kr.ddit.kixiv.picture.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.ddit.kixiv.likey.service.LikeyService;
import kr.ddit.kixiv.picboard.service.PicBoardService;
import kr.ddit.kixiv.picture.service.PictureService;
import kr.ddit.kixiv.picture.vo.DataSet;
import kr.ddit.kixiv.picture.vo.Picture;
import kr.ddit.kixiv.picture.vo.SearchVO;
import kr.ddit.kixiv.tag.service.TagService;
import kr.ddit.kixiv.tag.vo.TagVo;
import kr.ddit.kixiv.tagList.service.TagListService;


@Controller
@RequestMapping("/picture")
public class PictureController {
	final String path = "picture/";
	
	@Autowired
	PictureService pictureService;
	
	@Autowired
	PicBoardService picBoardService;
	
	@Autowired
	TagService tagService;
	
	@Autowired
	TagListService tagListService;
	
	@Autowired
	LikeyService likeyService;
	
	@RequestMapping(value="/piclist")
	String piclist() {
		
		return path + "piclist";
	}
	
	@RequestMapping(value="listMake", produces="text/plain;charset=UTF-8")
	@ResponseBody   //없으면 AJAX 통신 안되요
	public String getList(SearchVO param, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
	    Gson gson = new Gson();
	    DataSet set = new DataSet();
	    try {
	        int totalCnt = pictureService.getListCnt(param);  //데이터의 전체 갯수를 가져온다.
	        int page = param.getPage();  //파라메터 page값을 받는다.
	        if (page==1){
	            param.setStartNum(1);
	            param.setEndNum(20);  //데이터를 20개씩 가져오겠다.
	        }else{
	            param.setStartNum(page+(19*(page-1)));  //10개씩 가져오고싶다면 19->9로 
	            param.setEndNum(page*20);   //20, 40, 60
	        }
	        //위에서 구한, 데이터를 가져올 시작 rownum과 끝 rownum을 값을 같이 보낸다. 이 사이의 데이터를 조회
	        List<Picture> list = pictureService.getList(param);  //조회한 데이터를 가져온다.
	        System.out.println("list" + list);
	        
	        set.setRows(list);
	        set.setTotCnt(totalCnt);
	        set.setStartNum(param.getStartNum());
	        set.setResultCode(200);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    System.out.println("gson.toJson(set) : " + gson.toJson(set));
	    return gson.toJson(set);
	}
	
	
	@RequestMapping(value="/likeyPicList")
	String likeyPicList() {

		return path + "likeyPicList";
	}
	
	@RequestMapping(value="likeListMake", produces="text/plain;charset=UTF-8")
	@ResponseBody   //없으면 AJAX 통신 안되요
	public String getLikeList(SearchVO param, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
	    Gson gson = new Gson();
	    DataSet set = new DataSet();
	    try {
	        int totalCnt = pictureService.getListCnt(param);  //데이터의 전체 갯수를 가져온다.
	        int page = param.getPage();  //파라메터 page값을 받는다.
	        if (page==1){
	            param.setStartNum(1);
	            param.setEndNum(20);  //데이터를 20개씩 가져오겠다.
	        }else{
	            param.setStartNum(page+(19*(page-1)));  //10개씩 가져오고싶다면 19->9로 
	            param.setEndNum(page*20);   //20, 40, 60
	        }
	        //위에서 구한, 데이터를 가져올 시작 rownum과 끝 rownum을 값을 같이 보낸다. 이 사이의 데이터를 조회
	        List<Picture> list = pictureService.veryLikeImgs(param);  //조회한 데이터를 가져온다.
	        System.out.println("list" + list);
	        
	        set.setRows(list);
	        set.setTotCnt(totalCnt);
	        set.setStartNum(param.getStartNum());
	        set.setResultCode(200);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    System.out.println("gson.toJson(set) : " + gson.toJson(set));
	    return gson.toJson(set);
	}
	
	
	@RequestMapping(value="/followList")
	String followList() {

		return path + "followList";
	}
	
	@RequestMapping(value="followListMake", produces="text/plain;charset=UTF-8")
	@ResponseBody   //없으면 AJAX 통신 안되요
	public String getFollowList(SearchVO param, HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session) {
	    Gson gson = new Gson();
	    DataSet set = new DataSet();
	    param.setUser_id((String)session.getAttribute("userId"));
	    try {
	        int totalCnt = pictureService.getFollowListCnt(param);  //데이터의 전체 갯수를 가져온다.
	        int page = param.getPage();  //파라메터 page값을 받는다.
	        if (page==1){
	            param.setStartNum(1);
	            param.setEndNum(20);  //데이터를 20개씩 가져오겠다.
	        }else{
	            param.setStartNum(page+(19*(page-1)));  //10개씩 가져오고싶다면 19->9로 
	            param.setEndNum(page*20);   //20, 40, 60
	        }
	        //위에서 구한, 데이터를 가져올 시작 rownum과 끝 rownum을 값을 같이 보낸다. 이 사이의 데이터를 조회
	        List<Picture> list = pictureService.followImgs(param);  //조회한 데이터를 가져온다.
	        System.out.println("list" + list);
	        
	        set.setRows(list);
	        set.setTotCnt(totalCnt);
	        set.setStartNum(param.getStartNum());
	        set.setResultCode(200);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    System.out.println("gson.toJson(set) : " + gson.toJson(set));
	    return gson.toJson(set);
	}
	
	
	@RequestMapping(value="/recomList")
	String recomList() {
		
		return path + "recomList";
	}
	
	@RequestMapping(value="recomListMake", produces="text/plain;charset=UTF-8")
	@ResponseBody   //없으면 AJAX 통신 안되요
	public String getRecomList(SearchVO param, HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session) {
		Gson gson = new Gson();
		DataSet set = new DataSet();
		param.setUser_id((String)session.getAttribute("userId"));
		try {
			int totalCnt = pictureService.getRecomListCnt(param);  //데이터의 전체 갯수를 가져온다.
			int page = param.getPage();  //파라메터 page값을 받는다.
			if (page==1){
				param.setStartNum(1);
				param.setEndNum(20);  //데이터를 20개씩 가져오겠다.
			}else{
				param.setStartNum(page+(19*(page-1)));  //10개씩 가져오고싶다면 19->9로 
				param.setEndNum(page*20);   //20, 40, 60
			}
			//위에서 구한, 데이터를 가져올 시작 rownum과 끝 rownum을 값을 같이 보낸다. 이 사이의 데이터를 조회
			List<Picture> list = pictureService.RecomImgs(param);  //조회한 데이터를 가져온다.
			System.out.println("list" + list);
			
			set.setRows(list);
			set.setTotCnt(totalCnt);
			set.setStartNum(param.getStartNum());
			set.setResultCode(200);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("gson.toJson(set) : " + gson.toJson(set));
		return gson.toJson(set);
	}
	
	@RequestMapping(value="myListMake", produces="text/plain;charset=UTF-8")
	@ResponseBody   //없으면 AJAX 통신 안되요
	public String getMyList(SearchVO param, HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session) {
		System.out.println("myListMake 컨트롤러");
		
		Gson gson = new Gson();
		DataSet set = new DataSet();
		param.setUser_id((String)session.getAttribute("userId"));
		
		try {
			int totalCnt = pictureService.getMyListCnt(param);  //데이터의 전체 갯수를 가져온다.
			System.out.println("totalCnt : " + totalCnt);
			
			int page = param.getPage();  //파라메터 page값을 받는다.
			if (page==1){
				param.setStartNum(1);
				param.setEndNum(20);  //데이터를 20개씩 가져오겠다.
			}else{
				param.setStartNum(page+(19*(page-1)));  //10개씩 가져오고싶다면 19->9로 
				param.setEndNum(page*20);   //20, 40, 60
			}
			//위에서 구한, 데이터를 가져올 시작 rownum과 끝 rownum을 값을 같이 보낸다. 이 사이의 데이터를 조회
			List<Picture> list = pictureService.myImgs(param.getUser_id());  //조회한 데이터를 가져온다.
			System.out.println("list" + list);
			
			set.setRows(list);
			set.setTotCnt(totalCnt);
			set.setStartNum(param.getStartNum());
			set.setResultCode(200);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("gson.toJson(set) : " + gson.toJson(set));
		return gson.toJson(set);
	}

	@RequestMapping(value="userListMake", produces="text/plain;charset=UTF-8")
	@ResponseBody   //없으면 AJAX 통신 안되요
	public String getUserList(SearchVO param, ModelMap model, HttpSession session) {
		System.out.println("myListMake 컨트롤러");
		
		Gson gson = new Gson();
		DataSet set = new DataSet();
//		param.setUser_id((String)session.getAttribute("userId"));
		System.out.println("getUser_id : " + param.getUser_id());
		
		try {
			int totalCnt = pictureService.getMyListCnt(param);  //데이터의 전체 갯수를 가져온다.
			System.out.println("totalCnt : " + totalCnt);
			
			int page = param.getPage();  //파라메터 page값을 받는다.
			if (page==1){
				param.setStartNum(1);
				param.setEndNum(20);  //데이터를 20개씩 가져오겠다.
			}else{
				param.setStartNum(page+(19*(page-1)));  //10개씩 가져오고싶다면 19->9로 
				param.setEndNum(page*20);   //20, 40, 60
			}
			//위에서 구한, 데이터를 가져올 시작 rownum과 끝 rownum을 값을 같이 보낸다. 이 사이의 데이터를 조회
			List<Picture> list = pictureService.myImgs(param.getUser_id());  //조회한 데이터를 가져온다.
			System.out.println("list" + list);
			
			set.setRows(list);
			set.setTotCnt(totalCnt);
			set.setStartNum(param.getStartNum());
			set.setResultCode(200);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("gson.toJson(set) : " + gson.toJson(set));
		return gson.toJson(set);
	}
	
	
	
	@RequestMapping(value="/mypiclist")
	String mypiclist() {
		return path + "mypiclist";
	}
	
	
	@RequestMapping(value="hashTag")
	String hashTag(String tag_id, Model model) {
		
		List<Picture>list = pictureService.hashTag(tag_id);
		TagVo vo = tagService.tagList(tag_id);
		
		model.addAttribute("list",list);
		model.addAttribute("TagItem",vo);
		return path + "hashTag";
	}
	
	@RequestMapping(value="/deleteBoard")
	String deleteBoard(int board_id) {
		tagListService.deleteTag(board_id);
		likeyService.deleteLikeyB(board_id);
		pictureService.deletePicture(board_id);
		picBoardService.deleteBoard(board_id);
		return path + "piclist";
	}
	
	@RequestMapping(value="/delteYnBoard")
	String delteYnBoard(int board_id) {
		picBoardService.deleteYnBoard(board_id);
		return path + "piclist";
	}

	

	
}
