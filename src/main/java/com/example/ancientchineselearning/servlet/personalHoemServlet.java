package com.example.ancientchineselearning.servlet;

import com.example.ancientchineselearning.dao.collection4Dao;
import com.example.ancientchineselearning.domain.Collection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "personalHoemServlet", value = "/personalHoemServlet")
public class personalHoemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        int antID = Integer.parseInt(request.getParameter("acnID"));
        List<Collection> collectionList = new ArrayList<>();
        collectionList = collection4Dao.getPoemListByID(antID);

        request.setAttribute("collectionList", collectionList);
        request.getRequestDispatcher("personalHome.jsp").forward(request, response);
    }
}
