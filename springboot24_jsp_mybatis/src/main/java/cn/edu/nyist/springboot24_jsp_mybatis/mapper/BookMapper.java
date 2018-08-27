package cn.edu.nyist.springboot24_jsp_mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;

import cn.edu.nyist.springboot24_jsp_mybatis.model.Book;
@Mapper
public interface BookMapper {
    @Insert("insert into t_book values(default,#{tid},#{name},#{descri},#{photo},#{pubDate},#{price},#{author})")
	int save(Book book);
    //@Select("select * from t_book")
    @SelectProvider(type=BookSqlProvider.class,method="createBookFindAll")
	List<Book> findAll( @Param("name")String name,@Param("tid")int tid);
    @Delete("delete from t_book where id=#{id}")
	int del(int id);
    @Select("select * from t_book where id=#{id}")
	Book findById(int id);
    @UpdateProvider(type=BookSqlProvider.class,method="updateBook")
	int update(Book book);

}
