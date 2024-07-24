package kr.ddit.kixiv.fund.service.impl;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.ddit.kixiv.fund.mapper.FundDao;
import kr.ddit.kixiv.fund.service.FundService;
import kr.ddit.kixiv.fund.vo.FundCodeVO;
import kr.ddit.kixiv.fund.vo.FundPicVO;
import kr.ddit.kixiv.fund.vo.FundVO;
import kr.ddit.kixiv.user.vo.User;

@Service
public class FundServiceImpl implements FundService {
	@Autowired
	FundDao dao;

	@Override
	public List<Map<String, Object>> getFundList(Map<String, Object> map) {
		return dao.selectList(map);
	}
	
	@Override
	public List<Map<String, Object>> getFundBanner() {
		return dao.getFundBanner();
	}
	
	@Override
	public int getFundTotal(Map<String, Object> map) {
		return dao.getFundTotal(map);
	}

	@Override
	public List<FundCodeVO> selectCodeList() {
		return dao.selectCodeList();
	}
	
	@Override
	public FundVO selectFundVO(Map<String, Object> map) {
		return dao.selectFundVO(map);
	}

	@Override
	public List<Map<String, Object>> selectFundPicList(Map<String, Object> map) {
		return dao.selectFundPicList(map);
	}

	@Override
	public int selectMaxFundId() {
		return dao.selectMaxFundId();
	}

	@Override
	public int insertFund(Map<String, Object> fundMap) {
		return dao.insertFund(fundMap);
	}

	@Override
	public int insertFundPicture(Map<String, Object> fileMap) {
		return dao.insertFundPicture(fileMap);
	}

	@Override
	public int deleteFund(String fundId) {
		return dao.deleteFund(fundId);
	}

	@Override
	public int deleteFundPic(String fundId) {
		return dao.deleteFundPic(fundId);
	}
	
	@Override
	public int deleteFundPicSeq(Map<String, Object> picseq) {
		return dao.deleteFundPicSeq(picseq);
	}
	
	@Override
	public List<Map<String, Object>> getPicseq(String fundId) {
		return dao.getPicseq(fundId);
	}

	@Override
	public int updateFund(Map<String, Object> fundMap) {
		return dao.updateFund(fundMap);
	}

	@Override
	public User selectFundUser(Map<String, Object> map) {
		return dao.selectFundUser(map);
	}

	@Override
	public int insertInvestor(Map<String, Object> map) {
		return dao.insertInvestor(map);
	}

	@Override
	public Map<String, Object> selectInvestor(Map<String, Object> map) {
		Map<String, Object> result = dao.selectInvestor(map);
		if(result != null) {
			return result;
		}
		
		return Collections.EMPTY_MAP;
	}

}