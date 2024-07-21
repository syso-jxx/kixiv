 package kr.ddit.kixiv.user.service;


import java.util.List;
import java.util.Map;

import kr.ddit.kixiv.user.vo.User;
import kr.ddit.kixiv.utill.Page;

public interface UserService {

	// 로그인
	public boolean login(User user);
	
	// 회원정보 가져오기
	public User item(String user_id);
	
	// 회원가입
	public int signup(User user);

	// 닉네임 중복 체크
	public User getNickname(String nickname);
	
	// 프로필 이미지 업데이트
	public void proifleImgUpdate(User vo);
	
	// 유저 정보 가져오기
	public User getUser(String user_id);
	
	// 회원 정보 수정
	public int modify(User user);

	// 회원 이메일 체크
	public int emailCheck(String email);
	
	// 회원 리스트
	public List<User> userList(Page page);
	
	// 회원 총 명수
	public int totalCount(Page page);
	
	// 비밀번호 찾기(이메일 아이디 일치여부 확인)
	public User findPwd(User user);
	
	// 임시비밀번호로 변경
	public void changeTempPwd(User vo);
	
	// 투자 리스트 총 갯수
	public int investTotalCount(Page page);

	// 투자 리스트
	public List<Map<String, Object>> investList(Page page);
	
	// 펀드 리스트 총 갯수
	public int myFundTotalCount(Page page);
	
	// 펀드 리스트
	public List<Map<String, Object>> myFundList(Page page);
	
	// 갤러리 대관 환불요청 리스트 총 갯수
	public int refundTotalCount();
	
	// 갤러리 대관 환불요청 리스트
	public List<Map<String, Object>> refundList(Page page);
	
	// 갤러리 대관 환불 승인
	public void permissionRefund(Map<String, Object> map);
		
}
