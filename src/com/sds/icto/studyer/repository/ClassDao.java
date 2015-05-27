package com.sds.icto.studyer.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ClassDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public int subjectWrite(String subject) {

		int class_subject_no = 0;

		System.out.println(subject);
		if (sqlMapClientTemplate.queryForObject("class.subjectFind", subject) == null) {
			sqlMapClientTemplate.insert("class.subjectInsert", subject);
			class_subject_no = (int)sqlMapClientTemplate.queryForObject("class.subjectFind", subject) ;
		} else {
			class_subject_no = (int) sqlMapClientTemplate.queryForObject("class.subjectFind", subject);
		}
		return class_subject_no;

	}

	public int teacherWrite(String teacher) {

		int class_teacher_no = 0;
		if (sqlMapClientTemplate.queryForObject("class.teacherFind", teacher) == null) {
			sqlMapClientTemplate.insert("class.teacherInsert", teacher);
			class_teacher_no = (int)sqlMapClientTemplate.queryForObject("class.teacherFind", teacher) ;
		} else {
			class_teacher_no = (int) sqlMapClientTemplate.queryForObject("class.teacherFind", teacher);
		}
		return class_teacher_no;
	}

	public int placeWrite(String place) {

		int class_place_no = 0;
		if (sqlMapClientTemplate.queryForObject("class.placeFind", place) == null) {
			sqlMapClientTemplate.insert("class.placeInsert", place);
			class_place_no = (int)sqlMapClientTemplate.queryForObject("class.placeFind", place) ;
		} else {
			class_place_no = (int) sqlMapClientTemplate.queryForObject("class.placeFind", place);
		}
		return class_place_no;
	}

	public int nameWrite(String name) {

		int class_name_no = 0;
		if (sqlMapClientTemplate.queryForObject("class.nameFind", name) == null) {
			sqlMapClientTemplate.insert("class.nameInsert", name);
			class_name_no = (int)sqlMapClientTemplate.queryForObject("class.nameFind", name) ;
		} else {
			class_name_no = (int) sqlMapClientTemplate.queryForObject("class.nameFind", name);
		}
		return class_name_no;
	}

	@SuppressWarnings("unchecked")
	public List<String> selectSubjectClassList() {
		return sqlMapClientTemplate.queryForList("class.selectSubjectList");
	}
	@SuppressWarnings("unchecked")
	public List<String> selectTeacherClassList() {
		return sqlMapClientTemplate.queryForList("class.selectTeacherList");
	}
	@SuppressWarnings("unchecked")
	public List<String> selectPlaceClassList() {
		return sqlMapClientTemplate.queryForList("class.selectPlaceList");
	}
	@SuppressWarnings("unchecked")
	public List<String> selectNameClassList() {
		return sqlMapClientTemplate.queryForList("class.selectNameList");
	}

}
