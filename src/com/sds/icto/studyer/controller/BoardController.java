package com.sds.icto.studyer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping({"", "/write"})
	public String index(){
		return "board/write";
	}
}
