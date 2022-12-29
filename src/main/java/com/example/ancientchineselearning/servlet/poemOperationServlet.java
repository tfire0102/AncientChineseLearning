package com.example.ancientchineselearning.servlet;

import com.example.ancientchineselearning.dao.poetry4Dao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "poemOperationServlet", value = "/poemOperationServlet")
public class poemOperationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        poetry4Dao dao = new poetry4Dao();

        String type = request.getParameter("type");
        if("agree".equals(type)) {
            int rid = Integer.parseInt(request.getParameter("rid"));
            dao.setPoemPass(rid);
            response.sendRedirect("poemControlServlet?type=examine");
        } else if ("refuse".equals(type)) {
            int rid = Integer.parseInt(request.getParameter("rid"));
            dao.deletePoem(rid);
            response.sendRedirect("poemControlServlet?type=examine");

        }
    }
}
