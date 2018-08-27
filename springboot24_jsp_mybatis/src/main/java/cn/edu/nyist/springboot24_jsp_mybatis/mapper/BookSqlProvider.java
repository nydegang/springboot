package cn.edu.nyist.springboot24_jsp_mybatis.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

import cn.edu.nyist.springboot24_jsp_mybatis.model.Book;

public class BookSqlProvider {
	public String createBookFindAll(@Param(value = "name") final String name, @Param(value = "tid") final int tid) {
		return new SQL() {
			{
				SELECT("*");
				FROM("t_book");
				if (tid != -1) {
					WHERE("tid=#{tid}");
				}
				if (name != null && !name.equals("")) {
					WHERE("name like concat('%',#{name},'%')");
				}
			}
		}.toString();
	}

	public String updateBook(final Book book) {
		return new SQL() {
			{
				UPDATE("t_book");
				SET("tid=#{tid}");
				SET("name=#{name}");
				SET("price=#{price}");
				SET("author=#{author}");
				SET("descri=#{descri}");
				SET("pubDate=#{pubDate}");
				if (book.getPhoto() != null) {
					SET("photo=#{photo}");
				}
				WHERE("id=#{id}");

			}
		}.toString();
	}
}
