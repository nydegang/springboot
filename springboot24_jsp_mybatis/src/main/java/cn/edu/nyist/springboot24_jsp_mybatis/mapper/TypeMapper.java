package cn.edu.nyist.springboot24_jsp_mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import cn.edu.nyist.springboot24_jsp_mybatis.model.Type;

@Mapper
public interface TypeMapper {
	@Select("select * from t_type")
	List<Type> findAll();

}
