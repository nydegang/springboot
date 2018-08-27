package cn.edu.nyist.springboot24_jsp_mybatis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller()
public class MainController {
	@RequestMapping("/home")
  public String home() {
	  return "main";
  }
}
