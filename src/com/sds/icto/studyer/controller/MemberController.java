package com.sds.icto.studyer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sds.icto.studyer.domain.MemberVo;
import com.sds.icto.studyer.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;

	@RequestMapping("/checkEmail")
	@ResponseBody
	public Object checkEmail(String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(memberService.checkEmail(email)) {
			map.put("result", true );
			map.put("data", "이미 사용 중인 Email입니다." );
		} else  {
			map.put("result", false );
			map.put("data", "Email을 사용할 수 있습니다." );	
		}
		
		return map;
	}
	

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberVo vo) {
		memberService.joinUser(vo);
		return "redirect:/index";
	}

	@RequestMapping(value = "/signIn")
	@ResponseBody
	public Object login(String email, String password,  HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberVo memberVo = memberService.authUser(email, password);
		
		if (memberService.authUser(email, password) == null) {
			map.put("result","fail");
		}else {
			map.put("result","success");
			session.setAttribute("authUser",memberVo);
		}
		return map;
	}
	
	@RequestMapping(value = "/userinfo", method = RequestMethod.POST)
	public String update(@ModelAttribute MemberVo vo, HttpSession session) {
		memberService.UpdateUinfo(vo);
		MemberVo memberVo = memberService.authUser(vo.getEmail(), vo.getPassword());
		session.setAttribute("authUser", memberVo);
		return "redirect:/index";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.removeAttribute("authUser");
		session.invalidate();

		return "redirect:/index";
	}

}
