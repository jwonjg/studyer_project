package com.sds.icto.studyer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.studyer.domain.MemberVo;
import com.sds.icto.studyer.repository.MemberDao;

@Service
public class MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	public void joinUser(MemberVo vo){
		memberDao.insert(vo);
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
