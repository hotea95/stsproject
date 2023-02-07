package spring.project.interpark.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import spring.project.interpark.member.dto.MemberDTO;
import spring.project.interpark.member.service.MemberService;

@Slf4j
@Controller

public class IdfindController {
	@Autowired
	private MemberService memberService;
	
	public String findid(MemberDTO memberDTO, Model model) {
		if (memberDTO == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("id", memberService.findId(memberDTO));
			log.info("아이디: " + memberService.findId(memberDTO));
		}
		return null;
	}
}
