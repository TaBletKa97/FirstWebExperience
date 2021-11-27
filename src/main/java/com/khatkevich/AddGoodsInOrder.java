package com.khatkevich;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;


@WebServlet(name = "ServletHello", value = "/add")
public class AddGoodsInOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        People client = (People) request.getSession().getAttribute("client");
        String item = request.getParameter("item");
        System.out.println(item);
        client.getOrder().add(item);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/MainShop.jsp");
        dispatcher.forward(request , response);
    }
}
