package kr.ddit.kixiv.chart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.chart.mapper.ChartMapper;
import kr.ddit.kixiv.chart.vo.Deta;

@Service
public class ChartServiceImpl implements ChartService {
	
	@Autowired
	ChartMapper dao;
	//연 가입자 수
	@Override
	public List<String> chartCountDate() {
		return dao.chartCountDate();
	}

	@Override
	public List<String> chartCountPeple() {
		return dao.chartCountPeple();
	}

	@Override
	public List<String> chartCountGPeple() {
		return dao.chartCountGPeple();
	}
	
	//연 펀딩 글 작성률
	@Override
	public List<String> chartFundCountData() {
		return dao.chartFundCountData();
	}

	@Override
	public List<String> chartFundCountCnt() {
		return dao.chartFundCountCnt();
	}

	@Override
	public List<String> chartTag() {
		return dao.chartTag();
	}

	@Override
	public List<String> tCntlist() {
		return dao.tCntlist();
	}

	@Override
	public List<String> taglistRankList() {
		return dao.taglistRankList();
	}

	@Override
	public List<String> tCntRankList() {
		return dao.tCntRankList();
	}

	@Override
	public List<String> userRankList() {
		return dao.userRankList();
	}

	@Override
	public List<String> userRankCntList() {
		return dao.userRankCntList();
	}

	@Override
	public List<String> newUserRankList() {
		return dao.newUserRankList();
	}
	
	@Override
	public List<String> newUserRank() {
		return dao.newUserRank();
	}






}
