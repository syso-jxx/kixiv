package kr.ddit.kixiv.picture.service;

import java.util.ArrayList;
import java.util.List;

import kr.ddit.kixiv.picboard.vo.Picboard;
import kr.ddit.kixiv.picture.vo.PicCriteria;
import kr.ddit.kixiv.picture.vo.PicPage;
import kr.ddit.kixiv.picture.vo.Picture;
import kr.ddit.kixiv.picture.vo.SearchVO;


public interface PictureService {


	public void fileupdate(Picture pic);

	public List<Picture> list();

	public List<Picture> picSearch(int boradid);

	public List<Picture> viewList();

	public List<Picture> userPic(PicPage page);

	public int listCount(int board_id);

	public Picture OneSearch(int pic_num);
	
	//main 페이지 최신그림 불러오기
	public List<Picture> newsImg();

	public List<Picture> veryLikeImg();

	public List<Picture> followImg(String user_id);

	public List<Picture> myImgs(String user_id);
	
	public List<Picture> hashTag(String tag_id);

	// 게시글 사진 갯수
	int totalCount(int board_id);
	
	// 데이터의 전체 갯수를 가져온다.
	public int getListCnt(SearchVO param);
	
	// 페이징처리한 리스트 불러오기
	public List<Picture> getList(SearchVO param);

	// 좋아요수가 많은 그림 리스트 불러오기 
	public List<Picture> veryLikeImgs(SearchVO param);
	
	// 팔로우한 사람의 사진 갯수
	public int getFollowListCnt(SearchVO param);
	
	// 내 사진 갯수
	public int getMyListCnt(SearchVO param);
	
	// 필로우 한 그림 리스트 불러오기
	public List<Picture> followImgs(SearchVO param);
	
	//글 수정용 그림 리스트 가져오기
	public List<Picture> getPicture(int board_id);

	public void deleteChangeImg(String pic_num);

	public void deletePicture(int board_id);

	public ArrayList<Picture> newTopImg();

	public List<Picture> recomImg(String user_id);
	//추천사진 전체 수
	public int getRecomListCnt(SearchVO param);

	public List<Picture> RecomImgs(SearchVO param);

	
}
