package com.sds.icto.studyer.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	private static final Log LOG = LogFactory.getLog( MemberController.class );
	
	@RequestMapping({"", "/index"})
	public String index(){
		return "main/index";
	}
}
