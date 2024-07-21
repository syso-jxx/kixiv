package kr.ddit.kixiv.gallery.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.ddit.kixiv.cmt.vo.CmtVo;
import kr.ddit.kixiv.cmt.vo.GoodBadCntVo;
import kr.ddit.kixiv.gallery.vo.GalleryRentVO;
import kr.ddit.kixiv.gallery.vo.GalleryVO;
import kr.ddit.kixiv.gallery.vo.RentCmtVO;
import kr.ddit.kixiv.gallery.vo.RentVO;

@Mapper
public interface GalleryDao {
	
	public List<Map<String, Object>> list();
	
	public List<Map<String, Object>> getGalleryRentList(Map<String, Object> map);

	//전체 rowcount 가져옴
	public int count(Map<String, Object> map);
	
	public int selectSearchCount(String keyword);

	public Map<String, Object> getRent(Map<String, Object> map);
	
	// 전체 댓글 가져오기
	public List<RentCmtVO> getCmtList(Map<String, Object> map);

	// 모댓글 등록
	public void writeCmtVO(RentCmtVO cmtVO);
 
	// 모댓글 수정
	public void updCmtVO(RentCmtVO cmtVO);
	
	// 모댓글 삭제
	public int delCmtVO(RentCmtVO cmtVO);
	
	// 대댓글 등록
	public void replyWriteCmtVO(RentCmtVO cmtVO);
	
	//대댓글 수정
	public void replyUpdCmtVO(RentCmtVO cmtVO);
	
	// 대댓글 삭제
	public int replyDelCmtVO(RentCmtVO cmtVO);
	
	// 좋아요/싫어요 최초 클릭 시 수행
	public void goodAndBadVO(RentCmtVO cmtVO);
	
	//현재댓글에 대한 좋아요 싫어요 count
	public ArrayList<GoodBadCntVo> gb_list(RentCmtVO cmtVO);

	// 갤러리 대여 글쓰기
	public int writeRent(Map<String, Object> rentMap);
	
	// 갤러리 렌트 결제 인서트
	public int rentReqVO(GalleryRentVO galleryRentVO);
	
	// 갤러리 렌트 결제 업데이트 (상태값 변경)
	public void rentReqStVO(GalleryRentVO galleryRentVO);
	
	// 갤러리 렌트 환불
	public int rentRefundVO(GalleryRentVO galleryRentVO);
	
	// 갤러리 리스트
	public List<GalleryVO> galleryList(String user_id);
	
	// 주소 중복 체크
	public GalleryVO addressCheck(String gallery_add1);
	
	// 갤러리 추가
	public void addGallery(GalleryVO vo);

	// 갤러리 수정
	public void modifyGallery(GalleryVO vo);
	
	// 갤러리 상세
	public GalleryVO myGalleryDetail(String gallery_num);
	
	// 갤러리 삭제
	public void deleteGallery(String gallery_num);
	
	//내 결제내역 리스트
	public List<GalleryRentVO> galleryRentUserList(String user_id);
	
	// 갤러리 회원 갤러리 렌트 작성글 갯수
	public int totalCount(Map<String, Object> map);
	
	// 갤러리 회원 갤러리 렌트 작성글 리스트
	public List<Map<String, Object>> myGalleryRent(Map<String, Object> map);

	// 일반회원 갤러리 렌트 리스트
	public List<Map<String, Object>> getMyRentReqList(Map<String, Object> map);
	
	// 디테일 갤러리 회원정보 가져오기
	public GalleryRentVO oneitemPick(String rent_num);

	// 일반회원 갤러리 렌트 리스트 갯수
	public int getMyRentReqListCnt(Map<String, Object> map);

	public int selectMaxRentSeq();

	public int insertRentPicture(Map<String, Object> fileMap);

	public RentVO getRentVO(int rent_seq);

	public GalleryVO getGalleryVO(int gallery_num);

	public void galleryRentModify(RentVO rentVO);

	public void galleryRentDelete(int rent_seq);

	public void galleryReqRefund(GalleryRentVO galleryRentVO);

	public void rentStatusUpdate(RentVO rentVO);

	public void galleryValidUser();

	public int getGrpCount(int grp);

	public int getCountGB(RentCmtVO cmtVO);

	public int deleteGB(RentCmtVO cmtVO);

	public int delCmtVOComp(RentCmtVO cmtVO);

	public String getStatus(RentCmtVO cmtVO);

	public int delGBFromUser(RentCmtVO cmtVO);

	public String getDelYn(int grp);

	public int getCmtId(RentCmtVO cmtVO);

}
