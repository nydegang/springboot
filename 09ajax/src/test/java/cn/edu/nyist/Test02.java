package cn.edu.nyist;

import org.json.JSONArray;
import org.json.JSONObject;

public class Test02 {
	public static void main(String[] args) {
		// json数组--->JSONArray
		String jsonStr1 = "[\"xiaosb\",\"dasb\"]";
		JSONArray jsonArray = new JSONArray(jsonStr1);
		System.out.println(jsonArray.getString(0));
		// json对象--->JSONObject
		String jsonStr2 = "{\"name\":\"zhangsan\",\"pwd\":\"123\"}";
		JSONObject jsonObject = new JSONObject(jsonStr2);
		System.out.println(jsonObject.getString("name"));

	}
}
