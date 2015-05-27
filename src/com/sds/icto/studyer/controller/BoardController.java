package com.sds.icto.studyer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping(value={"", "/write"}, method=RequestMethod.GET)
	public String index(){
		return "board/write";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(){
		return "board/list";
	}
	
	@RequestMapping(value="/detail")
	public String detail(){
		return "board/detail";
	}
	
}
