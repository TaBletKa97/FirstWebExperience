package com.khatkevich;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/auth")
public class Authentication extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        boolean agreement = Boolean.parseBoolean(req.getParameter("agree"));
        People client = new People(name);
        client.setAgreement(agreement);
        HttpSession httpSession = req.getSession();
        httpSession.setAttribute("client", client);
        resp.sendRedirect("/com/khatkevich/protected/MainShop.jsp");
//        RequestDispatcher dispatcher = req.getRequestDispatcher("/com/khatkevich/protected/MainShop.jsp");
//        dispatcher.forward(req, resp);
    }
}
