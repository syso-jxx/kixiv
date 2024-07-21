package kr.ddit.kixiv.report.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.report.mapper.ReportDao;
import kr.ddit.kixiv.report.service.ReportService;
import kr.ddit.kixiv.report.vo.ReportVo;
import kr.ddit.kixiv.utill.Page;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportDao dao;
	
	@Override
	public int totalCount(Page page) {
		return dao.totalCount(page) ;
	}

	@Override
	public List<ReportVo> reportList(Page page) {
		return dao.reportList(page);
	}

	@Override
	public void Reportadd(ReportVo reportVo) {
		dao.Reportadd(reportVo);
	}

	@Override
	public ReportVo detailItem(int report_id) {
		return dao.detailItem(report_id);
	}

	@Override
	public void updateReport(ReportVo report) {
		dao.updateReport(report);
	}

}
