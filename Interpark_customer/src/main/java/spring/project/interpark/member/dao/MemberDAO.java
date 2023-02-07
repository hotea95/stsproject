package spring.project.interpark.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import spring.project.interpark.member.dto.MemberDTO;
import spring.project.interpark.page.dto.PageDTO;

@Repository
@EnableAspectJAutoProxy(proxyTargetClass = true)
@Slf4j

public class MemberDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 페이징처리 후 회원 전체 조회
	public List<MemberDTO> selectAll(PageDTO pageDTO) throws Exception {
		return sqlSessionTemplate.selectList("selectAll", pageDTO);
	}
	public int listCount() throws Exception {
		return sqlSessionTemplate.selectOne("listCount");
	}
	
	// 회원 상세
	public MemberDTO select(String id) {
		log.info("DAO에서 id- " + id);
		return sqlSessionTemplate.selectOne("select", id);
	}
	
	@Transactional
	// 회원 가입
	public void insert(MemberDTO memberDTO) {
		log.info("DAO에서 memberDTO- " + memberDTO);
		sqlSessionTemplate.insert("insert", memberDTO);
	}
	
	// 회원 수정
	public void update(MemberDTO memberDTO) {
		log.info("DAO에서 memberDTO- " + memberDTO);
		sqlSessionTemplate.update("update", memberDTO);
	}
	
	// 회원 삭제
	public void delete(String id) {
		log.info("DAO에서 id- " + id);
		sqlSessionTemplate.delete("delete", id);
	}
	
	// 로그인
	public int loginChk(MemberDTO memberDTO) throws Exception {
		return sqlSessionTemplate.selectOne("loginChk", memberDTO);
	}
	
	// 아이디 중복검사
	public int idChk(MemberDTO memberDTO) throws Exception {
		int result = sqlSessionTemplate.selectOne("idChk", memberDTO);
		log.info("DAO에서 result- " + result);
		log.info("DAO에서 memberDTO-" + memberDTO);
		return result;
	}
	
	// 아이디 찾기
	public MemberDTO findId(MemberDTO memberDTO) {
		log.info("DAO에서 memberDTO- " + memberDTO);
		return sqlSessionTemplate.selectOne("findId", memberDTO);
	}
	
	// 비밀번호 찾기(이메일로 임시 비밀번호 전송)
	public void findPassword(MemberDTO memberDTO) {
		log.info("DAO에서 memberDTO- " + memberDTO);
		sqlSessionTemplate.update("findPassword", memberDTO);
	}
	
	
	
	
}
