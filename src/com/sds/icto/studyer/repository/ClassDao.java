package com.sds.icto.studyer.repository;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.studyer.controller.MemberController;

@Repository
public class ClassDao {

	private static final Log LOG = LogFactory.getLog( MemberController.class );
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public int subjectWrite(String subject) {

		int class_subject_no = subjectSearch(subject);
		if (class_subject_no == 0) {
			sqlMapClientTemplate.insert("class.subjectInsert", subject);
			class_subject_no = (int)sqlMapClientTemplate.queryForObject("class.subjectFind", subject) ;
		}
		return class_subject_no;

	}

	public int teacherWrite(String teacher) {

		int class_teacher_no = teacherSearch(teacher);
		if (class_teacher_no == 0) {
			sqlMapClientTemplate.insert("class.teacherInsert", teacher);
			class_teacher_no = (int)sqlMapClientTemplate.queryForObject("class.teacherFind", teacher) ;
		}
		return class_teacher_no;
	}

	public int placeWrite(String place) {

		int class_place_no = placeSearch(place);
		if (class_place_no == 0) {
			sqlMapClientTemplate.insert("class.placeInsert", place);
			class_place_no = (int)sqlMapClientTemplate.queryForObject("class.placeFind", place) ;
		}
		return class_place_no;
	}

	public int nameWrite(String name) {

		int class_name_no = nameSearch(name);
		if (class_name_no == 0) {
			sqlMapClientTemplate.insert("class.nameInsert", name);
			class_name_no = (int)sqlMapClientTemplate.queryForObject("class.nameFind", name) ;
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

	public int subjectSearch(String subjectName) {
		Object obj = sqlMapClientTemplate.queryForObject("class.subjectFind", subjectName);
		if(obj == null) return 0;
		return (int)obj;
	}

	public int teacherSearch(String teacherName) {
		Object obj = sqlMapClientTemplate.queryForObject("class.teacherFind", teacherName);
		if(obj == null) return 0;
		return (int)obj;
	}

	public int placeSearch(String placeName) {
		Object obj = sqlMapClientTemplate.queryForObject("class.placeFind", placeName);
		if(obj == null) return 0;
		return (int)obj;
	}

	public int nameSearch(String nameName) {
		Object obj = sqlMapClientTemplate.queryForObject("class.nameFind", nameName);
		if(obj == null) return 0;
		return (int)obj;
	}
}
