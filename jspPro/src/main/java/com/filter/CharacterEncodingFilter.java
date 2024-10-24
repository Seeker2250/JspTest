package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter{
	private String encoding;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {	
		System.out.println("CharacterEncodingFilter 생성될 때 짜란~");
		
//		web.xml init-param UTF-8	
		this.encoding = filterConfig.getInitParameter("encoding");//web.xml에 있는 이름
	      if(this.encoding == null) this.encoding = "UTF-8";
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("CharacterEncodingFilter doFilter 호출 때 따란~!");
	
			
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
		//다음 필터한테 넘겨(최종 자원일 수도 있어)
		//이제 필터 등록해야해.
		//그리고 필터는 등록하는 순서대로 chaining 돼 (1차, 2차, ..., n차)
	}
	
	@Override
	public void destroy() {
		System.out.println("CharacterEncodingFilter 소멸될 때 빠밤!!");
	}

	
}//class
