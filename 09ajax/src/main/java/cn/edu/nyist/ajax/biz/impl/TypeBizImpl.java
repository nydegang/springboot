package cn.edu.nyist.ajax.biz.impl;

import java.util.List;

import cn.edu.nyist.ajax.biz.TypeBiz;
import cn.edu.nyist.ajax.dao.TypeDao;
import cn.edu.nyist.ajax.dao.impl.TypeDaoJdbcImpl;
import cn.edu.nyist.ajax.vo.TypeVo;

public class TypeBizImpl implements TypeBiz {

	@Override
	public List<TypeVo> findAllTypes() {
		TypeDao typeDao=new TypeDaoJdbcImpl();
		return typeDao.findAll();
	}

}
