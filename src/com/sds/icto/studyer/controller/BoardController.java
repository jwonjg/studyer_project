package com.sds.icto.studyer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sds.icto.studyer.domain.BoardVo;
import com.sds.icto.studyer.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;

	@RequestMapping(value={"", "/write"}, method=RequestMethod.GET)
	public String index(){
		return "board/write";
	}
	

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(@ModelAttribute BoardVo vo, @RequestParam String subject, 
			@RequestParam String teacher, @RequestParam String place, @RequestParam String name){
/*		
		int class_subject_no = boardService.subjectInsert(subject);
		int class_teacher_no = boardService.teacherInsert(teacher);
		int class_place_no = boardService.placeInsert(place);
		int class_name_no = boardService.nameInsert(name);
		
		
		vo.setClass_subject_no(class_subject_no);
		vo.setClass_teacher_no(class_teacher_no);
		vo.setClass_place_no(class_place_no);
		vo.setClass_name_no(class_name_no);*/
		
		boardService.boardInsert(vo, subject, teacher, place, name);
		
				
		return "board/list";
	}
	
	@RequestMapping(value="/detail")
	public String detail(){
		return "board/detail";
	}
	
}
