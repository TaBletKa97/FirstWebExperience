package com.khatkevich;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Filter implements javax.servlet.Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse)response;
        HttpSession session = req.getSession();
        People client = (People) session.getAttribute("client");
        if (client.isAgreement()) {
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect("http://localhost:8080/hello");
        }
    }

    @Override
    public void destroy() {

    }
}
