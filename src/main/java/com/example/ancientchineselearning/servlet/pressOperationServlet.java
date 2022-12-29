package com.example.ancientchineselearning.servlet;

import com.example.ancientchineselearning.dao.press4Dao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "pressOperationServlet", value = "/pressOperationServlet")
public class pressOperationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        press4Dao dao = new press4Dao();
        String type = request.getParameter("type");
        if("agree".equals(type)) {
            int rid = Integer.parseInt(request.getParameter("rid"));
            dao.setPressPass(rid);
            response.sendRedirect("pressControlServlet");
        } else if ("refuse".equals(type)) {
            int rid = Integer.parseInt(request.getParameter("rid"));
            dao.deletePress(rid);
            response.sendRedirect("pressControlServlet");
        }
    }
}
