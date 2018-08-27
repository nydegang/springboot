package cn.edu.nyist.springboot23_thymeleaf;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nyist.springboot16_jdbc.model.Admin;

@SpringBootApplication
@Controller
public class Application {
	@RequestMapping("/")
	public String home(Model  model) {
		//逻辑视图名不会和具体模板绑定一起
		model.addAttribute("name", "xiaosb");
		List<Admin> ls=new ArrayList<Admin>();
		ls.add(new Admin(1, "xiaosb", "123"));
		ls.add(new Admin(2, "dasb", "888"));
		model.addAttribute("ls",ls);
		return "hw11";
	}
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}
