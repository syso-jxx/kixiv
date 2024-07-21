package kr.ddit.kixiv.picture.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.ddit.kixiv.picboard.vo.Picboard;
import kr.ddit.kixiv.picture.vo.PicCriteria;
import kr.ddit.kixiv.picture.vo.PicPage;
import kr.ddit.kixiv.picture.vo.Picture;
import kr.ddit.kixiv.picture.vo.SearchVO;

@Mapper
public interface PictureDao {
	
	public void fileupdate(Picture pic);

	public List<Picture> list();

	public List<Picture> picSearch(int boradid);

	public List<Picture> picList();

	public List<Picture> userPic(PicPage page);

	public int listCount(int board_id);

	public Picture OneSearch(int pic_num);

	public List<Picture> newsImg();

	public List<Picture> veryLikeImg();

	public List<Picture> followImg(String user_id);

	public List<Picture> myImgs(String user_id);

	public List<Picture> hashTag(String tag_id);

	int totalCount(int board_id);

	public int getListCnt(SearchVO param);

	public List<Picture> getList(SearchVO param);

	public List<Picture> veryLikeImgs(SearchVO param);

	public int getFollowListCnt(SearchVO param);

	public int getMyListCnt(SearchVO param);

	public List<Picture> followImgs(SearchVO param);

	public List<Picture> getPicture(int board_id);

	public void deleteChangeImg(String pic_num);

	public void deletePicture(int board_id);

	public ArrayList<Picture> newTopImg();

	public List<Picture> recomImg(String user_id);

	public int getRecomListCnt(SearchVO param);

	public List<Picture> RecomImgs(SearchVO param);


}
