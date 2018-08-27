package cn.edu.nyist.springboot24_jsp_mybatis.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.springboot24_jsp_mybatis.model.Type;

public interface TypeService {
  @Transactional(readOnly=true)
	List<Type> findAllTypes();

}
