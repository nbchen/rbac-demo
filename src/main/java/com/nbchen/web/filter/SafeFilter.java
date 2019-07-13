package com.nbchen.web.filter;

import com.nbchen.pojo.Funs;
import com.nbchen.pojo.Users;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Create by nbchen
 * 2019-07-13 9:22
 */
public class SafeFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        // 对静态资源放行处理
        if (uri.endsWith(".js") || uri.endsWith(".css") || uri.endsWith(".gif")) {
            chain.doFilter(req,resp);
        } else {
            // 对用户登录资源做放行
            if (uri.indexOf("login") != -1 || uri.indexOf("userLogin") != -1) {
                chain.doFilter(req, response);
            } else {
                HttpSession session = req.getSession();
                Users user = (Users) session.getAttribute("user");
                List<Funs> funsList = user.getFuns();
                // 开关
                boolean flag = false;
                for (Funs funs : funsList) {
                    // 判断当前访问的uri是否在功能数据中包含
                    if (uri.indexOf(funs.getFunurl()) != -1) {
                       flag = true;
                       break;
                    }
                }
                // 根据开关的值来进行跳转
                if (flag) {
                    chain.doFilter(req,resp);
                } else {
                    resp.sendRedirect("roleerror");
                }
            }
        }

    }

    @Override
    public void destroy() {

    }
}
