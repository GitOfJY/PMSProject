package com.spring.admin;

import java.util.List;

public interface AdminDAO {

	List<AdminDTO> plist();

	List<AdminDTO> elist();

	int adduser(AdminDTO dto);

	AdminDTO getuser(String employeeseq);

	int edituser(AdminDTO dto);

	int deluser(String employeeseq);

	int checkemail(String email);

	List<AdminPDTO> adminplist();

	List<AdminDTO> empllist();

	List<AdminDTO> rndlist();

	List<AdminDTO> ptypelist();

	List<AdminDTO> rolelist();
	
	List<AdminDTO> teamlist();
	
	List<AdminDTO> pstatelist();

	int addproject(AdminPDTO dto);

	int updateteam(AdminPDTO dto);

	int addteam(AdminPDTO dto);

	int checkteam(String team);

	AdminPDTO getproject(String projectseq);

	int editteam(AdminPDTO dto);

	int editproject(AdminPDTO dto);

	int editnull(AdminPDTO dto);

	
}
