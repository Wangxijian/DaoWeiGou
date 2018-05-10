package util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		// 如果session不为空，则可以浏览其他页面
		String url = request.getServletPath();
		//System.out.println(url);
		String path = request.getRequestURI();
		//这里判断目录，后缀名，当然也可以写在web.xml中，用url-pattern进行拦截映射
		if ((!request.getServletPath().equals("/admin/login.action"))
				&& (!request.getServletPath().equals("/admin/login.jsp"))
				&& (!request.getServletPath().equals("/admin/relogin.jsp"))
				&& (!request.getServletPath().equals("/admin/lib/font-awesome/css/font-awesome.css"))
				&& (!request.getServletPath().equals("/admin/lib/bootstrap/js/bootstrap.js"))
				&& (!request.getServletPath().equals("/admin/lib/jquery-1.7.2.min.js"))
				&& (!request.getServletPath().equals("/admin/stylesheets/theme.css"))
				&& (!request.getServletPath().equals("/admin/lib/bootstrap/css/bootstrap.css"))
				) {
			// 登陆页面无需过滤
			if(path.indexOf("/admin/login.jsp") > -1) {
				chain.doFilter(request, response);
				return;
			}
			
			

			if (session.getAttribute("admin") == null) {
				session.invalidate();
				response.setContentType("text/html;charset=gb2312");
				PrintWriter out = response.getWriter();
				out.println("<script language='javascript' type='text/javascript'>");
				out.println("alert('由于你长时间没有操作,导致Session失效!请你重新登录!');parent.location.href='" + request.getContextPath() + "/admin/login.jsp'");
				out.println("</script>");
			} else {
				chain.doFilter(request, response);
			}
		} else {
			chain.doFilter(request, response);
		}

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}