package cn.edu.nyist.springboot24_jsp_mybatis;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.ui.context.ThemeSource;
import org.springframework.ui.context.support.ResourceBundleThemeSource;
import org.springframework.web.servlet.ThemeResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.theme.CookieThemeResolver;
import org.springframework.web.servlet.theme.ThemeChangeInterceptor;

import com.alibaba.druid.pool.DruidDataSource;

import cn.edu.nyist.springboot24_jsp_mybatis.interceptor.AuthorInterceptor;

@Configuration
public class AppConfig extends WebMvcConfigurerAdapter {
	@Autowired
	private Environment env;// 由该类自动帮我们读取application.properites

	@Bean(name = "dataSource", destroyMethod = "close") // <bean>
	public DataSource getDataSource() {
		DruidDataSource ds = new DruidDataSource();
		ds.setPassword(env.getProperty("spring.datasource.password").trim());
		ds.setUsername(env.getProperty("spring.datasource.username").trim());
		ds.setUrl(env.getProperty("spring.datasource.url").trim());
		ds.setDriverClassName(env.getProperty("spring.datasource.driver-class-name"));
		return ds;
	}

	@Bean("themeSource")
	public ThemeSource getResourceBundleThemeSource() {
		ResourceBundleThemeSource rbt = new ResourceBundleThemeSource();
		rbt.setBasenamePrefix("cn.edu.nyist.springboot24_jsp_mybatis.theme.");

		return rbt;
	}

	@Bean("themeResolver")
	public ThemeResolver getThemeResolver() {
		CookieThemeResolver cookieThemeResolver = new CookieThemeResolver();
		cookieThemeResolver.setDefaultThemeName("cerulean");
		return cookieThemeResolver;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new ThemeChangeInterceptor());
		registry.addInterceptor(new AuthorInterceptor());
	}
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		  //注册静态资源路径
		  registry.addResourceHandler("/up/**").addResourceLocations("/WEB-INF/upload/");
	}
}
