package com.nbchen.web.filter;

import com.nbchen.pojo.Users;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 判断用户是否登录
 * Create by nbchen
 * 2019-07-13 8:12
 */
public class UserLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // 1.获取用户ULI
        HttpServletRequest req = (HttpServletRequest) request;
        String uri = req.getRequestURI();
        // 判断当前访问的URI是否是用户登录 资源,如果是则放行
        if (uri.indexOf("login") != -1 || uri.indexOf("userLogin") != -1) {
            chain.doFilter(req,response);
        } else {
            // 用户是否登录
            HttpSession session = req.getSession();
            Users user = (Users) session.getAttribute("user");
            if (user != null && user.getUsername().length() > 0) {
                chain.doFilter(req,response);
            } else {
                req.setAttribute("msg","请登录");
                req.getRequestDispatcher("/login").forward(req,response);
            }
        }
    }

    @Override
    public void destroy() {

    }
}
