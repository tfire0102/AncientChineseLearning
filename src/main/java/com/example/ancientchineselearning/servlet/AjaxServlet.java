package com.example.ancientchineselearning.servlet;

import com.example.ancientchineselearning.dao.poetry4Dao;
import com.example.ancientchineselearning.domain.Poetry;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AjaxServlet", value = "/AjaxServlet")
public class AjaxServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        poetry4Dao dao = new poetry4Dao();
        int poemID = Integer.parseInt(request.getParameter("poemID"));
        Poetry poetry = dao.getPoemByID(poemID);
//        System.out.println(poetry.getTitle() + "&" + poetry.getAuther().getName() + "&"
//                + poetry.getAuther().getDynasty() + "&" + poetry.getContent() + "&"
//                + poetry.getTranslate() + "&" + poetry.getAppreciate() + "&"
//                + poetry.getNotes() + "&" + poetry.getFamSentence()
//        );
        response.getWriter().print(poemID + "&" + poetry.getTitle() + "&" + poetry.getAuther().getName() + "&"
                + poetry.getAuther().getDynasty() + "&" + poetry.getContent() + "&"
                + poetry.getTranslate() + "&" + poetry.getAppreciate() + "&"
                + poetry.getNotes() + "&" + poetry.getFamSentence());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
