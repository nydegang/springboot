package cn.edu.nyist.springboot24_jsp_mybatis.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.springboot24_jsp_mybatis.model.Admin;
import cn.edu.nyist.springboot24_jsp_mybatis.service.AdminService;

@Controller
public class AdminController {
@Autowired
private AdminService adminService;

 public void setAdminService(AdminService adminService) {
	this.adminService = adminService;
}
@RequestMapping(path="/toLogin")
 public String toLogin(HttpServletRequest request) {
	 System.out.println(request.getServletContext().getRealPath("."));
	 return "login";
 }
 /**
  *  1  接收参数
  *  2 业务层
  *  3 返回一个逻辑视图名
  */
@RequestMapping("/login")
 public String login(@RequestParam String name,@RequestParam String pwd,@RequestParam String vcode,Model model,HttpSession session) {
	//先验证码
	String serverVcode=(String) session.getAttribute(ValidateController.serverVcodeName);
	 if (!serverVcode.equalsIgnoreCase(vcode)) {
		 model.addAttribute("msg", "验证码错误");
		 return  "login";
	}
	Admin admin= adminService.find(name,pwd);
	if (admin==null) {
		model.addAttribute("msg", "用户名或者密码错误");
		return "login";
	} else {
		    session.setAttribute("admin", admin);//以便后面根据它判断是否登陆
			return "redirect:/home";
		}
	 
 }
@RequestMapping("/exit")
public   String  exit(HttpServletRequest  request) {
	  request.getSession().invalidate();
	  return "redirect:/toLogin";
	  
}
}
