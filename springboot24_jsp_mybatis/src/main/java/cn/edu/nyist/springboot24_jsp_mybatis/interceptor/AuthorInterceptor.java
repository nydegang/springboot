package cn.edu.nyist.springboot24_jsp_mybatis.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthorInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		/**
		 * 分析思路： 如果已经登陆，放行；否则拦截 开放登陆：toLogin,login,vcode.png
		 */
		String requestURI = request.getRequestURI();
		if (request.getSession().getAttribute("admin") == null) {
			if (requestURI.endsWith("/toLogin") || requestURI.endsWith("/login")||requestURI.endsWith("/vcode.png")) {
				return true;
			}
			response.sendRedirect("/toLogin");
			return false;
		} else {
			return true;
		}
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

	}

}
