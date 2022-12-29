package com.example.ancientchineselearning.servlet;

import com.example.ancientchineselearning.dao.press4Dao;
import com.example.ancientchineselearning.domain.Press;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "pressControlServlet", value = "/pressControlServlet")
public class pressControlServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        press4Dao dao = new press4Dao();

        List<Press> pressList = new ArrayList<>();
        pressList = dao.getUnapprovedPressList();
        request.setAttribute("pressList", pressList);
        request.getRequestDispatcher("pressControl/pressUpload.jsp").forward(request, response);
    }
}
