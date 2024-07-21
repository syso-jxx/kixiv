package kr.ddit.kixiv.fileUpload.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ddit.kixiv.likey.service.LikeyService;
import kr.ddit.kixiv.picboard.service.PicBoardService;
import kr.ddit.kixiv.picboard.vo.Picboard;
import kr.ddit.kixiv.picture.service.PictureService;
import kr.ddit.kixiv.picture.vo.Picture;
import kr.ddit.kixiv.tag.service.TagService;
import kr.ddit.kixiv.tag.vo.TagVo;
import kr.ddit.kixiv.tagList.service.TagListService;
import kr.ddit.kixiv.tagList.vo.TagListVo;
import kr.ddit.kixiv.user.vo.User;
import kr.ddit.kixiv.utill.UploadFileUtils;



@Controller
public class FileUploadController {
	//글 쓰기를 위한
	List<String> filelist   = new ArrayList<String>();
	List<String> pathList = new ArrayList<String>();
	List<String> thumList= new ArrayList<String>();
	
	//글 변경 를 위한
	List<String> cfilelist= new ArrayList<String>();
	List<String> cpathList= new ArrayList<String>();
	List<String> cthumList= new ArrayList<String>();
	
	@Autowired
	public PictureService pictureService;
	
	@Autowired
	public PicBoardService picboardService;
	
	@Autowired
	public TagListService tagListService;
	
	@Autowired
	public TagService tagService;
	
	@Autowired
	public LikeyService likeySerivice;
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	
	@RequestMapping(value = "/fileUpload")
    public String dragAndDrop(Model model) {
		List<TagVo> tag = tagService.list();
		model.addAttribute("tag",tag);
		filelist.clear();
    	pathList.clear();
    	thumList.clear();
        return "fileUpload";
        
    }
	
	
    @SuppressWarnings("unused")
	@RequestMapping(value ="/fileUpload/post", method = RequestMethod.POST) //ajax에서 호출하는 부분
    public String upload(Picture pic, MultipartFile file, HttpSession session)  throws Exception { //Multipart로 받는다.
    	String pureImage = file.getOriginalFilename();
    	String imgUploadPath = uploadPath + File.separator + "imgUpload";
    	String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
    	String fileName = null;

    	if(file != null) {
    	 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
    	} else {
    	 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
    	}
    	filelist.add(pureImage);
    	pathList.add(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
    	thumList.add(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
    	
    	return "ok";
    }
    
    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public String boardUp(Picture pic, Picboard board,TagListVo tagList, HttpSession session, HttpServletRequest req) {
    	System.out.println("파일업로드 시작");
    	String[] arr = req.getParameterValues("myBtn");
    	User user = (User)req.getSession().getAttribute("user");
    	board.setUser_id(user.getUser_id());
    	pic.setUser_id(user.getUser_id());
    	picboardService.boradUp(board);
    	
    	int boradid = picboardService.boarditem();
    	pic.setBoard_id(boradid);
    	
    	for(int i = 0; i<filelist.size(); i++) {
    		pic.setPic_name(filelist.get(i));
    		pic.setPic_path(pathList.get(i));
    		pic.setThum_name(thumList.get(i));
    		pictureService.fileupdate(pic);
    	}
    	
    	if(arr.length > 0) {
    		tagList.setBoard_id(boradid);
    		for(int i = 0; i<arr.length; i++) {
    			tagList.setTag_id(arr[i]);
    			tagListService.tagListIns(tagList);
    		}
    	}
    	    	
    	filelist.clear();
    	pathList.clear();
    	thumList.clear();
    	
    	return "redirect:picture/piclist";
    }
    
    //글수정
	@RequestMapping(value = "/chageUpdate")
    public String chageUpdate(Model model, int board_id) {
		List<Picture> picture = pictureService.getPicture(board_id);
		List<TagVo> tag = tagService.list();
		
		model.addAttribute("picture",picture);
		model.addAttribute("tag",tag);
		//초기화
		cfilelist.clear();
    	cpathList.clear();
    	cthumList.clear();
        return "chageUpdate";
        
    }
    
    
    // 글 수정용 
    @SuppressWarnings("unused")
	@RequestMapping(value ="/changefileUpload/post", method = RequestMethod.POST) //ajax에서 호출하는 부분
    public String changeUpload(Picture pic, MultipartFile file, HttpSession session)  throws Exception { //Multipart로 받는다.
    	String pureImage = file.getOriginalFilename();
    	String imgUploadPath = uploadPath + File.separator + "imgUpload";
    	String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
    	String fileName = null;

    	if(file != null) {
    	 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
    	} else {
    	 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
    	}
    	cfilelist.add(pureImage);
    	cpathList.add(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
    	cthumList.add(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
    	
    	return "ok";
    }
    
    //글 수정 등록
    @ResponseBody
    @RequestMapping(value = "/changeFileUpload", method = RequestMethod.POST)
    public String changeBoardUp(Picture pic, TagListVo tagList, HttpSession session, 
    		HttpServletRequest req,  @RequestParam(value="arr[]") List<String> arr, @RequestParam(value="delImg[]") List<String> delImg, int board_id,
    		RedirectAttributes redirectAttributes) {
    	
    	int boradid = board_id;
    	User user = (User)req.getSession().getAttribute("user");
    	
    	if(!delImg.get(0).equals("0")) {
    		//삭제된 그림에 해당한 좋아요 삭제
    		
		   	for (String pic_num : delImg) {
		   		likeySerivice.deleteLikey(pic_num);   	
	    	}
		   	
		   	//삭제된  요청된 그림 삭제
		   	for (String pic_num : delImg) {
		    	pictureService.deleteChangeImg(pic_num);   	
		    }
    	}
	   	//기존태그 전부삭제
	   	tagListService.tagAllDel(board_id);
	   	
    	// 태그 다시삽입
    	if(arr.size() > 0) {
    		tagList.setBoard_id(boradid);
    		for(int i = 0; i<arr.size(); i++) {
    			tagList.setTag_id(arr.get(i));
    			tagListService.tagListIns(tagList);
    		}
    	}   	   	
    	pic.setUser_id(user.getUser_id());
    	pic.setBoard_id(boradid);
    	
    	if(cfilelist.size()>0) {
	    	for(int i = 0; i<cfilelist.size(); i++) {
	    		pic.setPic_name(cfilelist.get(i));
	    		pic.setPic_path(cpathList.get(i));
	    		pic.setThum_name(cthumList.get(i));
	    		pictureService.fileupdate(pic);
	    	}
    	}    	
    	cfilelist.clear();
    	cpathList.clear();
    	cthumList.clear();
    	redirectAttributes.addAttribute("board_id",board_id);
    	return "ok";
    }
    
    
    
    
    //예시 파일 업로드
    @RequestMapping(value = "/galleryFileUpload", method = RequestMethod.GET)
    String galleryFileUpload() {
    	
    	return "galleryFileUpload";
    }
    
    @RequestMapping(value = "/galleryFileUploads")
    String galleryFile(MultipartHttpServletRequest mtfRequest) {
          MultipartFile mf = mtfRequest.getFile("file");

          String path = uploadPath + File.separator + "imgGalleryUpload"+  File.separator;
          String originFileName = mf.getOriginalFilename(); // 원본 파일 명
          long fileSize = mf.getSize(); // 파일 사이즈


          String safeFile = path + System.currentTimeMillis() + originFileName;
          try {
              mf.transferTo(new File(safeFile));
          } catch (IllegalStateException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          } catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          }

    	return "redirect:/galleryFileUpload";
    }
    
    
    
    
}
