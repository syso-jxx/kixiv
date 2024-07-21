package kr.ddit.kixiv.chart.service;

import java.util.List;


public interface ChartService {

	//가입현황 날짜로 조회
	List<String> chartCountDate();
	
	//일반 사람 수
	List<String> chartCountPeple();
	
	//갤러리 사람수
	List<String> chartCountGPeple();
	
	//펀딩날짜 개수
	List<String> chartFundCountData();
	
	//해당 날짜의 펀딩 글수
	List<String> chartFundCountCnt();
	
	//태그 리스트 가져오기
	List<String> chartTag();
	
	//태그별 선호도 갯수
	List<String> tCntlist();
	
	//태그 top5 리스트가져오기
	List<String> taglistRankList();
	
	//태그 top5 랭크 가져오기
	List<String> tCntRankList();
	
	//유저 top5 리스트 가져오기
	List<String> userRankList();
	
	//유저 top5 랭크 가져오기
	List<String> userRankCntList();
	
	//새내기 (현재날짜로부터 6개월 전) top5 랭크 리스트
	List<String> newUserRankList();

	//새내기 (현재날짜로부터 6개월 전)유저 top5  리스트
	List<String> newUserRank();
}
