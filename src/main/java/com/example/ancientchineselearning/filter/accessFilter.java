package com.example.ancientchineselearning.filter;

import com.example.ancientchineselearning.domain.Account;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "accessFilter",
        urlPatterns = {"/informationShow/*", "/poemControl/*", "/pressControl/*"},
        servletNames = {"PoetryServlet"},
        initParams = {@WebInitParam(name = "index", value = "index.jsp")},
        dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.FORWARD})
public class accessFilter implements Filter {
    private String page = null;

    public void init(FilterConfig config) throws ServletException {
        page = config.getInitParameter("index");
        if (page == null) {
            page = "index.jsp";
        }
    }

    public void destroy() {
        page = null;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        Account account = (Account) session.getAttribute("LoginAccount");
        if (account == null) {
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Please login first!');");
            out.println("window.location = '" + page + "';");
            out.println("</script>");
        } else {
            session.setMaxInactiveInterval(30*60);
            chain.doFilter(request, response);
        }

    }
}
