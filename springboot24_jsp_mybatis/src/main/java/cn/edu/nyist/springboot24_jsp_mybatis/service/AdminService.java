package cn.edu.nyist.springboot24_jsp_mybatis.service;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.springboot24_jsp_mybatis.model.Admin;

public interface AdminService {
  @Transactional(readOnly=true)
	Admin find(String name, String pwd);

}
