package com.filter;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */


/*
 * @WebFilter( dispatcherTypes = {DispatcherType.REQUEST } , urlPatterns = {
 * "/days09/admin/*", "/days09/board/write.jsp"//web.xml에 url-pattern 넣는 대신 이렇게
 * })
 */
public class LoginCheckFilter implements Filter {


	public LoginCheckFilter() {

	}
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("LoginCheckFilter 초기화!");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("LoginCheckFilter doFilter()호출!");
		// 인증 == 세션
		HttpServletRequest jrequest = (HttpServletRequest) request;
		HttpServletResponse jresponse = (HttpServletResponse) response;
		
		String logonId = null;//세션에 저장된 이름 
		// pass the request along the filter chain
		boolean isLogon = false;
		HttpSession session = jrequest.getSession(false);
		if(session != null) {
			logonId = (String) session.getAttribute("auth");
			if(logonId != null) isLogon = true;
		}
		
		if(isLogon) {
			//만약 /admin/* 요청이라면 logonId= "admin"라면 통과
			//만약 /admin/* 요청이라면 logonId= "asdf"라면 컷
			
			
			
			chain.doFilter(request, response);//로그인 했으면 이동해라~
		}else {//로그인 안한 상태
			//원래 요청 URL 확인
			String referer = jrequest.getRequestURI();
			System.out.println("원래 가고자 했던 경로는 "+ referer);///jspPro/days09/board/write.jsp
			session.setAttribute("referer", referer);
			//리다이렉트로 로그인 페이지로 넘기기
			//왜냐하면 포워딩하면 남아있잖아
			String location = "/jspPro/days09/member/logon.jsp";
			jresponse.sendRedirect(location);
		}
		
	}

	public void destroy() {
		System.out.println("LoginCheckFilter destroy()됐어!");

	}


}

