package kr.ddit.kixiv.cmt.service;

import java.util.ArrayList;

import kr.ddit.kixiv.cmt.vo.CmtVo;

public interface CmtService {

	int pictureWriteReply(CmtVo to);

	ArrayList<CmtVo> picutre_replyList(CmtVo to);

	int pictureWriteReReply(CmtVo to);

	int pictureDeleteReply(CmtVo to);

	int pictureDeleteReReply(CmtVo to);

}
