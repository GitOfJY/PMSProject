package com.spring.adminWork;

import java.util.List;
import java.util.Map;

public interface AdminWorkDAO {

	List<AdminWorkDTO> wlist(String employeeseq);

	List<AdminWorkDTO> wstatelist();
	
	List<Map<String, String>> worksearch(Map<String, Object> param);

	List<AdminWorkDTO> getstage(String employeeseq);

	int emaddwork(AdminWorkDTO dto);

	AdminWorkDTO getemseq(String employeeseq);

	AdminWorkDTO getwinfo(String workseq);

	int editemworkok(AdminWorkDTO dto);

	int emdelwork(String workseq);

}
