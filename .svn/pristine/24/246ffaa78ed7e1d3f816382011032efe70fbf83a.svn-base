package kr.ddit.kixiv.fund.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.servlet.ModelAndView;

import kr.ddit.kixiv.fund.vo.FundCodeVO;
import kr.ddit.kixiv.fund.vo.FundPicVO;
import kr.ddit.kixiv.fund.vo.FundVO;
import kr.ddit.kixiv.user.vo.User;


@Mapper
public interface FundDao {

	//funding 출력용 메서드
	public List<Map<String, Object>> selectAll(Map<String, Object> map);
	public List<Map<String, Object>> selectList_coming(Map<String, Object> map);
	public List<Map<String, Object>> selectList(Map<String, Object> map);
	public List<Map<String, Object>> selectList_end(Map<String, Object> map);
	
	public List<Map<String, Object>> getFundBanner();
	public int getFundTotal(Map<String, Object> map);
	public int getFundTotalNoKeyword(Map<String, Object> map);
	
	public List<FundCodeVO> selectCodeList();

	public FundVO selectFundVO(Map<String, Object> map);

	public List<Map<String, Object>> selectFundPicList(Map<String, Object> map);
	
	public int selectMaxFundId();
	
	public int insertFund(Map<String, Object> fundMap);
	
	public int insertFundPicture(Map<String, Object> fileMap);
	
	public int deleteFund(String fundId);
	
	public int deleteFundPic(String fundId);
	public int deleteFundPicSeq(Map<String, Object> picseq);
	
	public List<Map<String, Object>> getPicseq(String fundId);
	
	public int updateFund(Map<String, Object> fundMap);
	
	public User selectFundUser(Map<String, Object> map);
	
	public int insertInvestor(Map<String, Object> map);
	
	public Map<String, Object> selectInvestor(Map<String, Object> map);
	
	
	
}
