package cn.edu.nyist.springboot24_jsp_mybatis.model;

import java.beans.Transient;
import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author 南阳德刚版权所有,企鹅号:2855128836<br>
 *2018年8月27日下午3:08:42<br>
 * 说明:对于数据库对应类---VO
 */
public class Book implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private int tid;
	@Size(min=1,max=50,message="{required.book.name}")
	private String name;
	@Length(max=150,min=10,message="{length.book.descri}")
	private String descri;
	private double price;
	private String author;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pubDate;
	
	private String photo;
	//数据库木有着该列
    private String vcode;
	public Book() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescri() {
		return descri;
	}

	public void setDescri(String descri) {
		this.descri = descri;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getPubDate() {
		return pubDate;
	}

	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

}
