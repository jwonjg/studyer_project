package com.sds.icto.studyer.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.studyer.domain.BoardVo;
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
	
	

}
