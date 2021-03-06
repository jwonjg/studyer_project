package com.sds.icto.studyer.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.studyer.controller.MemberController;
import com.sds.icto.studyer.domain.MemberVo;
import com.sds.icto.studyer.repository.MemberDao;

@Service
public class MemberService {

	private static final Log LOG = LogFactory.getLog( MemberController.class );
	
	@Autowired
	MemberDao memberDao;
	
	public int joinUser(MemberVo vo){
		//memberDao.insert(vo);
		int newNo = memberDao.insert(vo);
		return newNo;
	}
	
	public MemberVo authUser(String email, String password){
		MemberVo memberVo = memberDao.getMember(email, password);
		return memberVo;
	}
	
	public void UpdateUinfo(MemberVo vo){
		memberDao.update(vo);
	}

	public boolean checkEmail(String email) {
		return memberDao.checkEmail(email);
	}
	
}
