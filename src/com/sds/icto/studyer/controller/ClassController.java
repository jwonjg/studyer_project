package com.sds.icto.studyer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sds.icto.studyer.service.ClassService;

@Controller
@RequestMapping("/class")
public class ClassController {

	@Autowired
	ClassService classService;

	@RequestMapping("/subject")
	@ResponseBody
	public List<String> getSubjectClassList() {
		return classService.getSubjectClassList();
	}
	@RequestMapping("/teacher")
	@ResponseBody
	public List<String> getTeacherClassList() {
		return classService.getTeacherClassList();
	}
	@RequestMapping("/place")
	@ResponseBody
	public List<String> getPlaceClassList() {
		return classService.getPlaceClassList();
	}
	@RequestMapping("/name")
	@ResponseBody
	public List<String> getNameClassList() {
		return classService.getNameClassList();
	}
	
}
