package com.sds.icto.studyer.repository;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.studyer.controller.MemberController;
import com.sds.icto.studyer.domain.EditVo;

@Repository
public class EditDao {

	private static final Log LOG = LogFactory.getLog( MemberController.class );
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public void insert(EditVo editVo) {
		sqlMapClientTemplate.insert("edit.insert", editVo);
	}


}
