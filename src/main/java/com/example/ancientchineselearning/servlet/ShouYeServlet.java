package com.example.ancientchineselearning.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.ancientchineselearning.domain.Dynasty;
import com.example.ancientchineselearning.domain.Poetry;
import com.example.ancientchineselearning.dao.Auther1Dao;
import com.example.ancientchineselearning.dao.Shiwen1Dao;
import com.example.ancientchineselearning.dao.dynasty1Dao;

/**
 * Servlet implementation class ShouYeServlet
 */
@WebServlet(name = "ShouYeServlet", value = "/ShouYeServlet")
public class ShouYeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShouYeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        
        Shiwen1Dao dao = new Shiwen1Dao();	 
    	dynasty1Dao dynastyDao = new dynasty1Dao();
        List<Dynasty> dynastyList = new ArrayList<>();
        dynastyList = dynastyDao.getDynastyList();
        request.setAttribute("dynastyList", dynastyList);
        System.out.println(dynastyList);
        
        String poemName = request.getParameter("poemName");
        String autherName = request.getParameter("autherName");
        String dynastyIDofString = request.getParameter("dynastyID");
        System.out.println("poemName=" + poemName +
                " autherName=" + autherName + " dynastyID=" + dynastyIDofString);
        int autherID = -1;
        int dynastyID = -1;
        if (autherName != null && !"".equals(autherName)) {
        	autherID = (new Auther1Dao()).getIDByName(autherName);  
        }
        if (dynastyIDofString != null && !"".equals(dynastyIDofString)) {
            dynastyID = Integer.parseInt(dynastyIDofString);
        }
        
        List<Poetry> poetryList = null;
        if (poemName != null || autherID != -1 || dynastyID != -1)
            poetryList = dao.getFindPoem(poemName, autherID, dynastyID);
        request.setAttribute("poetryList", poetryList);

        request.getRequestDispatcher("shiwen.jsp").forward(request, response);
        
	}

}
