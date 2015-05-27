package com.sds.icto.studyer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.studyer.domain.BoardVo;
import com.sds.icto.studyer.domain.ClassVo;
import com.sds.icto.studyer.repository.BoardDao;
import com.sds.icto.studyer.repository.ClassDao;

@Service
public class BoardService {
	
	@Autowired
	BoardDao boardDao;

	@Autowired
	ClassDao classDao;
	
	public int boardInsert(BoardVo vo, String subject, String teacher, String place, String name){
		
		int class_subject_no = classDao.subjectWrite(subject);
		int class_teacher_no = classDao.teacherWrite(teacher);
		int class_place_no = classDao.placeWrite(place);
		int class_name_no = classDao.nameWrite(name);
		
		
		vo.setClass_subject_no(class_subject_no);
		vo.setClass_teacher_no(class_teacher_no);
		vo.setClass_place_no(class_place_no);
		vo.setClass_name_no(class_name_no);
		
		
		
		int newNo = boardDao.write(vo);
		return newNo;
	}
	
	public BoardVo boardDetail(int no){
		BoardVo vo2 = boardDao.detail(no);
		return vo2;
	}
	
	public ClassVo boardClassDetail(int no){
		ClassVo c_vo = boardDao.detailClass(no);
		return c_vo;
	}
	
}
