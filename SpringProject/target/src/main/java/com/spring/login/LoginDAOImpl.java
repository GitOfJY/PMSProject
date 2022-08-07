package com.spring.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO {

	private SqlSessionTemplate template;
	
	@Autowired
	public LoginDAOImpl(SqlSessionTemplate template) {
		this.template = template;
	}

	@Override
	public LoginDTO login(LoginDTO dto) {
		return this.template.selectOne("login.login", dto);
	}

}
