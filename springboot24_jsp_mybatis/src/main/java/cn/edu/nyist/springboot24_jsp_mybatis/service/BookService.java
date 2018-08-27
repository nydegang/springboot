package cn.edu.nyist.springboot24_jsp_mybatis.service;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;

import cn.edu.nyist.springboot24_jsp_mybatis.model.Book;

public interface BookService {
	@Transactional
	int saveBook(Book book);

	@Transactional(readOnly = true)
	PageInfo<Book> findAllBooks(int pageNo,String name, int tid);
    @Transactional()
	int delBookById(int id);
   @Transactional(readOnly=true)
	Book findBookById(int id);
   @Transactional
	int updateBook(Book book);

}
