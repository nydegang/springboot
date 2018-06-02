package cn.edu.nyist;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class Test01 {

	public static void main(String[] args) {
		// 1 生成：Java对象--->json对象或者数组字符
		// List---->json数组
		// Set--->json数组
		// 数组--->json数组
		// map--->json对象
		List<String> ls = new ArrayList<String>();
		ls.add("xiaosb");
		ls.add("dasb");
		JSONArray jsonArray = new JSONArray(ls);
		System.out.println(jsonArray.toString());
		Map<String, Object> map = new HashMap<>();
		map.put("name", "zhangsan");
		map.put("pwd", "123");
		JSONObject jsonObject = new JSONObject(map);
		System.out.println(jsonObject.toString());

	}

}
