package com.spring.login;

import org.springframework.beans.factory.annotation.Autowired;

public interface LoginService {

	LoginDTO login(LoginDTO dto);

}
