package com.spring.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OutputController {
	
	/*
	 * private OutputService service;
	 * 
	 * @Autowired public OutputController(OutputService service) { this.service =
	 * service; }
	 
	*/
	@GetMapping(value="/test")
	public String test() {
		
		return "test";
	}
	
	
}
