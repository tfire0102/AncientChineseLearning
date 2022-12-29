package com.example.ancientchineselearning.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.ancientchineselearning.dao.Account1Dao;

/**
 * 注册功能业务处理
 */
@WebServlet("/AccountRegisterServlet")
public class AccountRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//设置请求和相应编码方式
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//获取请求参数
		String email1 = request.getParameter("email1");
		String pawd1 = request.getParameter("pawd1");
		
		Account1Dao accDao = new Account1Dao();
		Boolean flag = accDao.isExistEmail(email1);
		if(flag) {
			out.println("<script type='text/javascript'>");
			out.println("alert('邮箱已被注册，请重新输入');");
			out.println("window.location = 'index.jsp'");
			out.println("</script>");
		}else {
			accDao.insertEmail(email1, pawd1);
			response.sendRedirect("index.jsp");
		}
	}

}
