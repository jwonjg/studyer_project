package com.sds.icto.studyer.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.studyer.domain.BoardVo;
import com.sds.icto.studyer.domain.ClassVo;
import com.sds.icto.studyer.domain.MemberVo;

@Repository
public class BoardDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public int write(BoardVo vo) {	
		int no = -1;
		no = (int)sqlMapClientTemplate.insert("board.insert", vo);
		
		return no;
	}
	
	public BoardVo detail(int no) {
		
		BoardVo vo2 = (BoardVo) sqlMapClientTemplate.queryForObject("board.detail", no);
		
		return vo2;

	}
	
	public ClassVo detailClass(int no){
		
		BoardVo vo2 = (BoardVo) sqlMapClientTemplate.queryForObject("board.detail", no);
		
		String subjectName = (String)sqlMapClientTemplate.queryForObject(
				"board.subjectDetail", vo2.getClass_subject_no());
		String teacherName = (String)sqlMapClientTemplate.queryForObject(
				"board.teacherDetail", vo2.getClass_teacher_no());
		String placeName = (String)sqlMapClientTemplate.queryForObject(
				"board.placeDetail", vo2.getClass_place_no());
		String nameName = (String)sqlMapClientTemplate.queryForObject(
				"board.nameDetail", vo2.getClass_name_no());
		ClassVo c_vo = new ClassVo();
		c_vo.setSubjectName(subjectName);
		c_vo.setTeacherName(teacherName);
		c_vo.setPlaceName(placeName);
		c_vo.setNameName(nameName);
				
		return c_vo;
	}
	
	

}
