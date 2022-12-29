package com.example.ancientchineselearning.servlet;

import com.example.ancientchineselearning.dao.feedback4Dao;
import com.example.ancientchineselearning.domain.Feedback;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "feedbackShowServlet", value = "/feedbackShowServlet")
public class feedbackShowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        feedback4Dao dao = new feedback4Dao();

        List<Feedback> feedbacks = dao.getFeedback();
        request.setAttribute("feedbacks", feedbacks);
        request.getRequestDispatcher("informationShow/feedbackShow.jsp").forward(request, response);
    }
}
