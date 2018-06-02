package cn.edu.nyist.ajax.vo;

import java.io.Serializable;
/**
 * 
 * @author 南阳德刚版权�?�?,企鹅�?:2855128836<br>
 *2018�?5�?13日上�?11:00:03<br>
 * 说明:遵循JavaBean要求书写
 */
public class TypeVo implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
    private String name;
   
	public TypeVo(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public TypeVo() {
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
	@Override
	public String toString() {
		return "TypeVo [id=" + id + ", name=" + name + "]";
	}

}
