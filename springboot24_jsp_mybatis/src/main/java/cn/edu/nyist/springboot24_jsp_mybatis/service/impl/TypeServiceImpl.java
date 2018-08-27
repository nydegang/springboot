package cn.edu.nyist.springboot24_jsp_mybatis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.springboot24_jsp_mybatis.mapper.TypeMapper;
import cn.edu.nyist.springboot24_jsp_mybatis.model.Type;
import cn.edu.nyist.springboot24_jsp_mybatis.service.TypeService;

@Service
public class TypeServiceImpl implements TypeService {
	@Autowired
	private TypeMapper typeMapper;

	public TypeServiceImpl() {
	}

	@Override
	public List<Type> findAllTypes() {
		return typeMapper.findAll();
	}

}
