package com.example.ancientchineselearning.servlet;

import com.example.ancientchineselearning.dao.auther4Dao;
import com.example.ancientchineselearning.dao.dynasty4Dao;
import com.example.ancientchineselearning.dao.poetry4Dao;
import com.example.ancientchineselearning.domain.Dynasty;
import com.example.ancientchineselearning.domain.Poetry;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "poemControlServlet", value = "/poemControlServlet")
public class poemControlServlet extends HttpServlet {
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
        if("examine".equals(type)) {
            List<Poetry> poetrys = new ArrayList<>();
            poetrys = dao.getUnapprovedPoemList();
            request.setAttribute("poetrys", poetrys);
            request.getRequestDispatcher("poemControl/uploadRequest.jsp").forward(request, response);
        } else if ("change".equals(type)) {
            dynasty4Dao dynastyDao = new dynasty4Dao();
            List<Dynasty> dynastyList = new ArrayList<>();
            dynastyList = dynastyDao.getDynastyList();
            request.setAttribute("dynastyList", dynastyList);

            String poemName = request.getParameter("poemName");
            String autherName = request.getParameter("autherName");
            String dynastyIDofString = request.getParameter("dynastyID");
            System.out.println("poemName=" + poemName +
                    " autherName=" + autherName + " dynastyID=" + dynastyIDofString);
            int autherID = -1;
            int dynastyID = -1;
            if (autherName != null && !"".equals(autherName)) {
                autherID = (new auther4Dao()).getIDByName(autherName);
            }
            if (dynastyIDofString != null && !"".equals(dynastyIDofString)) {
                dynastyID = Integer.parseInt(dynastyIDofString);
            }
            System.out.println("poemName=" + poemName +
                    " autherName=" + autherID + " dynastyID=" + dynastyID);
            List<Poetry> poetryList = null;
            if (poemName != null || autherID != -1 || dynastyID != -1)
                poetryList = dao.getFindPoem(poemName, autherID, dynastyID);
            request.setAttribute("poetryList", poetryList);

            request.getRequestDispatcher("poemControl/poetryModify.jsp").forward(request, response);
        } else if ("update".equals(type)) {
            String poemID = request.getParameter("poemID");
            String poemContent = request.getParameter("poemContent");
            String poemTranslate = request.getParameter("poemTranslate");
            String poemAppreciate = request.getParameter("poemAppreciate");
            String poemNotes = request.getParameter("poemNotes");
            String poemFamSentence = request.getParameter("poemFamSentence");

            Poetry p = new Poetry();
            p.setRid(Integer.parseInt(poemID));
            p.setContent(poemContent);
            p.setTranslate(poemTranslate);
            p.setAppreciate(poemAppreciate);
            p.setNotes(poemNotes);
            p.setFamSentence(poemFamSentence);

//            System.out.println(p);
            dao.updatePoem(p);
            request.getRequestDispatcher("poemControlServlet?type=change").forward(request, response);
        }
    }
}
