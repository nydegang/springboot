package cn.edu.nyist.ajax.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import cn.edu.nyist.ajax.biz.TypeBiz;
import cn.edu.nyist.ajax.biz.impl.TypeBizImpl;
import cn.edu.nyist.ajax.vo.TypeVo;


@WebServlet("/findAllTypes")
public class FindAllTypesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FindAllTypesServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1接收参数
		String  cb=request.getParameter("cb");
		 if (cb==null||cb.equals("")) {//可能木有传递
			cb="cb";
		}
		//2调用业务层
		TypeBiz typeBiz=new TypeBizImpl();
		 List<TypeVo> vos=typeBiz.findAllTypes();
		 //3 给客户端返回js
		 response.setContentType("text/javascript;charset=utf-8");
		/* JSONArray jsonArray=new JSONArray(vos);
		 String jsArr=jsonArray.toString();*/
		 //把map转换为json
		 Map<String,Object> map=new HashMap<>();
		 map.put("vos", vos);
		 JSONObject jsonObject=new JSONObject(map);
		 String jsObj=jsonObject.toString();
		 //json对象填充函数参数-----jsonp
		 //{"vos":[{"name":"电子书","id":1},{"name":"编程","id":2},{"name":"烹饪","id":3}]}-----json格式
		 response.getWriter().write(cb+"("+jsObj+");");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
