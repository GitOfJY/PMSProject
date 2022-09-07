package com.spring.adminProject;

import java.io.IOException;
import java.io.PrintWriter;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.login.LoginDTO;


@Controller
public class AdminProjectController {
   
   private AdminProjectService service;
   
   @Autowired
   public AdminProjectController(AdminProjectService service) {
      this.service = service;
   }
   
   
   @GetMapping(value="/plproject")
   public String plproject(HttpSession session, HttpServletResponse resp, Model model, HttpServletRequest req) {
      
      LoginDTO dto = (LoginDTO)session.getAttribute("result");
      String employeeseq = String.valueOf(dto.getEmployeeseq()); 
      
      List<AdminProjectDTO> projectlist = service.projectlist(employeeseq);
      model.addAttribute("projectlist", projectlist);
         
      return "adminProject.plproject";
   }
   
   
   @GetMapping(value = "/editplproject")
   public String editplproject(Model model, String projectseq) {
         
      AdminProjectDTO dto = service.getproject(projectseq);
      model.addAttribute("dto", dto);
         
      List<AdminProjectDTO> teamlist = service.teamlist();
      model.addAttribute("teamlist", teamlist);
         
      List<AdminProjectDTO> ptypelist = service.ptypelist();
      model.addAttribute("ptypelist", ptypelist);
         
      List<AdminProjectDTO> rndlist = service.rndlist();
      model.addAttribute("rndlist", rndlist);
         
      List<AdminProjectDTO> pstatelist = service.pstatelist();
      model.addAttribute("pstatelist", pstatelist);
                  
      return "adminProject.editplproject";

   }
   
   
   @PostMapping(value="/editplprojectok")
   public void editplprojectok(HttpServletResponse resp, AdminProjectDTO dto, HttpServletRequest req) {
      
      int presult = service.editproject(dto);
      
      try {
         if (presult == 1) {
            resp.sendRedirect("/web/plproject");
         } else {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('오류'); location.href='/web/editplproject';</script>");
            out.flush();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      
   }
   
   
   @GetMapping(value="/plstage")
   public String plstage(HttpSession session, HttpServletResponse resp, Model model, HttpServletRequest req) {
      
      LoginDTO dto = (LoginDTO)session.getAttribute("result");
      String tname = String.valueOf(dto.getTname()); 
      
      List<AdminProjectDTO> stagelist = service.stagelist(tname);
      model.addAttribute("stagelist", stagelist);
      
      AdminProjectDTO getpseq = service.getpseq(tname);
      model.addAttribute("getpseq", getpseq);
      
      return "adminProject.plstage";
   }
   
   @GetMapping(value = "/editplstage")
   public String editplstage(HttpSession session, Model model, String stageseq) {
      
      LoginDTO dto = (LoginDTO)session.getAttribute("result");
      String tname = String.valueOf(dto.getTname()); 
      
      AdminProjectDTO getstagename = service.getstagename(stageseq);
      model.addAttribute("ndto", getstagename);
      
      AdminProjectDTO getstageseq = service.getstageseq(stageseq);
      model.addAttribute("sdto", getstageseq);
      
      List<AdminProjectDTO> sworkerlist = service.sworkerlist(stageseq);
      model.addAttribute("sworkerlist", sworkerlist);
      
      List<AdminProjectDTO> editworkerlist = service.editworkerlist(tname);
      model.addAttribute("editworkerlist", editworkerlist);
               
      return "adminProject.editplstage";

   }
   
   @PostMapping(value="/editplstageok")
   public void plstageok(HttpServletResponse resp, AdminProjectDTO dto, HttpServletRequest req) {
      
      int result = service.pleditstage(dto);
      
      try {
         if (result == 1) {
            resp.sendRedirect("/web/plstage");
         } else {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('오류'); location.href='/web/plstage';</script>");
            out.flush();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      
   }
   
   @PostMapping(value="/pladdstageok")
   public void pladdstageok(HttpSession session, HttpServletResponse resp, AdminProjectDTO dto, HttpServletRequest req) {
      
      int result = service.pladdstage(dto);
      
      try {
         if (result == 1) {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('새로고침을 하세요.'); history.go(-1);</script>");
            out.flush();
         } else {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('오류'); location.href='/web/plstage';</script>");
            out.flush();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      
   }
   
   @PostMapping(value="/pleditworkok")
   public void pleditworkok(HttpServletResponse resp, AdminProjectDTO dto, HttpServletRequest req) {
      
      int uresult = service.updatework(dto);
      
      try {
         if (uresult == 1) {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('새로고침을 하세요.'); history.go(-1);</script>");
            out.flush();
      } else {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('오류'); location.href='/web/plstage';</script>");
            out.flush();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }   
   }
   
   @PostMapping(value="/pladdwork")
   public void pladdwork(HttpServletResponse resp, AdminProjectDTO dto, HttpServletRequest req) {
      
      int result = service.pladdwork(dto);
      
      try {
         if (result == 1) {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('새로고침을 하세요.'); history.go(-1);</script>");
            out.flush();
      } else {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('오류'); location.href='/web/plstage';</script>");
            out.flush();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }   
      
   }
   
   @GetMapping(value = "/pldelwork")
   public String pldelwork(Model model, String workseq, HttpServletResponse resp, HttpServletRequest req){
      
      int result = service.pldelwork(workseq);
      
      try {
         if (result == 1) {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('새로고침을 하세요.'); history.go(-1);</script>");
            out.flush();
         } else {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('오류'); history.go(-1);</script>");
            out.flush();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return "adminProject.pldelwork";

   }

   @GetMapping(value="/plteam")
   public String plteam(HttpSession session, HttpServletResponse resp, Model model, HttpServletRequest req) {
      
      LoginDTO dto = (LoginDTO)session.getAttribute("result");
      String employeeseq = String.valueOf(dto.getEmployeeseq()); 
      String tname = String.valueOf(dto.getTname()); 
      
      List<AdminProjectDTO> pltlist = service.pltlist(employeeseq);
      model.addAttribute("pltlist", pltlist);
      
      List<AdminProjectDTO> plteamlist = service.plteamlist(tname);
      model.addAttribute("plteamlist", plteamlist);
         
      return "adminProject.plteam";
   }
   

   @GetMapping(value = "/editplteam")
   public String editplteam(Model model, String tname) {
      
      AdminProjectDTO teamname = service.gettname(tname);
      model.addAttribute("teamname", teamname);
      
      List<AdminProjectDTO> plteamlist = service.plteamlist(tname);
      model.addAttribute("plteamlist", plteamlist);
      
      List<AdminProjectDTO> empllist = service.empllist();
      model.addAttribute("empllist", empllist);
      
      List<AdminProjectDTO> rolelist = service.rolelist();
      model.addAttribute("rolelist", rolelist);
      
      return "adminProject.editplteam";

   }
   
   @PostMapping(value="/editplteamok")
   public void editplteamok(HttpSession session, HttpServletResponse resp, AdminProjectDTO dto, HttpServletRequest req) {
      
      int result = service.pldeltem(dto);
      
      LoginDTO ldto = (LoginDTO)session.getAttribute("result");
      String tname = URLEncoder.encode(String.valueOf(ldto.getTname())); 
      
      try {
         if (result == 1) {
            resp.sendRedirect("/web/editplteam?tname="+tname);
         } else {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('오류'); location.href='/web/plteam';</script>");
            out.flush();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      
   }
   
   @PostMapping(value="/pladdteamok")
   public void pladdteamok(HttpSession session, HttpServletResponse resp, AdminProjectDTO dto, HttpServletRequest req) {
      
      int result = service.pladdteam(dto);
      
      LoginDTO ldto = (LoginDTO)session.getAttribute("result");
      String tname = URLEncoder.encode(String.valueOf(ldto.getTname())); 
      
      try {
         if (result == 1) {
            resp.sendRedirect("/web/editplteam?tname="+tname);
         } else {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('오류'); location.href='/web/plteam';</script>");
            out.flush();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      
   }
   
   @ResponseBody
   @PostMapping(value="/pldelteam")
   public int pldelteam(String employeeseq) throws Exception {
      
      int result = service.pldelteam(employeeseq);
      
      return result;
   }
   

}