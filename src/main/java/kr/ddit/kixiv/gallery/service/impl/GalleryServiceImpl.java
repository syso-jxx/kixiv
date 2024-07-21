package kr.ddit.kixiv.gallery.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.cmt.vo.CmtVo;
import kr.ddit.kixiv.cmt.vo.GoodBadCntVo;
import kr.ddit.kixiv.gallery.mapper.GalleryDao;
import kr.ddit.kixiv.gallery.service.GalleryService;
import kr.ddit.kixiv.gallery.vo.GalleryRentVO;
import kr.ddit.kixiv.gallery.vo.GalleryVO;
import kr.ddit.kixiv.gallery.vo.RentCmtVO;
import kr.ddit.kixiv.gallery.vo.RentVO;

@Service
public class GalleryServiceImpl implements GalleryService {
	@Autowired
	public GalleryDao dao;

	@Override
	public List<Map<String, Object>> getGalleryRentList(Map<String, Object> map) {
		return dao.getGalleryRentList(map);
	}

	@Override
	public int selectCount(Map<String, Object> map) {
		return dao.count(map);
	}
	
	@Override
	public int selectSearchCount(String keyword) {
		return dao.selectSearchCount(keyword);
	}

	@Override
	public Map<String, Object> getRent(Map<String, Object> map) {
		return dao.getRent(map);
	}

	@Override
	public List<RentCmtVO> getCmtList(Map<String, Object> map) {
		List<RentCmtVO> rentCmtVO = dao.getCmtList(map);
		return rentCmtVO;
	}

	@Override
	public void writeCmtVO(RentCmtVO cmtVO) {
	   	 dao.writeCmtVO(cmtVO);
	}
	@Override
	public void updCmtVO(RentCmtVO cmtVO) {
		dao.updCmtVO(cmtVO);
	}
	@Override
	public int delCmtVO(RentCmtVO cmtVO) {
		return dao.delCmtVO(cmtVO);
	}
	@Override
	public void replyWriteCmtVO(RentCmtVO cmtVO) {
		dao.replyWriteCmtVO(cmtVO);
	}

	@Override
	public void replyUpdCmtVO(RentCmtVO cmtVO) {
		dao.replyUpdCmtVO(cmtVO);
	}

	@Override
	public int replyDelCmtVO(RentCmtVO cmtVO) {
		return dao.replyDelCmtVO(cmtVO);
	}
	
	@Override
	public void goodAndBadVO(RentCmtVO cmtVO) {
		dao.goodAndBadVO(cmtVO);
	}
	
	@Override
	public ArrayList<GoodBadCntVo> gb_list(RentCmtVO cmtVO) {
		return dao.gb_list(cmtVO);
	}

	// 갤러리 렌트 결제
	@Override
	public int rentReqVO(GalleryRentVO galleryRentVO) {
		return dao.rentReqVO(galleryRentVO);
	}
	@Override
	public void rentReqStVO(GalleryRentVO galleryRentVO) {
		dao.rentReqStVO(galleryRentVO);
		
	}
	// 갤러리 렌트 환불
	@Override
	public int rentRefundVO(GalleryRentVO galleryRentVO) {
		return dao.rentRefundVO(galleryRentVO);
	}

	@Override
	public List<GalleryVO> galleryList(String user_id) {
		return dao.galleryList(user_id);
	}

	@Override
	public GalleryVO addressCheck(String gallery_add1) {
		return dao.addressCheck(gallery_add1);
	}

	@Override
	public void addGallery(GalleryVO vo) {
		dao.addGallery(vo);
	}

	@Override
	public void modifyGallery(GalleryVO vo) {
		dao.modifyGallery(vo);
	}
	
	@Override
	public GalleryVO myGalleryDetail(String gallery_num) {
		return dao.myGalleryDetail(gallery_num);
	}

	@Override
	public void deleteGallery(String gallery_num) {
		dao.deleteGallery(gallery_num);
	}

	@Override
	public List<GalleryRentVO> galleryRentUserList(String user_id) {
		return dao.galleryRentUserList(user_id);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}

	@Override
	public List<Map<String, Object>> myGalleryRent(Map<String, Object> map) {
		return dao.myGalleryRent(map);
	}

	@Override
	public List<Map<String, Object>> getMyRentReqList(Map<String, Object> map) {
		return dao.getMyRentReqList(map);
	}

	@Override
	public GalleryRentVO oneitemPick(String rent_num) {
		return dao.oneitemPick(rent_num);
	}

	@Override
	public int getMyRentReqListCnt(Map<String, Object> map) {
		return dao.getMyRentReqListCnt(map);
	}

	@Override
	public int selectMaxRentSeq() {
		return dao.selectMaxRentSeq();
	}

	@Override
	public int writeRent(Map<String, Object> rentMap) {
		return dao.writeRent(rentMap);
	}

	@Override
	public int insertRentPicture(Map<String, Object> fileMap) {
		return dao.insertRentPicture(fileMap);
	}

	@Override
	public RentVO getRentVO(int rent_seq) {
		return dao.getRentVO(rent_seq);
	}

	@Override
	public GalleryVO getGalleryVO(int gallery_num) {
		return dao.getGalleryVO(gallery_num);
	}

	@Override
	public void galleryRentModify(RentVO rentVO) {
		dao.galleryRentModify(rentVO);
	}

	@Override
	public void galleryRentDelete(int rent_seq) {
		dao.galleryRentDelete(rent_seq);
	}

	@Override
	public void galleryReqRefund(GalleryRentVO galleryRentVO) {
		dao.galleryReqRefund(galleryRentVO);
	}

	@Override
	public void rentStatusUpdate(RentVO rentVO) {
		dao.rentStatusUpdate(rentVO);
		
	}

	@Override
	public void galleryValidUser() {
		dao.galleryValidUser();
		
	}

	@Override
	public int getGrpCount(int grp) {
		return dao.getGrpCount(grp);
	}

	@Override
	public int getCountGB(RentCmtVO cmtVO) {
		return dao.getCountGB(cmtVO);
	}

	@Override
	public int deleteGB(RentCmtVO cmtVO) {
		return dao.deleteGB(cmtVO);
	}

	@Override
	public int delCmtVOComp(RentCmtVO cmtVO) {
		return dao.delCmtVOComp(cmtVO);
	}

	@Override
	public String getStatus(RentCmtVO cmtVO) {
		return dao.getStatus(cmtVO);
	}

	@Override
	public int delGBFromUser(RentCmtVO cmtVO) {
		return dao.delGBFromUser(cmtVO);
	}

	@Override
	public String getDelYn(int grp) {
		return dao.getDelYn(grp);
	}

	@Override
	public int getCmtId(RentCmtVO cmtVO) {
		return dao.getCmtId(cmtVO);
	}


}
