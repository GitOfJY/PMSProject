package com.spring.adminProject;

import java.util.List;

public interface AdminProjectService {

	List<AdminProjectDTO> projectlist(String employeeseq);

	AdminProjectDTO getproject(String projectseq);

	List<AdminProjectDTO> teamlist();

	List<AdminProjectDTO> rndlist();

	List<AdminProjectDTO> ptypelist();

	List<AdminProjectDTO> pstatelist();

	int editproject(AdminProjectDTO dto);

	List<AdminProjectDTO> pltlist(String employeeseq);

	List<AdminProjectDTO> plteamlist(String tname);

	AdminProjectDTO gettname(String tname);

	int pldelteam(String employeeseq);

	List<AdminProjectDTO> empllist();

	List<AdminProjectDTO> rolelist();

	int pladdteam(AdminProjectDTO dto);

	int pldeltem(AdminProjectDTO dto);

	List<AdminProjectDTO> stagelist(String tname);

	List<AdminProjectDTO> sworkerlist(String stageseq);

	int pleditstage(AdminProjectDTO dto);

	AdminProjectDTO getstagename(String stageseq);

	AdminProjectDTO getstageseq(String stageseq);

	List<AdminProjectDTO> editworkerlist(String tname);

	int updatework(AdminProjectDTO dto);

	AdminProjectDTO getpseq(String tname);

	int pladdstage(AdminProjectDTO dto);

	int pladdwork(AdminProjectDTO dto);

	int pldelwork(String workseq);

}
