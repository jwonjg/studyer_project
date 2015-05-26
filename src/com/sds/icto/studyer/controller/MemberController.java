package com.sds.icto.studyer.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sds.icto.studyer.domain.MemberVo;
import com.sds.icto.studyer.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;

	/*@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUpForm() {
		return "/member/signUpform";
	}*/

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberVo vo) {
		memberService.joinUser(vo);
		return "redirect:/index";
	}

/*	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String loginForm() {
		return "/member/signInform";
	}*/

	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberVo vo, HttpSession session) {
		
		MemberVo memberVo = memberService.authUser(vo);

		// 로그인 실패
		if (memberVo == null) {
			return "redirect:/member/login?result=fail";
		}

		// 로그인 성공
		session.setAttribute("authUser", memberVo);

		return "redirect:/index";
	}

	/*@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.removeAttribute("authUser");
		session.invalidate();

		return "redirect:/index";
	}*/

	/*@RequestMapping("/uinfo")
	public String uinfo(HttpSession session) {
		return "/member/memberinfo";
	}*/
}
