package com.sds.icto.studyer.repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.studyer.domain.MemberVo;


@Repository
public class MemberDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public int insert(MemberVo vo) {
		int no = -1;
		no=(int) sqlMapClientTemplate.insert("member.insert",vo);
		
		return no;
	}

	public MemberVo getMember(String email, String password) {
		
		Map map = new HashMap();
			map.put("email", email );
			map.put("password", password );
		MemberVo memberVo = null;
		
		memberVo = (MemberVo) sqlMapClientTemplate.queryForObject(
				"member.getMember", map);

		return memberVo;
	}
	
	public void update(MemberVo vo) {
		sqlMapClientTemplate.update("member.update", vo);
	}

	public boolean checkEmail(String email) {
		
		MemberVo memberVo = null;
		memberVo = (MemberVo)sqlMapClientTemplate.queryForObject("member.check",email);
		if(memberVo==null){
			return false;
		}else{
			return true;
		}
	}
	
	

		
	
}
