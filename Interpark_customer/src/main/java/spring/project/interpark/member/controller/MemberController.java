package spring.project.interpark.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import spring.project.interpark.member.dto.MemberDTO;
import spring.project.interpark.member.service.MemberService;
import spring.project.interpark.page.dto.PageDTO;
import spring.project.interpark.page.dto.PageMakerDTO;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private LoginController loginController;
	@Autowired
	private IdfindController idfindController;
	@Autowired
	private EmailController emailController;
	
	// 페이징처리 후 젠체조회
	@RequestMapping(value = "/MemberSelect", method = RequestMethod.GET)
	public String list(Model model, PageDTO pageDTO) throws Exception {
		model.addAttribute("list", memberService.memberSelectAll(pageDTO));
		PageMakerDTO pageMakerDTO = new PageMakerDTO();
		pageMakerDTO.setPageDTO(pageDTO);
		pageMakerDTO.setTotalCount(memberService.listCount());
		model.addAttribute("pageMakerDTO", pageMakerDTO);
		return "./interpark/member/member_select_all_view";
	}
	
	// 회원 상세 보기
	@RequestMapping(value = "/MemberSelectDetail", method = RequestMethod.GET)
	public String detail(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberDTO", memberService.memberSelect(memberDTO.getId()));
		log.info("Controller에서 model- " + model);
		return "./interpark/member/member_select_detail_view";
	}

	// 회원 가입 페이지 이동
	@RequestMapping(value = "/MemberInsert", method = RequestMethod.GET)
	public String insert() {
		return "./interpark/member/member_insert";
	}
	
	// 회원 가입 확인
	@RequestMapping(value = "/MemberInsert", method = RequestMethod.POST)
	public String insert(@Valid MemberDTO memberDTO, PageDTO pageDTO, Model model) throws Exception {
		int result;
			result = memberService.idChk(memberDTO);
			log.info("Controller에서 result- " + result);
			model.addAttribute("list", memberService.memberSelectAll(pageDTO));
			memberService.memberInsert(memberDTO);
		return "./interpark/member/member_insert_view";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/MemberidChk", method = RequestMethod.POST)
	// 비동기식 데이터 전송
		@ResponseBody
	public String idChk(MemberDTO memberDTO) throws Exception {
		int result = memberService.idChk(memberDTO);
		if(result > 0) {
			log.info("N: " + result);
			return "N";
		} else if (result == 0) {
			log.info("Y: " + result);
			return "Y";
		} else {
			return "./interpark/member/member_insert";
		}
	}
	
	//회원 업데이트 페이지 이동
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.GET)
	public String update(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberDTO", memberService.memberSelect(memberDTO.getId()));
		log.info("Controller에서 model- " + model);
		return "./interpark/member/member_update";
	}
	
	// 회원 업데이트 확인
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.POST)
	public String update(MemberDTO memberDTO) {
		memberService.memberUpdate(memberDTO);
		log.info("Controller에서 memberDTO- " + memberDTO);
		return "./interpark/member/member_update_view";
	}
	
	// 회원 삭제
	@RequestMapping(value = "/MemberDelete", method = RequestMethod.GET)
	public String delete(MemberDTO memberDTO, HttpServletRequest request) {
		String id = request.getParameter("id");
		log.info("Controller에서 id" + id);
		return "./interpark/member/member_delete";
	}
		
	// 회원 삭제 확인
	@RequestMapping(value = "/MemberDeleteCheck", method = RequestMethod.GET)
	public String delete(MemberDTO memberDTO) {
		log.info("Controller에서 memberDTO- " + memberDTO);
		memberService.memberDelete(memberDTO.getId());
		log.info("Controller에서 memberDTO.getID()- " + memberDTO.getId());
		return "./interpark/member/member_delete_view";
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "/MemberLogin", method = RequestMethod.GET)
	public String login() {
		return "./interpark/member/member_login";
	}
	
	// 로그인 확인
	@RequestMapping(value = "/MemberLogin", method = RequestMethod.POST)
	public String loginChk(@RequestParam("id") String id,@RequestParam("password") String password,
			Model model, HttpSession session, MemberDTO memberDTO) throws Exception {
		loginController.loginChk(id, password, model, session, memberDTO);
		return "./interpark/member/member_login_view";
	}
	
	// 로그아웃
	@RequestMapping(value = "/MemberLogout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "./interpark/member/member_logout_view";
	}
	
	// 아이디 찾기 페이지 이동
	@RequestMapping(value = "/MemberfindId", method = RequestMethod.GET)
	public String findId() {
		return "./interpark/member/member_find_id";
	}
	
	// 아이디 찾기 실행
	@RequestMapping(value="/MemberfindId", method=RequestMethod.POST)
	public String findId(MemberDTO memberDTO, Model model) {
		idfindController.findid(memberDTO, model);
		return "./interpark/member/member_find_id_view";
	}
	
	// 비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/MemberfindPassword", method = RequestMethod.GET)
	public String findPassword() {
		return "./interpark/member/member_find_password";
	}
	
	// 비밀번호 찾기(이메일로 임시 비밀번호 전송)
	@RequestMapping(value = "/MemberfindPassword", method = RequestMethod.POST)
	public  String findPassword(Model model, HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO) throws Exception {
		emailController.findPassword(model, request, response, memberDTO);
		return "./interpark/member/member_find_password_view";
	}
}
