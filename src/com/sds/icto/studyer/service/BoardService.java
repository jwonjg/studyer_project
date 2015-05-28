package com.sds.icto.studyer.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.studyer.controller.MemberController;
import com.sds.icto.studyer.domain.BoardVo;
import com.sds.icto.studyer.domain.ClassVo;
import com.sds.icto.studyer.domain.EditVo;
import com.sds.icto.studyer.repository.BoardDao;
import com.sds.icto.studyer.repository.ClassDao;
import com.sds.icto.studyer.repository.EditDao;

@Service
public class BoardService {

	private static final Log LOG = LogFactory.getLog( MemberController.class );
	
	@Autowired
	BoardDao boardDao;

	@Autowired
	ClassDao classDao;
	
	@Autowired
	EditDao editDao;
	
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
	
	public void boardUpdate(BoardVo vo){
		boardDao.update(vo);
	}
	
	public BoardVo boardDetail(int no){
		BoardVo vo2 = boardDao.detail(no);
		return vo2;
	}
	
	public ClassVo boardClassDetail(int no){
		ClassVo c_vo = boardDao.detailClass(no);
		return c_vo;
	}

	public List<BoardVo> boardClassList(ClassVo vo) {
		int class_subject_no = classDao.subjectSearch(vo.getSubjectName());
		int class_teacher_no = classDao.teacherSearch(vo.getTeacherName());
		int class_place_no = classDao.placeSearch(vo.getPlaceName());
		int class_name_no = classDao.nameSearch(vo.getNameName());
		return boardDao.selectBoardList(class_subject_no, class_teacher_no, class_place_no, class_name_no);
	}

	public void editInsert(EditVo editVo) {
		editDao.insert(editVo);
	}
	
	public void boardDelete(int no){
		boardDao.delete(no);
	}
	
	public void boardLike(int no){
		boardDao.like(no);
	}
}
