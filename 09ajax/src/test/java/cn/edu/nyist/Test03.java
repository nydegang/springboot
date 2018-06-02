package cn.edu.nyist;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import cn.edu.nyist.ajax.vo.TypeVo;

public class Test03 {

	public static void main(String[] args) throws IOException {
		//生成
		ObjectMapper objectMapper=new ObjectMapper();
		List<TypeVo>  ls=new ArrayList<>();
		ls.add(new TypeVo(1, "电子书"));
		ls.add(new TypeVo(2, "烹饪"));
		String jsonStr=objectMapper.writeValueAsString(ls);
		System.out.println(jsonStr);
		//解析:json对象--->java对象
	   TypeVo vo= objectMapper.readValue("{\"id\":1,\"name\":\"电子书\"}", TypeVo.class);
	   System.out.println(vo);
	   

	}

}
