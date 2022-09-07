package com.spring.adminWork;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminWorkDAOImpl implements AdminWorkDAO {
	
	private SqlSessionTemplate template;
	
	@Autowired
	public AdminWorkDAOImpl(SqlSessionTemplate template) {
		this.template = template;
	}

	@Override
	public List<AdminWorkDTO> wlist(String employeeseq) {
		return template.selectList("adminWork.wlist", employeeseq);
	}

	@Override
	public List<AdminWorkDTO> wstatelist() {
		return template.selectList("adminWork.wstatelist");
	}

	@Override
	public List<Map<String, String>> worksearch(Map<String, Object> param) {
		return template.selectList("adminWork.worksearch", param);
	}

	@Override
	public List<AdminWorkDTO> getstage(String employeeseq) {
		return template.selectList("adminWork.getstage", employeeseq);
	}

	@Override
	public int emaddwork(AdminWorkDTO dto) {
		return this.template.insert("adminWork.emaddwork", dto);
	}

	@Override
	public AdminWorkDTO getemseq(String employeeseq) {
		return template.selectOne("adminWork.getemseq", employeeseq);
	}

	@Override
	public AdminWorkDTO getwinfo(String workseq) {
		return template.selectOne("adminWork.getwinfo", workseq);
	}

	@Override
	public int editemworkok(AdminWorkDTO dto) {
		return this.template.update("adminWork.editemworkok", dto);
	}

	@Override
	public int emdelwork(String workseq) {
		return template.delete("adminWork.emdelwork", workseq);
	}

}
