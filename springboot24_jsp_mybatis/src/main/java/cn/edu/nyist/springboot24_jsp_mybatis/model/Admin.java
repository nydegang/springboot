package cn.edu.nyist.springboot24_jsp_mybatis.model;

import java.io.Serializable;

public class Admin implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String pwd;

	public Admin() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
