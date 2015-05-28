package com.sds.icto.studyer.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sds.icto.studyer.service.ClassService;

@Controller
@RequestMapping("/class")
public class ClassController {

	private static final Log LOG = LogFactory.getLog( MemberController.class );
	
	@Autowired
	ClassService classService;

	@RequestMapping("/subjectName")
	@ResponseBody
	public List<String> getSubjectClassList() {
		return classService.getSubjectClassList();
	}
	@RequestMapping("/teacherName")
	@ResponseBody
	public List<String> getTeacherClassList() {
		return classService.getTeacherClassList();
	}
	@RequestMapping("/placeName")
	@ResponseBody
	public List<String> getPlaceClassList() {
		return classService.getPlaceClassList();
	}
	@RequestMapping("/nameName")
	@ResponseBody
	public List<String> getNameClassList() {
		return classService.getNameClassList();
	}
	
}
