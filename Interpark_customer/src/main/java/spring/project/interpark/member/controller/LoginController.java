package spring.project.interpark.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import spring.project.interpark.member.dto.MemberDTO;
import spring.project.interpark.member.service.MemberService;

@Slf4j
@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;
	
	public String loginChk(@RequestParam("id") String id,@RequestParam("password") String password,
			Model model, HttpSession session, MemberDTO memberDTO) throws Exception {
		memberDTO.setId(id);
		memberDTO.setPassword(password);
		memberDTO.getMname();
		log.info("LoginController에서 memberDTO.getMname()- " + memberDTO.getMname());
		int result = memberService.loginChk(memberDTO);
		
		if (result == 1) {
			log.info("======로그인 성공======");
			session.setAttribute("id", memberDTO.getId());
			model.addAttribute("mname", memberService.memberSelect(id).getMname());
			log.info("LoginController에서 memberService.memberSelect(id).getMname()- " + memberService.memberSelect(id).getMname());
			session.setAttribute("mname", memberService.memberSelect(id).getMname());
			model.addAttribute("result", result);
			log.info("LoginController에서 result- " + result);
			model.addAttribute("memberDTO", memberDTO);
			log.info("LoginController에서 memberDTO- " + memberDTO);
			log.info("LoginController에서 model- " + model);
		} else {
			log.info("======로그인 실패======");
			model.addAttribute("result", result);
		}
		return null;
	}	
}