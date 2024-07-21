package kr.ddit.kixiv.report.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ddit.kixiv.report.vo.ReportVo;
import kr.ddit.kixiv.utill.Page;

@Mapper
public interface ReportDao {

	int totalCount(Page page);

	List<ReportVo> reportList(Page page);

	void Reportadd(ReportVo reportVo);

	ReportVo detailItem(int report_id);

	void updateReport(ReportVo report);

}
