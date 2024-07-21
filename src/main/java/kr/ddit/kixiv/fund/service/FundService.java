package kr.ddit.kixiv.fund.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import kr.ddit.kixiv.fund.vo.FundCodeVO;
import kr.ddit.kixiv.fund.vo.FundPicVO;
import kr.ddit.kixiv.fund.vo.FundVO;
import kr.ddit.kixiv.user.vo.User;

public interface FundService {
	public List<Map<String, Object>> getFundList(Map<String, Object> map);
	public List<Map<String, Object>> getFundBanner();
	public int getFundTotal(Map<String, Object> map);

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
