package spring.project.interpark.member.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import spring.project.interpark.member.dao.MemberDAO;
import spring.project.interpark.member.dto.MemberDTO;
import spring.project.interpark.page.dto.PageDTO;

@Slf4j
@Service
public class MemberService {
			
	@Autowired
	MemberDAO memberDAO;
	
	//페이징처리 후 회원전체 조회
	public List<MemberDTO> memberSelectAll(PageDTO pageDTO) throws Exception {
		return memberDAO.selectAll(pageDTO);
	}
	
	// 전체 회원 수
	public int listCount() throws Exception {
		return memberDAO.listCount();
	}
	
	// 회원 상세
	public MemberDTO memberSelect(String id) {
		log.info("Service에서 id- " + id);
		return memberDAO.select(id);
	}
	
	// 회원 가입
	public void memberInsert(MemberDTO memberDTO) {
		log.info("Service에서 memberDTO- " + memberDTO);
		try {
			memberDAO.insert(memberDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	
	// 회원 수정
	public void memberUpdate(MemberDTO memberDTO) {
		log.info("Service에서 memberDTO- " + memberDTO);
		memberDAO.update(memberDTO);
	}
	
	// 회원 삭제
	public void memberDelete(String id) {
		log.info("Service에서 id- " + id);
		memberDAO.delete(id);
	}
	
	// 로그인
	public int loginChk(MemberDTO memberDTO) throws Exception {
		return memberDAO.loginChk(memberDTO);
	}
	
	// 로그아웃
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
	}
	
	// 아이디 중복검사
	public int idChk(MemberDTO memberDTO) throws Exception {
		log.info("Service에서 memberDTO- " + memberDTO);
		int result = memberDAO.idChk(memberDTO);
		log.info("Service에서 result- " + result);
		return result;
	}
	
	// 아이디 찾기
	public MemberDTO findId(MemberDTO memberDTO) {
		log.info("Service에서 memberDTO- : " + memberDTO);
		return memberDAO.findId(memberDTO);
	}
	
	// 비밀번호 찾기(이메일로 임시 비밀번호 발급)
	public void findPassword(MemberDTO memberDTO) {
		log.info("Service에서 memberDTO- " + memberDTO);
		memberDAO.findPassword(memberDTO);
	}
	
}
