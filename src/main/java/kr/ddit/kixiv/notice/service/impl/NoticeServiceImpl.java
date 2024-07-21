package kr.ddit.kixiv.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ddit.kixiv.notice.mapper.NoticeDao;
import kr.ddit.kixiv.notice.service.NoticeService;
import kr.ddit.kixiv.notice.vo.NoticeVO;
import kr.ddit.kixiv.utill.Page;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;
	
	@Override
	public List<NoticeVO> noticeList(Page page) {
		return dao.noticeList(page);
	}

	@Override
	public int totalCount(Page page) {
		return dao.totalCount(page);
	}

	@Override
	public void addHit(String notice_id) {
		dao.addHit(notice_id);
	}

	@Override
	public NoticeVO getNotice(String notice_id) {
		return dao.getNotice(notice_id);
	}

	@Override
	public int write(NoticeVO vo) {
		return dao.write(vo);
	}

	@Override
	public void delete(NoticeVO vo) {
		dao.delete(vo);
	}

	@Override
	public void modify(NoticeVO vo) {
		dao.modify(vo);
	}
	

}
