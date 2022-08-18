package com.spring.myproject;

import java.util.List;
import java.util.Map;

import com.spring.project.OutputDTO;

public interface MyOutputListDAO {

	List<OutputDTO> outputlist(String employeeseq);

	List<OutputDTO> pnamelist(String employeeseq);

	List<OutputDTO> otypelist();

	List<OutputDTO> outputsearch(OutputDTO dto);


}
