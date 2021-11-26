package com.khatkevich;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "ServletHello", value = "/hello")
public class ServletHello extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        People client = new People(name);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/MainShop.jsp");
        dispatcher.forward(request , response);
    }
}
