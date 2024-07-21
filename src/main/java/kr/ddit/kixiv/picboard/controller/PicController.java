package kr.ddit.kixiv.picboard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ddit.kixiv.follow.service.FollowService;
import kr.ddit.kixiv.follow.vo.FollowVo;
import kr.ddit.kixiv.likey.service.LikeyService;
import kr.ddit.kixiv.likey.vo.LikeyVo;
import kr.ddit.kixiv.picboard.service.PicBoardService;
import kr.ddit.kixiv.picboard.vo.Picboard;
import kr.ddit.kixiv.picture.service.PictureService;
import kr.ddit.kixiv.picture.vo.PicCriteria;
import kr.ddit.kixiv.picture.vo.PicPage;
import kr.ddit.kixiv.picture.vo.PicPageMaker;
import kr.ddit.kixiv.picture.vo.Picture;
import kr.ddit.kixiv.tagList.service.TagListService;
import kr.ddit.kixiv.tagList.vo.TagAllVo;
import kr.ddit.kixiv.user.service.UserService;
import kr.ddit.kixiv.user.vo.User;

@Controller
@RequestMapping("/picture")
public class PicController {
	final String path = "picture/";
	

	@Resource(name = "uploadPath")
	private String uploadPath;

	
	@Autowired
	PictureService pictureService;
	
	@Autowired
	PicBoardService picBoardService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	TagListService tagListService;
	
	@Autowired
	LikeyService likeyService;
	
	@Autowired
	FollowService followService;
	
	
	@RequestMapping(value = "/picDetail")
	String picDetail(PicPage page, int board_id, Model model, HttpSession session) {
		System.out.println("totalCount : " + pictureService.totalCount(board_id));
		page.setUser_id((String)session.getAttribute("userId"));
		page.setBoard_id(board_id);
		page.setTotalCount(pictureService.totalCount(board_id));
		picBoardService.upcnt(board_id);
		System.out.println("board_id : " + page.getBoard_id());
		System.out.println("user_id : " + page.getUser_id());
		System.out.println("keyword : " + page.getTotalCount());
		System.out.println("num : " + page.getNum());
		System.out.println("totalCount : " + page.getTotalCount());
		System.out.println("getStartPost : " + page.getStartPost());
		System.out.println("getEndPost : " + page.getEndPost());
		System.out.println("getPostNum : " + page.getPostNum());
		System.out.println("getStartPageNum : " + page.getStartPageNum());
		System.out.println("getEndPageNum : " + page.getEndPageNum());
		System.out.println("getPageNum : " + page.getPageNum());
		System.out.println("getPrev : " + page.getPrev());
		System.out.println("getNext : " + page.getNext());
		
		List<Picture> userPic = pictureService.userPic(page);
		model.addAttribute("userPic",userPic);
		model.addAttribute("page", page);
		
		for(Picture pic : userPic) {
			System.out.println(pic.getPic_name());
		}

		String user_id = picBoardService.checkUser(board_id);
		model.addAttribute("user_id",user_id);
		
		User userImp = userService.getUser(user_id);
		model.addAttribute("userImp",userImp);
		
		Picboard pocboard = picBoardService.picitem(board_id);
		model.addAttribute("pocboard",pocboard);
		
		//팔로우 유무 확인
		FollowVo follow = new FollowVo();
		follow.setFrom_id(userImp.getUser_id());
		follow.setTo_id((String)session.getAttribute("userId"));
		int followCnt =  followService.followYn(follow);
		
		model.addAttribute("followCnt",followCnt);
		
		List<TagAllVo> tagList = tagListService.tagData(board_id);
		model.addAttribute("tagList",tagList);
		
		int lookCnt = picBoardService.countCnt(board_id);
		model.addAttribute("lookCnt",lookCnt);
		
		
		return path + "picDetail";
	}
	
	@RequestMapping(value = "/download" , produces="text/plain;charset=UTF-8")
	public void download(HttpServletResponse response, HttpServletRequest request) {
        // 직접 파일 정보를 변수에 저장해 놨지만, 이 부분이 db에서 읽어왔다고 가정한다.
//		System.out.println("왔다");
		int pic_num = Integer.parseInt(request.getParameter("picId"));
		Picture downPic = pictureService.OneSearch(pic_num);

	     String fileName = downPic.getPic_name();
	  
	     File file = null;
	     InputStream is = null;
	     OutputStream os = null;
	  
	     String mimetype = "application/x-msdownload";
	     response.setContentType(mimetype);
	  
	     try {
	         setDisposition(fileName, request, response);
	   
	         file = new File(uploadPath + downPic.getPic_path());
	         is = new FileInputStream(file);
	         os = response.getOutputStream();
	   
	         byte b[] = new byte[(int) file.length()];
	         int leng = 0;
	   
	         while((leng = is.read(b)) > 0){
	             os.write(b,0,leng);
	         }
	   
	         is.close();
	         os.close();
	     } catch (Exception e) {
	         e.printStackTrace();
	     }


	
}
	void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
			    String browser = getBrowser(request);
			    String dispositionPrefix = "attachment; filename=";
			    String encodedFilename = null;
			 
			    if (browser.equals("MSIE")) {
			        encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll(
			        "\\+", "%20");
			    } else if (browser.equals("Firefox")) {
			        encodedFilename = "\""
			        + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			    } else if (browser.equals("Opera")) {
			        encodedFilename = "\""
			        + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			    } else if (browser.equals("Chrome")) {
			        StringBuffer sb = new StringBuffer();
			        for (int i = 0; i < filename.length(); i++) {
			        char c = filename.charAt(i);
			        if (c > '~') {
			            sb.append(URLEncoder.encode("" + c, "UTF-8"));
			        } else {
			            sb.append(c);
			        }
			    }
			    encodedFilename = sb.toString();
			    } else {
			        throw new IOException("Not supported browser");
			    }
			 
			    response.setHeader("Content-Disposition", dispositionPrefix
			    + encodedFilename);
			 
			    if ("Opera".equals(browser)) {
			        response.setContentType("application/octet-stream;charset=UTF-8");
			    }
			 
			}

	
	private String getBrowser(HttpServletRequest request) {
	      String header = request.getHeader("User-Agent");
	      if (header.indexOf("MSIE") > -1) {
	           return "MSIE";
	      } else if (header.indexOf("Chrome") > -1) {
	           return "Chrome";
	      } else if (header.indexOf("Opera") > -1) {
	           return "Opera";
	      } else if (header.indexOf("Firefox") > -1) {
	           return "Firefox";
	      } else if (header.indexOf("Mozilla") > -1) {
	           if (header.indexOf("Firefox") > -1) {
	                return "Firefox";
	           }else{
	                return "MSIE";
	           }
	      }
	      return "MSIE";
	 }

}


