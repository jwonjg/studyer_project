package com.sds.icto.studyer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sds.icto.studyer.domain.BoardVo;
import com.sds.icto.studyer.domain.MemberVo;
import com.sds.icto.studyer.repository.BoardDao;
import com.sds.icto.studyer.repository.ClassDao;

@Service
public class ClassService {
	
	@Autowired
	ClassDao classDao;

	public List<String> getSubjectClassList() {
		return classDao.selectSubjectClassList();
	}
	public List<String> getTeacherClassList() {
		return classDao.selectTeacherClassList();
	}
	public List<String> getPlaceClassList() {
		return classDao.selectPlaceClassList();
	}
	public List<String> getNameClassList() {
		return classDao.selectNameClassList();
	}
	
//	public int boardInsert(BoardVo vo, String subject, String teacher, String place, String name){
//		
//		int class_subject_no = classDao.subjectWrite(subject);
//		int class_teacher_no = classDao.teacherWrite(teacher);
//		int class_place_no = classDao.placeWrite(place);
//		int class_name_no = classDao.nameWrite(name);
//		
//		
//		vo.setClass_subject_no(class_subject_no);
//		vo.setClass_teacher_no(class_teacher_no);
//		vo.setClass_place_no(class_place_no);
//		vo.setClass_name_no(class_name_no);
//		
//		
//		
//		int newNo = c.write(vo);
//		return newNo;
//	}
}