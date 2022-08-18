package com.spring.project;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.myproject.IssueDTO;

@Controller
public class OutputController {
	private OutputService service;

	@Autowired
	public OutputController(OutputService service) {
		this.service = service;
	}

	// 모든 산출물페이지
	@GetMapping(value = "/project/outputslist")
	public String alist(Model model) {

		List<OutputDTO> alist = service.alist();
		model.addAttribute("alist", alist);
		return "project.outputslist";
	}

	// 모든 산출물 검색기능
	@GetMapping(value = "/project/outputssearch")
	public String alistsearch(Model model, HttpServletRequest req) {

		String title = req.getParameter("title");

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("title", title);

		List<Map<String, String>> alist = service.resultalist(param);

		model.addAttribute("alist", alist);

		return "project.outputslist";
	}

	// 산출물 상세정보페이지
	@GetMapping(value = "/project/outputinfo")
	public String info(Model model, String fileseq) {

		OutputDTO dto = service.info(fileseq);
		List<OutputDTO> projectlist = service.projectlist();
		List<OutputDTO> worklist = service.worklist();

		model.addAttribute("projectlist", projectlist);
		model.addAttribute("worklist", worklist);
		model.addAttribute("dto", dto);
		return "project.outputinfo";
	}

	// 산출물 등록페이지
	@GetMapping(value = "/project/outputadd")
	public String add(Model model) {

		List<OutputDTO> projectlist = service.projectlist();
		List<OutputDTO> worklist = service.worklist();

		model.addAttribute("projectlist", projectlist);
		model.addAttribute("worklist", worklist);

		return "project.outputadd";
	}

	// 산출물 등록하기 + 파일 업로드
	@PostMapping(value = "/project/outputaddok")
	public String addok(HttpServletRequest req, Model model) {

		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) req;
		MultipartFile file = multi.getFile("title");

		String filename = file.getOriginalFilename();
		String path = req.getRealPath("resources/files");

		// 파일명 중복 방지
		filename = getFileName(path, filename);

		// 파일 이동하기
		File file2 = new File(path + "\\" + filename); // 희망 경로

		try {
			file.transferTo(file2); // 임시 폴더 > 업로드 폴더

		} catch (Exception e) {
			System.out.println("OutputController.addok");
			e.printStackTrace();
		}

		String projectseq = req.getParameter("projectseq");
		String workseq = req.getParameter("workseq");
		String otypeseq = req.getParameter("otypeseq");
		String fileexplain = req.getParameter("fileexplain");
		String title = filename;

		OutputDTO dto = new OutputDTO();
		dto.setProjectseq(projectseq);
		dto.setWorkseq(workseq);
		dto.setOtypeseq(otypeseq);
		dto.setFileexplain(fileexplain);
		dto.setTitle(title);

		int result = service.add(dto);

		if (result == 2) {
			return "redirect:/project/outputlist?projectseq=" + projectseq;
		} else {
			return "redirect:" + req.getHeader("Referer");
		}

	}

	// 파일명 중복 방지
	private String getFileName(String path, String filename) {

		int n = 1; // 인덱싱 숫자
		int index = filename.lastIndexOf(".");

		String tempName = filename.substring(0, index);
		String tempExt = filename.substring(index);

		while (true) {

			File file = new File(path + "\\" + filename);

			if (file.exists()) {
				// 있다. > 중복 > 파일 변경
				filename = tempName + "_" + n + tempExt;
				n++;
			} else {
				// 없다. > 파일명 사용 가능
				return filename;
			}
		}
	}

	// 산출물 파일 다운로드
	@GetMapping(value = "/project/download")
	public void download(HttpServletRequest req, HttpServletResponse resp, String title) throws Exception {

		ServletContext context = req.getSession().getServletContext();
		String savePath = "/resources/files";
		String sDownloadPath = context.getRealPath(savePath);

		String sFilePath = sDownloadPath + "/" + title;
		byte b[] = new byte[4096];
		FileInputStream in = new FileInputStream(sFilePath);
		String sMimeType = context.getMimeType(sFilePath);
		System.out.println("sMimeType>>>" + sMimeType);

		if (sMimeType == null)
			sMimeType = "application/octet-stream";// MIME. 브라우저에게 해석할 수 없는 데이터라고 타입을 속여서 보내는 작업 중 하나

		resp.setContentType(sMimeType);

		String agent = req.getHeader("User-Agent");
		boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);

		if (ieBrowser) {
			title = URLEncoder.encode(title, "UTF-8").replaceAll("/+", "%20");
		} else {
			title = new String(title.getBytes("UTF-8"), "iso-8859-1");
		}

		resp.setHeader("Content-Disposition", "attachment; filename= " + title);

		ServletOutputStream out2 = resp.getOutputStream();
		int numRead;

		while ((numRead = in.read(b, 0, b.length)) != -1) {
			out2.write(b, 0, numRead);
		}

		out2.flush();
		out2.close();
		in.close();
	}

	// 산출물 삭제하기
	@GetMapping(value = "/project/outputdel")
	public String del(String projectseq, String outputseq, String title, HttpServletRequest req,
			HttpServletResponse resp) {

		// 파일 삭제
		ServletContext context = req.getSession().getServletContext();
		String savePath = "/resources/files";
		String sDownloadPath = context.getRealPath(savePath);
		String sFilePath = sDownloadPath + "/" + title;

		File dir = new File(sFilePath);

		try {

			if (dir.exists()) {
				dir.delete(); // 진짜 삭제
			}

		} catch (Exception e) {
			System.out.println("OutputController.del");
			e.printStackTrace();
		}

		int result = service.del(outputseq);

		if (result == 1) { // 삭제성공
			return "redirect:/project/outputlist?projectseq=" + projectseq;
		} else {
			return "redirect:" + req.getHeader("Referer");
		}

	}

	// 산출물 수정하기
	@PostMapping(value = "/project/outputedit")
	public String edit(HttpServletRequest req) {
		String projectseq = req.getParameter("projectseq");
		String workseq = req.getParameter("workseq");
		String otypeseq = req.getParameter("otypeseq");
		String fileexplain = req.getParameter("fileexplain");
		String outputseq = req.getParameter("outputseq");
		String fileseq = req.getParameter("fileseq");

		OutputDTO odto = new OutputDTO();
		odto.setProjectseq(projectseq);
		odto.setWorkseq(workseq);
		odto.setOtypeseq(otypeseq);
		odto.setFileexplain(fileexplain);
		odto.setOutputseq(outputseq);

		int result = service.edit(odto);

		if (result == 1) {
			return "redirect:/project/outputlist?projectseq=" + projectseq;
		} else {
			return "redirect:" + req.getHeader("Referer");
		}

	}

	// 새로운 파일버전페이지
	@GetMapping(value = "/project/outputnewfile")
	public String newfile() {
		return "project.outputnewfile";
	}

	// 배정현황 탭
	@GetMapping(value = "/project/assignment")
	public String assignment(Model model, String projectseq) {

		List<OutputDTO> assignment = service.assignment(projectseq);
		model.addAttribute("assignment", assignment);
		return "project.assignment";
	}

	// 산출물 탭
	@GetMapping(value = "/project/outputlist")
	public String list(Model model, String projectseq) {

		List<OutputDTO> list = service.list(projectseq);
		OutputDTO seq = service.seq(projectseq);
		model.addAttribute("list", list);
		model.addAttribute("seq", seq);
		return "project.outputlist";
	}

	// 산출물 탭 검색기능
	@GetMapping(value = "/project/outputsearch")
	public String listsearch(Model model, HttpServletRequest req) {

		String title = req.getParameter("title");
		String projectseq = req.getParameter("projectseq");

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("title", title);
		param.put("projectseq", projectseq);

		List<Map<String, String>> list = service.resultlist(param);
		OutputDTO seq = service.seq(projectseq);

		model.addAttribute("list", list);
		model.addAttribute("seq", seq);

		return "project.outputlist";
	}

	// 이슈 탭
	@GetMapping(value = "/project/issue")
	public String issue(Model model, String projectseq) {

		List<IssueDTO> issue = service.issue(projectseq);
		OutputDTO seq = service.seq(projectseq);
		model.addAttribute("issue", issue);
		model.addAttribute("seq", seq);
		return "project.issue";
	}

	// 이슈 탭 검색기능
	@GetMapping(value = "/project/issuesearch")
	public String search(Model model, HttpServletRequest req) {

		String title = req.getParameter("title");
		String imergency = req.getParameter("imergency");
		String projectseq = req.getParameter("projectseq");

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("title", title);
		param.put("imergency", imergency);
		param.put("projectseq", projectseq);

		List<Map<String, String>> issue = service.issueResultList(param);
		OutputDTO seq = service.seq(projectseq);

		model.addAttribute("issue", issue);
		model.addAttribute("seq", seq);

		return "project.issue";
	}

}
