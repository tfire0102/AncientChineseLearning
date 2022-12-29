package com.example.ancientchineselearning.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.ancientchineselearning.dao.Poetry2Dao;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//设置请求和响应的编码方式
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");				
				
		//获取请求参数
		int PoetryId = Integer.valueOf((String)request.getParameter("PoetryId"));
		int AccountId = Integer.valueOf((String)request.getParameter("AccountId"));	
		//获取输入框信息
		String message = request.getParameter("message");
		Poetry2Dao dao= new Poetry2Dao();
		dao.ContactInster(PoetryId,AccountId,message);
		request.getRequestDispatcher("PoetryServlet?type=select&PoetryId="+PoetryId).forward(request, response);
	}

}
