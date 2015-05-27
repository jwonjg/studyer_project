package com.sds.icto.studyer.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.studyer.domain.BoardVo;

@Repository
public class BoardDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public void write(BoardVo vo) {		
		sqlMapClientTemplate.insert("board.insert", vo);
	}
	
	

}
