package kr.ddit.kixiv.picture.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.picboard.vo.Picboard;
import kr.ddit.kixiv.picture.mapper.PictureDao;
import kr.ddit.kixiv.picture.service.PictureService;
import kr.ddit.kixiv.picture.vo.PicCriteria;
import kr.ddit.kixiv.picture.vo.PicPage;
import kr.ddit.kixiv.picture.vo.Picture;
import kr.ddit.kixiv.picture.vo.SearchVO;

@Service
public class PictureServiceImpl implements PictureService {
	@Autowired
	public PictureDao dao;
	
	@Override
	public void fileupdate(Picture pic) {
		dao.fileupdate(pic);
		
	}

	@Override
	public List<Picture> list() {
		return dao.list();
		
	}

	@Override
	public List<Picture> picSearch(int boradid) {
		return dao.picSearch(boradid);
	}

	@Override
	public List<Picture> viewList() {
		return dao.picList();
	}

	@Override
	public List<Picture> userPic(PicPage page) {
		return dao.userPic(page);
	}

	@Override
	public int listCount(int board_id) {
		return dao.listCount(board_id);
	}

	@Override
	public Picture OneSearch(int pic_num) {
		return dao.OneSearch(pic_num) ;
	}

	@Override
	public List<Picture> newsImg() {
		return dao.newsImg();
	}

	@Override
	public List<Picture> veryLikeImg() {
		return dao.veryLikeImg();
	}

	@Override
	public List<Picture> followImg(String user_id) {
		return dao.followImg(user_id);
	}

	@Override
	public List<Picture> hashTag(String tag_id) {
		return dao.hashTag(tag_id);
	}

	@Override
	public int totalCount(int board_id) {
		return dao.totalCount(board_id);
	}

	@Override
	public int getListCnt(SearchVO param) {
		return dao.getListCnt(param);
	}

	@Override
	public List<Picture> getList(SearchVO param) {
		return dao.getList(param);
	}

	@Override
	public List<Picture> veryLikeImgs(SearchVO param) {
		return dao.veryLikeImgs(param);
	}

	@Override
	public int getFollowListCnt(SearchVO param) {
		return dao.getFollowListCnt(param);
	}

	@Override
	public int getMyListCnt(SearchVO param) {
		return dao.getMyListCnt(param);
	}

	@Override
	public List<Picture> myImgs(String user_id) {
		return dao.myImgs(user_id);
	}

	@Override
	public List<Picture> followImgs(SearchVO param) {
		return dao.followImgs(param);
	}

	@Override
	public List<Picture> getPicture(int board_id) {
		return dao.getPicture(board_id);
	}

	@Override
	public void deleteChangeImg(String pic_num) {
		dao.deleteChangeImg(pic_num);
	}

	@Override
	public void deletePicture(int board_id) {
		dao.deletePicture(board_id);
	}

	@Override
	public ArrayList<Picture> newTopImg() {
		return dao.newTopImg();
	}

	@Override
	public List<Picture> recomImg(String user_id) {
		return dao.recomImg(user_id);
	}

	@Override
	public int getRecomListCnt(SearchVO param) {
		return dao.getRecomListCnt(param);
	}

	@Override
	public List<Picture> RecomImgs(SearchVO param) {
		return dao.RecomImgs(param);
	}

}
