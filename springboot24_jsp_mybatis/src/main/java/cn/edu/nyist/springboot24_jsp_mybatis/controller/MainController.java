package cn.edu.nyist.springboot24_jsp_mybatis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 
 * @author 南阳德刚版权所有,企鹅号:2855128836<br>
 *2018年8月27日下午6:46:50<br>
 * 说明:
 */
@Controller
public class MainController {
	@RequestMapping("/home")
	public String home() {
		return "main";
	}
}
