package cn.edu.nyist.springboot24_jsp_mybatis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.springboot24_jsp_mybatis.mapper.AdminMapper;
import cn.edu.nyist.springboot24_jsp_mybatis.model.Admin;
import cn.edu.nyist.springboot24_jsp_mybatis.service.AdminService;
import cn.edu.nyist.springboot24_jsp_mybatis.util.Md5Util;
/**
 * 
 * @author 南阳德刚版权所有,企鹅号:2855128836<br>
 *2018年8月27日下午6:48:45<br>
 * 说明:
 */
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;

	public AdminServiceImpl() {
	}
    
	@Override
	public Admin find(String name, String pwd) {
		return adminMapper.find(name,Md5Util.getMD5(pwd));
	}

}
