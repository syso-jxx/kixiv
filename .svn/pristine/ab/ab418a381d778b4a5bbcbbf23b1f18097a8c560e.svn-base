package kr.ddit.kixiv.report.service;

import java.util.List;

import kr.ddit.kixiv.report.vo.ReportVo;
import kr.ddit.kixiv.utill.Page;

public interface ReportService {
	
	//게시물 총 갯수
	public int totalCount(Page page);

	//게시물 목록 + 페이징 + 검색
	public List<ReportVo> reportList(Page page);

	public void Reportadd(ReportVo reportVo);

	public ReportVo detailItem(int report_id);

	public void updateReport(ReportVo report);
	
	
}
