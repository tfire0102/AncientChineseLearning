package com.example.ancientchineselearning.servlet;

import com.example.ancientchineselearning.tools.JsoupTools;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "idiomFindServlet", value = "/idiomFindServlet")
public class idiomFindServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String text = request.getParameter("findText");

        List<String> result = new ArrayList<>();
        result = JsoupTools.getIdioms(text);
//        System.out.println(result);
        request.setAttribute("result", result);
        request.getRequestDispatcher("chengyu.jsp").forward(request, response);
    }
}
