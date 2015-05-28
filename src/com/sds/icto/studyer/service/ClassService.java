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
	
}
