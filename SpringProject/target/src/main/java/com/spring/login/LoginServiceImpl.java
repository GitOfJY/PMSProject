package com.spring.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

	private LoginDAO dao;
	
	@Autowired
	public LoginServiceImpl(LoginDAO dao) {
		this.dao = dao;
	}

	@Override
	public LoginDTO login(LoginDTO dto) {
		return dao.login(dto);
	}


}
