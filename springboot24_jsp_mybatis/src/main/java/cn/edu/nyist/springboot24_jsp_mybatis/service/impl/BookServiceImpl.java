package cn.edu.nyist.springboot24_jsp_mybatis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.nyist.springboot24_jsp_mybatis.constant.PageConstant;
import cn.edu.nyist.springboot24_jsp_mybatis.mapper.BookMapper;
import cn.edu.nyist.springboot24_jsp_mybatis.model.Book;
import cn.edu.nyist.springboot24_jsp_mybatis.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;

	public BookServiceImpl() {
	}

	@Override
	public int saveBook(Book book) {
		return bookMapper.save(book);
	}

	@Override
	public PageInfo<Book> findAllBooks(int pageNum, String name, int tid) {

		PageHelper.offsetPage((pageNum - 1) * PageConstant.PAGE_SIZE + 1 - 1, PageConstant.PAGE_SIZE, true);

		List<Book> ls = bookMapper.findAll(name, tid);
		PageInfo<Book> pageInfo = new PageInfo<Book>(ls);
		//System.out.println(pageInfo);
		return pageInfo;
	}

	@Override
	public int delBookById(int id) {
		return bookMapper.del(id);
	}

	@Override
	public Book findBookById(int id) {
		return bookMapper.findById(id);
	}

	@Override
	public int updateBook(Book book) {
		return bookMapper.update(book);
	}

}
